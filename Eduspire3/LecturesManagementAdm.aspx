<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true" CodeBehind="LecturesManagementAdm.aspx.cs" Inherits="Eduspire3.LecturesManagementAdm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
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
                                        <h2 style="margin-top: -56px;" class="text-center">Lectures Management</h2>

                            

                                        <div class="row" >
                                            <div class="col-md-3 mb-2 form-group" style="left: 0px; top: 0px">
                                                <label for="exampleInputEmail1" class="text-uppercase">Email ID:</label>
                                                 <asp:TextBox ID="txtEmailID" class="form-control" runat="server" Placeholder="Enter Email ID" MaxLength="50"></asp:TextBox>
                                                <asp:Label ID="lblEmailError" runat="server" ForeColor="Red"></asp:Label><br />
                                                <%--<asp:Button ID="btnSearch"  runat="server" Text="Search" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'"/>--%>
                                                </div>

                                            
                                            <div class="col-md-3 mb-2 form-group" style="left: 0px; top: 0px">
                                                 <label for="exampleInputEmail1" class="text-uppercase">Lecture On Course:</label>
                                           <asp:TextBox ID="txtCourse" class="form-control" runat="server" Placeholder="Enter Course Name" MaxLength="50"></asp:TextBox>
                                                <asp:Label ID="lblCourseError" runat="server" ForeColor="Red"></asp:Label><br />
                                                </div>
                       

                                            </div>
                                        <div class="d-flex justify-content-end pt-3">
                                             <asp:Button ID="btnSearch" class="btn btn-success btn-danger" runat="server" Text="SEARCH" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnSearch_Click1" />
                                             &nbsp;&nbsp;&nbsp;
                                              <asp:Button ID="btnShowAllLec" class="btn btn-success btn-danger" runat="server" Text="SHOW ALL RECORDS" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="193px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnShowAllLec_Click"  /> 
                                           
                                            </div>

                                          <hr />
                                        

                                        


                                        <div class="col-xl-12">
                                             <div class="auto-style1">
                                                  <asp:Label ID="lbl" runat="server"  Font-Bold="True" Font-Size="Large"></asp:Label>
                                                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting"
                                                     EmptyDataText="No records has been added." PagerStyle-NextPageText="Next"
                                                PagerStyle-PrevPageText="Prev" GridLines="None" AllowPaging="True" class="table table-responsive table-hover " CellPadding="4" ForeColor="#333333" OnPageIndexChanging="GridView1_PageIndexChanging" >
                                                     <Columns>
                                                         <asp:TemplateField HeaderText="ID">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:BoundField DataField="tut_EmailID" HeaderText="Tutor's Email" />
                                                         <asp:BoundField DataField="Title" HeaderText="Title" />
                                                         <asp:BoundField DataField="VideoOnCourse" HeaderText="Course Type" />
                                                         <asp:BoundField DataField="UploadedOn" HeaderText="Uploaded on" />
                                                         <asp:TemplateField HeaderText="Lecture Video">
                                                             <ItemTemplate>
                                                                 <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("VideoPath") %>'></asp:Literal>
                                                        </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Delete">
                                                              <ItemTemplate>
                                                                  <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete">Delete</asp:LinkButton>
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
