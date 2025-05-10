<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassForAdmTut.aspx.cs" Inherits="Eduspire3.ResetPassForAdmTut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Eduspire | Reset Password</title>
</head>
<body>

     <style>
    </style>
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
            min-height: 100%;
        }

        .login-block {
            /*//// background: #DE6262;*/ /* fallback for old browsers */
            /*background: -webkit-linear-gradient(to bottom, #FFB88C, #DE6262);*/ /* Chrome 10-25, Safari 5.1-6 */
            /*background: linear-gradient(to bottom, #FFB88C, #DE6262);*/ /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
             background: linear-gradient(to bottom, #FFB88C, #DE6262);
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
            max-width: 629px;
            background: #fff;
            border-radius: 27px;
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

        html {
            min-height: 100%;
            background: linear-gradient(to bottom, #FFB88C, #DE6262);
        }
    </style>

    <form id="form1" runat="server">

        <section class="login-block">
            <div class="container" style="margin-top: 33px; margin-left: 300px;">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-7 login-sec">
                        <h2 class="text-center" style="margin-top: 50px;">Reset your password</h2>


                        <div class="form-group">
                            <label for="exampleInputEmail1" class="text-uppercase">
                                Enter new Password
                               <span class="mand">*</span>
                            </label>
                            <asp:TextBox ID="txtNewPass" runat="server" placeholder="Enter new password" TextMode="Password" class="form-control" MaxLength="50"></asp:TextBox>
                            <input type="checkbox" onchange="document.getElementById('txtNewPass').type = this.checked ? 'text' : 'password'" /><asp:Label ID="lblShowPassword" runat="server" Text="Show Password"></asp:Label><br />
                             <asp:RequiredFieldValidator ID="rfvPassword" class="error" runat="server" ControlToValidate="txtNewPass" ErrorMessage="Please enter a 'Password'." ForeColor="Red" SetFocusOnError="True" ValidationGroup="Login"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPassword" class="error" runat="server" ControlToValidate="txtNewPass" ErrorMessage="Please enter a strong password" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Login" ValidationExpression="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&amp;])[A-Za-z\d@$!%*#?&amp;]{8,}$"></asp:RegularExpressionValidator>
                            </div>

                         <div class="form-group" id="div_OTP" runat="server">
                            <label for="exampleInputEmail1" class="text-uppercase">
                                Confirm Password
                               <span class="mand">*</span>
                                </label>
                                <asp:TextBox ID="txtConfPass" Placeholder="Confirm Password" runat="server" TextMode="Password" class="form-control" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvConfPassword" class="error" runat="server" ControlToValidate="txtConfPass" ErrorMessage="Please fill the 'Confirm Password' field." ForeColor="Red" SetFocusOnError="True" ValidationGroup="Login"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvPassword" class="error" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtConfPass" ErrorMessage="Password doesn't match!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Login"></asp:CompareValidator>
                                </div>

                        <div class="d-flex justify-content-end pt-3" id="div_sendOTP" runat="server">
                                    <asp:Button ID="btnReset" runat="server" ValidationGroup="Login" Text="Reset" BackColor="#FF6666" Font-Bold="False" Font-Size="Large" ForeColor="White" Height="27px" Width="152px" BorderWidth="1px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnReset_Click" />
                                    </div>

                         <div class="copy-text" style="margin-left: 40px">
                            <a href="HomePage.aspx">Home</a> / <a href="Login6.aspx">Login</a> / <a href="VerifyStudent.aspx">Student Registration</a>
                            
                            <%--<br />
                            Created with <i class="fa fa-book"></i>by Eduspire--%>
                        </div>

                        </div>
                    <div class="col-md-4">
                        <img src="Images/ResetPass.png" style="height: 585px; margin-top: -50px;" />
                    </div>
                    </div>
                </div>
            </section>

        <div>
        </div>
    </form>
</body>
</html>
