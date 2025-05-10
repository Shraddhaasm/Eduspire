using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduspire3
{
    public partial class ContentTut : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tut_ID"] != null)
            {
                lblFName.Text = Session["tut_FirstName"].ToString();
                ImgTutor.ImageUrl = "~/Images/TutorIcon.png";
            }
            else
            {
                Response.Redirect("HomePage.aspx");
            }
        }
    }
}