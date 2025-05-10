using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Windows.Forms;

namespace Eduspire3
{
    public partial class RegisterAsStu : System.Web.UI.Page
    {
        String CS = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            StuAutoID();
            //data from previous page
            if (!IsPostBack)
            {
                if (Session["EmailID"] != null)
                {
                    lbl2EmailID.Text = Session["EmailID"].ToString();
                }
                else
                {
                    Response.Redirect("VerifyStudent.aspx");
                }
            }
        }

        //Auto generated tutor ID
        private void StuAutoID()
        {
            String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection connection = new SqlConnection(mycon);
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select top 1 * from RegisterStu_Table5 order by stu_ID Desc", connection);
            //SqlCommand cmd = new SqlCommand("Select count(stu_ID)from[RegisterStu_Table5]", connection);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            connection.Close();
            i++;
            lblStuIDNo.Text = i.ToString();
        }

        

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if(drpdwnlstSecQues.SelectedIndex==0)
            {
                lblError.Text = "Please enter Security Question";
            }
            else
            {
                lblError.Text = "";
                String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                SqlConnection con = new SqlConnection(mycon);
                con.Open();
                string query = "insert into RegisterStu_Table5 (stu_ID,stu_FirstName,stu_LastName,stu_ContactNo,stu_EmailID,stu_DOB,stu_Gender,stu_Password,stu_Ques,stu_Ans,Created_On) values ('" + lblStuIDNo.Text + "','" + txtFirstName.Text + "','" + txtLastName.Text + "','" + txtContactNo.Text + "','" + lbl2EmailID.Text + "','" + txtDOB.Text + "','" + radiobtnlstGender.SelectedValue + "','" + txtPassword.Text + "','" + drpdwnlstSecQues.SelectedValue + "','" + txtAns.Text + "',getdate())";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Session["stu_ID"] = lblStuIDNo.Text;
                Session["stu_FirstName"] = txtFirstName.Text;
                Session["stu_ContactNo"] = txtContactNo.Text;
                Response.Redirect("PlanSelection.aspx");
            }
            
            
            
            //Response.Write("<script>alert('" + drpdwnlstTitle.SelectedValue + txtFirstName.Text + " you have registered successfully!')</script>");

            //Response.Redirect("WebForm1.aspx");
            //MessageBox.Show("success");
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtContactNo.Text = "";
            txtDOB.Text = "";
            radiobtnlstGender.SelectedValue = null;
            txtPassword.Text = "";
            txtConfPassword.Text = "";
        }
    }
}