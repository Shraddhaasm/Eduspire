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
    public partial class LoginAsStu : System.Web.UI.Page
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
                else if (CheckStudent() == true)
                {
                    //string pass = txtPassword.Text.Trim();
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select * from RegisterStu_Table5 where stu_EmailID ='" + txtEmailID.Text + "'  and stu_Password ='" + txtPassword.Text + "'", con);
                    //SqlCommand cmd = new SqlCommand();
                    //cmd.Connection = con;
                    //cmd.CommandType = CommandType.Text;
                    //cmd.CommandText = "select * from RegisterStu_Table5 where stu_EmailID COLLATE SQL_Latin1_General_CP1_CS_AS=@Email and stu_Password COLLATE SQL_Latin1_General_CP1_CS_AS=@Pass";
                    //cmd.Parameters.AddWithValue("@Email", txtEmailID.Text.Trim());
                    //cmd.Parameters.AddWithValue("@Pass", txtPassword.Text.Trim());
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    if (dt != null && dt.Rows.Count != 0)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            Session["stu_ID"] = row["stu_ID"].ToString();
                            Session["stu_FirstName"] = row["stu_FirstName"].ToString();
                            Session["stu_LastName"] = row["stu_LastName"].ToString();
                            Session["stu_ContactNo"] = row["stu_ContactNo"].ToString();
                            Session["stu_EmailID"] = row["stu_EmailID"].ToString();
                            Session["stu_DOB"] = row["stu_DOB"].ToString();
                            Session["stu_Gender"] = row["stu_Gender"].ToString();
                            Session["PlanName"] = row["PlanName"].ToString();
                            Session["PlanStartDate"] = row["PlanStartDate"].ToString();
                            Session["PlanEndDate"] = row["PlanEndDate"].ToString();
                            Session["IsPlanActive"] = row["IsPlanActive"].ToString();
                            Session["Created_On"] = row["Created_On"].ToString(); 
                        }
                        if (Session["IsPlanActive"].ToString() != "True")
                        {
                            Response.Redirect("PlanSelection.aspx");
                        }
                        else
                        {
                            Response.Redirect("CoursesStu.aspx");
                        }
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
        private Boolean CheckStudent()
        {
            Boolean Student = false;
            SqlConnection con = new SqlConnection(CS);
            String query = "Select * from RegisterStu_Table5 where stu_EmailID='" + txtEmailID.Text + "'";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = com;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Student = true;
            }
            con.Close();
            return Student;
        }
    }
}