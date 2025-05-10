using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Razorpay.Api;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Text;

namespace Eduspire3
{
    public partial class PaymentInvoice : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["stu_ID"] != null)
            {
                lblOrderID.Text = (string)Session["OrderID"];
                lblstu_ID.Text = (string)Session["stu_ID"];
            }
            else
            {
                Response.Redirect("HomePage.aspx");
            }
                
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            SqlCommand comm = new SqlCommand("select * from RegisterStu_Table5 where stu_ID='" + lblstu_ID.Text + "'", conn);
            SqlDataReader r = comm.ExecuteReader();
            while (r.Read())
            {
                lblFName.Text = r.GetValue(1).ToString();
                lblLName.Text = r.GetValue(2).ToString();
                lblContact.Text = r.GetValue(3).ToString();
                lblEmail.Text = r.GetValue(4).ToString();
                lblPlan.Text = r.GetValue(10).ToString();
            }
            conn.Close();

            SqlConnection con1 = new SqlConnection(constr);
            con1.Open();
            SqlCommand com = new SqlCommand("select * from PaymentDetails_Table11 where Pay_ID='" + lblOrderID.Text + "'", con1);
            SqlDataReader r1 = com.ExecuteReader();
            while (r1.Read())
            {
                lblPayID.Text = r1.GetValue(2).ToString();
                lblPayDate.Text = r1.GetValue(6).ToString();
                lblAmount.Text = r1.GetValue(4).ToString();
                lblStatus.Text = r1.GetValue(5).ToString();
            }
            con1.Close();
            
        }
        private void exportpdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Invoice_" + lblstu_ID.Text + ".pdf");
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