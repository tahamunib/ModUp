<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Modupv1.tbSkill>" %>
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
    <link href="/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <!-- owl carousel -->
    <link rel="stylesheet" href="/css/owl.carousel.css" type="text/css">

    <!-- Custom styles -->
<link href="/web-css/stylemain.css" rel="stylesheet" type="text/css">
    <link href="/web-css/dashboard_dev.css" rel="stylesheet">
    <link href="/web-css/quizToVerify_dev.css" rel="stylesheet">
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
            <a href="<%: Url.Action("Home","Developer") %>" class="logo"><img src="/web-img/modup_256.png" alt="" width="80" height="36" /></a>
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
                   
                    <!-- alert notification end-->
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                <img alt="" src="/img/msa_logo-280x280.jpg" width="35" height="35">
                            </span>
                            <span class="username"><%:Model.tbDeveloper.tbClient.tbUser.firstName %> <%:Model.tbDeveloper.tbClient.tbUser.lastName %></span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <li class="eborder-top">
                                <a href="#"><i class="icon_profile"></i>My Profile</a>
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
                          <a href="<%:@Url.Action("LogOff", "Account")%>"><i class="icon_key_alt"></i> Log Out</a>
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
                        <div class="panel-body project-team">
                            <div class="task-progress col-md-offset-2">
                                  <h1 style="margin-left:.3em; font-size:4em; font-weight:lighter;">Skill Test</h1>  
                            </div>
                        </div>
                        
                        <div class="padding-default offset-to-mid">
                        	<h1 class="h2 cust-h"><%: Model.name %></h1>
                            <p class="h4 cust-p">Read the Online Testing Policies and the instructions below prior to taking the test.<br /><br />

 	This test will cover the following topics:<br /><br />
 	The Skill Evaluation Test has been developed to provide an insight to the important concepts and techniques related to this skill. This test covers all the aspects of this technology and helps the Project Manager and Developer achieving their objectives through the system.</p>
                            <h1 class="h3 cust-h">Duration:</h1>
                            <p class="h4 cust-p">The test consists of 10 multiple choice questions and the duration is approximately 5-10 minutes.</p>
                            <h1 class="h3 cust-h">Instructions:</h1>
                            <ul>
                                <li class="h4 cust-p"><span class="glyphicon glyphicon-ok margin-right"></span>Each question has between 2 and 4 options. Only one answer is correct.</li>
                                <li class="h4 cust-p"><span class="glyphicon glyphicon-ok margin-right"></span>Attempt all questions since there are no penalties for incorrect answers.</li>
                                <li class="h4 cust-p"><span class="glyphicon glyphicon-ok margin-right"></span>Each question must be answered in the time limit shown at the top of the test window.</li>
                                <li class="h4 cust-p"><span class="glyphicon glyphicon-ok margin-right"></span>You must answer each question before proceeding to the next question. You will not be able to change an answer once you've moved to the next question.</li>
                                <%--<li class="h4 cust-p"><span class="glyphicon glyphicon-ok margin-right"></span>If you leave the test midway through your session, you can resume it where you left off by returning to this page.</li>--%>
                            </ul>
                            <br/>
                            <div class="row">
                                <div class="text-center pull-right">
                                    <% Session["sklID"] = ViewData["skillID"];%>
                                    <a href="<%:@Url.Action("quiz", "Developer", new { id="0"})%>">
                                       
                                       
                                        <button type="button" class="btn btn-danger cust-btn">Start Test</button>
                                    </a>
                                </div>
                            </div>
                            
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
<div class="container-fluid footer-fix" id="footer">
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
                    <p style="text-align:center;color:#fff;">Designed by <a href="http://www.sohailanwar.iblogger.org" style="color:#FF7F55;">MSA</a></p>
          </div>
    </div>
</div>
    <!-- javascripts --><!--
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
    <%--<script src="/assets/jquery-knob/js/jquery.knob.js"></script>--%>
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

  

  </body>
</html>

