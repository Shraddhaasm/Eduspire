using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp;
using iTextSharp.text.pdf;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using System.IO;

namespace Eduspire3
{
    public partial class ResumePDF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FirstName"] != null)
            {
                lblFName.Text = (string)Session["FirstName"];
                lblMName.Text = (string)Session["MiddleName"];
                lblLName.Text = (string)Session["LastName"];
                lblEmailID.Text = (string)Session["EmailAddr"];
                lblContactNo.Text = (string)Session["ContactNo"];
                lblAddress.Text = (string)Session["Address"];
                lblKeySkills.Text = (string)Session["Keyskills"];
                lblSoftDev.Text = (string)Session["SoftwareDev"];

                lblProTit.Text = (string)Session["ProjectTitle"];
                lblProTag.Text = (string)Session["ProjectTag"];
                lblClient.Text = (string)Session["EnterClient"];
                lblProStatus.Text = (string)Session["ProjectStatus"];
                lblNatEmp.Text = (string)Session["NatureOfEmp"];

                lblEduLevel.Text = (string)Session["EducationLevel"];
                lblBoardName.Text = (string)Session["BoardName"];
                lblMedium.Text = (string)Session["Medium"];
                lblPassingYr.Text = (string)Session["PassingOutYear"];
                lblPassPer.Text = (string)Session["PassingPer"];

                lblCerName.Text = (string)Session["CertificateName"];
                lblCerDate.Text = (string)Session["CertificateValidFrom"];

                lblSkillName.Text = (string)Session["SkillName"];
                //lblLastUsed.Text = (string)Session["LastUsed"];
                lblWrkExp.Text = (string)Session["WorkExperience"];
            }
            else
            {
                Response.Redirect("HomePage.aspx");
            }
            
        }
        private void exportpdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Resume.pdf");
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
            /* Verifies that the control is rendered */
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            exportpdf();
        }
    }
}