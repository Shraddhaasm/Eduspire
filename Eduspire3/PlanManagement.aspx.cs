using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text.RegularExpressions;

namespace Eduspire3
{
    public partial class PlanManagement : System.Web.UI.Page
    {
        String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }
        private void LoadRecord()
        {
            string constr = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            SqlCommand comm = new SqlCommand("select * from PlanPrice_Table10 where ID='1'", conn);
            SqlDataReader r = comm.ExecuteReader();
            while (r.Read())
            {
                lblBasic.Text = r.GetValue(1).ToString();
                lblPlus.Text = r.GetValue(2).ToString();
                lblPro.Text = r.GetValue(3).ToString();
                lblUpdate.Text = r.GetValue(4).ToString();
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(txtBasicPrice.Text != "")
            {
                SqlConnection con = new SqlConnection(mycon);
                con.Open();
                SqlCommand comm = new SqlCommand("update PlanPrice_Table10 set Basic_Price='" + txtBasicPrice.Text + "', Updated_On = getdate() where ID='1' ", con);
                comm.ExecuteNonQuery();
                con.Close();
            }
            if(txtPlusPrice.Text!="")
            {
                SqlConnection con = new SqlConnection(mycon);
                con.Open();
                SqlCommand comm = new SqlCommand("update PlanPrice_Table10 set Plus_Price='" + txtPlusPrice.Text + "', Updated_On = getdate() where ID='1' ", con);
                comm.ExecuteNonQuery();
                con.Close();
            }
            if(txtProPrice.Text!="")
            {
                SqlConnection con = new SqlConnection(mycon);
                con.Open();
                SqlCommand comm = new SqlCommand("update PlanPrice_Table10 set Pro_Price='" + txtProPrice.Text + "', Updated_On = getdate() where ID='1' ", con);
                comm.ExecuteNonQuery();
                con.Close();
            }
            Response.Write("<script>alert('Updated Successfully!')</script>");
            LoadRecord();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtBasicPrice.Text = "";
            txtPlusPrice.Text = "";
            txtProPrice.Text = "";
        }
    }
}