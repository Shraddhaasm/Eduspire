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
    public partial class ForgotPassForTut : System.Web.UI.Page
    {
        [DllImport("wininet.dll")]
        private extern static bool InternetGetConnectedState(out int Description, int ReservedValue);
        String CS = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            div_VerifyOtp.Visible = false;
            div_OTP.Visible = false;
        }
        private Boolean CheckEmail()
        {
            Boolean emailavailable = false;
            SqlConnection con = new SqlConnection(CS);
            String query = "Select * from RegisterTut_Table1 where tut_EmailID='" + txtEmailID.Text + "'";
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
        private Boolean CheckEmailAdmin()
        {
            Boolean emailavailable = false;
            SqlConnection con = new SqlConnection(CS);
            String query = "Select * from [Admin_Table7] where adm_EmailID='" + txtEmailID.Text + "'";
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
        private void SendEmailAdmin()
        {
            int Desc;
            if (InternetGetConnectedState(out Desc, 0) == true)
            {
                String CS = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select * from [Admin_Table7] where adm_EmailID='" + txtEmailID.Text + "'", con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        String myGUID = Guid.NewGuid().ToString();
                        int Uid = Convert.ToInt32(dt.Rows[0][0]);
                        SqlCommand cmd1 = new SqlCommand("insert into GUID_Tut_Table values('" + myGUID + "','" + Uid + "',getdate())", con);
                        cmd1.ExecuteNonQuery();
                        //send Email
                        try
                        {
                            String ToEmailAddress = dt.Rows[0][4].ToString();
                            String Username = dt.Rows[0][1].ToString();
                            String EmailBody = "Dear " + Username + ",<br/><br/> We received your request for password reset.<br/><br/> Click the link below and you will be prompted to reset your password <br/><br/> http://localhost:54911/ResetPassForAdmTut.aspx?Uid=" + myGUID + "<br/><br/> This email is only valid for 24 hours, after that, you must request a new password reset email.<br/><br/>Sincerely,<br/><br/>Eduspire Team";
                            //String EmailBody1 = "<br/><br/> This email is only valid for 24 hours, after that, you must request a new password reset email.<br/><br/>Sincerely,<br/><br/>Eduspire Team";
                            MailMessage PassRecMail = new MailMessage("eduspire39154@gmail.com", ToEmailAddress);
                            PassRecMail.Body = EmailBody;
                            string fromaddress = "Eduspire Team <eduspire39154@gmail.com>";
                            PassRecMail.From = new MailAddress(fromaddress);
                            //PassRecMail.Body = EmailBody1;
                            PassRecMail.IsBodyHtml = true;
                            PassRecMail.Subject = "Link to Reset your Password";
                            PassRecMail.Priority = MailPriority.High;
                            //SmtpClient SMTP = new SmtpClient("smtp-mail.outlook.com", 587);
                            SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                            //SmtpClient SMTP = new SmtpClient("relay-hosting.secureserver.net", 25);
                            SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
                            SMTP.UseDefaultCredentials = false;
                            SMTP.Credentials = new NetworkCredential()
                            {
                                UserName = "eduspire39154@gmail.com",
                                Password = "dmrqnnqukuaxlqrm"
                            };
                            SMTP.EnableSsl = true;
                            SMTP.Send(PassRecMail);
                            //Response.Write("<script>alert('Check your E-mail to reset your password.');</script>");
                            Response.Write("<script>alert('Password reset information should reach you shortly via Email.');</script>");
                            txtEmailID.Text = "";
                        }
                        //catch (Exception ex)
                        catch (Exception)
                        {
                            //Label4.Text = "ERROR: " + ex.Message.ToString();
                            Response.Write("<script>alert('Message not sent.');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('OOPS! No account corresponds to the Email ID you have entered.');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Message not sent please check your internet connection.');</script>");
            }
        }

        private void SendEmail()
        {
            int Desc;
            if (InternetGetConnectedState(out Desc, 0) == true)
            {
                String CS = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select * from RegisterTut_Table1 where tut_EmailID='" + txtEmailID.Text + "'", con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        String myGUID = Guid.NewGuid().ToString();
                        int Uid = Convert.ToInt32(dt.Rows[0][0]);
                        SqlCommand cmd1 = new SqlCommand("insert into GUID_Tut_Table values('" + myGUID + "','" + Uid + "',getdate())", con);
                        cmd1.ExecuteNonQuery();
                        //send Email
                        try
                        {
                            String ToEmailAddress = dt.Rows[0][4].ToString();
                            String Username = dt.Rows[0][1].ToString();
                            String EmailBody = "Dear " + Username + ",<br/><br/> We received your request for password reset.<br/><br/> Click the link below and you will be prompted to reset your password <br/><br/> http://localhost:54911/ResetPassForTut9.aspx?Uid=" + myGUID + "<br/><br/> This email is only valid for 24 hours, after that, you must request a new password reset email.<br/><br/>Sincerely,<br/><br/>Eduspire Team";
                            //String EmailBody1 = "<br/><br/> This email is only valid for 24 hours, after that, you must request a new password reset email.<br/><br/>Sincerely,<br/><br/>Eduspire Team";
                            MailMessage PassRecMail = new MailMessage("eduspire39154@gmail.com", ToEmailAddress);
                            PassRecMail.Body = EmailBody;
                            string fromaddress = "Eduspire Team <eduspire39154@gmail.com>";
                            PassRecMail.From = new MailAddress(fromaddress);
                            //PassRecMail.Body = EmailBody1;
                            PassRecMail.IsBodyHtml = true;
                            PassRecMail.Subject = "Link to Reset your Password";
                            PassRecMail.Priority = MailPriority.High;
                            //SmtpClient SMTP = new SmtpClient("smtp-mail.outlook.com", 587);
                            SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                            //SmtpClient SMTP = new SmtpClient("relay-hosting.secureserver.net", 25);
                            SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
                            SMTP.UseDefaultCredentials = false;
                            SMTP.Credentials = new NetworkCredential()
                            {
                                UserName = "eduspire39154@gmail.com",
                                Password = "dmrqnnqukuaxlqrm"
                            };
                            SMTP.EnableSsl = true;
                            SMTP.Send(PassRecMail);
                            //Response.Write("<script>alert('Check your E-mail to reset your password.');</script>");
                            Response.Write("<script>alert('Password reset information should reach you shortly via Email.');</script>");
                            txtEmailID.Text = "";
                        }
                        //catch (Exception ex)
                        catch (Exception)
                        {
                            //Label4.Text = "ERROR: " + ex.Message.ToString();
                            Response.Write("<script>alert('Message not sent.');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('OOPS! No account corresponds to the Email ID you have entered.');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Message not sent please check your internet connection.');</script>");
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (CheckEmailAdmin() == true)
            {
                div_VerifyOtp.Visible = true;
                div_OTP.Visible = true;
                btnNext.Visible = false;
                string constr = WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                SqlConnection conn = new SqlConnection(constr);
                conn.Open();
                SqlCommand comm = new SqlCommand("select * from [Admin_Table7] where adm_EmailID='" + txtEmailID.Text + "'", conn);
                SqlDataReader r = comm.ExecuteReader();
                while (r.Read())
                {
                    lblSecQues.Text = r.GetValue(6).ToString();
                }

            }
            else if (CheckEmail() == true)
            {
                div_VerifyOtp.Visible = true;
                div_OTP.Visible = true;
                btnNext.Visible = false;
                string constr = WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                SqlConnection conn = new SqlConnection(constr);
                conn.Open();
                SqlCommand comm = new SqlCommand("select * from RegisterTut_Table1 where tut_EmailID='" + txtEmailID.Text + "'", conn);
                SqlDataReader r = comm.ExecuteReader();
                while (r.Read())
                {
                    lblSecQues.Text = r.GetValue(7).ToString();
                }
                //Server.Transfer("SecQuesForTut.aspx");
            }
            else
            {
                Response.Write("<script>alert('No account exists corresponds to Email you entered.')</script>");
            }
        }
        

        protected void btnSend_Click(object sender, EventArgs e)
        {
            div_VerifyOtp.Visible = true;
            div_OTP.Visible = true;
            btnNext.Visible = false;
            string constr = WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            try
            {
                if (CheckEmailAdmin() == true)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select count(*) from [Admin_Table7] where adm_EmailID='" + txtEmailID.Text + "' and adm_Ans='" + txtAns.Text + "' ", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    cmd.ExecuteNonQuery();
                    if (dt.Rows[0][0].ToString() == "1")
                    {
                        btnSend.Visible = false;
                        SendEmailAdmin();
                        //Response.Write("<script>alert('Verified successfully!')</script>");
                        //Server.Transfer("ResetLinkForTut.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('The entered answer is incorrect.')</script>");
                    }
                }
                else if (CheckEmail() == true)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select count(*) from RegisterTut_Table1 where tut_EmailID='" + txtEmailID.Text + "' and tut_Ans='" + txtAns.Text + "' ", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    cmd.ExecuteNonQuery();
                    if (dt.Rows[0][0].ToString() == "1")
                    {
                        btnSend.Visible = false;
                        SendEmail();
                        //Response.Write("<script>alert('Verified successfully!')</script>");
                        //Server.Transfer("ResetLinkForTut.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('The entered answer is incorrect.')</script>");
                    }
                }

            }
            catch (Exception)
            {
                //Response.Write(ex.Message);
            }
        }
    }
}