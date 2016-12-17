<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="store">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>modup</title>
    
    <link rel="stylesheet" type="text/css" href="/Content/bootstrap.css" />
    <script type="text/javascript" src="/Scripts/jquery.min.js"></script>
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script src="/Scripts/SpryValidationTextField.js" type="text/javascript"></script>
    <script src="/Scripts/SpryValidationPassword.js" type="text/javascript"></script>
    <script src="/Scripts/SpryValidationConfirm.js" type="text/javascript"></script>
    <script src="/Scripts/SpryValidationCheckbox.js" type="text/javascript"></script>
    <script src="/Scripts/SpryValidationSelect.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#myBtnLogIn").click(function () {
                $("#myModal").modal();
            });
            $("#myBtnSignUp").click(function () {
                $("#myModal2").modal();
            });
            
        });
    </script>
    
    <link href="/Content/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
    <link href="/Content/SpryValidationPassword.css" rel="stylesheet" type="text/css" />
    <link href="/Content/SpryValidationConfirm.css" rel="stylesheet" type="text/css" />
    <link href="/Content/SpryValidationCheckbox.css" rel="stylesheet" type="text/css" />
    <link href="/Content/SpryValidationSelect.css" rel="stylesheet" type="text/css" />

    <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css"/>
    <link href="/Content/stylemain.css" rel="stylesheet" type="text/css" />

</head>

<body>
    <!-- Navbar -->

    <div class="container-fluid wrapper">
        <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>   
       <!-- <i class="glyphicon glyphicon-comment" style="color:#777;"></i>  -->                   
      </button>
      <a class="navbar-brand" href="#"><img src="/Content/Images/modup_256.png" alt="" width="80" height="36" /></a>
           <div id="visible-xs-customize" class="pull-right">
                <div id="wrap" class="visible-xs visible-xs-customize"> <!-- class="col-md-offset-3"-->
                  <form action="" autocomplete="on">
                  <input id="search" name="search" type="text" placeholder="Search"><input id="search_submit" value="Rechercher" type="submit">
                  </form>
                </div>
            </div>
    </div>
<!--    <form class="navbar-form pull-left" role="search">
            <div class="input-group hidden-xs">
               <input type="text" class="form-control" placeholder="Search">
               <div class="input-group-btn">
                  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
               </div>
            </div>
     </form>-->
    
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav pull-left"><!--
        <li class="active"><a href="#">Home</a></li>-->
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">BROWSE <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Browse Categories</a></li>
            <li><a href="#">Browse Developers</a></li>
            <li><a href="#">Browse Jobs</a></li>
          </ul>
        </li>
        <li><a href="#">HIRE</a></li>
        <li><a href="#">WORK</a></li>
      </ul>
      

      <ul class="nav navbar-nav navbar-right pull-right">
        <li>

        	<div id="wrap" class="hidden-xs"> <!-- class="col-md-offset-3"-->
              <form action="" autocomplete="on">
              <input id="search" name="search" type="text" placeholder="What're you looking for ?"><input id="search_submit" value="Rechercher" type="submit">
              </form>
            </div>
        </li>
        <li  id="myBtnSignUp"><a href="#"><span class="glyphicon glyphicon-user"></span> SIGN UP</a></li>
        <li  id="myBtnLogIn"><a href="#"><span class="glyphicon glyphicon-log-in"></span> LOGIN</a></li>
             
     
      </ul>
    </div>
  </div>
