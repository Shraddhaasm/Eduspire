<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true" CodeBehind="QueriesManagement.aspx.cs" Inherits="Eduspire3.QueriesManagement" %>
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
                                        <h2 style="margin-top: -56px;" class="text-center">Queries Management</h2>

                                         <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lblHeading" runat="server" Text="RESPONSE TO QUERIES" Font-Bold="True"></asp:Label><br /><br />

                                        <div class="row" >
                                             <div class=" form-group col-md-6">
                                                  <label for="exampleInputEmail1" class="text-uppercase">Sender Email ID: </label>
                                                 <asp:TextBox ID="txtEmailID" class="form-control" runat="server" Placeholder="Enter Email ID"></asp:TextBox>
                                                 <asp:Label ID="lblEmailIDError" runat="server" ForeColor="#ff0000" Text=""></asp:Label>
                                             </div>
                                                 
                                                
                                              <%-- </div>--%><br />
                                            
<%--                                         <br />
                                        <div class="row" >--%>
                                            <div class=" form-group col-md-6">
                                                <label for="exampleInputEmail1" class="text-uppercase">Subject: </label>
                                                <asp:TextBox ID="txtSubject" class="form-control" runat="server" Placeholder="Enter Subject"></asp:TextBox>
                                                </div>

                                            </div>
                                        <br />
                                        <div class="row" >
                                            <div class="col-md-3 mb-2 form-group">
                                                 <label for="exampleInputEmail1" class="text-uppercase">Message: </label>
                                                <asp:TextBox ID="txtMessage" runat="server" class="form-control" TextMode="MultiLine" Placeholder="Enter Message" Width="675px" MaxLength="110"></asp:TextBox>
                                              </div>
                                            </div>


                                        <div class="d-flex justify-content-end pt-3">
                                            <asp:Button ID="btnSend" class="btn btn-success btn-danger" runat="server" Text="Send"  BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="109px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnSend_Click" />
                                             &nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnSearch" class="btn btn-success btn-danger" runat="server" Text="Search" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnID_Click"/>
                                            &nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnShowAllRecords" class="btn btn-success btn-danger" runat="server" Text="SHOW ALL RECORDS" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="176px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnShowAllRecords_Click"/>
                                            </div>

                                        <hr />

                                        <div class="col-xl-12">
                                             <div class="auto-style1">
                                                 <asp:Label ID="lblQueries" runat="server" Text="Queries/Feedback" Font-Bold="True" Font-Size="Large"></asp:Label>
                                             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                                  EmptyDataText="No records has been added." PagerStyle-NextPageText="Next"
                                                PagerStyle-PrevPageText="Prev" GridLines="None" AllowPaging="True" class="table table-responsive table-hover " CellPadding="4" ForeColor="#333333" OnPageIndexChanging="GridView1_PageIndexChanging" >
                                                 <Columns>
                                                     <asp:BoundField DataField="ID" HeaderText="ID" />
                                                     <asp:BoundField DataField="Name" HeaderText="Name" />
                                                     <asp:BoundField DataField="Email_ID" HeaderText="Email ID" />
                                                     <asp:BoundField DataField="Subject" HeaderText="Subject" />
                                                     <asp:BoundField DataField="Message" HeaderText="Message" />
                                                     <asp:BoundField DataField="CreatedOnDate" HeaderText="Send On" />
                                                     <asp:BoundField DataField="Replied_Msg" HeaderText="Replied Message" />
                                                     <asp:BoundField DataField="RepliedOnDate" HeaderText="Replied On" />
                                                     <asp:TemplateField HeaderText="Select Email">
                                                         <ItemTemplate>
                                                             <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Select</asp:LinkButton>
                                                         </ItemTemplate>
                                                     </asp:TemplateField>
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
