<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Eduspire3.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Home | Eduspire</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
 <%-- <link href="Images/favicon.png" rel="icon">
  <link href="Images/apple-touch-icon.png" rel="apple-touch-icon">--%>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets1/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets1/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets1/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets1/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets1/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets1/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">




  <!-- Template Main CSS File -->
  <link href="assets1/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Ninestars - v4.10.0
  * Template URL: https://bootstrapmade.com/ninestars-free-bootstrap-3-theme-for-creative/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
    <style>
        body::after {
            content: "";
            background: url("Images/BackgroundDoodlle.png");
            opacity: 5%;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            position: fixed;
            z-index: -1;
        }
        .box{  height:318px;

        }
        #header {
            height: 99px !important;
            box-shadow: 0px 2px 15px #ef7f4d;
        }
        .animate-charcter
        {
            text-transform: uppercase;
            background-image: linear-gradient(
            -225deg,
             #231557 0%,
             #44107a 29%,
             #ff1361 67%,
             #fff800 100%
            );
             background-size: auto auto;
             background-clip: border-box;
             background-size: 200% auto;
             color: #fff;
            background-clip: text;
            text-fill-color: transparent;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
             animation: textclip 2s linear infinite;
            display: inline-block;
             font-size: 20px;
        }
        @keyframes textclip {
            to {
                background-position: 200% center;
            }
        }
    </style>
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
          <img src="Images/Logo.png" style="margin-top: -23px;max-height: 125px!important;"/>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div><div class="col-md-12 text-center">
       <h6 class="animate-charcter" style="
    margin-left: -718px;
    margin-top: 76px;
    font-size: 14px;
    font-weight: bold;">Educate and Inspire </h6>
         </div>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          
          <li><a class="nav-link scrollto" href="#about">Home</a></li>
          <li><a class="nav-link scrollto" href="#services">Services</a></li>
          
          <li><a class="nav-link scrollto" href="#team">Courses</a></li>
          
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
             <li><a class="getstarted scrollto" href="Login6.aspx">Login</a></li>
           
          <li><a class="getstarted scrollto" href="VerifyStudent.aspx">Student Registration</a></li>

            <li><a class="getstarted scrollto" href="VerifyTutor3.aspx">Tutor Application</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->



  <!-- ======= Hero Section ======= -->
  

  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="row justify-content-between">
          <div class="col-lg-5 d-flex align-items-center justify-content-center about-img">
            <img src="assets1/img/about-img.svg" class="img-fluid" alt="" data-aos="zoom-in">
          </div>
          <div class="col-lg-6 pt-5 pt-lg-0">
            <h3 data-aos="fade-up">Eduspire (Education + Inspiration)</h3>
            <p data-aos="fade-up" data-aos-delay="100">
             We are introducing “Eduspire” (online/E-learning and resume building website) which means Education + Inspiration. This website is similar to E-learning platforms and is a combination of other multiple services regarding skills development. Basically, this website will offer various certificate courses, and aptitude tests and will help build resumes for users which will be available on the drive for easy access</p>
            <div class="row">
              <div class="col-md-6" data-aos="fade-up" data-aos-delay="100">
                <i class="bx bx-desktop"></i>
                <h4>E-Learning</h4>
                <p>Helps and improves Online Learinig </p>
              </div>
              <div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
                <i class="bx bx-note"></i>
                <h4>Resume-Building</h4>
                <p>Provides templates for making your own resume</p>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg" style="background: linear-gradient(to bottom, #FFB88C, #DE6262)!important;">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2 style="color: #fbfbfb;">Services</h2>
          <p>Check out the great services we offer</p>
        </div>

        <div class="row">
          <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-pencil"></i></div>
              <h4 class="title"><a href="">E_Learning</a></h4>
              <p class="description">Try out our Best Courses we offer by some of the Qualified Professionals around the World.</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-notepad"></i></div>
              <h4 class="title"><a href="">Test</a></h4>
              <p class="description">Test your abilities now by enrolling yourself for a Test and get your score immediately.</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-news"></i></div>
              <h4 class="title"><a href="">Resume</a></h4>
              <p class="description">Choosing a Resume format is an hectic process. Eduspire makes it easy on click of few buttons.</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="400">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-certification"></i></div>
              <h4 class="title"><a href="">Certificate </a></h4>
              <p class="description">Get a Certificate of your Courses which are accepted world wide.</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Services Section -->

  
    <!-- ======= Team Section ======= -->
      
    <!-- ======= Clients Section ======= -->
     
   
    <section id="team" class="section-bg">
         
      <div class="container" data-aos="fade-up" style="">
        <div class="section-title">
         <h2>Courses</h2>
          <p>Check out the courses we offer</p>
        </div>
         
        <div class="clients-slider swiper" data-aos="fade-up" data-aos-delay="100" style="margin-top: -40px;">
          <div class="swiper-wrapper align-items-center">
             <div class="swiper-slide"><img src="Images/PYTHON.png"  class="img-fluid" alt=""></div>
            <div class="swiper-slide"><img src="Images/JAVA.png"  class="img-fluid" alt=""></div>
            <div class="swiper-slide"><img src="Images/CSharp.png"  class="img-fluid" alt=""></div>
              <div class="swiper-slide"> <img src="Images/HMTL.png" class="img-fluid" alt=""></div>
            <div class="swiper-slide"><img src="https://i.imgur.com/VzjZw9M.png" class="img-fluid" alt=""></div>
            <div class="swiper-slide"> <img src="Images/CPP.png" class="img-fluid" alt=""></div>
            
          
          </div>
            
          
              <br />
          <div class="swiper-pagination"></div>
        </div>
          <style>
              .pricing .card {
                  border: none;
                  border-radius: 1rem;
                  transition: all 0.2s;
                  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
              }

              .pricing hr {
                  margin: 1.5rem 0;
              }

              .pricing .card-title {
                  margin: 0.5rem 0;
                  font-size: 0.9rem;
                  letter-spacing: .1rem;
                  font-weight: bold;
              }

              .pricing .card-price {
                  font-size: 3rem;
                  margin: 0;
              }

                  .pricing .card-price .period {
                      font-size: 0.8rem;
                  }

              .pricing ul li {
                  margin-bottom: 1rem;
              }

              .pricing .text-muted {
                  opacity: 0.7;
              }

              .pricing .btn {
                  font-size: 80%;
                  border-radius: 5rem;
                  letter-spacing: .1rem;
                  font-weight: bold;
                  padding: 1rem;
                  opacity: 0.7;
                  transition: all 0.2s;
              }

              /* Hover Effects on Card */

              @media (min-width: 992px) {
                  .pricing .card:hover {
                      margin-top: -.25rem;
                      margin-bottom: .25rem;
                      box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.3);
                  }

                      .pricing .card:hover .btn {
                          opacity: 1;
                      }
              }

              .btn-primary {
                  --bs-btn-color: #fff;
                  --bs-btn-bg: #de6262;
                  --bs-btn-border-color: #dc3545;
                  --bs-btn-hover-color: #fff;
                  --bs-btn-hover-bg: #dc3545;
                  --bs-btn-hover-border-color: #dc3545;
                  --bs-btn-focus-shadow-rgb: 49,132,253;
                  --bs-btn-active-color: #fff;
                  --bs-btn-active-bg: #ef7f4d;
                  --bs-btn-active-border-color: #ef7f4d;
                  --bs-btn-active-shadow: inset 0 3px 5pxrgba(0, 0, 0, 0.125);
                  --bs-btn-disabled-color: #fff;
                  --bs-btn-disabled-bg: #dc3545;
                  --bs-btn-disabled-border-color: #dc3545;
              }
          </style>
          
          <section class="pricing py-5">
  <div class="container" style="margin-top: -42px;">
    <div class="row">
      <!-- Free Tier -->
      <div class="col-lg-4">
        <div class="card mb-5 mb-lg-0">
          <div class="card-body box">
            <h5 class="card-title text-muted text-uppercase text-center">Basic</h5>
            <h6 class="card-price text-center"><asp:Label ID="lblBasic" runat="server"></asp:Label>₹<span class="period">/1 month</span></h6>
            <hr style="margin: 0.5rem 0!important;">
             <ul class="fa-ul">
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Lecture Videos
              </li>
              
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Assessment/Certificate</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>resume</li>
              
            </ul>
            
              
                  <%-- <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Free Subdomain
              </li>--%>            <%--  <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Monthly Status
                Reports</li>--%>
            
            <div class="d-grid">
              <a href="VerifyStudent.aspx" class="btn btn-primary text-uppercase">Enroll Now</a>
            </div>
          </div>
        </div>
      </div>
      <!-- Plus Tier -->
      <div class="col-lg-4">
        <div class="card mb-5 mb-lg-0">
          <div class="card-body">
            <h5 class="card-title text-muted text-uppercase text-center">Plus</h5>
            <h6 class="card-price text-center"> <asp:Label ID="lblPlus" runat="server"></asp:Label>₹<span class="period">/6Months</span></h6>
           <hr style="margin: 0.5rem 0!important;">
             <ul class="fa-ul">
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Lecture Videos
              </li>
              
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Assessment/Certificate</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>resume</li>
              
            </ul>
            <div class="d-grid">
              <a href="VerifyStudent.aspx" class="btn btn-primary text-uppercase">Enroll Now</a>
            </div>
          </div>
        </div>
      </div>
      <!-- Pro Tier -->
      <div class="col-lg-4">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title text-muted text-uppercase text-center">Pro</h5>
            <h6 class="card-price text-center"> <asp:Label ID="lblPro" runat="server"></asp:Label>₹<span class="period">/1Year</span></h6>
            <hr style="margin: 0.5rem 0!important;">
            <ul class="fa-ul">
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Lecture Videos
              </li>
              
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Assessment/Certificate</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>resume</li>
              
            </ul>
            <div class="d-grid">
              <a href="VerifyStudent.aspx" class="btn btn-primary text-uppercase">Enroll Now</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    

      </div>

    </section><!-- End Clients Section -->
      
    <!-- ======= Contact Us Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Contact Us/Feedback</h2>
          <p>Contact for more Queries</p>
        </div>

        <div class="row">

          <div class="col-lg-5 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="info">
              <%--<div class="address">
                <i class="bi bi-geo-alt"></i>
                <h4>Location:</h4>
                <p>Mumbai</p>
              </div>--%>

              <div class="email">
                <i class="bi bi-envelope"></i>
                <h4>Email:</h4>
                <p>eduspire39154@gmail.com</p>
              </div>

              

               </div>

          </div>
            <style>
                .contact .php-email-form input, .contact .php-email-form textarea {
                    border-radius: 4px !important;
                }

                .navbar .getstarted:hover {
                    background: #ef7f4d;
                }
                 .error {
            color: Red;
            visibility: hidden;
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

                .contact .php-email-form input {
                    height: 40px;
                }

                .contact .php-email-form .form-group {
                    padding-bottom: 0px;
                }
            </style>
          <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
            <form runat="server" class="php-email-form">

              <div class="row">
                  <asp:Label ID="lblID" runat="server" Text="ID: " Visible="False"></asp:Label>
                   <asp:Label ID="lblIDNo" runat="server" Text="No." Visible="False"></asp:Label>
                                                <br />
                <div class="form-group col-md-6">
                  <label>Name</label><span class="mand">*</span>
                  <asp:TextBox  runat="server"  type="text" name="name" class="form-control" id="txtName" placeholder="Enter your Full Name"/>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" class="error" ErrorMessage="Please enter your 'Name'."  ValidationGroup="contact" SetFocusOnError="True" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator  ID="revName" class="error"  runat="server" ControlToValidate="txtName" ValidationGroup="contact" ErrorMessage="Enter alphabets only." ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-z]+([\s][a-zA-Z]+)*$"></asp:RegularExpressionValidator>
                </div>
               
                  <div class="form-group col-md-6 mt-3 mt-md-0">
                  <label>Email ID</label><span class="mand">*</span>
                  <asp:TextBox  runat="server" type="email" class="form-control" ValidationGroup="contact" name="email" id="txtEmail" placeholder="Enter your Email ID" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Please enter your 'Email ID'." class="error" ControlToValidate="txtEmail" ValidationGroup="contact" SetFocusOnError="True"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator class="error" ID="revEmailID" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter a valid E-mail ID." ValidationGroup="contact" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
              </div>

              <div class="form-group mt-3">
                <span>Subject</span><span class="mand">*</span>
                <asp:TextBox  runat="server" type="text" class="form-control" name="subject" id="txtSubject" placeholder="Subject" />
                  <asp:RequiredFieldValidator ID="rfvSubject" runat="server" class="error" ErrorMessage="Please enter your 'Subject'." ValidationGroup="contact" ControlToValidate="txtSubject" SetFocusOnError="True"></asp:RequiredFieldValidator>
              </div>
              <div class="form-group mt-3">
                <span>Message</span><span class="mand">*</span>
                <asp:TextBox runat="server" id="txtMessage" class="form-control" name="message" rows="10"  style="height:100px" placeholder="Type your Message here."></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvMessage" runat="server" class="error" ErrorMessage="Please enter your 'Message'." ValidationGroup="contact" ControlToValidate="txtMessage"></asp:RequiredFieldValidator>
              
              </div>
                <br />
              
              <div class="text-center">
                  <asp:Button id="btnSubmit"  type="submit" runat="server" ValidationGroup="contact"  style="background: #de6262;  border: 0;  padding: 10px 24px;  color: #fff;  transition: 0.4s;  border-radius: 4px;" Text="Send Message" OnClick="btnSubmit_Click"/></div>
            </form>
          </div>

        </div>

      </div>
    </section><!-- End Contact Us Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

   

    

    <div class="container py-4">
      <div class="copyright">
        
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/ninestars-free-bootstrap-3-theme-for-creative/ -->
     
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets1/vendor/aos/aos.js"></script>
  <script src="assets1/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets1/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets1/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets1/vendor/swiper/swiper-bundle.min.js"></script>
 
  <!-- Template Main JS File -->
  <script src="assets1/js/main.js"></script>

</body

</html>
