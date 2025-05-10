using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduspire3
{
    public partial class ScheduleTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //CalendarExtender1.StartDate = DateTime.Now.Date;
            txtStart.Text = DateTime.Now.ToShortDateString();
            CalendarExtender2.StartDate = DateTime.Now.Date;
 
            if (Session["tut_ID"] != null)
            {



            }
            else
            {
                Response.Redirect("Login6.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string[] validFilesTypes = { ".xls", ".xlsx" };
                string ext = System.IO.Path.GetExtension(Idupload.PostedFile.FileName);
                bool isValidFile = false;
                for (var i = 0; i < validFilesTypes.Length; i++)
                {
                    if (ext == validFilesTypes[i])
                    {
                        isValidFile = true;
                        break;
                    }
                }
                if (!isValidFile)
                {
                    lbl1.Text = "Invalid File. Please upload a Excel file with extension: " + string.Join(", ", validFilesTypes);
                    lbl1.ForeColor = System.Drawing.Color.Red;
                    lblDrpError1.Text = "";
                    lblDrpError2.Text = "";
                }
                else if (CoursesList.SelectedIndex == 0)
                {
                    lblDrpError1.Text = "Please select Course Name";
                    lbl1.Text = "";
                    lblDrpError2.Text = "";
                }
                else if (DropDownList1.SelectedIndex == 0)
                {
                    lblDrpError2.Text = "Please select Test Duration";
                    lbl1.Text = "";
                    lblDrpError1.Text = "";
                }
                else
                {
                    lblDrpError1.Text = "";
                    lblDrpError2.Text = "";
                    lbl1.Text = "";
                    Random rnd1 = new Random(10);
                    string path = rnd1.Next() + Path.GetFileName(Idupload.FileName);
                    path = path.Replace(" ", "");
                    Idupload.SaveAs(Server.MapPath("~/ExcelFile/") + path);
                    String ExcelPath = Server.MapPath("~/ExcelFile/") + path;
                    OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + ExcelPath + "; Extended Properties=Excel 8.0; Persist Security Info = False");
                    mycon.Open();
                    OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", mycon);
                    OleDbDataReader dr = cmd.ExecuteReader();



                    string query = @"INSERT INTO [dbo].[TestDetails] ([TestName]  ,[Courses],[PassingPer] ," +
                                    "[TestStartDate],[TestEndDate],[TestDuration],[CreatedBy])" +
                                     "VALUES('" + txtName.Text.ToString() + "','" + CoursesList.SelectedValue.ToString() + "','" + TxtMarks.Text.ToString() +
                                    "','" + txtStart.Text.ToString() + "','" + txtEnd.Text.ToString() + "','" + DropDownList1.SelectedValue.ToString() + "','" + Session["tut_ID"].ToString() + "'); SELECT CAST(scope_identity() AS int)";


                    String mycon1 = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                    SqlConnection con1 = new SqlConnection(mycon1);
                    con1.Open();
                    SqlCommand cmd1 = new SqlCommand();
                    cmd1.CommandText = query;
                    cmd1.Connection = con1;
                    int newID = (int)cmd1.ExecuteScalar();
                    //save tets data

                    while (dr.Read())
                    {
                        if (dr[0].ToString() != "")
                        {

                            string Questions = dr[0].ToString();
                            string Option1 = dr[1].ToString();
                            string Option2 = dr[2].ToString();
                            string Option3 = dr[3].ToString();
                            string Option4 = dr[4].ToString();
                            string Answer = dr[5].ToString();
                            savedata(newID, Questions, Option1, Option2, Option3, Option4, Answer);
                        }
                        else
                        {
                            break;
                        }
                    }
                    //lbl1.Text = "File has been Uploaded Successfully";
                    Response.Write("<script>alert('Test uploaded Successfully!')</script>");
                    //lbl1.ForeColor = System.Drawing.Color.Green;
                    mycon.Close();

                    File.Delete(ExcelPath);
                }


            }
            //catch(Exception)
            catch (Exception ex)
            {
                //lbl1.Text = "File has been Uploaded Successfully";
                //lbl1.ForeColor = System.Drawing.Color.Green;
                Response.Write(ex.Message);
            }
        }
        private void savedata(int TestId, String Questions, String Option1, String Option2, String Option3, String Option4, String Answer)
        {
            String query = "insert into Questions(TestId,Questions,Option1,Option2,Option3,Option4,Answer) values(" + TestId + ",'" + Questions + "','" + Option1 + "','" + Option2 + "','" + Option3 + "','" + Option4 + "','" + Answer + "')";
            String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }




        //private void UpdateDatabase(int No, String Questions, String Option1, String Option2, String Option3, String Option4, String Answer)
        //{
        //    String query = "update Test set Questions='" + Questions + "', Option1='" + Option1 + "', Option2='" + Option2 + "', Option3='" + Option3 + "', Option4='" + Option4 + "', Answer='" + Answer + "' where No=" + No;
        //    String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        //    SqlConnection con = new SqlConnection(mycon);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = query;
        //    cmd.Connection = con;
        //    cmd.ExecuteNonQuery();

        //}

        protected void Reset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            TxtMarks.Text = "";
            txtEnd.Text = "";
        }
    }
}