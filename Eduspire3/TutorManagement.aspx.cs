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

namespace Eduspire3
{
    public partial class TutorManagement : System.Web.UI.Page
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
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand comm = new SqlCommand("Select * from RegisterTut_Table1", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        private void ClearPrevErrors()
        {
            lblEmailError.Text = "";
            lblFNameError.Text = "";
            lblLNameError.Text = "";
            lblContactError.Text = "";
        }
        
        private Boolean CheckEmailInRegister()
        {
            Boolean emailavailable = false;
            SqlConnection con = new SqlConnection(mycon);
            String query = "Select * from RegisterTut_Table1 where tut_EmailID='" + txtEmailID.Text + "'";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = com;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                emailavailable = true;
            }
            con.Close();
            return emailavailable;
        }
        private Boolean CheckFNameInRegister()
        {
            Boolean FName = false;
            SqlConnection con = new SqlConnection(mycon);
            String query = "Select * from RegisterTut_Table1 where tut_FirstName='" + txtFName.Text + "'";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = com;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                FName = true;
            }
            con.Close();
            return FName;
        }
        private Boolean CheckLNameInRegister()
        {
            Boolean LName = false;
            SqlConnection con = new SqlConnection(mycon);
            String query = "Select * from RegisterTut_Table1 where tut_LastName='" + txtLName.Text + "'";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = com;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                LName = true;
            }
            con.Close();
            return LName;
        }
        private Boolean CheckContactInRegister()
        {
            Boolean Contact = false;
            SqlConnection con = new SqlConnection(mycon);
            String query = "Select * from RegisterTut_Table1 where tut_ContactNo='" + txtContactNo.Text + "'";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = com;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Contact = true;
            }
            con.Close();
            return Contact;
        }
        private bool ValidEmail()
        {
            Boolean Email = false;
            Regex regEmail = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
            Match matchEmail = regEmail.Match(txtEmailID.Text);
            if (matchEmail.Success)
            {
                Email = true;
            }
            return Email;
        }
        private bool ValidFName()
        {
            Boolean FName = false;
            Regex regFName = new Regex(@"[a-zA-Z]+");
            Match matchFName = regFName.Match(txtFName.Text);
            if (matchFName.Success)
            {
                FName = true;
            }
            return FName;
        }
        private bool ValidLName()
        {
            Boolean LName = false;
            Regex regLName = new Regex(@"[a-zA-Z]+");
            Match matchLName = regLName.Match(txtLName.Text);
            if (matchLName.Success)
            {
                LName = true;
            }
            return LName;
        }
        private bool ValidContact()
        {
            Boolean Contact = false;
            Regex regContact = new Regex(@"^([7-9]{1})([0-9]{9})$");
            Match matchContact = regContact.Match(txtContactNo.Text);
            if (matchContact.Success)
            {
                Contact = true;
            }
            return Contact;
        }

        protected void btnSearch_Click1(object sender, EventArgs e)
        {
            ClearPrevErrors();
            if (txtEmailID.Text != "")
            {
                if(ValidEmail()==false)
                {
                    lblEmailError.Text = "Please enter valid Email";
                }
                else if(CheckEmailInRegister() == false)
                {
                    lblEmailError.Text = "Entered Email doesn't exist";
                }
                else
                {
                    ClearPrevErrors();
                    txtFName.Text = "";
                    txtLName.Text = "";
                    txtContactNo.Text = "";
                    SqlConnection con = new SqlConnection(mycon);
                    SqlCommand comm = new SqlCommand("Select * from RegisterTut_Table1 where tut_EmailID='" + txtEmailID.Text + "'", con);
                    SqlDataAdapter d = new SqlDataAdapter(comm);
                    DataTable dt = new DataTable();
                    d.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    con.Open();
                    //SqlCommand com = new SqlCommand("Select * from RegisterTut_Table1 where tut_EmailID='" + txtEmailID.Text + "'", con);
                    SqlDataReader r = comm.ExecuteReader();
                    while (r.Read())
                    {
                        lblID.Text = r.GetValue(0).ToString();
                    }
                    con.Close();
                }
            }
            if (txtFName.Text != "")
            {
                if (ValidFName() == false)
                {
                    lblFNameError.Text = "Enter alphabets only.";
                }
                else if(CheckFNameInRegister()==false)
                {
                    lblFNameError.Text = "Entered First Name doesn't exist";
                }
                else
                {
                    ClearPrevErrors();
                    txtEmailID.Text = "";
                    txtLName.Text = "";
                    txtContactNo.Text = "";
                    SqlConnection con = new SqlConnection(mycon);
                    SqlCommand comm = new SqlCommand("Select * from RegisterTut_Table1 where tut_FirstName='" + txtFName.Text + "'", con);
                    SqlDataAdapter d = new SqlDataAdapter(comm);
                    DataTable dt = new DataTable();
                    d.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                    
            }
            if (txtLName.Text != "")
            {
                if (ValidLName() == false)
                {
                    lblLNameError.Text = "Enter alphabets only.";
                }
                else if (CheckLNameInRegister() == false)
                {
                    lblLNameError.Text = "Entered Last Name doesn't exist";
                }
                else
                {
                    ClearPrevErrors();
                    txtEmailID.Text = "";
                    txtFName.Text = "";
                    txtContactNo.Text = "";
                    SqlConnection con = new SqlConnection(mycon);
                    SqlCommand comm = new SqlCommand("Select * from RegisterTut_Table1 where tut_LastName='" + txtLName.Text + "'", con);
                    SqlDataAdapter d = new SqlDataAdapter(comm);
                    DataTable dt = new DataTable();
                    d.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                
            }
            if (txtContactNo.Text != "")
            {
                if (ValidContact() == false)
                {
                    lblContactError.Text = "Please enter a valid Contact Number.";
                }
                else if (CheckContactInRegister() == false)
                {
                    lblContactError.Text = "Entered Contact Number doesn't exist";
                }
                else
                {
                    ClearPrevErrors();
                    txtEmailID.Text = "";
                    txtFName.Text = "";
                    txtLName.Text = "";
                    SqlConnection con = new SqlConnection(mycon);
                    SqlCommand comm = new SqlCommand("Select * from RegisterTut_Table1 where tut_ContactNo='" + txtContactNo.Text + "'", con);
                    SqlDataAdapter d = new SqlDataAdapter(comm);
                    DataTable dt = new DataTable();
                    d.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            ClearPrevErrors();
            if (txtEmailID.Text != "")
            {
                if (ValidEmail() == false)
                {
                    lblEmailError.Text = "Please enter valid Email";
                }
                else if (CheckEmailInRegister() == true)
                {
                    lblEmailError.Text = "Entered Email already exists";
                }
                else
                {
                    ClearPrevErrors();
                    SqlConnection con = new SqlConnection(mycon);
                    con.Open();
                    SqlCommand comm = new SqlCommand("update RegisterTut_Table1 set tut_EmailID='" + txtEmailID.Text + "' where tut_ID='" + int.Parse(lblID.Text) + "' ", con);
                    comm.ExecuteNonQuery();
                    con.Close();
                    //Response.Write("<script>alert('Successfully Updated!')</script>");
                    LoadRecord();
                }
            }
            if (txtFName.Text != "")
            {
                if (ValidFName() == false)
                {
                    lblFNameError.Text = "Enter alphabets only.";
                }
                else
                {
                    ClearPrevErrors();
                    SqlConnection con = new SqlConnection(mycon);
                    con.Open();
                    SqlCommand comm = new SqlCommand("update RegisterTut_Table1 set tut_FirstName='" + txtFName.Text + "' where tut_ID='" + int.Parse(lblID.Text) + "' ", con);
                    comm.ExecuteNonQuery();
                    con.Close();
                    //Response.Write("<script>alert('Successfully Updated!')</script>");
                    LoadRecord();
                }
            }
            if (txtLName.Text != "")
            {
                if (ValidLName() == false)
                {
                    lblLNameError.Text = "Enter alphabets only.";
                }
                else
                {
                    ClearPrevErrors();
                    SqlConnection con = new SqlConnection(mycon);
                    con.Open();
                    SqlCommand comm = new SqlCommand("update RegisterTut_Table1 set tut_LastName='" + txtLName.Text + "' where tut_ID='" + int.Parse(lblID.Text) + "' ", con);
                    comm.ExecuteNonQuery();
                    con.Close();
                    //Response.Write("<script>alert('Successfully Updated!')</script>");
                    LoadRecord();
                }
            }
            if (txtContactNo.Text != "")
            {
                if (ValidContact() == false)
                {
                    lblContactError.Text = "Please enter a valid Contact Number.";
                }
                else
                {
                    ClearPrevErrors();
                    SqlConnection con = new SqlConnection(mycon);
                    con.Open();
                    SqlCommand comm = new SqlCommand("update RegisterTut_Table1 set tut_ContactNo='" + txtContactNo.Text + "' where tut_ID='" + int.Parse(lblID.Text) + "' ", con);
                    comm.ExecuteNonQuery();
                    con.Close();
                    //Response.Write("<script>alert('Successfully Updated!')</script>");
                    LoadRecord();
                }

            }
            Response.Write("<script>alert('Successfully Updated!')</script>");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ClearPrevErrors();
            if (txtEmailID.Text == "")
            {
                lblEmailError.Text = "Please enter EmailID";
            }
            else if (ValidEmail() == false)
            {
                lblEmailError.Text = "Please enter valid Email";
            }
            else if (CheckEmailInRegister() == false)
            {
                lblEmailError.Text = "Entered Email doesn't exist";
            }
            else
            {
                lblEmailError.Text = "";
                SqlConnection con = new SqlConnection(mycon);
                con.Open();
                SqlCommand comm = new SqlCommand("delete RegisterTut_Table1 where tut_EmailID='" + txtEmailID.Text + "' ", con);
                comm.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Successfully deleted!')</script>");
                LoadRecord();
            }
        }

        protected void btnShowAllReg_Click(object sender, EventArgs e)
        {
            ClearPrevErrors();
            LoadRecord();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int rowind = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            lblID.Text = GridView1.Rows[rowind].Cells[0].Text;
            txtFName.Text = GridView1.Rows[rowind].Cells[1].Text;
            txtLName.Text = GridView1.Rows[rowind].Cells[2].Text;
            txtContactNo.Text = GridView1.Rows[rowind].Cells[3].Text;
            txtEmailID.Text = GridView1.Rows[rowind].Cells[4].Text;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtEmailID.Text = "";
            txtFName.Text = "";
            txtLName.Text = "";
            txtContactNo.Text = "";
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadRecord();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}