</nav>
        <!-- First Container -->
        <div class="container-fluid section-01 text-center">
            <div class="row hidden-xs">
                <p class="section-01-h">Looking to work in modules? You are at the right place!</p>
            </div>
            <div class="row hidden-xs">
                <p class="section-01-p">Find developers at your finger tips!</p>
            </div>
            <div class="row hidden-xs">
                <div class="row hidden-xs">
                    <div class="center-block" style="width: 300px;" id="myBtnSignUp" data-toggle="modal" data-target="#myModal2">
                        <a href="#" class="caption-btn btn-white">Signup</a>
                    </div>
                    <div class="center-block" style="width: 300px;" id="myBtnLogIn" data-toggle="modal" data-target="#myModal">
                        <a href="#" class="caption-btn btn-white">Login</a>
                    </div>
                </div>
            </div>

            <div>
                <p class="section-01-h-xs visible-xs">Looking to work in modules? You are at the right place!</p>
            </div>
            <div>
                <p class="section-01-p-xs visible-xs">Find developers at your finger tips!</p>
            </div>
            <div class="row visible-xs">
                <div class="row visible-xs">
                    <div class="center-block" style="width: 300px;" id="myBtnSignUp" data-toggle="modal" data-target="#myModal2">
                        <a href="#" class="caption-btn-xs btn-white btn-xs">Signup</a>
                    </div>
                    <div class="center-block" style="width: 300px;" id="myBtnLogIn" data-toggle="modal" data-target="#myModal">
                        <a href="#" class="caption-btn-xs btn-white">Login</a>
                    </div>
                </div>
            </div>
        </div>


        <div class="container-fluid section-category">

            <div class="service_list service_list_1 container">
                <div class="row">
                    <div class="col-sm-3 circle-parent">
                        <!--service item-->
                        <a href="#" class="section-category-link">
                            <div class="service_item boxed no-radius">
                                <div class="inner">
                                    <div class="service_img"><span class="glyphicon glyphicon-globe icon-lg"></span></div>
                                    <div class="service_title">
                                        <h2><a href="#">Web
                                            <br />
                                            Developers</a></h2>
                                    </div>
                                </div>
                            </div>
                        </a>
                        <!--/service item-->
                    </div>
                    <div class="col-sm-3 circle-parent">
                        <!--service item-->
                        <a href="#" class="section-category-link">
                            <div class="service_item boxed no-radius">
                                <div class="inner">
                                    <div class="service_img"><span class="glyphicon glyphicon-phone icon-lg"></span></div>
                                    <div class="service_title">
                                        <h2><a href="#">Mobile Developers</a></h2>
                                    </div>
                                    <!--<div class="service_desc">
                            <p>It is an established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of</p>
                        </div>
                        <div class="service_meta_bot"><a href="#" class="link-more">Related works</a></div>-->
                                </div>
                            </div>
                        </a>
                        <!--/service item-->
                    </div>
                    <div class="col-sm-3 circle-parent">
                        <!--<div class="circle-singleline">
                <img src="img/birds-of-paradise-sq.jpg" class="img-responsive img-circle" style="display:inline" alt="Bird" width="50px" height="50px">
            </div>-->
                        <!--service item-->
                        <a href="#" class="section-category-link">
                            <div class="service_item boxed no-radius">
                                <div class="inner">
                                    <div class="service_img"><span class="glyphicon glyphicon-picture icon-lg"></span></div>
                                    <div class="service_title">
                                        <h2><a href="#">Designers & Creatives</a></h2>
                                    </div>
                                    <!--<div class="service_desc">
                            <p>Content here, content there, making it look like readable English. Many desktop publishing packages and web page editors</p>
                        </div>
                        <div class="service_meta_bot"><a href="#" class="link-more">Related works</a></div>-->
                                </div>
                            </div>
                        </a>
                        <!--/service item-->
                    </div>

                    <div class="col-sm-3 circle-parent">
                        <!--<div class="circle-singleline">
                657
            </div>-->
                        <!--service item-->
                        <a href="#" class="section-category-link">
                            <div class="service_item boxed no-radius">
                                <div class="inner">
                                    <div class="service_img"><span class="glyphicon glyphicon-calendar icon-lg"></span></div>
                                    <div class="service_title">
                                        <h2><a href="#">Data Entry & Admin</a></h2>
                                    </div>
                                    <!--<div class="service_desc">
                            <p>Content here, content there, making it look like readable English. Many desktop publishing packages and web page editors</p>
                        </div>
                        <div class="service_meta_bot"><a href="#" class="link-more">Related works</a></div>-->
                                </div>
                            </div>
                        </a>
                        <!--/service item-->
                    </div>
                </div>
                <!--/ .row-->

                <!-- .row-->
                <div class="row">
                    <div class="col-sm-4 circle-parent">
                        <!--<div class="circle-singleline">
                Top
            </div>-->
                        <!--service item-->
                        <a href="#" class="section-category-link">
                            <div class="service_item boxed no-radius">
                                <div class="inner">
                                    <div class="service_img"><span class="glyphicon glyphicon-pencil icon-lg"></span></div>
                                    <div class="service_title">
                                        <h2><a href="#">Writers</a></h2>
                                    </div>
                                    <!--<div class="service_desc">
                            <p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content</p>
                        </div>
                        <div class="service_meta_bot"><a href="#" class="link-more">Related works</a></div>-->
                                </div>
                            </div>
                        </a>
                        <!--/service item-->
                    </div>
                    <div class="col-sm-4 circle-parent">
                        <!--<div class="circle-singleline">
                755
            </div>-->
                        <!--service item-->
                        <a href="#" class="section-category-link">
                            <div class="service_item boxed no-radius">
                                <div class="inner">
                                    <div class="service_img"><span class="glyphicon glyphicon-user icon-lg"></span></div>
                                    <div class="service_title">
                                        <h2><a href="#">Accountants & Consultants</a></h2>
                                    </div>
                                    <!--<div class="service_desc">
                            <p>It is an established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of</p>
                        </div>
                        <div class="service_meta_bot"><a href="#" class="link-more">Related works</a></div>-->
                                </div>
                            </div>
                        </a>
                        <!--/service item-->
                    </div>
                    <div class="col-sm-4 circle-parent">
                        <!--<div class="circle-singleline">
                5000
            </div>-->
                        <!--service item-->
                        <a href="#" class="section-category-link">
                            <div class="service_item boxed no-radius">
                                <div class="inner">
                                    <div class="service_img"><span class="glyphicon glyphicon-signal icon-lg"></span></div>
                                    <div class="service_title">
                                        <h2><a href="#">Sales & Marketing Experts</a></h2>
                                    </div>
                                    <!--<div class="service_desc">
                            <p>Content here, content there, making it look like readable English. Many desktop publishing packages and web page editors</p>
                        </div>
                        <div class="service_meta_bot"><a href="#" class="link-more">Related works</a></div>-->
                                </div>
                            </div>
                        </a>
                        <!--/service item-->
                    </div>
                </div>
                <!--/ .row-->

                <!-- .row-->
                <div class="row margin margin-top">
                    <div class="col-sm-12 text-center">
                        <a href="quizToVerify_dev.html">
                            <button type="button" class="btn btn-danger cust-btn">See all categories</button>
                        </a>
                    </div>
                </div>
                <!--/ .row-->
            </div>
            <!--/ .service list-->


        </div>


        <div class="section-02">


            <div class="container">



                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="flat-img">
                            <img src="/Content/Images/lp-connection.png" class="img-responsive" alt="pic-2" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="item-dtls">
                            <div>
                                <h1>Great work starts with great talent</h1>
                            </div>
                            <div>Get amazing results working with the best programmers, designers, writers and other top online pros. Hire freelancers with confidence, always knowing their work experience and feedback from other clients.</div>
                            <!--<h3>The perfect App</h3>
                            <h1>landing page</h1>
                            <p>We have created this demo version in order to show you the structure of Startup Framework.</p>
                            <a href="#" class="caption-btn btn-white"><span>Available in </span>App Store</a>-->
                        </div>
                    </div>
                </div>


            </div>
            <!--container-->

        </div>
        <!-- end .slider-->


        <div class="container-fluid section-img visible-lg">
        </div>
        <div class="container-fluid section-img hidden">
        </div>



        <div class="section-03">
            <!--section-03-->


            <div class="container">



                <div class="row">

                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="item-dtls-03">
                            <div>
                                <h1>Great work starts with great talent</h1>
                            </div>
                            <div>Get amazing results working with the best programmers, designers, writers and other top online pros. Hire freelancers with confidence, always knowing their work experience and feedback from other clients.</div>
                            <!--<h3>The perfect App</h3>
                            <h1>landing page</h1>
                            <p>We have created this demo version in order to show you the structure of Startup Framework.</p>
                            <a href="#" class="caption-btn btn-white"><span>Available in </span>App Store</a>-->
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="flat-img-03">
                            <img src="/Content/Images/profile-info.png" class="img-responsive" alt="pic-3" style="float: right;" />
                        </div>
                    </div>
                </div>


            </div>
            <!--container-->

        </div>
        <!-- end .slider-->
        <div class="container-fluid section-img visible-lg">
        </div>
        <div class="container-fluid section-img hidden">
        </div>
        <!-- Second Container -->
        <!--<div class="container-fluid bg-1 text-center">
  <h3 class="margin">What Am I?</h3>
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
  <a href="#" class="btn btn-default btn-lg">
    <span class="glyphicon glyphicon-search"></span> Search
  </a>
