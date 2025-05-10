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
    public partial class RegisterTutor : System.Web.UI.Page
    {
        String CS = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        string GUIDvalue;
        DataTable dt = new DataTable();
        int Uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            using (SqlConnection con = new SqlConnection(CS))
            {
                GUIDvalue = Request.QueryString["Uid"];
                if (GUIDvalue != null)
                {
                    SqlCommand cmd = new SqlCommand("select * from GUID_Tut_Table where ID='" + GUIDvalue + "'", con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        Uid = Convert.ToInt32(dt.Rows[0][1]);
                        
                    }
                    else
                    {
                        Response.Write("<script>alert('Your link is invalid or expired!');</script>");
                        return;
                    }
                }
                else
                {
                    Response.Redirect("~/VerifyTutor3.aspx");
                }
            }
            if (!IsPostBack)
            {
                
                if (dt.Rows.Count != 0)
                {
                    txtPassword.Visible = true;
                    txtConfPassword.Visible = true;
                }
                else
                {
                    Response.Write("<script>alert('Your Password reset link is invalid or expired!');</script>");
                    return;
                }
            }
            string constr = WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            SqlCommand comm = new SqlCommand("select * from RegisterTut_Table1 where tut_ID='" + Uid + "'", conn);
            SqlDataReader r = comm.ExecuteReader();
            while (r.Read())
            {
                lblFirstName.Text = r.GetValue(1).ToString();
                lblLastName.Text = r.GetValue(2).ToString();
                lblContactNo.Text = r.GetValue(3).ToString();
                lblEmailID.Text = r.GetValue(4).ToString();
                //lblGender.Text = r.GetValue(5).ToString();
            }
        }

        

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if(drpdwnlstSecQues.SelectedIndex==0)
            {
                lblError.Text = "Please select Security Question";
            }
            else
            {
                lblError.Text = "";
                using (SqlConnection con = new SqlConnection(CS))
                {
                    String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                    SqlConnection con1 = new SqlConnection(mycon);
                    con.Open();
                    string query = "update RegisterTut_Table1 set tut_Password='" + txtPassword.Text + "',tut_Ques='" + drpdwnlstSecQues.SelectedValue + "',tut_Ans='" + txtAns.Text + "',Created_On= getdate() where tut_ID='" + Uid + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlCommand cmd2 = new SqlCommand("select tut_ID,tut_FirstName from RegisterTut_Table1 where tut_ID='" + Uid + "'", con);
                    cmd2.ExecuteNonQuery();
                    Session["tut_ID"] = lblID.Text;
                    Session["tut_FirstName"] = lblFirstName.Text;
                    cmd.ExecuteNonQuery();
                    SqlCommand cmd3 = new SqlCommand("delete from GUID_Tut_Table where UID='" + Uid + "'", con);
                    cmd3.ExecuteNonQuery();
                    Response.Redirect("UploadVideo.aspx");
                }
            }
        }
        protected void btnClear_Click1(object sender, EventArgs e)
        {
            lblError.Text = "";
            txtPassword.Text = "";
            txtConfPassword.Text = "";
            txtAns.Text = "";
        }
    }
}