<%@ Page Title="" Language="C#" MasterPageFile="~/ContentStu.Master" AutoEventWireup="true" CodeBehind="Resume.aspx.cs" Inherits="Eduspire3.Resume" %>

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
    <script>
        $('#time').datetimepicker({
            format: 'yyyy-mm-dd'
        });
    </script>
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
                                        <h2 style="margin-top: -56px;" class="text-center">Resume </h2>
                                        <h5> PERSONAL DETAILS </h5>
                                        <div class="row" style="margin-bottom: -32px;">
                                            <div class="form-group col-md-4">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                    First Name
                                                <span class="mand">*</span>
                                                </label>
                                                 <%--<input type="text" class="form-control" placeholder="" />--%>
                                                <asp:TextBox ID="txtFirstName" ValidationGroup="submit" class="form-control" runat="server" Placeholder="Enter First Name"></asp:TextBox>

                                                <asp:RequiredFieldValidator class="error" ID="rfvFirstName" runat="server" ValidationGroup="submit"  ControlToValidate="txtFirstName" ErrorMessage="Please enter your first name" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator class="error" ID="revFirstName" runat="server" ValidationGroup="submit" ControlToValidate="txtFirstName" ErrorMessage="Enter Alphabets only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                                            </div>
                                            <div class="col-md-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                    Middle Name
                                           <span class="mand">*</span>
                                                </label>
                                                <asp:TextBox ID="txtMidName" class="form-control" ValidationGroup="submit" runat="server" Placeholder="Enter Middle Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvLastName" class="error" runat="server"  ValidationGroup="submit" ControlToValidate="txtMidName" ErrorMessage="Please enter your middle name" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator class="error" ID="RegularExpressionValidatorLastname" ValidationGroup="submit" runat="server" ControlToValidate="txtMidName" ErrorMessage="Enter Alphabets only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                                            </div>
                                             <div class="col-md-4 form-group">
                                                <label for="InputText" class="text-uppercase">
                                                    Last Name
                                           <span class="mand">*</span>
                                                </label>
                                                <asp:TextBox ID="txtlastName" class="form-control" ValidationGroup="submit" runat="server" Placeholder="Enter Last Name"></asp:TextBox>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" class="error" runat="server"  ValidationGroup="submit" ControlToValidate="txtMidName" ErrorMessage="Please enter your last name" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                 <asp:RegularExpressionValidator class="error" ID="RegularExpressionValidator1" ValidationGroup="submit" runat="server" ControlToValidate="txtLastName" ErrorMessage="Enter Alphabets only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                                            </div>
                                            <div class="form-floating mb-3 col-md-6">
                                                 <label class="text-uppercase" for="floatingInput">E-Mail Address<span class="mand">*</span></label>
                                             <asp:TextBox ID="txtEmail" class="form-control" runat="server" TextMode="Email" Placeholder="Enter E-mail ID"></asp:TextBox>
                                                <asp:RequiredFieldValidator class="error" ID="rfvEmailID" ValidationGroup="submit" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter your Email ID" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator class="error" ID="revEmailID" ValidationGroup="submit" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid E-mail ID" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                                                    </div>
                                            <div class="col-md-6 form-group">
                                                <label class="text-uppercase">
                                                   Contact No <span class="mand">*</span>
                                                </label>
                                               <asp:TextBox ID="txtContact" MaxLength="10" class="form-control" ValidationGroup="submit" runat="server" Placeholder="Enter Contact Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvContact" runat="server" class="error" ControlToValidate="txtContact" ValidationGroup="submit" ErrorMessage="Please enter your Contact Number"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revContactNo" class="error" runat="server" ControlToValidate="txtContact" ErrorMessage="Please enter a valid Contact Number." ForeColor="Red" SetFocusOnError="True" ValidationExpression="^([7-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>  
                                            </div>
                                             <div class="col-md-6 form-group">
                                                <label class="text-uppercase">
                                                  Residential Address</label>
                                                <asp:TextBox ID="txtProfile" class="form-control" ValidationGroup="submit" runat="server" Placeholder="Enter Address" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                           <div class="col-md-6 form-group">
                                                <label class="text-uppercase">
                                                   Key Skills </label>  
                                                <asp:TextBox ID="txtSkills" class="form-control" ValidationGroup="submit" runat="server" Placeholder="Enter Your Skills"></asp:TextBox>
                                                </div>
                                             <div class="col-md-12 form-group">
                                                <label class="text-uppercase">
                                                  Employment </label>
                                             <div class="form-floating row">
                                               <asp:TextBox runat="server" class="form-control col-6" placeholder="Consult" id="txtEmployment" style="height: 100px"></asp:TextBox>
                                                 
                                               <asp:TextBox runat="server" class="form-control col-6" placeholder="Software Developer" id="txtSoftwareDev" style="height: 100px"></asp:TextBox>
                                                </div>
                                                 <div>
                                                     <hr /><h5>
                                                     PROJECT DETAILS
                                                     </h5>
                                                     <div class="row">
                                                          <div class="form-group col-md-4">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                      Project Title
                                                </label>
                                                 <%--<input type="text" class="form-control" placeholder="" />--%>
                                                <asp:TextBox ID="txtProTitle" ValidationGroup="submit" class="form-control" runat="server" Placeholder="Project Title"></asp:TextBox>
                                                      </div>
                                            <div class="col-md-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                     Project Tag
                                                </label>
                                                <asp:TextBox ID="txtProjectTag" class="form-control" ValidationGroup="submit" runat="server" Placeholder="Project Tag"></asp:TextBox>
                                               </div>
                                             <div class="col-md-4 form-group">
                                                <label for="InputText" class="text-uppercase">
                                                    Enter Client
                                                </label>
                                                <asp:TextBox ID="TxtClient" class="form-control" ValidationGroup="submit" runat="server" Placeholder="Enter Client"></asp:TextBox>
                                               </div>
                                                          <div class="col-md-6 form-group">
                                                <label class="text-uppercase">
                                                  Project Status  </label> 
                                                   <asp:TextBox ID="txtProStatus" runat="server" class="form-control" ValidationGroup="submit" Placeholder="(eg: In Progress or Finished )" Width="263px"></asp:TextBox>
                                                   
                                               <%--<asp:RadioButtonList ID="rdbtn" runat="server">
                                                   <asp:ListItem Text="In Progress"></asp:ListItem>
                                                   <asp:ListItem Text="Finished"></asp:ListItem>
                                               </asp:RadioButtonList>--%>
                                                   </div>
                                                  <%-- <div class="col-md-6 form-group">
                                                <label class="text-uppercase">
                                                  Work Duration <span class="mand">*</span>
                                                </label>  
                                                <asp:TextBox ID="txtWork" class="form-control" ValidationGroup="submit" runat="server" Placeholder="Enter Work Duration" Width="305px"></asp:TextBox>
                                               <asp:RequiredFieldValidator class="error" ID="RequiredFieldValidator5" ValidationGroup="submit" runat="server" ControlToValidate="txtSkills" ErrorMessage="Required." ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                             </div>--%>
                                                        
                                                      <div class="col-md-6 form-group">
                                                <label class="text-uppercase">
                                                  Nature of Employment <%--<span class="mand">*</span>--%>
                                                    <asp:TextBox ID="natureOfEmp" runat="server" class="form-control" ValidationGroup="submit" Placeholder="(eg: Full Time, Part Time or Contractual)" Width="305px"></asp:TextBox>
                                                    <%-- <asp:RadioButtonList ID="rdbtnEmp" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem class="col-md-4 mb-4 form-group">  Full Time</asp:ListItem>
                                                        <asp:ListItem class="col-md-4 mb-4 form-group">Part Time</asp:ListItem>
                                                         <asp:ListItem class="col-md-4 mb-4 form-group">Contractual</asp:ListItem>
                                                     </asp:RadioButtonList--%>

                                                </label>  
                                               </div>
                                                         </div>
                                                      <div>
                                                     <hr /><h5>
                                                     QUALIFICATION DETAILS
                                                     </h5>
                                                     <div class="row">
                                                          <div class="form-group col-md-4">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                     Education Level
                                           <span class="mand">*</span>
                                                </label>
                                                <asp:TextBox ID="txtEducation" class="form-control" ValidationGroup="submit" runat="server" Placeholder="Enter Education Level"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="error" runat="server"  ValidationGroup="submit" ControlToValidate="txtEducation" ErrorMessage="Please enter education level" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </div>
                                                            <div class="form-group col-md-4">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                     Board Name
                                           <span class="mand">*</span>
                                                </label>
                                                <asp:TextBox ID="txtBoard" class="form-control" ValidationGroup="submit" runat="server" Placeholder="Enter Board Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" class="error" runat="server"  ValidationGroup="submit" ControlToValidate="txtBoard" ErrorMessage="Please enter board name" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </div>
                                                            <div class="form-group col-md-4">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                     Passing Out Year
                                           <span class="mand">*</span>
                                                </label>
                                               <asp:TextBox ID="txtPassingYear" class="form-control" MaxLength="4" ValidationGroup="submit" runat="server" Placeholder="Enter Passing Out Year"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="error" runat="server"  ValidationGroup="submit" ControlToValidate="txtPassingYear" ErrorMessage="Please enter passing out year" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator class="error" ID="RegularExpressionValidator2" ValidationGroup="submit" runat="server" ControlToValidate="txtPassingYear" ErrorMessage="Enter numbers only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d+"></asp:RegularExpressionValidator>  
                                                            </div>
                                                           <div class="form-group col-md-4">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                    Medium
                                           <span class="mand">*</span>
                                                </label>
                                               <asp:TextBox ID="txtMedium" class="form-control" ValidationGroup="submit" runat="server" Placeholder="Enter Medium of Language"></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" class="error" runat="server"  ValidationGroup="submit" ControlToValidate="txtMedium" ErrorMessage="Please enter medium" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                          <asp:RegularExpressionValidator class="error" ID="RegularExpressionValidator3" ValidationGroup="submit" runat="server" ControlToValidate="txtMedium" ErrorMessage="Enter Alphabets only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                                                           </div>
                                                          <div class="form-group col-md-4">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                  Passing %
                                           <span class="mand">*</span>
                                                </label>
                                               <asp:TextBox ID="txtPassingPer" MaxLength="3" class="form-control"  ValidationGroup="submit" runat="server" Placeholder="Enter Passing %"></asp:TextBox>
                                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator13" class="error" runat="server"  ValidationGroup="submit" ControlToValidate="txtPassingPer" ErrorMessage="Please enter percentage" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        <%--<asp:RegularExpressionValidator class="error" ID="RegularExpressionValidator4" ValidationGroup="submit" runat="server" ControlToValidate="txtPassingPer" ErrorMessage="Enter numbers only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d+"></asp:RegularExpressionValidator>  --%>
                                                          </div>
                                                         </div>
                                                            </div>
                                                      <div>
                                                     <hr /><h5>
                                                    CERTIFICATION DETAILS
                                                     </h5>
                                                          <label class="text-info">
                                                              Add details of your Certification (if any)
                                                          </label>
                                                          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                     <div class="row">
                                                          <div class="form-group col-md-4">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                     Certification Name
                                                </label>
                                                <asp:TextBox ID="txtCertificateName" class="form-control" ValidationGroup="submit" runat="server" Placeholder="Enter Certification Name"></asp:TextBox>
                                                <%--<asp:RegularExpressionValidator class="error" ID="RegularExpressionValidator5" ValidationGroup="submit" runat="server" ControlToValidate="txtCertificateName" ErrorMessage="Enter Alphabets only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>--%>
                                                          </div>
                                                         <div class="form-group col-md-4">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                     Certified On
                                                </label>
                                                             <asp:TextBox runat="server" class="form-control" TextMode="Date"  placeholder="Certified On Date" ID="txtCertificate" />     
                                                             
                                                         </div>
                                                          <%--<div class="form-group col-md-4">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                     Certificate valid till 
                                                </label>
                                                             <asp:TextBox runat="server" type="time"  TextMode="Date" class="form-control" placeholder="Certificate valid till " ID="txtCertificateValid" />     
                                                        </div>--%></div>
                                                          <div>
                                                     <hr /><h5>
                                                     IT SKILLS
                                                     </h5>
                                                     <div class="row">
                                                          <div class="form-group">
                                                <label for="exampleInputEmail1" class="text-info">
                                                      Specify details about programming languages (such as Java, Python, PHP, C/C++, Oracle, SQL, etc) 
                                                    softwares (Microsoft Word, Excel, Tally, etc) or any other software related knowledge)
                                                </label></div>
                                                      <div class="col-md-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                     Skill Name
                                                </label>
                                                <asp:TextBox ID="txtSkill" class="form-control" ValidationGroup="submit" runat="server" Placeholder="Skill Name"></asp:TextBox>
                                                </div>
                                              <div class="form-group col-md-4">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                     Last Used (YEAR)
                                                </label>
                                                <asp:TextBox ID="txtlastUsed" class="form-control" ValidationGroup="submit" runat="server" MaxLength="4" Placeholder="Skill last used in year"></asp:TextBox>
                                              <asp:RegularExpressionValidator class="error" ID="RegularExpressionValidator6" ValidationGroup="submit" runat="server" ControlToValidate="txtlastUsed" ErrorMessage="Enter numbers only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d+"></asp:RegularExpressionValidator>   
                                              </div>
                                             <div class="form-group col-md-4">
                                                <label for="exampleInputEmail1" class="text-uppercase">
                                                    Work Experience
                                                </label>
                                                <asp:TextBox ID="txtExperience" class="form-control" ValidationGroup="submit" runat="server" Placeholder="Enter Your Work Experience"></asp:TextBox>
                                                </div>
                                                         </div>
                                                              <div class="row">
                                                                  <div class="col-md-6">
                                                                   <asp:Button ID="btnSubmit" type="button" ValidationGroup="submit" align="center" OnClick="btnSubmit_Click" class="btn btn-login form-control float-right" Text="Submit form"  runat="server" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" />
                                                                 </div><div class="col-md-6">
                                                                   <asp:Button ID="Button1" type="button" class="btn btn-login form-control float-right" Text="Clear" runat="server" OnClick="Button1_Click" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" />
                                                              </div>
                                                              </div>
                                                            <%-- <asp:TextBox runat="server" Visible="false" ID="ResumeID"></asp:TextBox>
                                                              <asp:TextBox runat="server" Visible="false" ID="txtSkillID"></asp:TextBox>--%>
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
                            </div>
                  </div>
        </section>


    </form>
</asp:Content>