</div>-->

        <!-- Third Container (Grid) -->
        <!--<div class="container-fluid bg-2 text-center">    
  <h3 class="margin">Where To Find Me?</h3><br>
  <div class="row">
    <div class="col-md-4">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <img src="img/bird.jpg" class="img-responsive margin" style="width:100%" alt="Image">
    </div>
    <div class="col-md-4"> 
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <img src="img/bird.jpg" class="img-responsive margin" style="width:100%" alt="Image">
    </div>
    <div class="col-md-4"> 
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <img src="img/bird.jpg" class="img-responsive margin" style="width:100%" alt="Image">
    </div>
  </div>
</div>-->

        <div class="container-fluid bg-3 visible-xs text-center">
            <div class="container">
                <div class="row">

                    <div class="container">
                        <h1>What People Are Saying</h1>
                    </div>
                    <!--<div class="container">Companies and individuals love using ModUp to work their way.</div>-->
                    <div class="margin-bottom-less padding-top">
                        <img src="/Content/Images/birds-of-paradise-sq.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="150px" height="150px">
                    </div>

                    <div>
                        <p>I feel safe and secure when meeting new clients on ModUp. I've also been able to develop my skills working on a variety of projects.</p>
                    </div>
                    <div>
                        <p style="font-size: 14px; font-weight: bold;">Lynda John</p>
                        <p></p>
                        <p style="font-size: 10px;">OWNER OF ADOBE</p>
                    </div>

                    <div class="margin-bottom-less padding-top">
                        <img src="/Content/Images/drops.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="150px" height="150px">
                    </div>

                    <div>
                        <p>I started my company 5 years ago on ModUp using a single PC. Today, I manage more than 20 employees and will have earned $1 million at the end of this year.</p>
                    </div>
                    <div>
                        <p style="font-size: 14px; font-weight: bold;">Hisham Sarwa</p>
                        <p></p>
                        <p style="font-size: 10px;">CEO OF INFOMIST</p>
                    </div>

                    <div class="margin-bottom-less padding-top">
                        <img src="/Content/Images/leaf.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="150px" height="150px">
                    </div>

                    <div>
                        <p>ModUp is an amazing service that I highly recommend to businesses of all sizes looking to find short or long-term, high quality resources.</p>
                    </div>
                    <div>
                        <p style="font-size: 14px; font-weight: bold;">Bev Flaxington</p>
                        <p></p>
                        <p style="font-size: 10px;">PRINCIPAL OF THE COLLABORATIVE</p>
                    </div>

                    <div class="margin-bottom-less padding-top">
                        <img src="/Content/Images/leaves.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="150px" height="150px">
                    </div>

                    <div>
                        <p>The hiring process on ModUp is easy, and every freelancer we have worked with was extremely professional and made sure we were more than happy.</p>
                    </div>
                    <div>
                        <p style="font-size: 14px; font-weight: bold;">Christy Woodrow</p>
                        <p></p>
                        <p style="font-size: 10px;">CO-FOUNDER OF TRAVELER</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid bg-3 hidden-xs" id="testimonials">
            <div class="container">
                <h1>What People Are Saying</h1>
            </div>
            <div class="container">Companies and individuals love using ModUp to work their way.</div>
            <div class="container testimonials">
                <div class="row margin">
                    <div class="col-md-5 text-margin-r text-justify margin">
                        <div class="pull-left img-margin-r">
                            <img src="/Content/Images/birds-of-paradise-sq.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="100px" height="100px">
                        </div>
                        <div class="margin">
                            <p class="clearfix">
                                I feel safe and secure when meeting new clients on ModUp. I've also been able to develop my skills working on a variety of projects.
                            </p>
                            <div class="text-margin-l">
                                <p style="font-size: 14px; font-weight: bold;">Lynda John</p>
                                <p></p>
                                <p style="font-size: 10px;">OWNER OF ADOBE</p>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-5 text-margin-r text-justify">
                        <div class="pull-left img-margin-r">
                            <img src="/Content/Images/drops.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="100px" height="100px">
                        </div>
                        <div class="margin">
                            <p class="clearfix">
                                I started my company 5 years ago on ModUp using a single PC. Today, I manage more than 20 employees and will have earned $1 million at the end of this year.
                            </p>
                            <div class="pull-right">
                                <div style="font-size: 14px; font-weight: bold;">Hisham Sarwa</div>
                                <p></p>
                                <div style="font-size: 10px;">CEO OF INFOMIST</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-5 text-margin-r text-justify margin">
                        <div class="pull-left img-margin-r">
                            <img src="/Content/Images/leaf.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="100px" height="100px">
                        </div>
                        <div class="margin">
                            <p class="clearfix">
                                ModUp is an amazing service that I highly recommend to businesses of all sizes looking to find short or long-term, high quality resources.
                            </p>
                            <div class="text-margin-l">
                                <p style="font-size: 14px; font-weight: bold;">Bev Flaxington</p>
                                <p></p>
                                <p style="font-size: 10px;">PRINCIPAL OF THE COLLABORATIVE</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 text-margin-r text-justify">
                        <div class="pull-left img-margin-r">
                            <img src="/Content/Images/leaves.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="100px" height="100px">
                        </div>
                        <div class="margin">
                            <p class="clearfix">
                                The hiring process on ModUp is easy, and every freelancer we have worked with was extremely professional and made sure we were more than happy.
                            </p>
                            <div class="pull-right">
                                <div style="font-size: 14px; font-weight: bold;">Christy Woodrow</div>
                                <p></p>
                                <div style="font-size: 10px;">CO-FOUNDER OF TRAVELER</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer 
