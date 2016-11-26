<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.userViewModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="store">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>modup</title>
    <!--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.10/angular.js" type="text/javascript"></script>
-->
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
    <script src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <%--<script type="text/javascript" src="js/angularjs-min.js"></script>--%>
    <!--<script type="text/javascript" src="js/app.js"></script>-->
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
    <script src="/SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
    <script src="/SpryAssets/SpryValidationPassword.js" type="text/javascript"></script>
    <script src="/SpryAssets/SpryValidationConfirm.js" type="text/javascript"></script>
    <script src="/SpryAssets/SpryValidationCheckbox.js" type="text/javascript"></script>
    <script src="/SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>

    <link href="/SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
    <link href="/SpryAssets/SpryValidationPassword.css" rel="stylesheet" type="text/css" />
    <link href="/SpryAssets/SpryValidationConfirm.css" rel="stylesheet" type="text/css" />
    <link href="/SpryAssets/SpryValidationCheckbox.css" rel="stylesheet" type="text/css" />
    <link href="/SpryAssets/SpryValidationSelect.css" rel="stylesheet" type="text/css" />

    <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css"/>
    <link href="/web-css/stylemain.css" rel="stylesheet" type="text/css" />

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
      <a class="navbar-brand" href="#"><img src="web-img/modup_256.png" alt="" width="80" height="36" /></a>
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
<!--      <ul class="nav navbar-nav navbar-left">
        <li><a href="#">WHO</a></li>
        <li><a href="#">WHAT</a></li>
        <li><a href="#">WHERE</a></li>
      </ul>-->
    </div>
  </div>
