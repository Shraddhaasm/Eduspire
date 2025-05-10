<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true" CodeBehind="ExamDetailsAdm.aspx.cs" Inherits="Eduspire3.ExamDetailsAdm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
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
                                        <h2 style="margin-top: -56px;" class="text-center">Test Details</h2>

                                        
                                        <hr />

                                        <div class="col-xl-12">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                                PagerStyle-NextPageText="Next"
                                                PagerStyle-PrevPageText="Prev"
                                                EmptyDataText="No records has been added." AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging"
                                                DataKeyNames="id" class="table table-responsive table-hover " CellPadding="4" ForeColor="#333333" GridLines="None">
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Test Name" ItemStyle-Width="15%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%#Bind("TestName") %>'></asp:Label>
                                                        </ItemTemplate>

<ItemStyle Width="15%"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Course Name" ItemStyle-Width="15%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%#Bind("Courses") %>'></asp:Label>
                                                        </ItemTemplate>

<ItemStyle Width="15%"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Minimun Passing %" ItemStyle-Width="15%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label3" runat="server" Text='<%#Bind("PassingPer") %>'></asp:Label>
                                                        </ItemTemplate>

<ItemStyle Width="15%"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Test Start Date" ItemStyle-Width="15%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label8" runat="server" Text='<%#Bind("TestStartDate") %>'></asp:Label>
                                                        </ItemTemplate>

<ItemStyle Width="15%"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Test valide till Date" ItemStyle-Width="15%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" ReadOnly="true" runat="server" Text='<%#Bind("TestEndDate") %>'></asp:Label>
                                                        </ItemTemplate>

<ItemStyle Width="15%"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Total Number of Questions" ItemStyle-Width="15%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label5" runat="server" Text='<%#Bind("TotalQuestions") %>'></asp:Label>
                                                        </ItemTemplate>

<ItemStyle Width="15%"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Test Duration (HH:MM)" ItemStyle-Width="15%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label6" runat="server" Text='<%#Bind("TestDuration") %>'></asp:Label>
                                                        </ItemTemplate>

<ItemStyle Width="15%"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false" HeaderText="Number of Attempts" ItemStyle-Width="15%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label7" runat="server" Text='<%#Bind("TotalAttempts") %>'></asp:Label>
                                                        </ItemTemplate>

<ItemStyle Width="15%"></ItemStyle>
                                                    </asp:TemplateField>
                                                    
                                                    <asp:TemplateField Visible="false" ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:Button ID="Button2" Text="Start Test" OnClientClick=<%# string.Format("javascript:Callmodel('{0}','{1}','{2}','{3}','{4}','{5}');return false;",Eval("id"),Eval("TestName"),Eval("PassingPer"),Eval("TestDuration"),Eval("Courses"),Eval("TotalQuestions")) %> CssClass="Save" runat="server" />
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
        </section>

        <script>
            function Callmodel(Id, Name, PassingPer, TestDuration, Course, TotalQuesstion) {

                $("#testName").html(Name);
                $("#testId").html(Id);
                $('#myModal').modal('show');
                $("#Duration").html(TestDuration);
                $("#PassingPercentage").html(PassingPer);
                $("#Course").html(Course);
                $("#Marksforeach").html(100 / TotalQuesstion);
                $("#TotalQuesstion").html(TotalQuesstion);
               
            }

            function StartExam() {

                window.location = "/StartExam.aspx?Id=" + $("#testId").html();
            }
        </script>
        <div class="modal fade" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">
                           Exam Name: <lable id="testName"></lable>
                        </h4>
                        <h4 class="modal-title">                         
                            <lable id="testId" style="display:none"></lable>
                        </h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <h6 class="modal-title">
                           Exam Duration: <lable id="Duration"></lable> Hours : Minutes
                        </h6>
                         <h6 class="modal-title">
                           Course Type: <lable id="Course"></lable>
                        </h6>
                         <h6 class="modal-title">
                           Passing Percentage: <lable id="PassingPercentage"></lable>%
                        </h6> <h6 class="modal-title">
                           Total Quesstion:  <lable id="TotalQuesstion"></lable>
                        </h6>
                        <h6 class="modal-title">
                           Marks for each correct quession: <lable id="Marksforeach"></lable> 
                        </h6>
                         <h6 class="modal-title">
                         Tootal Marks: 100
                        </h6>
                        <hr />
                        <h6>DISCLAIMER </h6>
                        <ul>

                            <li>Student should try to attempt all Questions</li>
                            <li>Genuine efforts will help you score well</li>
                            <li><h4 style="color:forestgreen"> BEST LUCK FROM EDUSPIRE !!!</h4></li>
                        </ul>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" onclick="StartExam()" class="btn btn-success" data-dismiss="modal">Start Exam</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
    </form>
</asp:Content>
