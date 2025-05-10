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
using System.Net.Mail;

namespace Eduspire3
{
    public partial class QueriesManagement : System.Web.UI.Page
    {
        String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadRecord();
            txtEmailID.ReadOnly = false;
        }
        private void LoadRecord()
        {
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand comm = new SqlCommand("Select * from [ContactUs_Table4]", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        private bool ValidEmail()
        {
            Boolean Email = false;
            Regex regEmail = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
            Match matchEmail = regEmail.Match(txtEmailID.Text);
            if (matchEmail.Success)
            {
                Email = true;
            }
            return Email;
        }
        private Boolean CheckEmailInContactUs()
        {
            Boolean emailavailable = false;
            SqlConnection con = new SqlConnection(mycon);
            String query = "Select * from [ContactUs_Table4] where Email_ID='" + txtEmailID.Text + "'";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = com;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                emailavailable = true;
            }
            con.Close();
            return emailavailable;
        }


        protected void btnShowAllRecords_Click(object sender, EventArgs e)
        {
            lblEmailIDError.Text = "";
            LoadRecord();
        }

        protected void btnID_Click(object sender, EventArgs e)
        {
            if (txtEmailID.Text == "")
            {
                lblEmailIDError.Text = "Please enter Email";
            }
            else if(ValidEmail() == false)
            {
                lblEmailIDError.Text = "Please enter valid Email";
            }
            else if (CheckEmailInContactUs() == false)
            {
                lblEmailIDError.Text = "Entered Email doesn't exist";
            }  
            else
            {
                lblEmailIDError.Text = "";
                SqlConnection con = new SqlConnection(mycon);
                SqlCommand comm = new SqlCommand("Select * from [ContactUs_Table4] where Email_ID='" + txtEmailID.Text + "'", con);
                con.Open();
                SqlDataAdapter d = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                d.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

                SqlDataReader r = comm.ExecuteReader();
                while (r.Read())
                {
                    lblID.Text = r.GetValue(0).ToString();
                }
            }
        }
        private void sendEmail()
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("eduspire39154@gmail.com", "dmrqnnqukuaxlqrm");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = txtSubject.Text;
            msg.Body = txtMessage.Text;
            //msg.Body = "Dear " + TextBox1.Text + ",Your activation code is " + activationcode + "\n\n\nThanks & Regards\nEduspire Team";
            string toaddress = txtEmailID.Text;
            msg.To.Add(toaddress);
            string fromaddress = "Eduspire Team <eduspire39154@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);
            }
            //Resolve this when internet not connected
            //catch (Exception ex)
            catch(Exception)
            {
                //lblErrorMsg.Text = "ERROR: " + ex.Message.ToString();
                //Response.Write("<script>alert('Message not sent check your internet connection.');</script>");
                throw;
            }
        }
        private void UpdateContactUs()
        {
            String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            String updatedata = "update [ContactUs_Table4] set Replied_Msg = '"+txtMessage.Text+ "' , RepliedOnDate = getdate() where ID='" + lblID.Text + "'";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updatedata;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if(txtEmailID.Text=="")
            {
                lblEmailIDError.Text = "Please enter Email ID";
            }
            else if(ValidEmail()==false)
            {
                lblEmailIDError.Text = "Please enter valid Email ID";
            }
            else
            {
                lblEmailIDError.Text = "";
                sendEmail();
                UpdateContactUs();
                LoadRecord();
                Response.Write("<script>alert('Email sent successfully!')</script>");
            }
            

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            txtEmailID.Text = "";
            int rowind = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            txtEmailID.Text = GridView1.Rows[rowind].Cells[2].Text;
            lblID.Text = GridView1.Rows[rowind].Cells[0].Text;
            txtEmailID.ReadOnly = true;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadRecord();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}