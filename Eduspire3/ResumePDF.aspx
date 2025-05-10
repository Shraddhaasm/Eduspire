<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResumePDF.aspx.cs" Inherits="Eduspire3.ResumePDF" EnableEventValidation="false"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Eduspire</title>
    <style type="text/css">
        .auto-style1 {
            width: 75%;
            margin-left: 200px;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            text-align: left;
        }
        .auto-style7 {
            text-align: left;
            height: 31px;
        }
        .auto-style11 {
            text-align: left;
            width: 315px;
        }
        .auto-style12 {
            text-align: left;
            width: 315px;
            height: 31px;
        }
        .auto-style13 {
            margin-left: 189px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" align="center">
        <div>
            <asp:Panel ID="Panel1" runat="server" align="center" Height="922px" Width="720px" CssClass="auto-style13" >
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2" colspan="2">
                            <asp:Label ID="Label1" runat="server" align="center" Font-Bold="False" Font-Size="24px" Text="RESUME"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" colspan="2">
                            <asp:Label ID="lblFName" runat="server" align="center" Font-Bold="True" Font-Size="24px"></asp:Label>
                            &nbsp;<asp:Label ID="lblMName" runat="server" align="center" Font-Bold="True" Font-Size="24px"></asp:Label>
                            &nbsp;<asp:Label ID="lblLName" runat="server" align="center" Font-Bold="True" Font-Size="24px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="2">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" align="left" Text=" • Personal Details" Font-Size="14"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label7" runat="server" align="left" Text="Contact No. :"></asp:Label></td>
                        <td class="auto-style3">
                            <asp:Label ID="lblContactNo"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">
                            <asp:Label ID="Label8" runat="server" align="left" Text="Email ID:"></asp:Label></td>
                        <td class="auto-style7">
                            <asp:Label ID="lblEmailID"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label9" runat="server" align="left" Text="Residential Address:"></asp:Label></td>
                        <td class="auto-style3">
                            <asp:Label ID="lblAddress"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label10" runat="server" align="left" Text="Key Skills:"></asp:Label></td>
                        <td class="auto-style3">
                            <asp:Label ID="lblKeySkills"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label11" runat="server" align="left" Text="Software Development:"></asp:Label></td>
                        <td class="auto-style3">
                            <asp:Label ID="lblSoftDev"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="2">
                            <asp:Label ID="Label3" runat="server"  align="left" Font-Bold="True" Font-Size="14" Text="• Project Details"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label12" runat="server" align="left" Text="Project Title:"></asp:Label></td>
                        <td class="auto-style3">
                            <asp:Label ID="lblProTit"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label13" runat="server" align="left" Text="Project Tag:"></asp:Label></td>
                        <td class="auto-style3">
                            <asp:Label ID="lblProTag"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label14" runat="server" align="left" Text="Client:"></asp:Label></td>
                        <td class="auto-style3">
                            <asp:Label ID="lblClient"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label15" runat="server" align="left" Text="Project Status:"></asp:Label></td>
                        <td class="auto-style3">
                            <asp:Label ID="lblProStatus"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label16" runat="server" align="left" Text="Nature of Employment:"></asp:Label></td>
                        <td class="auto-style3">
                            <asp:Label ID="lblNatEmp"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="2">
                            <asp:Label ID="Label4" runat="server"  align="left" Font-Bold="True" Font-Size="14" Text="• Qualification Details"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label17" runat="server" align="left" Text="Education Level:"></asp:Label></td>
                        <td class="auto-style3">
                            <asp:Label ID="lblEduLevel"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label18" runat="server" align="left" Text="Board Name:"></asp:Label></td>
                        <td class="auto-style3">
                            <asp:Label ID="lblBoardName"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label19" runat="server" align="left" Text="Passing out Year:"></asp:Label></td>
                        <td class="auto-style3">
                            <asp:Label ID="lblPassingYr"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">
                            <asp:Label ID="Label20" runat="server" align="left" Text="Medium:"></asp:Label></td>
                        <td class="auto-style7">
                            <asp:Label ID="lblMedium"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">
                            <asp:Label ID="Label21" runat="server" align="left" Text="Passing %:"></asp:Label></td>
                        <td class="auto-style7">
                            <asp:Label ID="lblPassPer"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7" colspan="2">
                            <asp:Label ID="Label5" runat="server"  align="left" Font-Bold="True" Font-Size="14" Text="• Certification Details"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">
                            <asp:Label ID="Label22" runat="server" align="left" Text="Certificate Name:"></asp:Label></td>
                        <td class="auto-style7">
                            <asp:Label ID="lblCerName"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">
                            <asp:Label ID="Label23" runat="server" align="left" Text="Certified On:"></asp:Label></td>
                        <td class="auto-style7">
                            <asp:Label ID="lblCerDate"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7" colspan="2">
                            <asp:Label ID="Label6" runat="server"  align="left" Font-Bold="True" Font-Size="14" Text="• Skills"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">
                            <asp:Label ID="Label24" runat="server" align="left" Text="Skill Name:"></asp:Label></td>
                        <td class="auto-style7">
                            <asp:Label ID="lblSkillName"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">
                            <asp:Label ID="Label25" runat="server" align="left" Text="Work Experience:"></asp:Label></td>
                        <td class="auto-style7">
                            <asp:Label ID="lblWrkExp"  align="left" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
               
            </asp:Panel>
            <asp:Button ID="btnDownload" runat="server" Text="Download" OnClick="btnDownload_Click" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="109px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" /><br />
             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/HomePage.aspx">Home</asp:HyperLink><br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/CoursesStu.aspx">Continue</asp:HyperLink>
        </div>
    </form>
</body>
</html>
