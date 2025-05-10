<%@ Page Title="" Language="C#" MasterPageFile="~/ContentStu.Master" AutoEventWireup="true" CodeBehind="JavaLec.aspx.cs" Inherits="Eduspire3.JavaLec" %>
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
                                        <h2 style="margin-top: -56px;" class="text-center">Java Lectures</h2>

                                        <div>
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
                                                            <td>Uploaded by:
                                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("tut_FirstName") %>'></asp:Label>
                                                                &nbsp;<asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("tut_LastName") %>'></asp:Label>
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
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand=" select Video_Table12.ID,Video_Table12.tut_ID,Video_Table12.Title,Video_Table12.VideoOnCourse,Video_Table12.Description,Video_Table12.VideoPath,Video_Table12.UploadedOn,RegisterTut_Table1.tut_FirstName,RegisterTut_Table1.tut_LastName from Video_Table12,RegisterTut_Table1 where Video_Table12.tut_ID = RegisterTut_Table1.tut_ID and Video_Table12.VideoOnCourse='Java'"></asp:SqlDataSource>
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
