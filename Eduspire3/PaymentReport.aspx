<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true" CodeBehind="PaymentReport.aspx.cs" Inherits="Eduspire3.PaymentReport" EnableEventValidation="false" %>
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

        .modalPopup
        {
            background-color:white;
            width:800px;
            border:3px solid #000000;
            height:450px;
        }
        .modalPopup .header
        {
            background-color:white;
            height:30px;
            color:white;
            line-height:30px;
            text-align:right;
            font-weight:bold;
        }
        .modalPopup .content
        {
            text-align:center;
        }
        .modalPopup .footer
        {
           /* align-content:center;*/
             padding:3px;
             text-align:center;
             
        }
        .modalPopup .button
        {
            height:23px;
            color:white;
            line-height:23px;
            text-align:center;
            font-weight:bold;
            cursor:pointer;
            background-color:red;
            border:1px solid #5C5C5C; 
        }
        .auto-style9 {
            text-align: center;
        }
        .auto-style11 {
            text-align: left;
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
                                        <h2 style="margin-top: -56px;" class="text-center">Payment Report</h2>

                                        
                                            <div class="row" >
                                             <div class="col-md-3 mb-2 form-group">
                                                 
                                                 <label for="exampleInputEmail1" class="text-uppercase">Enter Date:</label>
                                                 <asp:TextBox ID="txtDate" class="form-control" runat="server" Placeholder="dd-mm-yyyy"></asp:TextBox>
                                                 <asp:Label ID="lblDate" runat="server" ForeColor="#ff0000" Text=""></asp:Label>
                                                 
                                                 </div>
                                            </div>       
                                        
                                        <div class="d-flex justify-content-end pt-3">
                                            <asp:Button ID="btnReport" class="btn btn-success btn-danger"  runat="server" Text="Get Report" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnReport_Click" />
                                            </div>

                                        <hr />

                                        <asp:Panel ID="Panel1" runat="server" Visible="false">
                                            <div class="auto-style9">
                                                <asp:Label ID="Label1" runat="server" align="center" Font-Bold="True" Font-Size="32px" Text="Payment Report"></asp:Label><br /><br />
                                            </div>
                                            <div class="auto-style11">
                                            <asp:Label ID="Label2" runat="server" Text="Created on Date:"></asp:Label>
                                                &nbsp;<asp:Label ID="lblCreatedon" runat="server" Font-Bold="True"></asp:Label><br />
                                                <asp:Label ID="Label3" runat="server" Text="Report of Date:"></asp:Label>
                                                 &nbsp;<asp:Label ID="lblReportDate" runat="server" Font-Bold="True"></asp:Label><br /><br />
                                                </div>
                                            <div>
                                                <asp:GridView ID="GridView1" CellPadding="4" runat="server" AutoGenerateColumns="False">
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Payment ID" DataField="Pay_ID" />
                                                        <asp:BoundField HeaderText="Student Email" DataField="stu_EmailID" />
                                                        <asp:BoundField HeaderText="Plan Name" DataField="PlanName" />
                                                        <asp:BoundField HeaderText="Paid Amount" DataField="Amount" />
                                                        <asp:BoundField HeaderText="Status" DataField="Status" />
                                                        <asp:BoundField HeaderText="Paid on" DataField="CreatedDate" />
                                                    </Columns>
                                                </asp:GridView><br /><br />
                                            </div>
                                            <div class="auto-style11">
                                                <asp:Label ID="Label4" runat="server" Text="Total Revenue (INR): "></asp:Label>
                                                <asp:Label ID="Label6" runat="server" Font-Bold="true" Text="Rs."></asp:Label><asp:Label ID="lblTotAmt" runat="server" Font-Bold="True"></asp:Label><br />
                                                <asp:Label ID="Label5" runat="server" Text="Total Transactions: "></asp:Label>
                                                <asp:Label ID="lblTrans" runat="server" Font-Bold="True"></asp:Label>
                                            </div>
                                        </asp:Panel>
                                        <div class="d-flex justify-content-end pt-3">
                                            <asp:Button ID="btnDownload" class="btn btn-success btn-danger" Visible="false"  runat="server" Text="Download" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnDownload_Click" />
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
