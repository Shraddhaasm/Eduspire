using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

namespace Eduspire3
{
    public partial class LoginAsTutor7 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string constr = WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            try
            {
                if (CheckAdmin() == true)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select * from Admin_Table7 where adm_EmailID='" + txtEmailID.Text + "' and adm_Password='" + txtPassword.Text + "' ", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    if (dt != null && dt.Rows.Count != 0)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            Session["adm_ID"] = row["adm_ID"].ToString();
                            Session["adm_FirstName"] = row["adm_FirstName"].ToString();
                            Session["adm_LastName"] = row["adm_LastName"].ToString();
                            Session["adm_ContactNo"] = row["adm_ContactNo"].ToString();
                            Session["adm_EmailID"] = row["adm_EmailID"].ToString();
                        }
                        Response.Redirect("CandidateManagement.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('The entered credentials are incorrect.')</script>");
                    }
                }
                else if (CheckTutor() == true)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select * from RegisterTut_Table1 where tut_EmailID='" + txtEmailID.Text + "' and tut_Password='" + txtPassword.Text + "' ", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    if (dt != null && dt.Rows.Count != 0)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            Session["tut_ID"] = row["tut_ID"].ToString();
                            Session["tut_FirstName"] = row["tut_FirstName"].ToString();
                            Session["tut_LastName"] = row["tut_LastName"].ToString();
                            Session["tut_ContactNo"] = row["tut_ContactNo"].ToString();
                            Session["tut_EmailID"] = row["tut_EmailID"].ToString();
                            Session["tut_Gender"] = row["tut_Gender"].ToString();
                            Session["Created_On"] = row["Created_On"].ToString();
                        }
                        Response.Redirect("UploadVideo.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('The entered credentials are incorrect.')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('No account exists corresponds with entered credentials.')</script>");
                }
            }
            //catch (Exception ex)
            catch(Exception)
            {
                //Response.Write(ex.Message);
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtEmailID.Text = "";
            txtPassword.Text = "";
        }
        private Boolean CheckAdmin()
        {
            Boolean Admin = false;
            SqlConnection con = new SqlConnection(CS);
            String query = "Select * from Admin_Table7 where adm_EmailID='" + txtEmailID.Text + "'";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = com;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Admin = true;
            }
            con.Close();
            return Admin;
        }
        private Boolean CheckTutor()
        {
            Boolean Tutor = false;
            SqlConnection con = new SqlConnection(CS);
            String query = "Select * from RegisterTut_Table1 where tut_EmailID='" + txtEmailID.Text + "'";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = com;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Tutor = true;
            }
            con.Close();
            return Tutor;
        }
    }
}