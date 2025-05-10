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
using System.Web.Configuration;
using System.IO;


namespace Eduspire3
{
    public partial class UploadVideo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VidID();
            if (Session["tut_ID"] != null)
            {
                lblTut_ID.Text = Session["tut_ID"].ToString();
            }
            else
            {
                Response.Redirect("HomePage.aspx");
            }
            //String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            //SqlConnection con = new SqlConnection(mycon);
            //string query = "Select * from Course_Table13";
            //SqlDataAdapter sda = new SqlDataAdapter(query, con);
            //DataTable dt = new DataTable();
            //sda.Fill(dt);
            //DropDownList1.DataSource = dt;
            //DropDownList1.DataValueField = "ID";
            //DropDownList1.DataTextField = "Course";
            //DropDownList1.DataBind();
        }
        private void VidID()
        {
            String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection connection = new SqlConnection(mycon);
            connection.Open();
            //SqlCommand cmd = new SqlCommand("Select count(ID)from[Video_Table12]", connection);
            SqlCommand cmd = new SqlCommand("Select top 1 * from Video_Table12 order by ID Desc", connection);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            connection.Close();
            i++;
            lblID.Text = i.ToString();
        }
        private void ClearPrevErrors()
        {
            lblTitleError.Text = "";
            lblFileError.Text = "";
            lblDrpError.Text = "";
        }
        private bool ValidTitle()
        {
            Boolean Title = false;
            Regex regTitle = new Regex(@"[a-zA-Z]+");
            Match matchTitle = regTitle.Match(txtTitle.Text);
            if (matchTitle.Success)
            {
                Title = true;
            }
            return Title;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(FileUpload1.FileName);
            string[] validFilesTypes = { ".mp4"};
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
            if (txtTitle.Text=="")
            {
                lblTitleError.Text = "Please enter video title";
                lblFileError.Text = "";
                lblDrpError.Text = "";
            }
            else if(ValidTitle()==false)
            {
                lblTitleError.Text = "Enter characters only";
                lblFileError.Text = "";
                lblDrpError.Text = "";
            }
            else if (DropDownList1.SelectedIndex == 0)
            {
                lblFileError.Text = "";
                lblTitleError.Text = "";
                lblDrpError.Text = "Please select Course name";
            }
            else if(!isValidFile)
            {
                lblTitleError.Text = "";
                lblDrpError.Text = "";
                lblFileError.Text = "Please upload a video with extension: " + string.Join(", ", validFilesTypes);
            }
            else if(FileUpload1.PostedFile.ContentLength < 104857600)
            {
                ClearPrevErrors();
                string dbcon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                SqlConnection sqlcon = new SqlConnection(dbcon);
                FileUpload1.SaveAs(Server.MapPath("~/VideoFile/") +
                Path.GetFileName(FileUpload1.FileName));
                String link = "VideoFile/" + Path.GetFileName(FileUpload1.FileName);
                link = "<Video width=400 Controls><Source src=" + link + " type=video/mp4></video>";
                String query = "insert into Video_Table12 (ID,tut_ID,Title,VideoOnCourse,Description,VideoPath,UploadedOn) values('" + lblID.Text + "','" + lblTut_ID.Text + "','" + txtTitle.Text + "','" + DropDownList1.SelectedValue + "','" + txtDes.Text + "','" + link + "',getdate())";
                SqlCommand cmd = new SqlCommand(query, sqlcon);
                sqlcon.Open(); ;
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                Response.Write("<script>alert('Lecture uploaded Successfully!')</script>");
                txtTitle.Text = "";
                txtDes.Text = "";
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearPrevErrors();
            txtTitle.Text = "";
            txtDes.Text = "";
        }
    }
}