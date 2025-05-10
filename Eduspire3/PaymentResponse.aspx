<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentResponse.aspx.cs" Inherits="Eduspire3.PaymentResponse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Eduspire</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 runat="server" id="h1Message"></h1>

            <p runat="server" visible="false" id="pTxnId"></p>

             <p runat="server" visible="false" id="pOrderId"></p>
            <asp:Label ID="lblOrderID" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lblstu_ID" runat="server" Visible="false"></asp:Label>
                       

            <p> <a href="CoursesStu.aspx" class="btn btn-login" role="button" id="IdLogin" runat="server">Click here to continue</a></p>
            <p> <a href="HomePage.aspx" class="btn btn-login" role="button" id="IdLogin1" runat="server">Home</a></p>
            
        </div>
        <asp:Button ID="btnGenerateInvoice" runat="server" Text="Generate Invoice" OnClick="btnGenerateInvoice_Click" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" />
         <asp:Label ID="lblDate" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
