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
    public partial class PlanSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["stu_ID"] != null)
            {
                Hidden_stu_ID.Value = Session["stu_ID"].ToString();
                Hidden_stu_FName.Value = Session["stu_FirstName"].ToString();
                Hidden_stu_ContactNo.Value = Session["stu_ContactNo"].ToString();
            }
            else
            {
                Response.Redirect("HomePage.aspx");
            }
            string constr = WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
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

        protected void Basic_Click(object sender, EventArgs e)
        {
            string Amount = lblBasic.Text;
            string Plan = "Basic";
            string EmailID = Session["stu_EmailID"].ToString();
            Response.Redirect(string.Format("Checkout.aspx?Name={0}&Email={1}&Contact={2}&Plan={3}&Amount={4}&stu_ID={5}", Hidden_stu_FName.Value, EmailID, Hidden_stu_ContactNo.Value, Plan, Amount, Hidden_stu_ID.Value));
        }

        protected void Plus_Click(object sender, EventArgs e)
        {
            string Amount = lblPlus.Text;
            string Plan = "Plus";
            string EmailID = Session["stu_EmailID"].ToString();
            Response.Redirect(string.Format("Checkout.aspx?Name={0}&Email={1}&Contact={2}&Plan={3}&Amount={4}&stu_ID={5}", Hidden_stu_FName.Value, EmailID, Hidden_stu_ContactNo.Value, Plan, Amount, Hidden_stu_ID.Value));
        }

        protected void Pro_Click(object sender, EventArgs e)
        {
            string Amount = lblPro.Text;
            string Plan = "Pro";
            string EmailID = Session["stu_EmailID"].ToString();
            Response.Redirect(string.Format("Checkout.aspx?Name={0}&Email={1}&Contact={2}&Plan={3}&Amount={4}&stu_ID={5}", Hidden_stu_FName.Value, EmailID, Hidden_stu_ContactNo.Value, Plan, Amount, Hidden_stu_ID.Value));
        }
    }
}