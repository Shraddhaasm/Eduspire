using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduspire3
{
    public partial class DetailsTutor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblFName.Text = Session["tut_FirstName"].ToString();
            lblLastName.Text = Session["tut_LastName"].ToString();
            lblContact.Text = Session["tut_ContactNo"].ToString();
            LblEmail.Text = Session["tut_EmailID"].ToString();
            lblGender.Text = Session["tut_Gender"].ToString();
            lblDate.Text = Session["Created_On"].ToString();
        }
    }
}