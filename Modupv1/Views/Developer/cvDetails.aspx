<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.devViewModel>" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Modup Dashboard">
    <meta name="author" content="Modup">
    <meta name="keyword" content="modup, dashboard">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Modup Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="/css/elegant-icons-style.css" rel="stylesheet" />
    <link href="/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- full calendar css-->
    <link href="/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
    <!-- easy pie chart-->
    <link href="/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen" />
    <!-- owl carousel -->
    <link rel="stylesheet" href="/css/owl.carousel.css" type="text/css">

    <!-- Custom styles -->
    <link href="/web-css/stylemain.css" rel="stylesheet" type="text/css">
    <link href="/web-css/dashboard_dev.css" rel="stylesheet">
    <link href="/web-css/profile_dev.css" rel="stylesheet">
    <link href="/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
</head>

<body>
    <!-- container section start -->
    <section id="container" class="">
        <!--header start-->

        <header class="header white-bg">
            <div class="toggle-nav">
                <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
            </div>

            <!--logo start-->
            <a href="index.html" class="logo">
                <img src="/web-img/modup_256.png" alt="" width="80" height="36" /></a>
            <!--logo end-->

            <div class="nav search-row" id="top_menu">
                <!--  search form start -->
                <!--<ul class="nav top-menu">                    
                    <li>
                        <form class="navbar-form">
                            <input class="form-control" placeholder="Search" type="text">
                        </form>
                    </li>                    
                </ul>-->
                <!--  search form end -->
            </div>

            <div class="top-nav notification-row">
                <!-- notificatoin dropdown start-->
                <ul class="nav pull-right top-menu">

                    <!-- task notificatoin start -->
                    <li id="task_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="icon-task-l"></span>
                            <span class="badge bg-important">5</span>
                        </a>
                        <ul class="dropdown-menu extended tasks-bar">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 5 pending tasks</p>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">Design PSD </div>
                                        <div class="percent">90%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                                            <span class="sr-only">90% Complete (success)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">
                                            Project 1
                                        </div>
                                        <div class="percent">30%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
                                            <span class="sr-only">30% Complete (warning)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">Digital Marketing</div>
                                        <div class="percent">80%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">Logo Designing</div>
                                        <div class="percent">78%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" style="width: 78%">
                                            <span class="sr-only">78% Complete (danger)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">Mobile App</div>
                                        <div class="percent">50%</div>
                                    </div>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                                            <span class="sr-only">50% Complete</span>
                                        </div>
                                    </div>

                                </a>
                            </li>
                            <li class="external">
                                <a href="#">See All Tasks</a>
                            </li>
                        </ul>
                    </li>
                    <!-- task notificatoin end -->
                    <!-- inbox notificatoin start-->
                    <li id="mail_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <i class="icon-envelope-l"></i>
                            <span class="badge bg-important">5</span>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 5 new messages</p>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo">
                                        <img alt="avatar" src="img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
                                    <span class="subject">
                                        <span class="from">Greg  Martin</span>
                                        <span class="time">1 min</span>
                                    </span>
                                    <span>I really like this admin panel.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo">
                                        <img alt="avatar" src="img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
                                    <span class="subject">
                                        <span class="from">Bob   Mckenzie</span>
                                        <span class="time">5 mins</span>
                                    </span>
                                    <span>Hi, What is next project plan?
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo">
                                        <img alt="avatar" src="img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
                                    <span class="subject">
                                        <span class="from">Phillip   Park</span>
                                        <span class="time">2 hrs</span>
                                    </span>
                                    <span>I am like to buy this Admin Template.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo">
                                        <img alt="avatar" src="img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
                                    <span class="subject">
                                        <span class="from">Ray   Munoz</span>
                                        <span class="time">1 day</span>
                                    </span>
                                    <span>Icon fonts are great.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">See all messages</a>
                            </li>
                        </ul>
                    </li>
                    <!-- inbox notificatoin end -->
                    <!-- alert notification start-->
                    <li id="alert_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">

                            <i class="icon-bell-l"></i>
                            <span class="badge bg-important">7</span>
                        </a>
                        <ul class="dropdown-menu extended notification">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 4 new notifications</p>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-primary"><i class="icon_profile"></i></span>
                                    Friend Request
                                    <span class="small italic pull-right">5 mins</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-warning"><i class="icon_pin"></i></span>
                                    John location.
                                    <span class="small italic pull-right">50 mins</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-danger"><i class="icon_book_alt"></i></span>
                                    Project 3 Completed.
                                    <span class="small italic pull-right">1 hr</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-success"><i class="icon_like"></i></span>
                                    Mick appreciated your work.
                                    <span class="small italic pull-right">Today</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">See all notifications</a>
                            </li>
                        </ul>
                    </li>
                    <!-- alert notification end-->
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                <img alt="" src="/img/msa_logo-280x280.jpg" width="35" height="35">
                            </span>
                            <span class="username">MSA</span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <li class="eborder-top">
                                <a href="dashboard_dev.html"><i class="icon_profile"></i>My Profile</a>
                            </li>
                            <!--<li>
                                <a href="#"><i class="icon_mail_alt"></i> My Inbox</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon_clock_alt"></i> Timeline</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon_chat_alt"></i> Chats</a>
                            </li>-->
                            <li>
                                <a href="login.html"><i class="icon_key_alt"></i>Log Out</a>
                            </li>
                            <!-- <li>
                                <a href="documentation.html"><i class="icon_key_alt"></i> Documentation</a>
                            </li>
                            <li>
                                <a href="documentation.html"><i class="icon_key_alt"></i> Documentation</a>
                            </li>-->
                        </ul>
                    </li>
                    <!-- user login dropdown end -->
                </ul>
                <!-- notificatoin dropdown end-->
            </div>



        </header>
        <!--header end-->

        <!--sidebar start-->

        <!--sidebar end-->

        <!--main content start-->
        <section id="main-content">
            <section class="wrapper">

                <!-- Quiz Description -->
                <div class="row">
                    <div class="">
                        <!--Quiz start-->
                        <section class="panel">
                            <div class="panel-body project-team" style="background-color: #f9f9f9;">
                                <div class="task-progress col-md-offset-2">
                                    <h1 style="margin-left: 0em; font-size: 4em; font-weight: lighter;">Setup Profile : Location Details</h1>
                                </div>
                            </div>

                            <div class="offset-to-mid">
                                <!--<div class="row margin-top">
                            	
                            	<div class="pull-left col-lg-4" style="padding-left:0px;">
                        			<h1 class="h4 cust-h">Question 1 of 40</h1>
                                </div>
                            	<div class="pull-right col-lg-4">
                        			<h1 class="h4 cust-h pull-right">Time Remaining: 01:00</h1>
                                </div>
                            </div>-->
                                <div class="row margin-top-more">
                                    <!--<h1 class="h3 cust-h">Which of the following can you NOT do with Photoshop?</h1>-->
                                    <div class="col-md-offset-5" style="padding-top: 1em;">
                                        <img src="/img/msa_logo-280x280.jpg" class="img-responsive img-thumbnail" style="display: inline; border: 3px solid rgba(0,0,0,0.1);" alt="Bird" width="130px" height="130px">
                                        
                                    </div>
                                    <div class="col-md-offset-4" style="padding-top: 1em; padding-left:3.5em;">
                                    <h1 class="h3 cust-h hidden-xs" style="margin: 1;"><%: Model.tbUser.firstName %> <%: Model.tbUser.lastName %></h1></div>
                                    <!--<div class="col-md-7">
                                	<h1 class="h3 cust-h hidden-xs" style="margin:0;">Sohail Anwar</h1>
                                	<h1 class="h3 cust-h margin-top visible-xs">Sohail Anwar</h1>
                                	<h1 class="h4 cust-h" style="margin-bottom:0;">Environment Artist / Web Designer / Graphic Designer</h1>
                                	<h1 class="h4 cust-h">Karachi, Pakistan</h1>
                                </div>
                                <div class="col-md-3">
                                	<h1 class="h3 cust-h" style="margin:0;">$30.33/hr</h1>
                                	<h1 class="h4 cust-h" style="margin-bottom:0;">Availability</h1>
                                	<h1 class="h5 cust-h">More than 30 hrs/week</h1>
                                    
                                	<h1 class="h4 cust-h" style="margin-bottom:0;">Languages</h1>
                                	<h1 class="h5 cust-h">English: Conversational Self-Assessed</h1>
                                </div>-->
                                </div>
                                <form class="form-validate form-horizontal " id="register_form" method="post" action="<%: Url.Action("locDetails", "Developer") %>">
                                    <div class="form">
                                        <div class="row margin-top-more">
                                            <div class="form-group ">
                                                <div class="col-md-12">
                                                    <h1 class="h3 cust-h">Country</h1>
                                                    <%: Html.TextBoxFor(model => model.tbUser.country, new { @class = "form-control"})%>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <div class="col-md-12">
                                                    <h1 class="h3 cust-h">State</h1>
                                                    <%: Html.TextBoxFor(model => model.tbUser.state , new { @class = "form-control"})%>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <div class="col-md-12">
                                                    <h1 class="h3 cust-h">City</h1>
                                                    <%: Html.TextBoxFor(model => model.tbUser.city, new { @class = "form-control"})%>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <div class="col-md-12">
                                                    <h1 class="h3 cust-h">Address</h1>
                                                    <%: Html.TextBoxFor(model => model.tbUser.address, new { @class = "form-control"})%>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <div class="col-md-12">
                                                    <h1 class="h3 cust-h">Contact Number</h1>
                                                    <%: Html.TextBoxFor(model => model.tbUser.contactNumber, new { @class = "form-control"})%>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <div class="col-md-12">
                                                    <h1 class="h3 cust-h">Postal Code</h1>
                                                    <%: Html.TextBoxFor(model => model.tbUser.postalCode, new { @class = "form-control"})%>
                                                </div>
                                            </div>

                                            <input type="hidden" id="usID" name="usID" value="<%:Model.tbUser.userID %>"/>

                                        </div>
                                         <div class="form-group pull-right" style="width:300px; padding-top:3%;">
                                          <%--<div class="col-lg-offset-2 col-lg-10">--%>
                                              <button class="btn btn-primary" type="submit" style="width:120px;">Proceed</button>
                                              
                                          <%--</div>--%>
                                      </div>
                                    </div>
                                </form>

                            </div>
                        </section>
                        <!--Quiz end-->
                    </div>


                </div>
                <!-- Quiz Description end -->

            </section>
        </section>
        <!--main content end-->
    </section>
    <!-- container section start -->
    <div class="container-fluid footer-fix" id="footer"style="padding-top:10%;">
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
    <!-- javascripts -->
    <!--
    <script src="js/jquery.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>-->
    <script src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui-1.9.2.custom.min.js"></script>
    <!-- bootstrap -->
    <script src="/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="/js/jquery.scrollTo.min.js"></script>
    <script src="/js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- charts scripts -->
    <script src="/assets/jquery-knob/js/jquery.knob.js"></script>
    <!--<script src="js/jquery.sparkline.js" type="text/javascript"></script>
    <script src="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
    <script src="js/owl.carousel.js" ></script>-->
    <!-- jQuery full calendar 
    <script src="assets/fullcalendar/fullcalendar/fullcalendar.min.js"></script>-->
    <!--script for this page only
    <script src="js/calendar-custom.js"></script>-->
    <!-- custom select 
    <script src="js/jquery.customSelect.min.js" ></script>-->
    <!--custome script for all page-->
    <script src="/js/scripts.js"></script>
    <!-- custom script for this page
    <script src="js/sparkline-chart.js"></script>
    <script src="js/easy-pie-chart.js"></script>-->

    <script>

        //knob
        $(function () {
            $(".knob").knob({
                'draw': function () {
                    $(this.i).val(this.cv + '%')
                }
            })
        });

        //carousel
        $(document).ready(function () {
            $("#owl-slider").owlCarousel({
                navigation: true,
                slideSpeed: 300,
                paginationSpeed: 400,
                singleItem: true

            });
        });

        //custom select box

        $(function () {
            $('select.styled').customSelect();
        });

    </script>

</body>
</html>
