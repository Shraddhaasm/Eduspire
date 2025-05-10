using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Configuration;
using System.Net.Mail;
using System.Net;
using System.Runtime;
using System.Runtime.InteropServices;

namespace Eduspire3
{
    public partial class VerifyStudent : System.Web.UI.Page
    {
        String CS = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        static String activationcode;
        [DllImport("wininet.dll")]
        private extern static bool InternetGetConnectedState(out int Description, int ReservedValue);
        protected void Page_Load(object sender, EventArgs e)
        {
            AutoID();
            div_VerifyOtp.Visible = false;
            div_OTP.Visible = false;
        }
        private void AutoID()
        {
            String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection connection = new SqlConnection(mycon);
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select top 1 * from ActivateStu_Table6 order by ID Desc", connection);
            //SqlCommand cmd = new SqlCommand("Select count(ID)from[ActivateStu_Table6]", connection);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            connection.Close();
            i++;
            lblID.Text = i.ToString();
        }
        //Method for checking availability of Email in database
        private Boolean CheckEmailInRegister()
        {
            Boolean emailavailable = false;
            SqlConnection con = new SqlConnection(CS);
            String query = "Select * from RegisterStu_Table5 where stu_EmailID='" + txtEmailID.Text + "'";
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

        private Boolean CheckEmailInActivate()
        {
            Boolean emailavailable = false;
            SqlConnection con = new SqlConnection(CS);
            String query = "Select * from ActivateStu_Table6 where Email='" + txtEmailID.Text + "'";
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


        private void sendcode()
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("eduspire39154@gmail.com", "dmrqnnqukuaxlqrm");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Activation Code to verify email address";
            msg.Body = "Dear Eduspire User ,Your activation code is " + activationcode + "\n\nNOTE:DO NOT SHARE IT WITH ANYONE\n\n\nThanks & Regards\nEduspire Team";
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
            catch (Exception ex)
            //catch(Exception)
            {
                lblErrorMsg.Text = "ERROR: " + ex.Message.ToString();
                //Response.Write("<script>alert('Message not sent check your internet connection.');</script>");
                //throw;
            }
        }

        private void changestatus()
        {
            String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            String updatedata = "update ActivateStu_Table6 set activationcode = 0 , Status = 'Verified' where Email='" + txtEmailID.Text + "'";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updatedata;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }

        protected void btnVerifyEmail_Click1(object sender, EventArgs e)
        {
            int Desc;
            if (CheckEmailInRegister() == true)
            {
                Response.Write("<script>alert('An account with Email " + txtEmailID.Text + " already exists.')</script>");
            }
            else if (InternetGetConnectedState(out Desc, 0) == false)
            {
                Response.Write("<script>alert('Message not sent please check your internet connection.')</script>");
            }
            else
            {
                div_VerifyOtp.Visible = true;
                div_OTP.Visible = true;
                btnVerifyEmail.Visible = false;
                if (CheckEmailInActivate() == true)
                {
                    //Response.Write("<script>alert('..........')</script>");
                    Random random = new Random();
                    activationcode = random.Next(1001, 9999).ToString();
                    String query = "update ActivateStu_Table6 set activationcode='" + activationcode + "' where Email='" + txtEmailID.Text + "'";
                    String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                    SqlConnection con = new SqlConnection(mycon);
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = query;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    sendcode();
                    //Response.Redirect("A4.aspx?email=" + txtEmailID.Text);
                    //Server.Transfer("RegisterAsTutor5.aspx?email=" + txtEmailID.Text);
                    Response.Write("<script>alert('Message sent check Email Inbox.')</script>");
                }
                else
                {
                    //activation code generation and insertion
                    Random random = new Random();
                    activationcode = random.Next(1001, 9999).ToString();
                    String query = "insert into ActivateStu_Table6(ID,Email,Status,activationcode) values('"+ lblID.Text + "','" + txtEmailID.Text + "','Unverified','" + activationcode + "')";
                    String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                    SqlConnection con = new SqlConnection(mycon);
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = query;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    sendcode();
                    //Response.Redirect("A4.aspx?email=" + txtEmailID.Text);
                    //Server.Transfer("RegisterAsTutor5.aspx?email=" + txtEmailID.Text);
                    Response.Write("<script>alert('Message sent check your Email Inbox.')</script>");
                }
            }
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            div_VerifyOtp.Visible = true;
            div_OTP.Visible = true;
            btnVerifyEmail.Visible = false;
            Session["EmailID"] = txtEmailID.Text;
            String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            //String myquery = "Select * from ActivateTut_Table2 where Email='" + Request.QueryString["Email"] + "'";
            String myquery = "Select * from ActivateStu_Table6 where Email='" + txtEmailID.Text + "'";
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                String activationcode;
                activationcode = ds.Tables[0].Rows[0]["activationcode"].ToString();
                if (activationcode == txtActivationCode.Text)
                {
                    changestatus();
                    //lblNote2.Text = "Your email has been verified successuflly";
                    Response.Redirect("RegisterAsStu.aspx?email=" + txtEmailID.Text);
                    //Response.Write("<script>alert('success.');</script>");
                }
                else
                {
                    Response.Write("<script>alert('You have entered Invalid activation code, kindly check your mail Inbox.');</script>");
                    //lblError.Text = "You have entered Invalid activation code , kindly check your Email inbox";
                }
            }
            con.Close();
        }
    }
}