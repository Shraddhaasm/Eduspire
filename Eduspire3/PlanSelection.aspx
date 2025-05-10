<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanSelection.aspx.cs" Inherits="Eduspire3.PlanSelection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Eduspire</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
            background: url("Image/Premium%20Vector%20_%20Back%20to%20school%20doodle%20elements.png");
            opacity: 4%;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            position: fixed;
            z-index: -1;
        }

        .box {
            height: 318px;
        }

        #header {
            height: 99px !important;
            box-shadow: 0px 2px 15px #ef7f4d;
        }
    </style>




    <!-- ======= Hero Section ======= -->

    <form runat="server">
        <asp:HiddenField ID="Hidden_stu_ID" runat="server" />
        <asp:HiddenField ID="Hidden_stu_FName" runat="server" />
        <asp:HiddenField ID="Hidden_stu_ContactNo" runat="server" />


        <main id="">




            <section id="team" class="section-bg">

                <div class="container" data-aos="fade-up" style="">
                    <div class="section-title">
                        <h2>Plan</h2>
                        <p>Select the plan</p>
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
                                        <h6 class="card-price text-center">
                                            <asp:Label ID="lblBasic" runat="server"></asp:Label>₹<span class="period">/1 month</span></h6>
                                        <hr style="margin: 0.5rem 0!important;">
                                         <ul class="fa-ul">
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Lecture Videos
              </li>
              
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Assessment/Certificate</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>resume</li>
              
            </ul>
         
             <%-- <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Free Subdomain
              </li>--%>
                                            <%--  <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Monthly Status
                Reports</li>--%>
                                      
                                        <div class="d-grid">
                                            <asp:Button class="btn btn-primary text-uppercase" Text="Enroll Now" ID="Basic" runat="server" OnClick="Basic_Click" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Plus Tier -->
                            <div class="col-lg-4">
                                <div class="card mb-5 mb-lg-0">
                                    <div class="card-body">
                                        <h5 class="card-title text-muted text-uppercase text-center">Plus</h5>
                                        <h6 class="card-price text-center">
                                            <asp:Label ID="lblPlus" runat="server"></asp:Label>₹<span class="period">/6Months</span></h6>
                                        <hr style="margin: 0.5rem 0!important;">
                                         <ul class="fa-ul">
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Lecture Videos
              </li>
              
              <li><span class="fa-li"><i class="fas fa-check"></i></span>Assessment/Certificate</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>resume</li>
              
            </ul>
                                        <div class="d-grid">
                                            <asp:Button class="btn btn-primary text-uppercase" Text="Enroll Now" ID="Plus" runat="server" OnClick="Plus_Click" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Pro Tier -->
                            <div class="col-lg-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title text-muted text-uppercase text-center">Pro</h5>
                                        <h6 class="card-price text-center">
                                            <asp:Label ID="lblPro" runat="server"></asp:Label>₹<span class="period">/1Year</span></h6>
                                        <hr style="margin: 0.5rem 0!important;">
                                        <ul class="fa-ul">
                                            <li><span class="fa-li"><i class="fas fa-check"></i></span><strong>Lecture Videos</strong>
                                            </li>

                                            <li><span class="fa-li"><i class="fas fa-check"></i></span>Assessment/Certificate</li>
                                            <li><span class="fa-li"><i class="fas fa-check"></i></span>resume</li>

                                        </ul>
                                        <div class="d-grid">
                                            <asp:Button class="btn btn-primary text-uppercase" Text="Enroll Now" ID="Pro" runat="server" OnClick="Pro_Click" />


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>


            </section>



        </main>
        <!-- End #main -->
    </form>
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
    </footer>
    <!-- End Footer -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets1/vendor/aos/aos.js"></script>
    <script src="assets1/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets1/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets1/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets1/vendor/swiper/swiper-bundle.min.js"></script>

    <!-- Template Main JS File -->
    <script src="assets1/js/main.js"></script>

</body>

</html>
