using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace Eduspire3
{
    public partial class ResetPassForTut9 : System.Web.UI.Page
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
                        Response.Write("<script>alert('Your Password reset link is invalid or expired!');</script>");
                        return;
                    }
                }
                else
                {
                    Response.Redirect("~/ForgotPassForTut.aspx");
                }
            }
            if (!IsPostBack)
            {
                if (dt.Rows.Count != 0)
                {
                    txtNewPass.Visible = true;
                    txtConfPass.Visible = true;
                    btnReset.Visible = true;
                }
                else
                {
                    Response.Write("<script>alert('Your Password reset link is invalid or expired!');</script>");
                    return;
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            if (txtNewPass.Text != "" && txtConfPass.Text != "" && txtNewPass.Text == txtConfPass.Text)
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("update RegisterTut_Table1 set tut_Password='" + txtNewPass.Text + "' where tut_ID='" + Uid + "'", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    SqlCommand cmd2 = new SqlCommand("delete from GUID_Tut_Table where UID='" + Uid + "'", con);
                    cmd2.ExecuteNonQuery();
                    Response.Write("<script>alert('Password changed successfully!!!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('All fields are mandatory');</script>");
            }
        }
    }
}