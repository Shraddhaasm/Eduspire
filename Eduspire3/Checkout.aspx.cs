using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Eduspire3
{
    public partial class Checkout : System.Web.UI.Page
    {
        public string OrderID;
        public string Amount;
        public string Contact;
        public string Name;
        public string Plan;
        public string Email;
        public string stu_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            AutoID();
            Amount = (Convert.ToInt32(Request.QueryString["Amount"]) * 100).ToString();
            Contact = Request.QueryString["Contact"].ToString();
            Name = Request.QueryString["Name"].ToString();
            Plan = Request.QueryString["Plan"].ToString();
            Email = Request.QueryString["Email"].ToString();
            stu_ID = Request.QueryString["stu_ID"].ToString();

            Dictionary<string, object> input = new Dictionary<string, object>();
            input.Add("amount", Amount);
            input.Add("currency", "INR");
            input.Add("payment_capture", 1);

            string key = "rzp_test_4Zm2Ep0RJLzSqw";
            string secret = "x3Oeh1D7IAkN8UBTBqxRD68M";

            RazorpayClient client = new RazorpayClient(key, secret);

            Razorpay.Api.Order order = client.Order.Create(input);
            OrderID = order["id"].ToString();

            string Amount1 = Convert.ToInt32(Request.QueryString["Amount"]).ToString();
            string Status = "Pending";
            string constr = WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            string query = "Insert into PaymentDetails_Table11(ID,stu_ID,Pay_ID,PlanName,Amount,Status) Values('" + lblID.Text + "','" + stu_ID + "','" + OrderID + "','" + Plan + "','" + Amount1 + "','" + Status + "')";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            da.SelectCommand.ExecuteNonQuery();
            con.Close();
        }
        private void AutoID()
        {
            String mycon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection connection = new SqlConnection(mycon);
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select top 1 * from PaymentDetails_Table11 order by ID Desc", connection);
            //SqlCommand cmd = new SqlCommand("Select count(ID)from[PaymentDetails_Table11]", connection);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            connection.Close();
            i++;
            lblID.Text = i.ToString();
        }
    }
}