using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduspire3
{
    public partial class DetailsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblFName.Text = Session["adm_FirstName"].ToString();
            lblLastName.Text = Session["adm_LastName"].ToString();
            lblContact.Text = Session["adm_ContactNo"].ToString();
            LblEmail.Text = Session["adm_EmailID"].ToString();
        }
    }
}