</nav>
        <!-- First Container -->
        <div class="container-fluid section-01 text-center">
            <!--
      <div><p class="section-01-h">Looking for developers? You are at the right place!</p></div>-->
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
                <!--<div><h1>Browse Jobs</h1></div>
            <div>Search for projects</div>-->
                <!-- .row-->
                <div class="row">
                    <div class="col-sm-3 circle-parent">
                        <!--<div class="circle-singleline">
                New
            </div>-->
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
                                    <!--<div class="service_desc">
                            <p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content</p>
                        </div>
                        <div class="service_meta_bot"><a href="#" class="link-more">Related works</a></div>-->
                                </div>
                            </div>
                        </a>
                        <!--/service item-->
                    </div>
                    <div class="col-sm-3 circle-parent">
                        <!--<div class="circle-singleline">
                Deal
            </div>-->
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
                            <img src="img/lp-connection.png" class="img-responsive" alt="pic-2" />
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
                            <img src="img/profile-info.png" class="img-responsive" alt="pic-3" style="float: right;" />
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
                        <img src="img/birds-of-paradise-sq.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="150px" height="150px">
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
                        <img src="img/drops.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="150px" height="150px">
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
                        <img src="img/leaf.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="150px" height="150px">
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
                        <img src="img/leaves.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="150px" height="150px">
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
                            <img src="img/birds-of-paradise-sq.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="100px" height="100px">
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
                            <img src="img/drops.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="100px" height="100px">
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
                            <img src="img/leaf.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="100px" height="100px">
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
                            <img src="img/leaves.jpg" class="img-responsive img-circle" style="display: inline" alt="Bird" width="100px" height="100px">
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
                    <form role="form" action="<%: Url.Action("Login","Account") %>" method="post">
                        <%: Html.AntiForgeryToken() %>
                        
                        <span id="sprytextfield1">
                            <div class="form-group">
                                <label for="usrname"><span class="glyphicon glyphicon-user"></span>Username</label>

                                <%: Html.TextBoxFor(model => model.LoginModel.UserName, new { @class = "form-control"}) %>
                                <%: Html.ValidationMessageFor(model => model.LoginModel.UserName) %>
                            </div>
                            <span class="textfieldRequiredMsg">* This field is required</span></span>
                        <span id="sprypassword1">
                            <div class="form-group">
                                <label for="psw"><span class="glyphicon glyphicon-eye-open"></span>Password</label>

                                <%: Html.PasswordFor(model => model.LoginModel.Password, new { @class = "form-control"}) %>
                                <%: Html.ValidationMessageFor(model => model.LoginModel.Password) %>
                            </div>
                            <span class="passwordRequiredMsg">* This field is required</span><span class="passwordMinCharsMsg">* At least 5 characters</span></span>
                        <div class="checkbox">
                            <%:Html.CheckBoxFor(model => model.LoginModel.RememberMe, new { @checkedstyle = "margin-top:13px"}) %>
                            <label><%--<input type="checkbox" value="" checked style="margin-top:13px">--%>Remember me</label>
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
                    <form role="form" method="post" action="<%: Url.Action("Register", "Account") %>">
                        <%: Html.AntiForgeryToken() %>

                        <span id="sprytextfield2"><div class="form-group">
                            <label for="cPass"><span class="glyphicon glyphicon-eye-close"></span>First Name</label>

                            <%: Html.TextBoxFor(model => model.tbUser.firstName, new { @class = "form-control"}) %>
                            <%: Html.ValidationMessageFor(model => model.tbUser.firstName) %>
                        </div><span class="textfieldRequiredMsg">* This field is required</span></span>
                        <span id="sprytextfield3"><div class="form-group">
                            <label for="cPass"><span class="glyphicon glyphicon-eye-close"></span>Last Name</label>

                            <%: Html.TextBoxFor(model => model.tbUser.lastName, new { @class = "form-control"}) %>
                            <%: Html.ValidationMessageFor(model => model.tbUser.lastName) %>
                        </div><span class="textfieldRequiredMsg">* This field is required</span></span>
                        <span id="sprytextfield4"><div class="form-group">
                            <label for="email"><span class="glyphicon glyphicon-envelope"></span>Email</label>

                            <%: Html.TextBoxFor(model => model.RegisterModel.Email, new { @class = "form-control"}) %>
                            <%: Html.ValidationMessageFor(model => model.RegisterModel.Email) %>
                        </div><span class="textfieldRequiredMsg">* This field is required</span><span class="textfieldInvalidFormatMsg">Invalid email address</span></span>
                        <span id="sprytextfield5"><div class="form-group">

                            <label for="usrnameSignUp"><span class="glyphicon glyphicon-user"></span>Username</label>

                            <%: Html.TextBoxFor(model => model.RegisterModel.UserName, new { @class = "form-control"}) %>
                            <%: Html.ValidationMessageFor(model => model.RegisterModel.UserName) %>
                        </div><span class="textfieldRequiredMsg">* This field is required</span></span>
                        <span id="sprypassword2"><div class="form-group">
                            <label for="psw"><span class="glyphicon glyphicon-eye-open"></span>Password</label>

                            <%: Html.PasswordFor(model => model.RegisterModel.Password, new { @class = "form-control", id="password" , name="password"}) %>
                            <%: Html.ValidationMessageFor(model => model.RegisterModel.Password) %>
                        </div><span class="textfieldRequiredMsg">* This field is required</span><span class="passwordMinCharsMsg">* At least 5 characters</span></span>
                        <span id="spryconfirm1"><div class="form-group">
                            <label for="cPass"><span class="glyphicon glyphicon-eye-close"></span>Confirm Password</label>

                            <%: Html.PasswordFor(model => model.RegisterModel.ConfirmPassword, new { @class = "form-control"}) %>
                            <%: Html.ValidationMessageFor(model => model.RegisterModel.ConfirmPassword) %>
                        </div><span class="textfieldRequiredMsg">* This field is required</span><span class="confirmInvalidMsg">Password don't match.</span></span>
                        <span id="spryselect1"><div class="form-group">
                            <label for="cPass"><span class="glyphicon glyphicon-eye-close"></span>Account Type</label>
                            <%--<input type="text" class="form-control" id="cPass" placeholder="Confirm password">--%>
                            <%:
                   Html.DropDownListFor(model => model.RegisterModel.AccountType,new List<SelectListItem> { 
                       new SelectListItem { Value = "Developer" , Text = "Developer" },
                       new SelectListItem { Value = "PM" , Text = "Project Manager" },
                       new SelectListItem { Value = "RA" , Text = "System Requirement Analyser" },
                       new SelectListItem { Value = "QA" , Text = "System Quality Assurance Engineer" }
                       
                    }, new { @class = "form-control"}
                  )%>
                        </div><span class="selectRequiredMsg">* Choose One</span></span>
                        <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>SignUp</button>
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
                var spryconfirm1 = new Spry.Widget.ValidationConfirm("spryconfirm1", "password", { validateOn: ["change"] });
            </script>
        </div>
    </div>
</body>
</html>
