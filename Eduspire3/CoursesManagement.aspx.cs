using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Eduspire3
{
    public partial class CoursesManagement : System.Web.UI.Page
    {
        String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            AutoID();
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }
        private void AutoID()
        {
            String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection connection = new SqlConnection(mycon);
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select top 1 * from Course_Table13 order by ID Desc", connection);
            //SqlCommand cmd = new SqlCommand("Select count(ID)from[Course_Table13]", connection);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            connection.Close();
            i++;
            lblID.Text = i.ToString();
        }
        private void LoadRecord()
        {
            DataList1.DataSourceID = null;
            SqlDataSource SqlDataSource2 = new SqlDataSource();
            SqlDataSource2.ID = "SqlDataSource2";
            this.Page.Controls.Add(SqlDataSource2);
            SqlDataSource2.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlDataSource2.SelectCommand = "Select ID,Course,CreatedOn from Course_Table13 except select ID,Course,CreatedOn from Course_Table13 where ID = 0";
            DataList1.DataSource = SqlDataSource2;
            DataList1.DataBind();
        }
        private Boolean CheckCourseInDB()
        {
            Boolean courseavailable = false;
            SqlConnection con = new SqlConnection(mycon);
            String query = "Select * from Course_Table13 where Course='" + txtCourse.Text + "'";
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            lblCourseError.Text = "";
            if(txtCourse.Text=="")
            {
                lblCourseError.Text = "Please enter Course name";
            }
            else if(CheckCourseInDB()==true)
            {
                lblCourseError.Text = "Entered Course already exists";
            }
            else
            {
                lblCourseError.Text = "";
                String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                SqlConnection con = new SqlConnection(mycon);
                con.Open();
                string query = "insert into Course_Table13 (ID,Course,CreatedOn) values ('" + lblID.Text + "','" + txtCourse.Text + "',getdate())";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Added Successfully!')</script>");
                txtCourse.Text = "";
                LoadRecord();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            lblCourseError.Text = "";
            if(txtCourse.Text=="")
            {
                lblCourseError.Text = "Please enter Course Name";
            }
            else if(CheckCourseInDB()==false)
            {
                lblCourseError.Text = "Entered Course doesn't exist";
            }
            else
            {
                lblCourseError.Text = "";
                SqlConnection con = new SqlConnection(mycon);
                con.Open();
                SqlCommand comm = new SqlCommand("delete Course_Table13 where Course='" + txtCourse.Text + "' ", con);
                comm.ExecuteNonQuery();
                con.Close();
                txtCourse.Text = "";
                Response.Write("<script>alert('Successfully deleted!')</script>");
                LoadRecord();
            }
        }

        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            string id = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("Label1")).Text;
            string del = "delete from Course_Table13 where ID=" + id;
            SqlCommand cmd = new SqlCommand(del, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LoadRecord();
        }
    }
}