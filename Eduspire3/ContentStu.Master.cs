using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduspire3
{
    public partial class ContentStu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["stu_ID"] != null)
            {
                lblFName.Text = Session["stu_FirstName"].ToString();
                ImgStudent.ImageUrl = "~/Images/StudentIcon.png";
            }
            else
            {
                Response.Redirect("HomePage.aspx");
            }
        }
    }
}