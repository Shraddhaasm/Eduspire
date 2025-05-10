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
using System.Text.RegularExpressions;


namespace Eduspire3
{
    public partial class CandidateManagement : System.Web.UI.Page
    {
        [DllImport("wininet.dll")]
        private extern static bool InternetGetConnectedState(out int Description, int ReservedValue);
        String CS = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RefreshData();
                btnSearch2.Visible = false;
                lblAllRecords.Visible = false;
                btnShowRecordsToApprove.Visible = false;
            }
        }
        
        public void RefreshData()
        {
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("SELECT can_ID,can_FirstName,can_LastName,can_ContactNo,can_EmailID,can_DOB,can_Gender,can_FileName,Applied_On FROM Candidate_Table8 WHERE (can_ApprovalStatus= 'NA')", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            grdviewCandidate.DataSource = ds;
            grdviewCandidate.DataBind();
        }
        public void RefreshData2()
        {
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("SELECT * from Candidate_Table8 ", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        public void ClearPrevError()
        {
            lblEmailIDError.Text = "";
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
        private Boolean CheckEmailCandidate()
        {
            Boolean emailavailable = false;
            SqlConnection con = new SqlConnection(mycon);
            String query = "Select * from [Candidate_Table8] where can_EmailID='" + txtEmailID.Text + "' and can_ApprovalStatus='NA'";
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
        private Boolean CheckEmailAllCandidate()
        {
            Boolean emailavailable = false;
            SqlConnection con = new SqlConnection(mycon);
            String query = "Select * from [Candidate_Table8] where can_EmailID='" + txtEmailID.Text + "'";
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
        private void UpdateRow(int ID, String Approval)
        {
            String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            String updatedata = "Update Candidate_Table8 set can_ApprovalStatus='" + Approval + "' where can_ID=" + ID;
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updatedata;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }
        //private void DeleteRow(int ID)
        //{
        //    String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        //    String deletedata = "Delete from Candidate_Table8 where can_ID=" + ID;
        //    SqlConnection con = new SqlConnection(mycon);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = deletedata;
        //    cmd.Connection = con;
        //    cmd.ExecuteNonQuery();
        //}
        private void InsertData(int ID,String FName,String LName,String ContactNo,String EmailID,String Gender)
        {
            String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            String insertdata = "Insert into RegisterTut_Table1 (tut_ID,tut_FirstName,tut_LastName,tut_ContactNo,tut_EmailID,tut_Gender) values('" + ID + "','" + FName + "','" + LName + "','" + ContactNo + "','" + EmailID + "','" + Gender + "')";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = insertdata;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }
        private void SendEmailApproval(String EmailID)
        {
            int Desc;
            if (InternetGetConnectedState(out Desc, 0) == true)
            {
                String CS = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select * from Candidate_Table8 where can_EmailID='" + EmailID + "'", con);
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
                        try
                        {
                            String ToEmailAddress = dt.Rows[0][4].ToString();
                            String Username = dt.Rows[0][1].ToString();
                            String EmailBody = "Dear "+Username+",<br/><br/> We received your Application for Tutor. You have been APPROVED and are ELIGIBLE as a Tutor.<br/><br/>Click the link below and get yourself registered.<br/><br/>http://localhost:54911/RegisterTutor.aspx?Uid=" + myGUID + " <br/><br/>Sincerely,<br/>Eduspire Team";
                            //String EmailBody1 = "<br/><br/> This email is only valid for 24 hours, after that, you must request a new password reset email.<br/><br/>Sincerely,<br/><br/>Eduspire Team";
                            MailMessage PassRecMail = new MailMessage("eduspire39154@gmail.com", ToEmailAddress);
                            PassRecMail.Body = EmailBody;
                            string fromaddress = "Eduspire Team <eduspire39154@gmail.com>";
                            PassRecMail.From = new MailAddress(fromaddress);
                            //PassRecMail.Body = EmailBody1;
                            PassRecMail.IsBodyHtml = true;
                            PassRecMail.Subject = "Application Approved as Tutor";
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
                            //Response.Write("<script>alert('Email sent.');</script>");
                            //Response.Write("Email sent to " + EmailID + "</br>");
                            EmailID = "";
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

        private void SendEmailReject(String EmailID)
        {
            int Desc;
            if (InternetGetConnectedState(out Desc, 0) == true)
            {
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("eduspire39154@gmail.com", "dmrqnnqukuaxlqrm");
                smtp.EnableSsl = true;
                MailMessage msg = new MailMessage();
                msg.Subject = "Your application to Eduspire for the Tutor position";
                msg.Body = "Dear Candidate,\n\n Thank you for applying for Tutor. After carefully reviewing your qualifications,we have decided to purse other candidates whom we feel more closely meet our needs at this time.\n\nWe appreciate your interest in Eduspire, and the time it took to apply with us. Please feel free to apply for positions with us in the future.\n\nAgain,thank you for considering us. We wish you success in your career pursuit.\n\n\nThanks & Regards\nEduspire Team";
                //msg.Body = "Dear " + TextBox1.Text + ",Your activation code is " + activationcode + "\n\n\nThanks & Regards\nEduspire Team";
                string toaddress = EmailID;
                msg.To.Add(toaddress);
                string fromaddress = "Eduspire Team <eduspire39154@gmail.com>";
                msg.From = new MailAddress(fromaddress);
                try
                {
                    smtp.Send(msg);
                }
                //Resolve this when internet not connected
                //catch (Exception ex)
                catch (Exception)
                {
                    //lblErrorMsg.Text = "ERROR: " + ex.Message.ToString();
                    //Response.Write("<script>alert('Message not sent check your internet connection.');</script>");
                    //throw;
                }
            }
            else
            {
                Response.Write("<script>alert('Message not sent please check your internet connection.');</script>");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ClearPrevError();
            foreach (GridViewRow row in grdviewCandidate.Rows)
            {
                RadioButton ApprovalStatus = (row.Cells[3].FindControl("RadioButton1") as RadioButton);
                RadioButton RejectStatus = (row.Cells[3].FindControl("RadioButton2") as RadioButton);
                int ID = Convert.ToInt32(row.Cells[0].Text);
                String FName = row.Cells[1].Text;
                String LName = row.Cells[2].Text;
                String ContactNo = row.Cells[3].Text;
                String EmailID = row.Cells[4].Text;
                String Gender = row.Cells[6].Text;
                if (ApprovalStatus.Checked)
                {
                    UpdateRow(ID, "Approved");
                    SendEmailApproval(EmailID);
                    InsertData(ID, FName, LName, ContactNo, EmailID, Gender);
                    Response.Write("<script>alert('Applications have been submited successfully.');</script>");
                }
                if(RejectStatus.Checked)
                {
                    UpdateRow(ID, "Rejected");
                    SendEmailReject(EmailID);
                    //DeleteRow(ID);
                    Response.Write("<script>alert('Applications have been submited successfully.');</script>");
                }
                //else
                //{
                //    UpdateRow(ID, "NA");
                //}
                //lblMSg.Text = "Applications have been submited successfully";
                SqlDataSource1.DataBind();
                RefreshData();
            }
            
        }

        protected void grdviewCandidate_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                Response.Clear();
                Response.ContentType = "application/octect-stream";
                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/Data/") + e.CommandArgument);
                Response.End();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ClearPrevError();
            if (txtEmailID.Text == "")
            {
                lblEmailIDError.Text = "Please enter Email";
            }
            else if (ValidEmail() == false)
            {
                lblEmailIDError.Text = "Please enter valid Email";
            }
            else if (CheckEmailCandidate() == false)
            {
                lblEmailIDError.Text = "Entered Email doesn't exist";
            }
            else
            {
                lblEmailIDError.Text = "";
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("SELECT * from [Candidate_Table8] WHERE can_EmailID='" + txtEmailID.Text + "' and can_ApprovalStatus='NA'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                grdviewCandidate.DataSource = ds;
                grdviewCandidate.DataBind();
            }
            
        }

        protected void btnShowAllRecords_Click(object sender, EventArgs e)
        {
            ClearPrevError();
            btnSearch.Visible = false;
            btnShowAllRecords.Visible = false;
            btnShowRecordsToApprove.Visible = true;
            grdviewCandidate.Visible = false;
            GridView1.Visible = true;
            btnSubmit.Visible = false;
            btnSearch2.Visible = true;
            lblAllRecords.Visible = true;
            lblRecordsToApprove.Visible = false;
            txtEmailID.Text = "";
            RefreshData2();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadFile")
            {
                Response.Clear();
                Response.ContentType = "application/octect-stream";
                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/Data/") + e.CommandArgument);
                Response.End();
            }
        }

        protected void btnSearch2_Click(object sender, EventArgs e)
        {
            ClearPrevError();
            if (txtEmailID.Text == "")
            {
                lblEmailIDError.Text = "Please enter Email";
            }
            else if (ValidEmail() == false)
            {
                lblEmailIDError.Text = "Please enter valid Email";
            }
            else if (CheckEmailAllCandidate() == false)
            {
                lblEmailIDError.Text = "Entered Email doesn't exist";
            }
            else
            {
                lblEmailIDError.Text = "";
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("SELECT * from [Candidate_Table8] WHERE can_EmailID='" + txtEmailID.Text + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        protected void btnShowRecordsToApprove_Click(object sender, EventArgs e)
        {
            ClearPrevError();
            btnSearch.Visible = true;
            btnShowAllRecords.Visible = true;
            btnShowRecordsToApprove.Visible = false;
            grdviewCandidate.Visible = true;
            btnSubmit.Visible = true;
            btnSearch2.Visible = false;
            lblAllRecords.Visible = false;
            lblRecordsToApprove.Visible = true;
            GridView1.Visible = false;
            txtEmailID.Text = "";
            RefreshData();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            RefreshData2();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void grdviewCandidate_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            RefreshData();
            grdviewCandidate.PageIndex = e.NewPageIndex;
            grdviewCandidate.DataBind();
        }
    }
}