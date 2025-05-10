using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Configuration;
using System.Data;
using System.Net.Mail;

namespace Eduspire3
{
    public partial class HomePage : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            AutoID();
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            SqlCommand comm = new SqlCommand("select * from PlanPrice_Table10 where ID='1'", conn);
            SqlDataReader r = comm.ExecuteReader();
            while (r.Read())
            {
                lblBasic.Text = r.GetValue(1).ToString();
                lblPlus.Text = r.GetValue(2).ToString();
                lblPro.Text = r.GetValue(3).ToString();
            }
        }
        private void AutoID()
        {
            String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection connection = new SqlConnection(mycon);
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select top 1 * from ContactUs_Table4 order by ID Desc", connection);
            //SqlCommand cmd = new SqlCommand("Select count(ID)from[ContactUs_Table4]", connection);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            connection.Close();
            i++;
            lblIDNo.Text = i.ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("eduspire39154@gmail.com");
            mailMessage.To.Add("eduspire39154@gmail.com");
            mailMessage.Subject = txtSubject.Text;

            mailMessage.Body = "<b>Sender Name : </b>" + txtName.Text + "<br/>"
                + "<b>Sender Email : </b>" + txtEmail.Text + "<br/>"
                + "<b>Message : </b>" + txtMessage.Text;
            mailMessage.IsBodyHtml = true;


            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new
            System.Net.NetworkCredential("eduspire39154@gmail.com", "dmrqnnqukuaxlqrm");
            smtpClient.Send(mailMessage);

            SqlConnection con = new SqlConnection(constr);
            string query = "Insert into ContactUs_Table4(ID,Name,Email_ID,Subject,Message,CreatedOndate) values('"+lblIDNo.Text+"','" + txtName.Text + "','" + txtEmail.Text + "','" + txtSubject.Text + "','" + txtMessage.Text + "',getdate())";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            con.Open();
            da.SelectCommand.ExecuteNonQuery();
            //MessageBox.Show("Message sent Successfully..");
            Response.Write("<script>alert('Message sent Successfully!.')</script>");
            con.Close();
            txtName.Text = "";
            txtEmail.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }
    }
}