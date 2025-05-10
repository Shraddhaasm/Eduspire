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
using System.Web.Configuration;
using System.IO;

namespace Eduspire3
{
    public partial class ExploreMore : System.Web.UI.Page
    {
        String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        private Boolean CheckCourse()
        {
            Boolean courseavailable = false;
            SqlConnection con = new SqlConnection(mycon);
            String query = "Select * from [Video_Table12] where VideoOnCourse='" + txtCourse.Text + "'";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = com;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                courseavailable = true;
            }
            con.Close();
            return courseavailable;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if(txtCourse.Text=="")
            {
                lblCourse.Text = "Please enter course name";
            }
            else if(CheckCourse()==false)
            {
                lblCourse.Text = "Entered course doesn't exist";
            }
            else
            {
                lblCourse.Text = "";
                Label6.Text = txtCourse.Text + " Lectures";
                DataList1.DataSourceID = null;
                SqlDataSource SqlDataSource2 = new SqlDataSource();
                SqlDataSource2.ID = "SqlDataSource2";
                this.Page.Controls.Add(SqlDataSource2);
                SqlDataSource2.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                SqlDataSource2.SelectCommand = "select Video_Table12.ID,Video_Table12.tut_ID,Video_Table12.Title,Video_Table12.VideoOnCourse,Video_Table12.Description,Video_Table12.VideoPath,Video_Table12.UploadedOn,RegisterTut_Table1.tut_FirstName,RegisterTut_Table1.tut_LastName from Video_Table12,RegisterTut_Table1 where Video_Table12.tut_ID = RegisterTut_Table1.tut_ID and VideoOnCourse='"+txtCourse.Text+"'";
                DataList1.DataSource = SqlDataSource2;
                DataList1.DataBind();
            }

        }

        protected void btnShowAllReg_Click(object sender, EventArgs e)
        {
            Label6.Text = "";
            lblCourse.Text = "";
            DataList1.DataSourceID = null;
            DataList1.DataSource = SqlDataSource1;
            DataList1.DataBind();
        }
    }
}