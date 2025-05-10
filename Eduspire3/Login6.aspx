<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login6.aspx.cs" Inherits="Eduspire3.Login6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Eduspire | Login</title>
    <style type="text/css">
        .auto-style1 {
            height: 31px;
        }
        .auto-style2 {
            margin-left: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td colspan="2" align="center">
                        <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" Font-Size="XX-Large" Text=" Welcome back to Eduspire!"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style1">
                        <asp:Image ID="imgTutor" runat="server" ImageUrl="~/Images/Tutor.png" Height="395px" Width="525px" />
                    </td>
                    <td align="center" class="auto-style1">
                        <asp:Image ID="imgStudent" runat="server" ImageUrl="~/Images/Student.png" />
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style2">
                        <asp:Button ID="btnLoginAsTutor" runat="server" Text="Login as a Tutor" BackColor="#FF6666" Font-Bold="False" Font-Size="Large" ForeColor="White" Height="56px" Width="321px"  BorderWidth="1px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnLoginAsTutor_Click"
 />
                    </td>
                    <td align="center">
                        <asp:Button ID="btnLoginAsStudent" runat="server" Text="Login as a Student" BackColor="#FF6666" Font-Bold="False" Font-Size="Large" ForeColor="White" Height="56px" Width="321px" BorderWidth="1px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnLoginAsStudent_Click"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="hyprlnkHome" runat="server" NavigateUrl="~/HomePage.aspx">Home</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
