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
using System.Drawing;
using System.Drawing.Imaging;
using ZXing;

namespace Eduspire3
{
    public partial class PassPage : System.Web.UI.Page
    {
        String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            

            lbluserid.Text = Session["stu_ID"].ToString();
            lblName.Text = Session["stu_FirstName"].ToString();
            //  lblLastName.Text = Session["LastName"].ToString();

            SqlConnection cn = new SqlConnection(mycon);
            string sql = "Select RegisterStu_Table5.stu_EmailID, RegisterStu_Table5.stu_LastName,TestDetails.Courses,TestDetails.TestName,ResultTable.TotalQuession,ResultTable.CorretAnsCount,ResultTable.TotalMarks,ResultTable.CreatedOn from TestDetails,ResultTable,RegisterStu_Table5 where TestDetails.id=ResultTable.Test_Id and RegisterStu_Table5.stu_ID=ResultTable.stu_ID and ResultTable.stu_ID='" + lbluserid.Text + "' and TestDetails.id='" + Session["TestID"].ToString() + "' order by ResultTable.CreatedOn desc";
            //string sql = "SELECT TOP 1 *  from ResultTable  where stu_ID='" + lbluserid.Text + "' order by id desc ";

            SqlCommand cmd = new SqlCommand(sql, cn);
            cn.Open();
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                if (dr.Read())
                {
                    //email,testname,created on
                    lblLastName.Text = dr["stu_LastName"].ToString();
                    lblEmailID.Text = dr["stu_EmailID"].ToString();
                    lbltestCourse.Text = dr["Courses"].ToString();
                    lblTestName.Text = dr["TestName"].ToString();
                    lblNoOFQuestions.Text = dr["TotalQuession"].ToString();
                    lblAns.Text = dr["CorretAnsCount"].ToString();
                    lbltotalmarks.Text = dr["TotalMarks"].ToString();
                    lblDate.Text = dr["CreatedOn"].ToString();
                }
            }
        }

        protected void btnCertificate_Click(object sender, EventArgs e)
        {
            string URL = "http://localhost:54911/Certificate.aspx?ID=" + lbluserid.Text + "&FName=" + lblName.Text + "&LName=" + lblLastName.Text + "";
            lblURL.Text = URL.ToString();
            GenerateCode(lblURL.Text);
        }
        private void GenerateCode(string link)
        {
            var writer = new BarcodeWriter();
            writer.Format = BarcodeFormat.QR_CODE;
            var result = writer.Write(link);
            string path = Server.MapPath("~/QR/QRImage.jpg");
            var barcodeBitmap = new Bitmap(result);

            using (MemoryStream memory = new MemoryStream())
            {
                using (FileStream fs = new FileStream(path, FileMode.Create, FileAccess.ReadWrite))
                {
                    barcodeBitmap.Save(memory, ImageFormat.Jpeg);
                    byte[] bytes = memory.ToArray();
                    fs.Write(bytes, 0, bytes.Length);
                }
            }
            Response.Redirect("Certificate.aspx?ID="+lbluserid.Text+"&FName="+lblName.Text+"&LName="+lblLastName.Text);
            //Image1.Visible = true;
            //Image1.ImageUrl = "~/QR/QRImage.jpg";
        }
    }
}