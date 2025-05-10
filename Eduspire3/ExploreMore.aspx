<%@ Page Title="" Language="C#" MasterPageFile="~/ContentStu.Master" AutoEventWireup="true" CodeBehind="ExploreMore.aspx.cs" Inherits="Eduspire3.ExploreMore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
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
            width: 100%;
        }

    </style>

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
                                        <h2 style="margin-top: -56px;" class="text-center">Lectures</h2>

                                        <div class="row" >
                                            <div class="col-md-3 mb-2 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">Course:</label>
                                                 <asp:TextBox ID="txtCourse" class="form-control" runat="server" Placeholder="Enter Course Name" MaxLength="50"></asp:TextBox>
                                                <asp:Label ID="lblCourse" runat="server" ForeColor="Red"></asp:Label><br />
                                                </div>
                                            </div>

                                        <div class="d-flex justify-content-end pt-3">

                                             <asp:Button ID="btnSearch" class="btn btn-success btn-danger" runat="server" Text="SEARCH" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnSearch_Click" />
                                             &nbsp;&nbsp;&nbsp;
                                             <asp:Button ID="btnShowAllReg" class="btn btn-success btn-danger" runat="server" Text="SHOW ALL" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="125px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnShowAllReg_Click" />
                                            </div>

                                        <div>

                                            <hr />
                                            <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
                                            <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource1" >
                                                <ItemTemplate>
                                                    <table class="auto-style1">
                                                        <tr>
                                                            <td rowspan="4">
                                                                <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("VideoPath") %>'></asp:Literal>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Title") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Uploaded by: <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("tut_FirstName") %>'></asp:Label> <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("tut_LastName") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Uploaded On:
                                                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("UploadedOn") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label4" runat="server" Font-Size="Small" Text='<%# Eval("Description") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                            <br />
                                            <br />
                                            
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand="select Video_Table12.ID,Video_Table12.tut_ID,Video_Table12.Title,Video_Table12.VideoOnCourse,Video_Table12.Description,Video_Table12.VideoPath,Video_Table12.UploadedOn,RegisterTut_Table1.tut_FirstName,RegisterTut_Table1.tut_LastName from Video_Table12,RegisterTut_Table1 where Video_Table12.tut_ID = RegisterTut_Table1.tut_ID"></asp:SqlDataSource>
                                            <br />
                                            
                                        </div>

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
