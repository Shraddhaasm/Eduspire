<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true" CodeBehind="CandidateManagement.aspx.cs" Inherits="Eduspire3.CandidateManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--<style type="text/css">
        
        .table td, .table th {
            padding: 0.5rem !important;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
        }
        .auto-style3 {
            text-align: center;
        }
    </style>--%>
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
                                        <h2 style="margin-top: -56px;" class="text-center">Candidate Management</h2>

                                        <div class="row" >
                                             <div class="col-md-3 mb-2 form-group" style="left: 0px; top: 0px">
                                                <label for="exampleInputEmail1" class="text-uppercase">Email ID:</label>
                                                 <asp:TextBox ID="txtEmailID" class="form-control" runat="server" Placeholder="Enter Email ID"></asp:TextBox>
                                                 <asp:Label ID="lblEmailIDError" runat="server" ForeColor="#ff0000" Text=""></asp:Label>
                                                 <%--<asp:Label ID="lbl" runat="server" Text=""></asp:Label><br />--%>
                                                 
                                             </div>
                                            </div>

                                        <div class="d-flex justify-content-end pt-3">
                                             <asp:Button ID="btnSearch" class="btn btn-success btn-danger" runat="server" Text="Search" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnSearch_Click"/>
                                                 &nbsp;&nbsp;&nbsp;
                                                 <asp:Button ID="btnSearch2" class="btn btn-success btn-danger"  runat="server" Text="Search" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnSearch2_Click" />
                                            &nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnShowAllRecords" class="btn btn-success btn-danger" runat="server" Text="SHOW ALL APPLICATIONS" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="38px" Width="222px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnShowAllRecords_Click"/>
                                            &nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnShowRecordsToApprove" class="btn btn-success btn-danger" runat="server" Text="APPLICATIONS TO APPROVE/REJECT" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="41px" Width="290px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnShowRecordsToApprove_Click" />
                                            </div>

                                        <hr />

                                        <div class="col-xl-12">
                                            <div class="auto-style1">
                                                <asp:Label ID="lblRecordsToApprove" runat="server" Text="Applications To Approve/Reject" Font-Bold="True" Font-Size="Large"></asp:Label>
                                            <asp:GridView ID="grdviewCandidate" runat="server" AutoGenerateColumns="False"
                                                 EmptyDataText="No records has been added." PagerStyle-NextPageText="Next"
                                                PagerStyle-PrevPageText="Prev" PageSize="10" AllowPaging="true" class="table table-responsive table-hover " CellPadding="4" ForeColor="#333333"
                                                OnRowCommand="grdviewCandidate_RowCommand" GridLines="None" OnPageIndexChanging="grdviewCandidate_PageIndexChanging">
                                                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <Columns>
                                                    <asp:BoundField DataField="can_ID" HeaderText="ID" />
                                                    <asp:BoundField DataField="can_FirstName" HeaderText="First Name" />
                                                    <asp:BoundField DataField="can_LastName" HeaderText="Last Name" />
                                                    <asp:BoundField DataField="can_ContactNo" HeaderText="Contact No" />
                                                    <asp:BoundField DataField="can_EmailID" HeaderText="Email ID" />
                                                    <asp:BoundField DataField="can_DOB" HeaderText="DOB" />
                                                    <asp:BoundField DataField="can_Gender" HeaderText="Gender" />
                                                    <asp:BoundField DataField="can_FileName" HeaderText="File Name" />
                                                    <asp:TemplateField HeaderText="Download" ItemStyle-Width="15%">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("can_FileName") %>' CommandName="Download">Download</asp:LinkButton>
                                                        </ItemTemplate>

<ItemStyle Width="15%"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Approval" ItemStyle-Width="15%">
                                                        <ItemTemplate>
                                                            <asp:RadioButton ID="RadioButton1" GroupName="Grid" runat="server" />
                                                        </ItemTemplate>

<ItemStyle Width="15%"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Reject" ItemStyle-Width="15%">
                                                        <ItemTemplate>
                                                           <asp:RadioButton ID="RadioButton2" GroupName="Grid" runat="server" />
                                                        </ItemTemplate>

<ItemStyle Width="15%"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="Applied_On" HeaderText="Applied On" />
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

                                            <div class="auto-style1">
                                                <asp:Label ID="lblAllRecords" runat="server" Text="All Applications" Font-Bold="True" Font-Size="Large"></asp:Label>
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
                                                    EmptyDataText="No records has been added." GridLines="None" PagerStyle-NextPageText="Next"
                                                PagerStyle-PrevPageText="Prev" PageSize="10" AllowPaging="true" class="table table-responsive table-hover " CellPadding="4" ForeColor="#333333" OnPageIndexChanging="GridView1_PageIndexChanging" >
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:BoundField DataField="can_ID" HeaderText="ID" />
                                                        <asp:BoundField DataField="can_FirstName" HeaderText="First Name" />
                                                        <asp:BoundField DataField="can_LastName" HeaderText="Last Name" />
                                                        <asp:BoundField DataField="can_ContactNo" HeaderText="Contact No" />
                                                        <asp:BoundField DataField="can_EmailID" HeaderText="Email ID" />
                                                        <asp:BoundField DataField="can_DOB" HeaderText="DOB" />
                                                        <asp:BoundField DataField="can_Gender" HeaderText="Gender" />
                                                        <asp:BoundField DataField="can_FileName" HeaderText="File Name" />
                                                        <asp:TemplateField HeaderText="Download">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton2" runat="server"  CommandArgument='<%# Eval("can_FileName") %>' CommandName="DownloadFile">Download</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="can_ApprovalStatus" HeaderText="Approval Status" />
                                                        <asp:BoundField DataField="Applied_On" HeaderText="Applied On" />
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


                                            <br />
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand="SELECT * FROM [Candidate_Table8]" ></asp:SqlDataSource>
                                            <br />
                                           
                                            <asp:Button ID="btnSubmit"  runat="server" Text="SUBMIT" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" OnClick="btnSubmit_Click" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'"/>
                                            <br />
                                            <br />
                                            <asp:Label ID="lblMSg" runat="server"></asp:Label>
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
