<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Eduspire3.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Eduspire</title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
            margin-top: 28px;
        }
    </style>
</head>
<body>
   
    <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
    <form action="PaymentResponse.aspx" method="post" align="center">
        <asp:Image ID="Image1" runat="server" CssClass="auto-style1" Height="149px" ImageUrl="~/Images/Razorpay.png" Width="412px" />
        <br />
        <script
            src="https://checkout.razorpay.com/v1/checkout.js"
            data-key="rzp_test_4Zm2Ep0RJLzSqw"
            data-amount="<%=Amount%>"
            data-name="<%=Name%>"
            data-description="<%=Plan%>"
            data-order_id="<%=OrderID%>"
            data-image="https://razorpay.com/favicon.png"
            data-buttontext="Pay with Razorpay" 
            data-prefill.name="<%=Name%>"
            data-prefill.email="<%=Email%>"
            data-prefill.contact="<%=Contact%>"
            data-theme.color="#F37254">
        </script>
                          
    </form>
</body>
</html>
