<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true" CodeBehind="PlanManagement.aspx.cs" Inherits="Eduspire3.PlanManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 32px;
        }

        .auto-style2 {
            height: 237px;
        }

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

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <form id="form1" runat="server">
        <section class="login-block">
            <div class="" style="margin-top: -93px;">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card card-registration my-3">
                            <div class="row g-0">
                                <asp:HiddenField runat="server" ID="tutorilaID" />
                                <div class="col-xl-12 login-sec">
                                    <div class="card-body p-md-3 text-black">
                                        <h2 style="margin-top: -56px;" class="text-center">Plan Management</h2>
                                        <div class="row" style="margin-bottom: -32px;">
                                            <div class="col-md-3 mb-2 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                    Basic Plan Price: 
                                                </label>
                                                <asp:TextBox ID="txtBasicPrice" ValidationGroup="submit" class="form-control" runat="server" Placeholder="Enter Price" MaxLength="5"></asp:TextBox>
                                                 <asp:RegularExpressionValidator class="error" ID="revBasicPlan" runat="server" ValidationGroup="submit" ControlToValidate="txtBasicPrice" ErrorMessage="Enter Digits only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                                </div>
                                            <div class="col-md-3 mb-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                    Plus Plan Price: 
                                                </label>
                                                <asp:TextBox ID="txtPlusPrice" ValidationGroup="submit" class="form-control" runat="server" Placeholder="Enter Price" MaxLength="5"></asp:TextBox>
                                                <asp:RegularExpressionValidator class="error" ID="revPlusPlan" runat="server" ValidationGroup="submit" ControlToValidate="txtPlusPrice" ErrorMessage="Enter Digits only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                                </div>
                                            <div class="col-md-3 mb-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                    Pro Plan Price: 
                                                </label>
                                                <asp:TextBox ID="txtProPrice" ValidationGroup="submit" class="form-control" runat="server" Placeholder="Enter Price" MaxLength="5"></asp:TextBox>
                                                <asp:RegularExpressionValidator class="error" ID="revProPlan" runat="server" ValidationGroup="submit" ControlToValidate="txtProPrice" ErrorMessage="Enter Digits only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                         <div class="d-flex justify-content-end pt-3" style="margin-top:20px">

                                           
                                            <asp:Button ID="btnSubmit"  type="button" class="btn btn-login float-right" OnClick="btnSubmit_Click" ValidationGroup="submit" Text="Submit" runat="server" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" />
                                              <asp:Button type="button"  class="btn btn-light btn-Cancel" Text="Clear"  runat="server" ID="btnClear" OnClick="btnClear_Click" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" ></asp:Button>
                                        </div>

                                        <hr />

                                        <div class="row" style="margin-bottom: -32px;">
                                            <div class="col-md-3 mb-2 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                    Current Basic Plan Price: 
                                                </label>
                                                <b>Rs.</b><asp:Label ID="lblBasic" runat="server" Font-Bold="True"></asp:Label>
                                                
                                                </div>
                                            <div class="col-md-3 mb-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                   Current Plus Plan Price: 
                                                </label>
                                                <b>Rs.</b><asp:Label ID="lblPlus" runat="server" Font-Bold="True"></asp:Label>
                                                
                                                </div>
                                            <div class="col-md-3 mb-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                   Current Pro Plan Price: 
                                                </label>
                                                <b>Rs.</b><asp:Label ID="lblPro" runat="server" Font-Bold="True"></asp:Label>
                                                
                                                </div>
                                            <div class="col-md-3 mb-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                   Last updated on: 
                                                </label><br />
                                                <asp:Label ID="lblUpdate" runat="server" Font-Bold="True"></asp:Label>
                                                </div>

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
