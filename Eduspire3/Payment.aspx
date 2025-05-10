<%@ Page Title="" Language="C#" MasterPageFile="~/ContentStu.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Eduspire3.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <body>
    <style>
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

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
            max-width: 400px;
            align-content:center;
            background: #FFB88C;
            border-radius: 25px;
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
        .proceed {
        margin-right: auto;
    height: 36px;
    margin-left: 1px;
    width: 110px;
    border-radius: 17px;
    border-color: bisque;
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
        .payment{
                margin-bottom: 30px;
    font-weight: 800;
    font-size: 30px;
    color: #DE6262;
        }

        html {
            min-height: 100%;
            background: linear-gradient(to bottom, #FFB88C, #DE6262);
        }
    </style>
    


        <section >
            <div class="container">   
                <form runat="server">
                    <h2 class="text-center payment" style="margin:10px"> Payment</h2>
            <label for="exampleInputEmail1" class="text-uppercase">Name
                               <span class="mand"> *</span> 
                            </label>

                              <asp:TextBox ID="txtName" runat="server"  class="form-control"> </asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Required" class="error"></asp:RequiredFieldValidator>
                              <asp:RegularExpressionValidator ID="revName" runat="server" class="error" ControlToValidate="txtName" ErrorMessage="Characters Only" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                                     <br />  
                              <label for="exampleInputEmail1" class="text-uppercase">E-Mail ID
                               <span class="mand"> * </span> 
                            </label>
                              <asp:TextBox ID="txtEmail" runat="server"  class="form-control"> </asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Required" class="error"></asp:RequiredFieldValidator>
                                  <br />
                                <label for="exampleInputEmail1" class="text-uppercase">Contact Number
                               <span class="mand"> * </span> 
                            </label>
                              <asp:TextBox ID="txtContact" runat="server"  class="form-control"> </asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="error" runat="server" ControlToValidate="txtContact" ErrorMessage="Required" ></asp:RequiredFieldValidator>
                                <br />
                              <label for="exampleInputEmail1" class="text-uppercase">Course Name
                               <span class="mand"> * </span> 
                            </label>
                              <asp:TextBox ID="txtPlan" runat="server"  class="form-control"> </asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" class="error" runat="server" ControlToValidate="txtProduct" ErrorMessage="Required" ></asp:RequiredFieldValidator>
                                <br />
                               <label for="exampleInputEmail1" class="text-uppercase">Amount
                               <span class="mand"> * </span> 
                            </label>
                              <asp:TextBox ID="txtAmount" runat="server"  class="form-control"> </asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" class="error" ControlToValidate="txtAmount" ErrorMessage="Required" ></asp:RequiredFieldValidator>
                                 <br />
                              <asp:Button ID="btnProceed" runat="server" Text="Proceed" OnClick="btnProceed_Click" class="proceed" />
                               
                </form>
                </div>
            
            </section>
           
    
                        </body>

</asp:Content>
