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

namespace Eduspire3
{
    public partial class StartExam : System.Web.UI.Page
    {
        public static string CsharpFunction()
        {
            return "";
            //Code;
        }
        String CS = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(CS);
            string Id = Request.QueryString["Id"];
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from [dbo].[TestDetails] where id='" + Id + "' select * from [dbo].[Questions] where TestId='" + Id + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            con.Close();
            string CourseType = "";

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                string time = ds.Tables[0].Rows[i]["TestDuration"].ToString() + ":00";
                double seconds = TimeSpan.Parse(time).TotalSeconds;
                HiddenTimmer.Value = seconds.ToString();
                CourseType = ds.Tables[0].Rows[i]["Courses"].ToString();

                HiddenFieldTestId.Value = ds.Tables[0].Rows[i]["id"].ToString();
                testName.Text = ds.Tables[0].Rows[i]["TestName"].ToString();
            }
            string mytabs1 = "";
            string QCards = "";
            string Qid = "";
            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {


                if (i == 0)
                {
                    Qid = ds.Tables[1].Rows[i]["id"].ToString();
                    mytabs1 = mytabs1 + "<li class='active'><a href = '#" + i + "' role = 'tab' data-toggle = 'tab'><icon class='fa fa-home'></icon> '#" + i + "'</a> </li>";
                }
                else
                {
                    Qid = Qid + "," + ds.Tables[1].Rows[i]["id"].ToString();
                    mytabs1 = mytabs1 + "<li><a href =  '#" + i + "' role = 'tab' data-toggle = 'tab'><icon class='fa fa-home'></icon> '#" + i + "'</a> </li>";
                }





                if (i == ds.Tables[1].Rows.Count - 1)
                {
                    QCards = QCards + "<div class='tab-pane fade in' id='" + i + "'>" +
                                                           "<div class='mt-12'>" +
                                                           "<div class='d-flex justify-content-center row'>" +
                                                               " <div class='col-md-10 col-lg-12'>" +
                                                               "     <div class='border'>" +
                                                               "         <div class='question bg-white p-3 border-bottom'>" +
                                                               "             <div class='d-flex flex-row justify-content-between align-items-center mcq'>" +
                                                               "                 <h4>MCQ " + Convert.ToInt32(i + 1) + "</h4> <h6>Student name: " + Session["stu_FirstName"].ToString() + "</h6> <h6>Course type: " + CourseType + "</h6>" +
                                                               "                 <span>(" + Convert.ToInt32(i + 1) + " of " + ds.Tables[1].Rows.Count + ")</span>" +
                                                               "             </div>" +
                                                               "         </div>" +
                                                               "         <div class='modal-dialog'>" +
                                                               "             <div class='modal-content'>" +
                                                               "                 <div class='d-flex flex-row align-items-center question-title'>" +
                                                               "                     <h3 class='text-danger'>Q.</h3>" +
                                                               "                     <h5 class='mt-1 ml-2'>" + ds.Tables[1].Rows[i]["Questions"].ToString() + "</h5>" +
                                                               "                 </div>" +

                                                               "                 <div class='col-xs-6 8'></div>" +
                                                               "                 <div class='quiz' id='quiz' data-toggle='buttons'>" +
                                                               "                     <label class='element-animation1 btn btn-lg btn-danger btn-block'>" +
                                                               "                         <span class='btn-label'><i class='glyphicon glyphicon-chevron-right'></i></span>" +
                                                               "                         <input type = 'radio' name='" + ds.Tables[1].Rows[i]["id"].ToString() + "' style='visibility: hidden;' value='1'>" + ds.Tables[1].Rows[i]["Option1"].ToString() + "</label>" +
                                                               "                     <label class='element-animation2 btn btn-lg btn-danger btn-block'>" +
                                                               "                         <span class='btn-label'><i class='glyphicon glyphicon-chevron-right'></i></span>" +
                                                               "                         <input type = 'radio' name='" + ds.Tables[1].Rows[i]["id"].ToString() + "' style='visibility: hidden;' value='2'>" + ds.Tables[1].Rows[i]["Option2"].ToString() + "</label>" +
                                                               "                     <label class='element-animation3 btn btn-lg btn-danger btn-block'>" +
                                                               "                         <span class='btn-label'><i class='glyphicon glyphicon-chevron-right'></i></span>" +
                                                               "                         <input type = 'radio' name='" + ds.Tables[1].Rows[i]["id"].ToString() + "' style='visibility: hidden;' value='3'>" + ds.Tables[1].Rows[i]["Option3"].ToString() + "</label>" +
                                                               "                     <label class='element-animation4 btn btn-lg btn-danger btn-block'>" +
                                                               "                         <span class='btn-label'><i class='glyphicon glyphicon-chevron-right'></i></span>" +
                                                               "                         <input type = 'radio' name='" + ds.Tables[1].Rows[i]["id"].ToString() + "' style='visibility: hidden;' value='4'>" + ds.Tables[1].Rows[i]["Option4"].ToString() + "</label>" +
                                                                                                                              "</div>" +
                                                               "             </div>" +
                                                               "         </div>" +
                                                               "         <div class='d-flex flex-row justify-content-between align-items-center p-3 bg-white'>" +
                                                               "             <button class='btn btn-primary d-flex align-items-center  btn prev' href='#' type='button'><i class='fa fa-angle-left mt-1 mr-1'></i>&nbsp;previous</button>" +
                                                               "             <button class='btn btn-primary border-success align-items-center btn-success btn next' href='#' type='button' onclick='endExam()'>Exit<i class='fa fa-angle-right ml-2'></i></button>" +
                                                               "         </div>" +
                                                               "     </div>" +
                                                               " </div>" +
                                                            "</div>" +
                                                       "</div>" +
                                                   "</div>";
                }

                else if (i == 0)
                {
                    QCards = QCards + "<div class='tab-pane fade active in' id='" + i + "'>" +
                                                           "<div class='mt-12'>" +
                                                           "<div class='d-flex justify-content-center row'>" +
                                                               " <div class='col-md-10 col-lg-12'>" +
                                                               "     <div class='border'>" +
                                                               "         <div class='question bg-white p-3 border-bottom'>" +
                                                               "             <div class='d-flex flex-row justify-content-between align-items-center mcq'>" +
                                                               "                 <h4>MCQ " + Convert.ToInt32(i + 1) + "</h4> <h6>Student name: " + Session["stu_FirstName"].ToString() + "</h6> <h6>Course type: " + CourseType + "</h6>" +
                                                               "                 <span>(" + Convert.ToInt32(i + 1) + " of " + ds.Tables[1].Rows.Count + ")</span>" +
                                                               "             </div>" +
                                                               "         </div>" +
                                                               "         <div class='modal-dialog'>" +
                                                               "             <div class='modal-content'>" +
                                                               "                 <div class='d-flex flex-row align-items-center question-title'>" +
                                                               "                     <h3 class='text-danger'>Q.</h3>" +
                                                               "                     <h5 class='mt-1 ml-2'>" + ds.Tables[1].Rows[i]["Questions"].ToString() + "</h5>" +
                                                               "                 </div>" +

                                                               "                 <div class='col-xs-6 8'></div>" +
                                                               "                 <div class='quiz' id='quiz' data-toggle='buttons'>" +
                                                               "                     <label class='element-animation1 btn btn-lg btn-danger btn-block'>" +
                                                               "                         <span class='btn-label'><i class='glyphicon glyphicon-chevron-right'></i></span>" +
                                                               "                         <input type = 'radio' name='" + ds.Tables[1].Rows[i]["id"].ToString() + "' style='visibility: hidden;' value='1'>" + ds.Tables[1].Rows[i]["Option1"].ToString() + "</label>" +
                                                               "                     <label class='element-animation2 btn btn-lg btn-danger btn-block'>" +
                                                               "                         <span class='btn-label'><i class='glyphicon glyphicon-chevron-right'></i></span>" +
                                                               "                         <input type = 'radio' name='" + ds.Tables[1].Rows[i]["id"].ToString() + "' style='visibility: hidden;' value='2'>" + ds.Tables[1].Rows[i]["Option2"].ToString() + "</label>" +
                                                               "                     <label class='element-animation3 btn btn-lg btn-danger btn-block'>" +
                                                               "                         <span class='btn-label'><i class='glyphicon glyphicon-chevron-right'></i></span>" +
                                                               "                         <input type = 'radio' name='" + ds.Tables[1].Rows[i]["id"].ToString() + "' style='visibility: hidden;' value='3'>" + ds.Tables[1].Rows[i]["Option3"].ToString() + "</label>" +
                                                               "                     <label class='element-animation4 btn btn-lg btn-danger btn-block'>" +
                                                               "                         <span class='btn-label'><i class='glyphicon glyphicon-chevron-right'></i></span>" +
                                                               "                         <input type = 'radio' name='" + ds.Tables[1].Rows[i]["id"].ToString() + "' style='visibility: hidden;' value='4'>" + ds.Tables[1].Rows[i]["Option4"].ToString() + "</label>" +
                                                                                                                              "</div>" +
                                                               "             </div>" +
                                                               "         </div>" +
                                                               "         <div class='d-flex flex-row justify-content-between align-items-center p-3 bg-white'>" +
                                                               "             <button disabled class='btn btn-primary d-flex align-items-center  btn prev' href='#' type='button'><i class='fa fa-angle-left mt-1 mr-1'></i>&nbsp;previous</button>" +
                                                               "             <button class='btn btn-primary border-success align-items-center btn-success btn next' href='#' type='button'>Next<i class='fa fa-angle-right ml-2'></i></button>" +
                                                               "         </div>" +
                                                               "     </div>" +
                                                               " </div>" +
                                                            "</div>" +
                                                       "</div>" +
                                                   "</div>";
                }
                else
                {
                    QCards = QCards + "<div class='tab-pane fade in' id='" + i + "'>" +
                                                            "<div class='mt-12'>" +
                                                            "<div class='d-flex justify-content-center row'>" +
                                                                " <div class='col-md-10 col-lg-12'>" +
                                                                "     <div class='border'>" +
                                                                "         <div class='question bg-white p-3 border-bottom'>" +
                                                                "             <div class='d-flex flex-row justify-content-between align-items-center mcq'>" +
                                                                "                 <h4>MCQ " + Convert.ToInt32(i + 1) + "</h4> <h6>Student name: " + Session["stu_FirstName"].ToString() + "</h6> <h6>Course type: " + CourseType + "</h6>" +
                                                                "                 <span>(" + Convert.ToInt32(i + 1) + " of " + ds.Tables[1].Rows.Count + ")</span>" +
                                                                "             </div>" +
                                                                "         </div>" +
                                                                "         <div class='modal-dialog'>" +
                                                                "             <div class='modal-content'>" +
                                                                "                 <div class='d-flex flex-row align-items-center question-title'>" +
                                                                "                     <h3 class='text-danger'>Q.</h3>" +
                                                                "                     <h5 class='mt-1 ml-2'>" + ds.Tables[1].Rows[i]["Questions"].ToString() + "</h5>" +
                                                                "                 </div>" +

                                                                "                 <div class='col-xs-6 8'></div>" +
                                                                "                 <div class='quiz' id='quiz' data-toggle='buttons'>" +
                                                                "                     <label class='element-animation1 btn btn-lg btn-danger btn-block'>" +
                                                                "                         <span class='btn-label'><i class='glyphicon glyphicon-chevron-right'></i></span>" +
                                                                "                         <input type = 'radio' name='" + ds.Tables[1].Rows[i]["id"].ToString() + "' style='visibility: hidden;' value='1'>" + ds.Tables[1].Rows[i]["Option1"].ToString() + "</label>" +
                                                                "                     <label class='element-animation2 btn btn-lg btn-danger btn-block'>" +
                                                                "                         <span class='btn-label'><i class='glyphicon glyphicon-chevron-right'></i></span>" +
                                                                "                         <input type = 'radio' name='" + ds.Tables[1].Rows[i]["id"].ToString() + "' style='visibility: hidden;' value='2'>" + ds.Tables[1].Rows[i]["Option2"].ToString() + "</label>" +
                                                                "                     <label class='element-animation3 btn btn-lg btn-danger btn-block'>" +
                                                                "                         <span class='btn-label'><i class='glyphicon glyphicon-chevron-right'></i></span>" +
                                                                "                         <input type = 'radio' name='" + ds.Tables[1].Rows[i]["id"].ToString() + "' style='visibility: hidden;' value='3'>" + ds.Tables[1].Rows[i]["Option3"].ToString() + "</label>" +
                                                                "                     <label class='element-animation4 btn btn-lg btn-danger btn-block'>" +
                                                                "                         <span class='btn-label'><i class='glyphicon glyphicon-chevron-right'></i></span>" +
                                                                "                         <input type = 'radio' name='" + ds.Tables[1].Rows[i]["id"].ToString() + "' style='visibility: hidden;' value='4'>" + ds.Tables[1].Rows[i]["Option4"].ToString() + "</label>" +
                                                                                                                               "</div>" +
                                                                "             </div>" +
                                                                "         </div>" +
                                                                "         <div class='d-flex flex-row justify-content-between align-items-center p-3 bg-white'>" +
                                                                "             <button class='btn btn-primary d-flex align-items-center  btn prev' href='#' type='button'><i class='fa fa-angle-left mt-1 mr-1'></i>&nbsp;previous</button>" +
                                                                "             <button class='btn btn-primary border-success align-items-center btn-success btn next' href='#' type='button'>Next<i class='fa fa-angle-right ml-2'></i></button>" +
                                                                "         </div>" +
                                                                "     </div>" +
                                                                " </div>" +
                                                             "</div>" +
                                                        "</div>" +
                                                    "</div>";
                }

            }
            HiddenField2.Value = mytabs1;
            HiddenField3.Value = QCards;
            HiddenFieldQId.Value = Qid;
        }

        protected void SubmitEaxm_Click(object sender, EventArgs e)
        {
            string QuessionId = HiddenFieldQId.Value;
            string Ans = HiddenFieldAns.Value;
            string tetsId = HiddenFieldTestId.Value;

            Session["TestID"] = HiddenFieldTestId.Value;

            SqlConnection con = new SqlConnection(CS);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from [dbo].[TestDetails] where id='" + tetsId + "' select * from [dbo].[Questions] where TestId=" + tetsId, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            con.Close();
            string passingper = "";
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                passingper = ds.Tables[0].Rows[i]["PassingPer"].ToString();
            }

            int Qcount = ds.Tables[1].Rows.Count;

            var ans1 = Ans.Split('|');
            int TotalMarks = 0;
            int TotalPEr = 0;
            bool IsPass = false;
            int CorrectansCount = 0;
            int TotalQUE = Qcount;
            for (int i = 0; i < ans1.Count() - 1; i++)
            {
                var ans2 = ans1[i].Split(':');
                for (int j = 0; j < ds.Tables[1].Rows.Count; j++)
                {
                    string id = ds.Tables[1].Rows[j]["id"].ToString();
                    string Answer = ds.Tables[1].Rows[j]["Answer"].ToString();

                    if (id == ans2[0])
                    {
                        if (Answer == ans2[1])
                        {
                            CorrectansCount = CorrectansCount + 1;
                        }

                    }
                }
            }
            int echQmarks = 100 / Qcount;
            TotalMarks = echQmarks * CorrectansCount;
            TotalPEr = (int)Math.Round((double)(100 * TotalMarks) / 100);
            if (Convert.ToInt32(passingper) <= TotalPEr)
            {
                IsPass = true;
            }

            con.Open();

            string query = "INSERT INTO [dbo].[ResultTable] ([Test_Id],[stu_ID],[TotalMarks],[IsPass],[TotalPercentage],[CorretAnsCount],[TotalQuession])" +
                            "VALUES('" + tetsId + "', '" + Session["stu_ID"].ToString() + "', '" + TotalMarks + "', '" + IsPass + "', '" + TotalPEr + "', '" + CorrectansCount + "', '" + TotalQUE + "')";
            SqlDataAdapter da = new SqlDataAdapter(query, con);

            da.SelectCommand.ExecuteNonQuery();
            if (IsPass)
            {
                Response.Redirect("PassPage.aspx");
            }
            else
            {
                Response.Redirect("Failed.aspx");
            }
            // ClearData();
        }
    }
}