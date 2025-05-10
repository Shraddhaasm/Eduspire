using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduspire3
{
    public partial class DetailsStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblFName.Text = Session["stu_FirstName"].ToString();
            lblLastName.Text = Session["stu_LastName"].ToString();
            lblContact.Text = Session["stu_ContactNo"].ToString();
            LblEmail.Text = Session["stu_EmailID"].ToString();
            lblDOB.Text = Session["stu_DOB"].ToString();
            lblGender.Text = Session["stu_Gender"].ToString();
            lblPlanName.Text = Session["PlanName"].ToString();
            lblPlan.Text = Session["PlanStartDate"].ToString();
            lblExpire.Text = Session["PlanEndDate"].ToString();
            lblCreatedOn.Text = Session["Created_On"].ToString();
        }
    }
}