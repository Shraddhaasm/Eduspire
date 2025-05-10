using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduspire3
{
    public partial class Login6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLoginAsTutor_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginAsTutor7.aspx");
        }

        protected void btnLoginAsStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginAsStu.aspx");
        }
    }
}