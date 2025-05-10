<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginAsStu.aspx.cs" Inherits="Eduspire3.LoginAsStu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Eduspire | Login as Student</title>
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

        html{
            min-height: 100%;
            background: linear-gradient(to bottom, #FFB88C, #DE6262);
        }
    </style>

    <form id="form1" class="login-form" runat="server">
        <section class="login-block" data-aos="fade-up">
        <div class="container" style="margin-top: 33px;margin-right: 600px;">
        <div class="row">
            <div class="col-md-1"></div>
                <div class="col-md-8 login-sec">
                    <h2 class="text-center" style="  margin-top: 42px;">Login to Eduspire</h2>
                    

                        <div class="form-group">
                            <label for="exampleInputEmail1" class="text-uppercase">Enter your E-mail ID<span class="mand"> *</span></label>
                                <asp:TextBox ID="txtEmailID" class="form-control" runat="server" TextMode="Email" Placeholder="Enter E-mail ID" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmailID" class="error" runat="server" ControlToValidate="txtEmailID" ErrorMessage="Please enter your 'E-mail ID'." ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="revEmailID" class="error" runat="server" ControlToValidate="txtEmailID" ErrorMessage="Please enter a valid E-mail ID." ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Please enter valid E-mail ID.</asp:RegularExpressionValidator>
                        </div>

                         <div class="form-group">
                            <label for="exampleInputPassword1" class="text-uppercase">Enter your Password<span class="mand"> *</span></label>
                                <asp:TextBox ID="txtPassword" class="form-control" runat="server" TextMode="Password" Placeholder="Enter Password" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" class="error" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter your 'Password'." ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <br />
                                <input type="checkbox" onchange="document.getElementById('txtPassword').type = this.checked ? 'text' : 'password'" />
                                <asp:Label ID="lblShowPassword" runat="server" Text="Show Password"></asp:Label>
                        </div>
                    
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ForgotPassForStu.aspx">Forgot Password?</asp:HyperLink>
                    
                        <div class="d-flex justify-content-end pt-3">
                            <asp:Button ID="btnLogin" class="btn btn-login float-right" runat="server" Text="LOG IN" BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="36px" Width="126px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnLogin_Click"/>
                            &nbsp;&nbsp;
                            <asp:Button ID="btnClear" class="btn btn-light btn-Cancel" runat="server" Text="CLEAR" BackColor="White" ForeColor="Black" BorderWidth="1px" Height="36px" Width="126px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnClear_Click"/><br />
                            </div>
                    <div class=" form-control-plaintext">
                            <asp:Label ID="lblAccount" runat="server" Text="Don't have an account?"></asp:Label>
                            &nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/VerifyStudent.aspx">Register</asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/HomePage.aspx">Home</asp:HyperLink>
                        </div>
    </form>
                       <%-- <div class="copy-text">
                        <br />
                        Created with <i class="fa fa-book"></i>by Eduspire
                    </div>--%>
                </div>
                <%--<div class="col-md-8 banner-sec">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img class="d-block img-fluid" src="https://static.pexels.com/photos/33972/pexels-photo.jpg" alt="First slide">
                                <div class="carousel-caption d-none d-md-block">
                                    <div class="banner-text">
                                        <h2>EDUSPIRE</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="https://static.pexels.com/photos/33972/pexels-photo.jpg" alt="First slide">
                                <div class="carousel-caption d-none d-md-block">
                                    <div class="banner-text">
                                        <h2>EDUSPIRE</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="https://static.pexels.com/photos/33972/pexels-photo.jpg" alt="First slide">
                                <div class="carousel-caption d-none d-md-block">
                                    <div class="banner-text">
                                        <h2>EDUSPIRE</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>--%>
            <div class="col-md-3">
                        <img src="Images/Login.png" style="height: 550px; margin-top: -50px;" />
                    </div>
            </div>
        </div>
    </section>
        <div>
        </div>
    </form>
</body>
</html>