<footer class="container-fluid bg-4 text-center">
  <p><a href="#">www.moodup.com</a></p> 
</footer>-->

        <div class="container-fluid" id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <h1>ABOUT</h1>
                        <ul class="list-unstyled">
                            <li><a href="#">About us</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Contact & support</a></li>
                            <li><a href="#">Enterprise</a></li>
                            <li><a href="#">Site status</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-3">
                        <h1>BROWSE</h1>
                        <ul class="list-unstyled">
                            <li><a href="#">Browse Categories</a></li>
                            <li><a href="#">Find Developers</a></li>
                            <li><a href="#">Find Jobs</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-3">
                        <h1>SERVICES</h1>
                        <ul class="list-unstyled">
                            <li><a href="#">Web analytics</a></li>
                            <li><a href="#">Presentations</a></li>
                            <li><a href="#">Code snippets</a></li>
                            <li><a href="#">Job board</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-3">
                        <h1>PRESS AND HELP</h1>
                        <ul class="list-unstyled">
                            <li><a href="#">Help</a></li>
                            <li><a href="#">Developer API</a></li>
                            <li><a href="#">FAQS</a></li>
                            <li><a href="#">In the News</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul>
                    </div>
                </div>

                <div class="row" id="footer-end">
                    <div class="col-sm-8 col-xs-12">
                        <ul class="list-unstyled list-inline pull-left">
                            <li><a href="#">Terms of Service</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Privacy</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-4 col-xs-12">
                        <ul class="list-unstyled list-inline pull-right">
                            <li class="text-muted pull-right">© 2015 ModUp. All rights reserved</li>
                        </ul>
                    </div>
                </div>
                <div class="container">
                    <p style="text-align: center; color: #fff;">Designed by <a href="http://www.sohailanwar.iblogger.org" style="color: #FF7F55;">MSA</a></p>
                </div>
            </div>
        </div>


    </div>
    <!--  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>-->

    <!-- Modal -->
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="padding: 35px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-lock"></span>Login</h4>
                </div>
                <div class="modal-body" style="padding: 40px 50px;">
                    <form id="frmLogin" role="form" action="" method="post">
                        
                        
                        <span id="sprytextfield1">
                            <div class="form-group">
                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
                                <input type="text" class="form-control" id="usrname" placeholder="Enter email"/>
                            </div>
                            <span class="textfieldRequiredMsg">* This field is required</span></span>
                        <span id="sprypassword1">
                            <div class="form-group">
                                <label for="psw"><span class="glyphicon glyphicon-eye-open"></span>Password</label>

                                <input type="password" class="form-control" id="psw" placeholder="Enter password"/>
                            </div>
                            <span class="passwordRequiredMsg">* This field is required</span><span class="passwordMinCharsMsg">* At least 5 characters</span></span>
                        <div class="checkbox">
                           
                            <label><input type="checkbox" value="" checked style="margin-top:13px"/>Remember me</label>
                        </div>
                        <button type="submit" id="btnLogin" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>Login</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <!--<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>-->
                    <p>Not a member? <span data-dismiss="modal" data-toggle="modal" data-target="#myModal2" id="myBtnSignUp"><a href="#">Sign Up</a></span></p>
                    <p>Forgot <a href="#">Password?</a></p>
                </div>
            </div>

        </div>
    </div>

    <script type="text/javascript">
        var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "none", { validateOn: ["change"] });
        var sprypassword1 = new Spry.Widget.ValidationPassword("sprypassword1", { minChars: 5, validateOn: ["change"] });
        
        
        
    </script>

    <div class="modal fade" id="myModal2" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="padding: 35px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-ok-circle"></span>SignUp</h4>
                </div>
                <div class="modal-body" style="padding: 40px 50px;">
                    <form id="frmSignup" role="form" method="post" action="">
                        

                        <span id="sprytextfield2"><div class="form-group">
                            <label for="cPass"><span class="glyphicon glyphicon-eye-close"></span>First Name</label>
                            <input type="text" class="form-control" id="fName" placeholder="Enter First name"/>
                            
                        </div><span class="textfieldRequiredMsg">* This field is required</span></span>
                        <span id="sprytextfield3"><div class="form-group">
                            <label for="cPass"><span class="glyphicon glyphicon-eye-close"></span>Last Name</label>
                            <input type="text" class="form-control" id="lName" placeholder="Enter Last Name"/>
                            
                        </div><span class="textfieldRequiredMsg">* This field is required</span></span>
                        <span id="sprytextfield4"><div class="form-group">
                            <label for="email"><span class="glyphicon glyphicon-envelope"></span>Email</label>
                            <input type="text" class="form-control" id="email" placeholder="Enter email"/>
                            
                        </div><span class="textfieldRequiredMsg">* This field is required</span><span class="textfieldInvalidFormatMsg">Invalid email address</span></span>
                        <span id="sprytextfield5"><div class="form-group">

                            <label for="usrnameSignUp"><span class="glyphicon glyphicon-user"></span>Username</label>
                            <input type="text" class="form-control" id="uName" placeholder="Enter Username"/>
                            
                        </div><span class="textfieldRequiredMsg">* This field is required</span></span>
                        <span id="sprypassword2"><div class="form-group">
                            <label for="psw"><span class="glyphicon glyphicon-eye-open"></span>Password</label>
                            <input type="password" class="form-control" id="regPsw" placeholder="Enter Password"/>
                            
                        </div><span class="textfieldRequiredMsg">* This field is required</span><span class="passwordMinCharsMsg">* At least 5 characters</span></span>
                        <span id="spryconfirm1"><div class="form-group">
                            <label for="cPass"><span class="glyphicon glyphicon-eye-close"></span>Confirm Password</label>

                           <input type="password" class="form-control" id="cnfrmRegPsw" placeholder="Re-Enter Password"/>
                        </div><span class="textfieldRequiredMsg">* This field is required</span><span class="confirmInvalidMsg">Password don't match.</span></span>
                        <span id="spryselect1"><div class="form-group">
                            <label for="cPass"><span class="glyphicon glyphicon-eye-close"></span>Account Type</label>
                           
                            <select id="accType">
                              <option id="optPM" value="PM">Development Manager</option>
                              <option id="optRE" value="RA">Requirement Engineer</option>
                              <option id="optQA" value="QA">Quality Assurance Engineer</option>
                              <option id="optDev" value="QA">Developer</option>
                              
                            </select> 
                        </div><span class="selectRequiredMsg">* Choose One</span></span>
                        <button id ="btnSignup" type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>SignUp</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <!--<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>-->
                    <p>Not a member? <span data-dismiss="modal" data-toggle="modal" data-target="#myModal" id="myBtnLogIn"><a href="#">Log In</a></span></p>
                    <p>Forgot <a href="#">Password?</a></p>
                </div>
            </div>
            <script type="text/javascript">

                var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "none", { validateOn: ["change"] });
                var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "none", { validateOn: ["change"] });
                var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1", { validateOn: ["change"] });



                var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "email", { validateOn: ["change"] });

                var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5", "none", { validateOn: ["change"] });
                var sprypassword2 = new Spry.Widget.ValidationPassword("sprypassword2", { minChars: 5, validateOn: ["change"] });
                var spryconfirm1 = new Spry.Widget.ValidationConfirm("spryconfirm1", "cnfrmRegPsw", { validateOn: ["change"] });
            </script>
        </div>
    </div>
</body>
</html>
