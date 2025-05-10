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
    public partial class PaymentReport : System.Web.UI.Page
    {
        String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Panel1.Visible = false;
            //btnDownload.Visible = false;
        }
        private bool ValidDate()
        {
            Boolean Date = false;
            Regex regDate = new Regex(@"(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$");
            Match matchDate = regDate.Match(txtDate.Text);
            if (matchDate.Success)
            {
                Date = true;
            }
            return Date;
        }
        private Boolean CheckAvailableDate()
        {
            Boolean AvailableDate = false;
            SqlConnection con = new SqlConnection(mycon);
            String query = "Select * from [PaymentDetails_Table11] where Date='" + txtDate.Text + "'";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = com;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                AvailableDate = true;
            }
            con.Close();
            return AvailableDate;
        }
        private void GetData()
        {
            DataTable dt = new DataTable();
            DataRow dr;

            dt.Columns.Add("Pay_ID");
            dt.Columns.Add("stu_EmailID");
            dt.Columns.Add("PlanName");
            dt.Columns.Add("Amount");
            dt.Columns.Add("Status");
            dt.Columns.Add("CreatedDate");
            SqlConnection con = new SqlConnection(mycon);
            String myquery = "Select PaymentDetails_Table11.Pay_ID,PaymentDetails_Table11.PlanName,PaymentDetails_Table11.Amount,PaymentDetails_Table11.Status,PaymentDetails_Table11.CreatedDate,RegisterStu_Table5.stu_EmailID from PaymentDetails_Table11,RegisterStu_Table5 where PaymentDetails_Table11.stu_ID=RegisterStu_Table5.stu_ID and Status='Successful' and Date='" + txtDate.Text + "'";
            //String myquery = "Select * from [PaymentDetails_Table11] where Status='Successful' and Date='" + TextBox1.Text + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            int totalrows = ds.Tables[0].Rows.Count;
            int i = 0;
            int grandtotal = 0;
            while (i < totalrows)
            {
                dr = dt.NewRow();
                dr["Pay_ID"] = ds.Tables[0].Rows[i]["Pay_ID"].ToString();
                dr["stu_EmailID"] = ds.Tables[0].Rows[i]["stu_EmailID"].ToString();
                dr["PlanName"] = ds.Tables[0].Rows[i]["PlanName"].ToString();
                dr["Amount"] = ds.Tables[0].Rows[i]["Amount"].ToString();
                dr["Status"] = ds.Tables[0].Rows[i]["Status"].ToString();
                dr["CreatedDate"] = ds.Tables[0].Rows[i]["CreatedDate"].ToString();
                int price = Convert.ToInt16(ds.Tables[0].Rows[i]["Amount"].ToString());
                int totalprice = price;
                dr["Amount"] = totalprice;
                grandtotal = grandtotal + totalprice;
                dt.Rows.Add(dr);
                i = i + 1;
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();

            lblTotAmt.Text = grandtotal.ToString();
        }
        private void GetCount()
        {
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select COUNT(*) as TotalCount from PaymentDetails_Table11 where Status='Successful' and Date='" + txtDate.Text + "'", con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            lblTrans.Text = ds.Tables[0].Rows[0]["TotalCount"].ToString();
        }
        private void exportpdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Payment_Report_" + txtDate.Text + ".pdf");
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

        protected void btnReport_Click(object sender, EventArgs e)
        {
            if(txtDate.Text=="")
            {
                lblDate.Text = "Please enter date";
            }
            else if(ValidDate()==false)
            {
                lblDate.Text = "Please enter valid date";
            }
            else if(CheckAvailableDate()==false)
            {
                lblDate.Text = "Entered date data doesn't exist";
            }
            else
            {
                lblDate.Text = "";
                Panel1.Visible = true;
                btnDownload.Visible = true;
                lblCreatedon.Text = DateTime.Now.ToShortDateString();
                lblReportDate.Text = txtDate.Text.ToString();
                GetData();
                GetCount();
                
            }
            
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            exportpdf();
        }
    }
}