<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true" CodeBehind="PaymentDetails.aspx.cs" Inherits="Eduspire3.PaymentDetails"  EnableEventValidation="false"  %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
            position: relative;
            width: 100%;
            min-height: 1px;
            -webkit-box-flex: 0;
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 100%;
            text-align: center;
            padding-left: 15px;
            padding-right: 15px;
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
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 100%;
            background-color: #CCCCCC;
        }
        .auto-style6 {
            width: 75%;
            height: 283px;
            margin-left: 100px;
        }
        .auto-style7 {
            width: 313px;
        }
        .auto-style8 {
            margin-left: 0;
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
                                        <h2 style="margin-top: -56px;" class="text-center">Payment Details</h2>

                                        <div class="row" >
                                             <div class="col-md-3 mb-2 form-group">
                                                 
                                                 <label for="exampleInputEmail1" class="text-uppercase">Payment ID:</label>
                                                 <asp:TextBox ID="txtPayID" class="form-control" runat="server" Placeholder="Enter Payment ID"></asp:TextBox>
                                                 <asp:Label ID="lblPayIDError" runat="server" ForeColor="#ff0000" Text=""></asp:Label>
                                                 
                                                 </div>
                                            </div>

                                        <div class="d-flex justify-content-end pt-3">
                                            <asp:Button ID="btnSearch" class="btn btn-success btn-danger"  runat="server" Text="Search" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnSearch_Click" />
                                            &nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnShow" class="btn btn-success btn-danger"  runat="server" Text="SHOW ALL PAYMENTS" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="176px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnShow_Click" />
                                            </div>

                                        <hr />

                                        <div class="col-xl-12">
                                             <div class="auto-style1">
                                                 <asp:Label ID="lblPay" runat="server" Text="Payment Details" Font-Bold="True" Font-Size="Large"></asp:Label>
                                             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                                  EmptyDataText="No records has been added." PagerStyle-NextPageText="Next"
                                                PagerStyle-PrevPageText="Prev" GridLines="None" AllowPaging="True"
                                                  class="table table-responsive table-hover " CellPadding="4" ForeColor="#333333" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                                                 <Columns>
                                                     <asp:BoundField DataField="ID" HeaderText="ID" />
                                                     <asp:BoundField DataField="stu_ID" HeaderText="Student ID" />
                                                     <asp:BoundField DataField="stu_EmailID" HeaderText="Student Email" />
                                                     <asp:BoundField DataField="stu_FirstName" HeaderText="Student First Name" />
                                                     <asp:BoundField DataField="stu_LastName" HeaderText="Student Last Name" />
                                                     <asp:BoundField DataField="Pay_ID" HeaderText="Payment ID" />
                                                     <asp:BoundField DataField="PlanName" HeaderText="Plan Name" />
                                                     <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                                     <asp:BoundField DataField="Status" HeaderText="Status" />
                                                     <asp:BoundField DataField="CreatedDate" HeaderText="Paid On" />
                                                     
                                                     <asp:CommandField HeaderText="View Invoice" SelectText="View" ShowSelectButton="True">
                                                     <ItemStyle ForeColor="#0099FF" />
                                                     </asp:CommandField>
                                                     
                                                 </Columns>
                                                 <EditRowStyle BackColor="#999999" />
                                                <FooterStyle ForeColor="White" Font-Bold="True" />
                                                <HeaderStyle BackColor="#DE6262" Font-Bold="True" ForeColor="White" />
                                                <PagerSettings Mode="NumericFirstLast" />
                                                <PagerStyle BackColor="#DE6262" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />

                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                                                 </asp:GridView>
                                            </div>
                                            </div>

                                        <hr />
                                        <asp:Label ID="lblStu_ID" runat="server" Visible="false" Text="Label"></asp:Label>
                                        <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                       <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Height="566px">
                                             <div id="headerDiv" class="header">
                                                  <asp:Button ID="btnClose" runat="server" Text="X" onmouseover="this.style.backgroundColor='Red'" onmouseout="this.style.backgroundColor='buttonface'" CssClass="auto-style8" Height="35px" />
                                             </div>
                                           <div id="divDetails" class="content">
                                                        <table class="auto-style3">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label1" runat="server" align="center" Font-Bold="True" Font-Size="30px" Text="INVOICE"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label6" runat="server" align="center" Font-Bold="True" Font-Italic="True" Font-Names="Times New Roman" Font-Size="26px" ForeColor="#FF5050" Text="EDUSPIRE"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                               <table class="auto-style4">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label7" runat="server" align="center" Font-Bold="True" Text="We have received your Payment!"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label8" runat="server" align="center" Text="Thank you for choosing us!"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                        <br />
                                                        <table class="auto-style6" border="1">
                                                            <tr>
                                                                <td class="auto-style7">Name:</td>
                                                                <td>
                                                                    <asp:Label ID="lblFName" runat="server"></asp:Label>
                                                                    &nbsp;<asp:Label ID="lblLName" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style7">Contact No:</td>
                                                                <td>
                                                                    <asp:Label ID="lblContact" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style7">Email ID:</td>
                                                                <td>
                                                                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style7">Plan Name:</td>
                                                                <td>
                                                                    <asp:Label ID="lblPlan" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style7">Playment ID:</td>
                                                                <td>
                                                                    <asp:Label ID="lblPayID" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style7">Payment Date:</td>
                                                                <td>
                                                                    <asp:Label ID="lblPayDate" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style7">Amount (INR):</td>
                                                                <td>Rs.<asp:Label ID="lblAmount" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style7">Payment Status:</td>
                                                                <td>
                                                                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                               <br />
                                            </div>
                                                <div id="footerdiv" class="footer">
                                                   <asp:Button ID="btnDownloadInvoice" runat="server" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="162px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" Text="Download Invoice" OnClick="btnDownloadInvoice_Click" /><br />
                                                    
                                                </div>
                                           
                                        </asp:Panel>
                                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1"  TargetControlID="LinkButton1" PopupControlID="Panel1" CancelControlID="btnClose" runat="server"></ajaxToolkit:ModalPopupExtender>



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
