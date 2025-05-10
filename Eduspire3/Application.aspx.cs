using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Windows.Forms;
using System.IO;

namespace Eduspire3
{
    public partial class Application : System.Web.UI.Page
    {
        String CS = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            CanAutoID();
            if (!IsPostBack)
            {
                if (Session["EmailID"] != null)
                {
                    lbl2EmailID.Text = Session["EmailID"].ToString();
                }
                else
                {
                    Response.Redirect("VerifyTutor3.aspx");
                }
            }
        }
        private void CanAutoID()
        {
            String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection connection = new SqlConnection(mycon);
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select top 1 * from Candidate_Table8 order by can_ID Desc", connection);
            //SqlCommand cmd = new SqlCommand("Select count(can_ID)from[Candidate_Table8]", connection);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            connection.Close();
            i++;
            lblCanIDNo.Text = i.ToString();
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            string[] validFilesTypes = { ".doc", ".docx", ".pdf", ".jpg", "jpeg", ".png" };
            string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
            bool isValidFile = false;
            for (var i = 0; i < validFilesTypes.Length; i++)
            {
                if (ext == validFilesTypes[i])
                {
                    isValidFile = true;
                    break;
                }
            }
            if (!isValidFile)
            {
                lblErrorMsg.Text = "Invalid File. Please upload a file with extension: " + string.Join(", ", validFilesTypes);
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
            }
            //else if (FileUpload1.HasFile)
            else
            {
                String constring = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                SqlConnection sqlcon = new SqlConnection(constring);
                FileUpload1.SaveAs(Server.MapPath("~/Data/") + Path.GetFileName(FileUpload1.FileName));
                String link = Path.GetFileName(FileUpload1.FileName);

                String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                SqlConnection con = new SqlConnection(mycon);
                con.Open();
                string query = "insert into Candidate_Table8 (can_ID,can_FirstName,can_LastName,can_ContactNo,can_EmailID,can_DOB,can_Gender,can_FileName,can_ApprovalStatus,Applied_On) values ('" +lblCanIDNo.Text +"','" + txtFirstName.Text + "','" + txtLastName.Text + "','" + txtContactNo.Text + "','" + lbl2EmailID.Text + "','" + txtDOB.Text + "','" + radiobtnlstGender.SelectedValue + "','" + link + "','NA',getdate())";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Applied Successfully! You will receive an Email within 24hrs for further instructions.')</script>");
                //Response.Redirect("Courses.aspx");
                //MessageBox.Show("success");
            }
        }
    }
}