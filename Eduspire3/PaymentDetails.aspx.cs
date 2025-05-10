using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text.RegularExpressions;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace Eduspire3
{
    public partial class PaymentDetails : System.Web.UI.Page
    {
        String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadRecord();
        }
        private void LoadRecord()
        {
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand comm = new SqlCommand(" Select PaymentDetails_Table11.ID,PaymentDetails_Table11.stu_ID,PaymentDetails_Table11.Pay_ID,PaymentDetails_Table11.PlanName,PaymentDetails_Table11.Amount,PaymentDetails_Table11.Status,PaymentDetails_Table11.CreatedDate,RegisterStu_Table5.stu_FirstName,RegisterStu_Table5.stu_LastName,RegisterStu_Table5.stu_EmailID from PaymentDetails_Table11,RegisterStu_Table5 where PaymentDetails_Table11.stu_ID=RegisterStu_Table5.stu_ID", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        private Boolean CheckPayIDinPaymentDetails()
        {
            Boolean PayID = false;
            SqlConnection con = new SqlConnection(mycon);
            String query = "Select * from [PaymentDetails_Table11] where Pay_ID='" + txtPayID.Text + "'";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = com;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                PayID = true;
            }
            con.Close();
            return PayID;
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            LoadRecord();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if(txtPayID.Text=="")
            {
                lblPayIDError.Text = "Enter Payment ID";
            }
            else if(CheckPayIDinPaymentDetails()==false)
            {
                lblPayIDError.Text = "Entered Payment ID doesn't exist";
            }
            else
            {
                lblPayIDError.Text = "";
                SqlConnection con = new SqlConnection(mycon);
                SqlCommand comm = new SqlCommand("Select PaymentDetails_Table11.ID,PaymentDetails_Table11.stu_ID,PaymentDetails_Table11.Pay_ID,PaymentDetails_Table11.PlanName,PaymentDetails_Table11.Amount,PaymentDetails_Table11.Status,PaymentDetails_Table11.CreatedDate,RegisterStu_Table5.stu_FirstName,RegisterStu_Table5.stu_LastName,RegisterStu_Table5.stu_EmailID from PaymentDetails_Table11,RegisterStu_Table5 where PaymentDetails_Table11.stu_ID=RegisterStu_Table5.stu_ID and Pay_ID='" + txtPayID.Text + "'", con);
                SqlDataAdapter d = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                d.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadRecord();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
            lblStu_ID.Text = GridView1.SelectedRow.Cells[1].Text;
            lblFName.Text = GridView1.SelectedRow.Cells[3].Text;
            lblLName.Text = GridView1.SelectedRow.Cells[4].Text;
            lblEmail.Text = GridView1.SelectedRow.Cells[2].Text;
            lblPlan.Text = GridView1.SelectedRow.Cells[6].Text;
            lblPayID.Text = GridView1.SelectedRow.Cells[5].Text;
            lblPayDate.Text = GridView1.SelectedRow.Cells[9].Text;
            lblAmount.Text = GridView1.SelectedRow.Cells[7].Text;
            lblStatus.Text = GridView1.SelectedRow.Cells[8].Text;

            if (lblStu_ID.Text != "")
            {
                string constr = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                SqlConnection conn = new SqlConnection(constr);
                conn.Open();
                SqlCommand comm = new SqlCommand("select * from RegisterStu_Table5 where stu_ID='" + lblStu_ID.Text + "'", conn);
                SqlDataReader r = comm.ExecuteReader();
                while (r.Read())
                {
                    lblContact.Text = r.GetValue(3).ToString();
                }
            }

        }
        private void exportpdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Invoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Panel1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void btnDownloadInvoice_Click(object sender, EventArgs e)
        {
            exportpdf();
        }
    }
}