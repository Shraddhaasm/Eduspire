using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Configuration;
using System.Web.Configuration;
using System.Windows.Forms;
using System.Text.RegularExpressions;


namespace Eduspire3
{
    public partial class ExamDetailsAdm : System.Web.UI.Page
    {
        String CS = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetExamDetails();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GetExamDetails();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
        public void GetExamDetails()
        {
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("SELECT [id]      ,[TestName]      ,[Courses]      ,[PassingPer]      ,[TestStartDate]      ,[TestEndDate]      ,[TestDuration], " +
                "isnull((select count(id) from[dbo].[Questions] where TestId = ts.[id]),0) as TotalQuestions, " +
                "isnull((select count(id) from[dbo].[ResultTable] where Test_id = ts.[id] and stu_ID = " + Session["adm_ID"] + "),0) as TotalAttempts," +
                "isnull((select count(id) from[dbo].[ResultTable] where Test_id = ts.[id] and IsPass = 1 and stu_ID =" + Session["adm_ID"] + "),0) as IsPass" +
                " FROM [dbo].[TestDetails] ts order by id desc", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}