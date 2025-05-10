using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Windows.Forms;
using System.Configuration;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace Eduspire3
{
    public partial class Resume : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["dbcon"].ToString();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("Insert into [Resume] ( FirstName , MiddleName , LastName , EmailAddr , ContactNo , Address , Keyskills , Employment , SoftwareDev , ProjectTitle , ProjectTag , EnterClient , ProjectStatus  , NatureOfEmp , EducationLevel , BoardName , PassingOutYear , Medium , PassingPer , CertificateName , CertifiedOn , SkillName , LastUsed , WorkExperience) " +
                "values(@FirstName , @MiddleName , @LastName , @EmailAddr , @ContactNo , @Address , @Keyskills , @Employment , @SoftwareDev , @ProjectTitle , @ProjectTag , @EnterClient , " +
                "@ProjectStatus  , @NatureOfEmp , @EducationLevel , @BoardName , @PassingOutYear , @Medium , @PassingPer , @CertificateName , @CertifiedOn  , @SkillName , @LastUsed , @WorkExperience )", con);
            cmd1.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd1.Parameters.AddWithValue("@MiddleName", txtMidName.Text);
            cmd1.Parameters.AddWithValue("@LastName", txtlastName.Text);
            cmd1.Parameters.AddWithValue("@EmailAddr", txtEmail.Text);
            cmd1.Parameters.AddWithValue("@ContactNo", txtContact.Text);
            cmd1.Parameters.AddWithValue("@Address", txtProfile.Text);
            cmd1.Parameters.AddWithValue("@Keyskills", txtSkills.Text);
            cmd1.Parameters.AddWithValue("@Employment", txtEmployment.Text);
            cmd1.Parameters.AddWithValue("@SoftwareDev", txtSoftwareDev.Text);

            cmd1.Parameters.AddWithValue("@ProjectTitle", txtProTitle.Text);
            cmd1.Parameters.AddWithValue("@ProjectTag", txtProjectTag.Text);
            cmd1.Parameters.AddWithValue("@EnterClient", TxtClient.Text);
            cmd1.Parameters.AddWithValue("@ProjectStatus", txtProStatus.Text);
            //cmd1.Parameters.AddWithValue("@WorkDuration", txtWork.Text);
            cmd1.Parameters.AddWithValue("@NatureOfEmp", natureOfEmp.Text);

            cmd1.Parameters.AddWithValue("@EducationLevel", txtEducation.Text);
            cmd1.Parameters.AddWithValue("@BoardName", txtBoard.Text);
            cmd1.Parameters.AddWithValue("@PassingOutYear", txtPassingYear.Text);
            cmd1.Parameters.AddWithValue("@Medium", txtMedium.Text);
            cmd1.Parameters.AddWithValue("@PassingPer", txtPassingPer.Text);

            cmd1.Parameters.AddWithValue("@CertificateName", txtCertificateName.Text);
            cmd1.Parameters.AddWithValue("@CertifiedOn", txtCertificate.Text);
            //cmd1.Parameters.AddWithValue("@CertificateValidTill", txtCertificateValid.Text);

            cmd1.Parameters.AddWithValue("@SkillName", txtSkill.Text);
            cmd1.Parameters.AddWithValue("@LastUsed", txtlastUsed.Text);
            cmd1.Parameters.AddWithValue("@WorkExperience", txtExperience.Text);

            cmd1.ExecuteNonQuery();
            cmd1.Parameters.Clear();
            Response.Write("<script>alert('Submitted Successfully!')</script>");

            Session["FirstName"] = txtFirstName.Text;
            Session["MiddleName"] = txtMidName.Text;
            Session["LastName"] = txtlastName.Text;
            Session["EmailAddr"] = txtEmail.Text;
            Session["ContactNo"] = txtContact.Text;
            Session["Address"] = txtProfile.Text;
            Session["Keyskills"] = txtSkills.Text;
            Session["Employment"] = txtEmployment.Text;
            Session["SoftwareDev"] = txtSoftwareDev.Text;

            Session["SkillName"] = txtSkill.Text;
            Session["LastUsed"] = txtlastUsed.Text;
            Session["WorkExperience"] = txtExperience.Text;

            Session["ProjectTitle"] = txtProTitle.Text;
            Session["ProjectTag"] = txtProjectTag.Text;
            Session["EnterClient"] = TxtClient.Text;
            Session["ProjectStatus"] = txtProStatus.Text;
            //Session["WorkDuration"] = txtWork.Text;
            Session["NatureOfEmp"] = natureOfEmp.Text;


            Session["EducationLevel"] = txtEducation.Text;
            Session["BoardName"] = txtBoard.Text;
            Session["PassingOutYear"] = txtPassingYear.Text;
            Session["Medium"] = txtMedium.Text;
            Session["PassingPer"] = txtPassingPer.Text;

            Session["CertificateName"] = txtCertificateName.Text;
            Session["CertificateValidFrom"] = txtCertificate.Text;
            //Session["CertificateValidTill"] = txtCertificateValid.Text;

            Response.Redirect("ResumePDF.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            txtBoard.Text = "";
            txtCertificate.Text = "";
            txtCertificateName.Text = "";
            txtContact.Text = "";
            txtEducation.Text = "";
            txtEmail.Text = "";
            txtEmployment.Text = "";
            txtExperience.Text = "";
            txtFirstName.Text = "";
            txtlastName.Text = "";
            txtlastUsed.Text = "";
            txtMedium.Text = "";
            txtMidName.Text = "";
            txtPassingPer.Text = "";
            txtPassingYear.Text = "";
            txtProfile.Text = "";
            txtProjectTag.Text = "";
            txtProStatus.Text = "";
            txtProTitle.Text = "";
            txtSkill.Text = "";
            txtSkills.Text = "";
            txtSoftwareDev.Text = "";
            TxtClient.Text = "";
        }
    }
}