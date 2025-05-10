using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Web.Configuration;
using System.Drawing;
using System.Drawing.Imaging;
using ZXing;

namespace Eduspire3
{
    public partial class Certificate : System.Web.UI.Page
    {
        String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                lblDate.Text = DateTime.Now.ToShortDateString();

                Image1.Visible = true;
                Image1.ImageUrl = "~/QR/QRImage.jpg";

                lbluserid.Visible = false;
                LblTestID.Visible = false;
                //age.Visible = true;
                //    CourseSelected();

                lbluserid.Text = Request.QueryString["ID"];
                lblName.Text = Request.QueryString["FName"];
                lblLastName.Text = Request.QueryString["LName"];

                //lbluserid.Text = Session["stu_ID"].ToString();
                //lblName.Text = Session["stu_FirstName"].ToString();
                //lblLastName.Text = Session["stu_Lastname"].ToString();

                // LblTestID.Text = Session["TestID"].ToString();



                SqlConnection cn = new SqlConnection(mycon);

                string sql = "SELECT TOP 1 *  from ResultTable  where stu_ID='" + lbluserid.Text + "' order by id desc ";

                SqlCommand cmd = new SqlCommand(sql, cn);
                cn.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        LblTestID.Text = dr["Test_Id"].ToString();
                    }
                }
                cn.Close();

                SqlConnection cm = new SqlConnection(mycon);
                string sql2 = "SELECT Courses  from TestDetails  where id='" + LblTestID.Text + "'";
                SqlCommand cmd2 = new SqlCommand(sql2, cm);
                cm.Open();
                using (SqlDataReader dr = cmd2.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        lblcourse.Text = dr["Courses"].ToString();
                    }
                }
                cm.Close();
            }
            else
            {
                Response.Redirect("HomePage.aspx");
            }

        }

    }

}