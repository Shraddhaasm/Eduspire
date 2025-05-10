using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduspire3
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("Checkout.aspx?Name={0}&Email={1}&Contact={2}&Plan={3}&Amount={4}", txtName.Text, txtEmail.Text, txtContact.Text, txtPlan.Text, txtAmount.Text));
        }
    }
}