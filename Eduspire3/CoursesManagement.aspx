<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true" CodeBehind="CoursesManagement.aspx.cs" Inherits="Eduspire3.CoursesManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style type="text/css">
        
        .table td, .table th {
            padding: 0.5rem !important;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
        }
         .mand {
            color: Red;
            position: absolute;
            font-size: 16px;
            font-weight: 500;
        }

        .error {
            color: Red;
            /* visibility: hidden; */
            position: absolute;
            font-size: 13px;
            font-weight: 500;
        }

        .auto-style1 {
            text-align: center;
        }

        .auto-style2 {
            width: 100%;
        }

        .auto-style3 {
            width: 131px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <form id="form1" runat="server">
        <section class="login-block">
            <div class="" style="margin-top: -93px;">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card card-registration my-3" style="left: 0px; top: 0px">
                            <div class="row g-0">
                                <asp:HiddenField runat="server" ID="tutorilaID" />
                                <div class="col-xl-12 login-sec">
                                    <div class="card-body p-md-3 text-black">
                                        <h2 style="margin-top: -56px;" class="text-center">Courses Management</h2>

                                        <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="lblCouID" runat="server" Visible="false"></asp:Label>

                                        <div class="row" >
                                             <div class="col-md-3 mb-2 form-group" style="left: 0px; top: 0px">
                                                <label for="exampleInputEmail1" class="text-uppercase">Course Name:</label>
                                                 <asp:TextBox ID="txtCourse" class="form-control" runat="server" Placeholder="Enter Course Name"></asp:TextBox>
                                                 <asp:Label ID="lblCourseError" runat="server" ForeColor="#ff0000" Text=""></asp:Label>
                                                 <%--<asp:Label ID="lbl" runat="server" Text=""></asp:Label><br />--%>
                                                 
                                             </div>
                                            </div>

                                        <div class="d-flex justify-content-end pt-3">
                                            <asp:Button ID="btnAdd" class="btn btn-success btn-danger"  runat="server" Text="ADD" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnAdd_Click"/>
                                                 &nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnDelete" class="btn btn-success btn-danger" runat="server" Text="DELETE" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClientClick="return confirm('Are you sure want to DELETE?');" OnClick="btnDelete_Click"/>
                                            </div>

                                         <hr />

                                        <div class="col-xl-12">
                                             <div class="auto-style1">
                                                 <asp:Label ID="lblTutReg" runat="server" Text="Active Courses" Font-Bold="True" Font-Size="Large"></asp:Label>
                                                 <asp:DataList ID="DataList1" runat="server" BorderWidth="1px" DataKeyField="ID" DataSourceID="SqlDataSource1" OnDeleteCommand="DataList1_DeleteCommand" RepeatColumns="3" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" BorderStyle="Solid">
                                                     <ItemTemplate>
                                                         <table align="center" class="auto-style2" border="1">
                                                             <tr>
                                                                 <td class="auto-style3">
                                                                     ID:
                                                                 </td>
                                                                 <td>
                                                                     <asp:Label ID="Label1" Font-Bold="true" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td class="auto-style3">
                                                                     Course Name:
                                                                 </td>
                                                                 <td>
                                                                     <asp:Label ID="Label2" Font-Bold="true" runat="server" Text='<%# Eval("Course") %>'></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td class="auto-style3">
                                                                     Created On:
                                                                 </td>
                                                                 <td>
                                                                     <asp:Label ID="Label3" Font-Bold="true" runat="server" Text='<%# Eval("CreatedOn") %>'></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td class="auto-style3">
                                                                     <asp:LinkButton ID="LinkButton1" Font-Bold="" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                     </ItemTemplate>
                                                 </asp:DataList>
                                                 </div>
                                            </div>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand="Select ID,Course,CreatedOn from Course_Table13 except select ID,Course,CreatedOn from Course_Table13 where ID=0"></asp:SqlDataSource>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </form>

</asp:Content>
