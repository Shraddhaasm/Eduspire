<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentInvoice.aspx.cs" Inherits="Eduspire3.PaymentInvoice" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Eduspire | Invoice</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style4 {
            width: 100%;
            height: 56px;
            background-color: #CCCCCC;
        }
        .auto-style7 {
            width: 78%;
            height: 247px;
            margin-left: 112px;
        }
        .auto-style9 {
            width: 496px;
            height: 31px;
        }
        .auto-style10 {
            height: 31px;
        }
        .auto-style11 {
            width: 496px;
        }
        .auto-style13 {
            width: 100%;
        }
        .auto-style14 {
            height: 39px;
        }
        .auto-style15 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
        <div>
            <div class="auto-style1">
                <asp:Label ID="lblOrderID" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lblstu_ID" runat="server" Visible="false"></asp:Label>
            
                <br />
                <asp:Panel ID="Panel1" runat="server" Height="566px">
                    
                    <table class="auto-style13">
                        <tr>
                            <td class="auto-style14">
                                <asp:Label ID="Label2" runat="server" align="center" Font-Bold="True" Font-Size="30px" Text="INVOICE"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" align="center" Font-Bold="True" Font-Italic="True" Font-Size="26px" Text="EDUSPIRE" Font-Names="Times New Roman" ForeColor="#FF5050"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <%--<span class="auto-style3"><strong>
                    <br />
                    INVOICE RECEIPT</strong></span><strong><br class="auto-style3" /> <span class="auto-style2"><em><span class="auto-style12">EDUSPIRE</span><br /> </em> </span></strong>--%>
                    <table class="auto-style4">
                        <tr>
                            <td class="auto-style15">
                                
                                <asp:Label ID="Label4" runat="server" align="center" Text="We have received your Payment!" Font-Bold="True"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" align="center" Text="Thank you for choosing us!"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table class="auto-style7" border="1">
                        <tr>
                            <td class="auto-style11">Name:</td>
                            <td>
                                <asp:Label ID="lblFName" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="lblLName" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">Contact No:</td>
                            <td>
                                <asp:Label ID="lblContact" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">Email ID:</td>
                            <td>
                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">Plan Name:</td>
                            <td>
                                <asp:Label ID="lblPlan" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">Payment ID:</td>
                            <td>
                                <asp:Label ID="lblPayID" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">Payment Date:</td>
                            <td>
                                <asp:Label ID="lblPayDate" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Amount (INR):</td>
                            <td class="auto-style10">Rs.<asp:Label ID="lblAmount" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">Payment Status:</td>
                            <td>
                                <asp:Label ID="lblStatus" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            
            </div>
        </div>
<asp:Button ID="btnDownloadInvoice" runat="server" OnClick="btnDownloadInvoice_Click" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="162px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" Text="Download Invoice" /><br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/HomePage.aspx">Home</asp:HyperLink><br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/CoursesStu.aspx">Continue</asp:HyperLink>
        </div>
    </form>
</body>
</html>
