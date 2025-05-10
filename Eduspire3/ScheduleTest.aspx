<%@ Page Title="" Language="C#" MasterPageFile="~/ContentTut.Master" AutoEventWireup="true" CodeBehind="ScheduleTest.aspx.cs" Inherits="Eduspire3.ScheduleTest" %>

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
                                        <h2 style="margin-top: -56px;" class="text-center">Schedule Test</h2>
                                        <div class="row" style="margin-bottom: -32px;">
                                            <div class="col-md-4 mb-8 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                    Courses
                                                <span class="mand">*</span>
                                                </label>
                                                <asp:DropDownList ID="CoursesList" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Course" DataValueField="Course">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand="SELECT [Course] FROM [Course_Table13]"></asp:SqlDataSource>
                                                  <asp:Label ID="lblDrpError1" runat="server" ForeColor="#ff0000" Text=""></asp:Label> 
                                                <%--<asp:RequiredFieldValidator ID="rfvCourses" ErrorMessage="Required*" class="error" ControlToValidate="CoursesList" ValidationGroup="submit" runat="server"></asp:RequiredFieldValidator>--%>
                                            </div>
                                             <div class="col-md-4 mb-8 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                    Test Name
                                                <span class="mand">*</span>
                                                </label>
                                                <asp:TextBox runat="server" class="form-control" placeholder="Enter test name" ID="txtName" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="error" runat="server" ValidationGroup="submit" ControlToValidate="txtName" ErrorMessage="Please enter Test Name" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-md-4 mb-8 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                    Passing %
                                                <span class="mand">*</span>
                                                </label>
                                                <asp:TextBox runat="server" class="form-control" placeholder="Enter passing %" ID="TxtMarks" Style="padding-right: 47px" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" class="error" runat="server" ValidationGroup="submit" ControlToValidate="TxtMarks" ErrorMessage="Please enter passing %" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                 <asp:RegularExpressionValidator class="error" ID="RegularExpressionValidator6" ValidationGroup="submit" runat="server" ControlToValidate="TxtMarks" ErrorMessage="Enter numbers only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d+"></asp:RegularExpressionValidator>   
                                                <asp:RangeValidator ID="RangeValidator1" class="error" runat="server" ErrorMessage="Invalid Passing %"  ValidationGroup="submit" ControlToValidate="TxtMarks" MaximumValue="60" MinimumValue="20" ForeColor="Red" SetFocusOnError="True"></asp:RangeValidator>
                                            </div>
                                           
                                            <div class="col-md-4 mb-6 form-group">
                                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                    Test Start Date
                                                <span class="mand">*</span>
                                                </label><br />
                                                <%--<asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>--%>
                                                <asp:TextBox runat="server"  class="form-control" ReadOnly="true" placeholder="mm-dd-yyyy" ID="txtStart" />
                                                <%--<asp:Button ID="Button1" runat="server" Text="Get Start Date" /><br />--%>
                                               <%-- <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtStart" PopupButtonID="txtStart"  PopupPosition="BottomLeft" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" class="error" runat="server" ValidationGroup="submit" ControlToValidate="txtStart" ErrorMessage="Please select Start Date" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                      <%--          <asp:RangeValidator ID="rgvStart" runat="server" MaximumValue="2024/12/28" class="error" MinimumValue="2023/01/28" ControlToValidate="txtStart" ErrorMessage="invalid date"></asp:RangeValidator>

            --%>                                </div>
                                            <div class="col-md-4 mb-8 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                    Test End Date
                                           <span class="mand">*</span>
                                                </label>
                                                <asp:TextBox runat="server" class="form-control" placeholder="dd-mm-yyyy" ID="txtEnd" />
                                                <asp:Button ID="Button1" runat="server" Text="Get Date" />
                                                <ajaxToolkit:CalendarExtender Format="dd-MM-yyyy" ID="CalendarExtender2" runat="server" TargetControlID="txtEnd" PopupButtonID="Button1"  PopupPosition="BottomLeft" />
                                                <%--<asp:Button ID="Button2" runat="server" Text="Get End Date" /><br />--%>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="error" runat="server" ValidationGroup="submit" ControlToValidate="txtEnd" ErrorMessage="Please select End Date" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-md-4 mb-8 form-group">

                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                    Set Duration (hh:mm)
                                                </label>
                                                <span class="mand">*</span><br />
                                                <asp:DropDownList ID="DropDownList1" class="form-control" runat="server">
                                                    <asp:ListItem>--SELECT--</asp:ListItem>
                                                    <asp:ListItem>00:30</asp:ListItem>
                                                    <asp:ListItem>01:00</asp:ListItem>
                                                    <asp:ListItem>01:30</asp:ListItem>
                                                    <asp:ListItem>02:00</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:Label ID="lblDrpError2" runat="server" ForeColor="#ff0000" Text=""></asp:Label> 
                                                <%--<asp:TextBox runat="server" type="time" TextMode="Time" class="form-control col-md-12" placeholder="Set Duration for test" ID="txtTime" Style="padding-right: 152px;" />
                                                <asp:RequiredFieldValidator ID="rfvTime" runat="server" class="error" ControlToValidate="txtTime" ErrorMessage="Required*"></asp:RequiredFieldValidator>--%>


                                            </div>
                                            <div class="col-md-4 mb-8 form-group">

                                                <label class="text-uppercase">
                                                    Upload File
                                                    <span class="mand">*</span>
                                                </label>
                                                <asp:FileUpload ID="Idupload" runat="server" class="form-control col-md-12" />
                                                <%--<asp:RequiredFieldValidator ID="rfvupload" runat="server" class="error" ErrorMessage="Please Upload File " ControlToValidate="Idupload" ValidationGroup="submit"></asp:RequiredFieldValidator>--%>


                                                <asp:Label ID="lbl1" runat="server"></asp:Label>
                                            </div>
                                            <div class="col-md-8 mb-8 form-group" style="margin-top: 30px;">
                                                <div class="d-flex justify-content-end pt-3">

                                                    
                                                    <asp:Button ID="btnSubmit" type="button" class="btn btn-login float-right" onClick="btnSubmit_Click" ValidationGroup="submit" Text="Submit form" runat="server" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" />
                                                    <asp:Button type="button" class="btn btn-light btn-Cancel" Text="Reset all" OnClick="Reset_Click" runat="server" ID="Reset" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'"></asp:Button>
                                                </div>
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
