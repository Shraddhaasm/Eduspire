using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduspire3
{
    public partial class Content : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adm_ID"] != null)
            {
                lblFName.Text = Session["adm_FirstName"].ToString();
                ImgAdmin.ImageUrl = "~/Images/AdminIcon.png";
            }
            else
            {
                Response.Redirect("HomePage.aspx");
            }
        }
    }
}