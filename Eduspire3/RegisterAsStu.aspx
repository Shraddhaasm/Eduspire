<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterAsStu.aspx.cs" Inherits="Eduspire3.RegisterAsStu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Eduspire | Register as Student</title>
</head>
<body>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>

    <style>
        html, body {
           margin: 0;
    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
    font-size: 14px;
    font-weight: 400;
    line-height: 0.7;
    color: #212529;
    text-align: left;
    background-color: #fff;
        min-height: 100%;
        }

        .login-block {
            /*//// background: #DE6262;*/ /* fallback for old browsers */
            /*background: -webkit-linear-gradient(to bottom, #FFB88C, #DE6262);*/ /* Chrome 10-25, Safari 5.1-6 */
            /*background: linear-gradient(to bottom, #FFB88C, #DE6262);*/ /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            float: left;
            width: 100%;
            padding: 50px 0;
        }

        .banner-sec {
            background: url(https://static.pexels.com/photos/33972/pexels-photo.jpg) no-repeat left bottom;
            background-size: cover;
            min-height: 500px;
            border-radius: 0 10px 10px 0;
            padding: 0;
        }

        .container {
            background: #fff;
            border-radius: 10px;
            box-shadow: 15px 20px 0px rgba(0,0,0,0.1);
        }

        .carousel-inner {
            border-radius: 0 10px 10px 0;
        }

        .carousel-caption {
            text-align: left;
            left: 5%;
        }

        .btn-Cancel {
            font-weight: 600;
        }

        .login-sec {
            position: relative;
        }

        .mb-4, .my-4 {
            margin-bottom: 1rem !important;
        }

        .login-sec .copy-text {
            position: absolute;
            width: 80%;
            bottom: 20px;
            font-size: 16px;
            text-align: center;
        }

            .login-sec .copy-text i {
                color: #FEB58A;
            }

            .login-sec .copy-text a {
                color: #E36262;
            }

        .login-sec h2 {
            margin-bottom: 30px;
            font-weight: 800;
            font-size: 30px;
            color: #DE6262;
        }

            .login-sec h2:after {
                content: " ";
                width: 100px;
                height: 5px;
                background: #FEB58A;
                display: block;
                margin-top: 20px;
                border-radius: 3px;
                margin-left: auto;
                margin-right: auto
            }

        .btn-login {
            background: #DE6262;
            color: #fff;
            font-weight: 600;
        }

        .banner-text {
            width: 70%;
            position: absolute;
            bottom: 40px;
            padding-left: 20px;
        }

            .banner-text h2 {
                color: #fff;
                font-weight: 600;
            }

                .banner-text h2:after {
                    content: " ";
                    width: 100px;
                    height: 5px;
                    background: #FFF;
                    display: block;
                    margin-top: 20px;
                    border-radius: 3px;
                }

            .banner-text p {
                color: #fff;
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

        html, body {
            min-height: 100%;
            background: linear-gradient(to bottom, #FFB88C, #DE6262);
        }
    </style>

    <form id="form1" runat="server">
        <section class="login-block">
            <div class="container" style="margin-top: -33px;">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card card-registration my-3">
                            <div class="row g-0">
                                <div class="col-xl-6 d-none d-xl-block ">
                                    <img src="Images/StudentRegister.png"
                                        alt="Sample photo" class="img-fluid"
                                        style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
                                    </div>

                                <div class="col-xl-6 login-sec">
                                    <div class="card-body p-md-3 text-black">
                                        <h2 class="text-center">Welcome! To get started, create an account</h2>

                                        <asp:Label ID="lblStuID" runat="server" Text="Tutor ID: " Visible="False"></asp:Label>
                                                <asp:Label ID="lblStuIDNo" runat="server" Text="No." Visible="False"></asp:Label>
                                                <br />


                                        <div class="row">
                                            <div class="col-md-6 mb-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">First Name<span class="mand">*</span></label><br />                  
                        <asp:TextBox ID="txtFirstName" class="form-control" runat="server" Placeholder="Enter First Name" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" class="error" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Please enter 'First Name'." ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                      
                        <asp:RegularExpressionValidator ID="revFirstName" class="error" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Enter alphabets only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                </div>
                                            <div class="col-md-6 mb-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">Last Name<span class="mand">*</span></label>
                        <asp:TextBox ID="txtLastName" runat="server" class="form-control" Placeholder="Enter Last Name" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLastName" class="error" runat="server" ControlToValidate="txtLastName" ErrorMessage="Please enter your 'Last Name'." ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        
                        <asp:RegularExpressionValidator ID="revLastName" class="error" runat="server" ControlToValidate="txtLastName" ErrorMessage="Enter alphabets only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                            </div>
                                                </div>


                                        <div class="row">
                                            <div class="col-md-6 mb-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">CONTACT NUMBER<span class="mand">*</span></label>                
                        <asp:TextBox ID="txtContactNo" class="form-control" runat="server" TextMode="Phone" Placeholder="Enter 10 digits Contact No." MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContactNo" class="error" runat="server" ControlToValidate="txtContactNo" ErrorMessage="Please enter your 'Contact Number'." ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                     
                        <asp:RegularExpressionValidator ID="revContactNo" class="error" runat="server" ControlToValidate="txtContactNo" ErrorMessage="Please enter a valid Contact Number." ForeColor="Red" SetFocusOnError="True" ValidationExpression="^([7-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>
                                                </div>
                                            <div class="col-md-6 mb-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">E-mail ID<span class="mand">*</span></label><br />
                        <asp:Label ID="lbl2EmailID" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lblVerified" runat="server" Text="Your Email is verified successfully." Font-Bold="True" Font-Size="XX-Small" ForeColor="Green"></asp:Label>
                                                </div>
                                            </div>


                            <div class="row">
                                            <div class="col-md-6 mb-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">Date Of Birth(DOB)<span class="mand">*</span></label>

                        <%--<asp:TextBox ID="txtAge" class="form-control" runat="server" TextMode="Date" Placeholder="Enter your Age"></asp:TextBox>--%>
                                <asp:TextBox ID="txtDOB" class="form-control" runat="server" TextMode="Date" Placeholder="Enter your DOB"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="rfvDOB" class="error" runat="server" ErrorMessage="Please enter your 'Date of birth'." ControlToValidate="txtDOB" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <%--<asp:RequiredFieldValidator ID="rfvDOB" class="error" runat="server" ControlToValidate="txtDOB" ErrorMessage="Please enter your 'Date of birth'." ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                       <asp:RangeValidator ID="rvDOB" runat="server" class="error" ControlToValidate="txtDOB" ErrorMessage="Age must be minimum 12yrs." ForeColor="Red" MaximumValue="2011/1/1" MinimumValue="1913/1/1" SetFocusOnError="True" ></asp:RangeValidator>
                        <%--<asp:RangeValidator ID="rvAge" runat="server" class="error" ControlToValidate="txtAge" ErrorMessage="Invalid Age." ForeColor="Red" MaximumValue="110" MinimumValue="3" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>--%>
                                                </div>
                                            <div class="col-md-6 mb-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">Gender<span class="mand">*</span></label>
                        <asp:RadioButtonList ID="radiobtnlstGender" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem class="col-md-4 mb-4 form-group">Male</asp:ListItem>
                        <asp:ListItem class="col-md-4 mb-4 form-group">Female</asp:ListItem>
                        <asp:ListItem class="col-md-4 mb-4 form-group">Other</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvGender" runat="server" class="error" ControlToValidate="radiobtnlstGender" ErrorMessage="Please select your 'Gender'." ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </div>
                                         </div>
                           

                        <div class="row">
                                            <div class="col-md-6 mb-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">Enter Password<span class="mand">*</span></label>
                    <asp:TextBox ID="txtPassword" class="form-control" runat="server" TextMode="Password" Placeholder="Enter Password" MaxLength="50"></asp:TextBox>
                    <input type="checkbox" onchange="document.getElementById('txtPassword').type = this.checked ? 'text' : 'password'" /><asp:Label ID="lblShowPassword" runat="server" Text="Show Password"></asp:Label><br />
                    <asp:RequiredFieldValidator ID="rfvPassword" class="error" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter a 'Password'." ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    
                    <asp:RegularExpressionValidator ID="revPassword" class="error" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter a strong password." ForeColor="Red" SetFocusOnError="True" ValidationExpression="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&amp;])[A-Za-z\d@$!%*#?&amp;]{8,}$"></asp:RegularExpressionValidator>
                                                </div>
                                            <div class="col-md-6 mb-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">Confirm Password<span class="mand">*</span></label>        
                        <asp:TextBox ID="txtConfPassword" class="form-control" runat="server" TextMode="Password" Placeholder="Re-enter Password" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfPassword" class="error" runat="server" ControlToValidate="txtConfPassword" ErrorMessage="Please fill the 'Confirm Password' field." ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                      
                        <asp:CompareValidator ID="cvPassword" runat="server" class="error" ControlToCompare="txtPassword" ControlToValidate="txtConfPassword" ErrorMessage="Password doesn't match!" ForeColor="Red" SetFocusOnError="True"></asp:CompareValidator>
                                                </div>
                                         </div>

                                        <div class="row" >
                                            <div class="col-md-6 mb-4 form-group">
                                                <label for="exampleInputEmail1" class="text-uppercase">Select a Security Question<span class="mand">*</span></label>
                             <asp:DropDownList ID="drpdwnlstSecQues" runat="server" class="form-control" >
                                 <asp:ListItem class="col-md-4 mb-4 form-group">--SELECT--</asp:ListItem>
                                 <asp:ListItem class="col-md-4 mb-4 form-group">What`s was your first pet`s name?</asp:ListItem>
                                    <asp:ListItem class="col-md-4 mb-4 form-group">What`s the name of the city where you were born?</asp:ListItem>
                                    <asp:ListItem class="col-md-4 mb-4 form-group">What was your childhood nickname?</asp:ListItem>
                                    <asp:ListItem class="col-md-4 mb-4 form-group">What`s the first name of your oldest cousin?</asp:ListItem>
                                    <asp:ListItem class="col-md-4 mb-4 form-group">What`s the name of your first school you attended?</asp:ListItem>
                                    <asp:ListItem class="col-md-4 mb-4 form-group">What`s your mother`s maiden name?</asp:ListItem>
                             </asp:DropDownList>
                                                <asp:Label ID="lblError" class="error" runat="server" ForeColor="Red"></asp:Label><br />
                             <asp:Label ID="lblSecQuesNote" runat="server" Text="In case you forget your password" Font-Bold="True" Font-Size="XX-Small"></asp:Label>
                                                </div>
                                            <div class="col-md-6 mb-4 form-group" >
                                                <label for="exampleInputEmail1" class="text-uppercase">What's your Answer?<span class="mand">*</span></label>
                            <asp:TextBox ID="txtAns" class="form-control" runat="server" Placeholder="Enter Answer" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAns"  class="error" runat="server" ControlToValidate="txtAns" ErrorMessage="Please enter an 'Answer'." ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="revAns" class="error" runat="server" ControlToValidate="txtAns" ErrorMessage="Enter alphabets only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>    
                                            </div>
                                         </div>

                                        <div class="d-flex justify-content-end pt-3">
                                            <asp:HyperLink ID="hyprlnkHome" runat="server" NavigateUrl="~/HomePage.aspx">Home</asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnRegister"  runat="server" Text="REGISTER" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="117px" OnClick="btnRegister_Click" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'"/>
                        &nbsp;
                        <asp:Button ID="btnClear" runat="server" Text="CLEAR" BackColor="White" ForeColor="Black" BorderWidth="1px" Height="39px" Width="117px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnClear_Click"/>
                        &nbsp;&nbsp;
                        <asp:Label ID="lblAlreadyRegistered" runat="server" Text="Already Registered? "></asp:Label>
                        <asp:HyperLink ID="hyprlnkLogin" runat="server" NavigateUrl="~/Login6.aspx">Login</asp:HyperLink>
                    </div>
                       
                                 
    </form>
</body>
</html>
