using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Razorpay.Api;

namespace Eduspire3
{
    public partial class PaymentResponse : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblDate.Text = DateTime.Now.ToShortDateString();
            try
            {
                string paymentId = Request.Form["razorpay_payment_id"];
                string orderId = Request.Form["razorpay_order_id"];
                string signature = Request.Form["razorpay_signature"];

                string key = "rzp_test_4Zm2Ep0RJLzSqw";
                string secret = "x3Oeh1D7IAkN8UBTBqxRD68M";

                RazorpayClient client = new RazorpayClient(key, secret);

                Dictionary<string, string> attributes = new Dictionary<string, string>();

                attributes.Add("razorpay_payment_id", paymentId);
                attributes.Add("razorpay_order_id", orderId);
                attributes.Add("razorpay_signature", signature);


                Utils.verifyPaymentSignature(attributes);
                pTxnId.InnerText = paymentId;
                pOrderId.InnerText = orderId;
                lblOrderID.Text = orderId;
                Session["OrderID"] = lblOrderID.Text;



                SqlConnection con = new SqlConnection(constr);
                con.Open();
                string query = "update PaymentDetails_Table11 set CreatedDate= getdate(),Status='Successful',Date='" + lblDate.Text + "' where Pay_ID='" + orderId + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.SelectCommand.ExecuteNonQuery();


                //con.Open();
                SqlCommand cmd = new SqlCommand("select * from PaymentDetails_Table11 where  Pay_ID= '" + orderId + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cmd.ExecuteNonQuery();
                string stu_ID = null;
                string PlanName = null;
                if (dt != null && dt.Rows.Count != 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {

                        stu_ID = row["stu_ID"].ToString();
                        PlanName = row["PlanName"].ToString();
                    }

                }
                lblstu_ID.Text = stu_ID;
                Session["stu_ID"] = lblstu_ID.Text;
                //con.Open();
                string query1 = "";
                if (PlanName.ToLower() == "basic")
                {
                    query1 = "update RegisterStu_Table5 set PlanName= '" + PlanName + "',PlanStartDate=getdate(),IsPlanActive=1,PlanEndDate= DATEADD(MONTH, 1, getdate()) where stu_ID='" + stu_ID + "'";


                }
                if (PlanName.ToLower() == "plus")
                {
                    query1 = "update RegisterStu_Table5 set PlanName= '" + PlanName + "',PlanStartDate=getdate(),IsPlanActive=1,PlanEndDate= DATEADD(MONTH, 6, getdate()) where stu_ID='" + stu_ID + "'";

                }
                if (PlanName.ToLower() == "pro")
                {
                    query1 = "update RegisterStu_Table5 set PlanName= '" + PlanName + "',PlanStartDate=getdate(),PlanEndDate= DATEADD(year, 1, getdate()),IsPlanActive=1 where stu_ID='" + stu_ID + "'";

                }

                SqlDataAdapter da1 = new SqlDataAdapter(query1, con);

                da1.SelectCommand.ExecuteNonQuery();
                h1Message.InnerText = "Transaction Successful";

                con.Close();
                IdLogin.Visible = true;
                IdLogin1.Visible = true;



            }
            catch (Exception)
            {
                //Label1.Text=ex.Message.ToString();
                h1Message.InnerText = "Transaction Unsuccessful";
                IdLogin.Visible = false;
                IdLogin1.Visible = false;
            }
        }

        protected void btnGenerateInvoice_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentInvoice.aspx");
        }
    }
}