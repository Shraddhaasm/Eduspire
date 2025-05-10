<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true" CodeBehind="StudentManagement.aspx.cs" Inherits="Eduspire3.StudentManagement" %>
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
                                        <h2 style="margin-top: -56px;" class="text-center">Student Management</h2>
                                         
                                         <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>

                                        <div class="row" >
                                            <div class="col-md-3 mb-2 form-group" style="left: 0px; top: 0px">
                                                <label for="exampleInputEmail1" class="text-uppercase">Email ID:</label>
                                                 <asp:TextBox ID="txtEmailID" class="form-control" runat="server" Placeholder="Enter Email ID" MaxLength="50"></asp:TextBox>
                                                <asp:Label ID="lblEmailError" runat="server" ForeColor="Red"></asp:Label><br />
                                                <%-- <asp:Button ID="btnSearch"  runat="server" Text="Search" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'"/>--%>
                                                </div>

                                            <div class="col-md-3 mb-2 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">First Name:</label>
                                                 <asp:TextBox ID="txtFName" class="form-control" runat="server" Placeholder="Enter First Name" MaxLength="50"></asp:TextBox>
                                                <asp:Label ID="lblFNameError" runat="server" ForeColor="Red"></asp:Label><br />
                                                </div>
                                      
                                          
                                       

                                       
                                             <div class="col-md-3 mb-2 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">Last Name:</label>
                                                 <asp:TextBox ID="txtLName" class="form-control" runat="server" Placeholder="Enter Last Name" MaxLength="50"></asp:TextBox>
                                                 <asp:Label ID="lblLNameError" runat="server" ForeColor="Red"></asp:Label><br />
                                             </div>
                                       

                                  
                                            <div class="col-md-3 mb-2 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">Contact No:</label>
                                                 <asp:TextBox ID="txtContactNo" class="form-control" runat="server" Placeholder="Enter 10 digits Contact No." MaxLength="10"></asp:TextBox>
                                                <asp:Label ID="lblContactError" runat="server" ForeColor="Red"></asp:Label><br />
                                                </div>
                                             </div>

                                        <div class="d-flex justify-content-end pt-3">

                                             <asp:Button ID="btnSearch" class="btn btn-success btn-danger" runat="server" Text="SEARCH" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnSearch_Click1" />
                                             &nbsp;&nbsp;&nbsp;
                                             <asp:Button ID="btnUpdate" class="btn btn-success btn-danger" runat="server" Text="UPDATE" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnUpdate_Click" />
                                              &nbsp;&nbsp;&nbsp;
                                              <asp:Button ID="btnDelete" class="btn btn-success btn-danger" runat="server" Text="DELETE" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure want to DELETE?');"/>
                                             &nbsp;&nbsp;&nbsp;
                                              <asp:Button ID="btnShowAllReg" class="btn btn-success btn-danger" runat="server" Text="SHOW ALL REGISTRATIONS" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="221px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnShowAllReg_Click" />
                                            &nbsp;&nbsp;&nbsp;
                                            <asp:Button type="button" class="btn btn-light btn-Cancel" Text="Clear"  runat="server" ID="btnClear" OnClick="btnClear_Click"  ></asp:Button>
                                        </div>

                                        <hr />

                                        <div class="col-xl-12">
                                             <div class="auto-style1">
                                                  <asp:Label ID="lblTutReg" runat="server" Text="Student Registrations" Font-Bold="True" Font-Size="Large"></asp:Label>
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                                EmptyDataText="No records has been added." PagerStyle-NextPageText="Next"
                                                PagerStyle-PrevPageText="Prev" GridLines="None" AllowPaging="True" class="table table-responsive table-hover " CellPadding="4" ForeColor="#333333" OnPageIndexChanging="GridView1_PageIndexChanging" >
                                                <Columns>
                                                    <asp:BoundField DataField="stu_ID" HeaderText="ID" />
                                                    <asp:BoundField DataField="stu_FirstName" HeaderText="First Name" />
                                                    <asp:BoundField DataField="stu_LastName" HeaderText="Last Name" />
                                                    <asp:BoundField DataField="stu_ContactNo" HeaderText="Contact No." />
                                                    <asp:BoundField DataField="stu_EmailID" HeaderText="Email ID" />
                                                     <asp:BoundField DataField="stu_DOB" HeaderText="DOB" />
                                                    <asp:BoundField DataField="stu_Gender" HeaderText="Gender" />
                                                    <asp:BoundField DataField="stu_Password" HeaderText="Password" />
                                                    <asp:BoundField DataField="stu_Ques" HeaderText="Security Question" />
                                                    <asp:BoundField DataField="stu_Ans" HeaderText="Security Answer" />
                                                    <asp:BoundField DataField="PlanName" HeaderText="Plan Name" />
                                                    <asp:BoundField DataField="PlanStartDate" HeaderText="Plan Start Date" />
                                                    <asp:BoundField DataField="PlanEndDate" HeaderText="Plan End Date" />
                                                    <asp:BoundField DataField="IsPlanActive" HeaderText="Plan Active" />
                                                    <asp:BoundField DataField="Created_On" HeaderText="Created On" />
                                                    <asp:TemplateField HeaderText="Edit">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Edit</asp:LinkButton>
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
