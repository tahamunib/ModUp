<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Modupv1.tbUser>" %>

<!DOCTYPE html >

<html lang="en" ng-app="store">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Modup Dashboard">
    <meta name="author" content="Modup">
    <meta name="keyword" content="modup, dashboard">
    <link rel="shortcut icon" href="/img/favicon.png"/>

    <title>Developer Home</title>

    <!-- Bootstrap CSS -->    
    <link href="/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- bootstrap theme -->
    <link href="/css/bootstrap-theme.css" rel="stylesheet"/>
    <!--external css-->
    <!-- font icon -->
    <link href="/css/elegant-icons-style.css" rel="stylesheet" />
    <link href="/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />    
    <!-- full calendar css-->
    <link href="/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
    <!-- easy pie chart-->
    <link href="/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <!-- owl carousel -->
    <link rel="stylesheet" href="/css/owl.carousel.css" type="text/css"/>

    <!-- Custom styles -->
    <link href="/web-css/dashboard_pm.css" rel="stylesheet"/>
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
            <a href="index.html" class="logo"><img src="../../web-img/modup_256.png" alt="" width="80" height="36" /></a>
            <!--logo end-->

            <div class="nav search-row" id="top_menu">
                <!--  search form start -->
                <ul class="nav top-menu">                    
                    <li>
                        <form class="navbar-form">
                            <input class="form-control" placeholder="Search" type="text">
                        </form>
                    </li>                    
                </ul>
                <!--  search form end -->                
            </div>

            <div class="top-nav notification-row">                
                <!-- notificatoin dropdown start-->
                <ul class="nav pull-right top-menu">
                	
                    <!-- task notificatoin start -->
                    <li id="task_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="icon-task-l"></span>
                            <%--<span class="badge bg-important">5</span>--%>
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
                                        <div class="progress-bar"  role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
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
                           <%-- <span class="badge bg-important">5</span>--%>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 5 new messages</p>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="../../img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
                                    <span class="subject">
                                    <span class="from">Greg  Martin</span>
                                    <span class="time">1 min</span>
                                    </span>
                                    <span>
                                        I really like this admin panel.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="/img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
                                    <span class="subject">
                                    <span class="from">Bob   Mckenzie</span>
                                    <span class="time">5 mins</span>
                                    </span>
                                    <span>
                                     Hi, What is next project plan?
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="/img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
                                    <span class="subject">
                                    <span class="from">Phillip   Park</span>
                                    <span class="time">2 hrs</span>
                                    </span>
                                    <span>
                                        I am like to buy this Admin Template.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="/img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
                                    <span class="subject">
                                    <span class="from">Ray   Munoz</span>
                                    <span class="time">1 day</span>
                                    </span>
                                    <span>
                                        Icon fonts are great.
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
                            <%--<span class="badge bg-important">7</span>--%>
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
                                    <span class="small italic pull-right"> Today</span>
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
                                <img alt=""  src="/img/birds-of-paradise-sq.jpg" width="35" height="35">
                            </span>
                            <span class="username"><%:Model.firstName %> <%:Model.lastName %> </span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <li class="eborder-top">
                                <a href="#"><i class="icon_profile"></i> My Profile</a>
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
                                <a href=" <%:@Url.Action("LogOff", "Account")%>"><i class="icon_key_alt"></i> Log Out</a>
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
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">                
                  <li class="active">
                      <a class="" href="<%:@Url.Action("Home", "Developer")%>">
                          <i class="icon_house_alt"></i>
                          <span>Home</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_desktop"></i>
                          <span>Notifications</span>
                          <!--<span class="menu-arrow arrow_carrot-right"></span>-->
                      </a><!--
                      <ul class="sub">
                          <li><a class="" href="general.html">General</a></li>
                          <li><a class="" href="buttons.html">Buttons</a></li>
                          <li><a class="" href="grids.html">Grids</a></li>
                      </ul>-->
                  </li>
                  <li>
                      <a class="" href="#">
                          <i class="icon_genius"></i>
                          <span>Invites</span>
                      </a>
                  </li>
                  <li class="sub-menu">                     
                      <a href="#" class="">
                          <i class="icon_piechart"></i>
                          <span>Submissions</span>
                      </a>                  
                  </li>
                 
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_document_alt"></i>
                          <span>Messages</span>
                          <!--<span class="menu-arrow arrow_carrot-right"></span>-->
                      </a><!--
                      <ul class="sub">
                          <li><a class="" href="form_component.html">Form Components</a></li>                          
                          <li><a class="" href="form_validation.html">Form Validation</a></li>
                      </ul>-->
                  </li>                  
                  <li class="sub-menu">
                      <a href="#" class="">
                          <i class="icon_table"></i>
                          <span>Watchlist</span>
                          <!--<span class="menu-arrow arrow_carrot-right"></span>-->
                      </a><!--
                      <ul class="sub">
                          <li><a class="" href="basic_table.html">Basic Table</a></li>
                      </ul>-->
                  </li>
                  
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_documents_alt"></i>
                          <span>My Profile</span>
                          <!--<span class="menu-arrow arrow_carrot-right"></span>-->
                      </a><!--
                      <ul class="sub">                          
                          <li><a class="" href="profile.html">Profile</a></li>
                          <li><a class="" href="login.html"><span>Login Page</span></a></li>
                          <li><a class="" href="blank.html">Blank Page</a></li>
                          <li><a class="" href="404.html">404 Error</a></li>
                      </ul>-->
                  </li>
                  <li class="sub-menu">
                      <a href="<%:@Url.Action("Browse", "Developer")%>" class="">
                          <i class="glyphicon glyphicon-globe"></i>
                          <span>Browse</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      
                  </li>
                  
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">            
              <!--overview start-->
              <div class="row state-overview">
                  <div class="col-lg-4">
                  <!--user profile info start-->
                  <section class="panel">
                      <div class="profile-widget profile-widget-info">
                          <div class="panel-body">
                            <div class="col-lg-4 col-sm-4 profile-widget-name">
                              <h4><%:Model.firstName %> <%:Model.lastName %></h4>               
                              <div class="follow-ava">
                                  <img src="/img/birds-of-paradise-sq.jpg" alt="">
                              </div>
                            </div>
                            <div class="col-lg-8 col-sm-8 follow-info">
                                <p>Welcome back <%:Model.firstName %>, Please check your pending work.</p>
                                
                                <h6>
                                    <span><i class="icon_clock_alt"></i><%:System.DateTime.Now.ToString("hh:mm") %></span>
                                    <span><i class="icon_calendar"></i><%:System.DateTime.Now.ToString("dd:mm:yyyy") %></span>
                                </h6>
                                <h6 style="margin-top:7px;">
                                    <span><i class="icon_pin_alt"></i><%:Model.country %></span>
                                </h6>
                            </div>
                            <div class="weather-category twt-category">
                                      <ul>
                                          <li class="active">
                                              <h4>0</h4>
                                              <i class="icon_close_alt2"></i> Pending Task
                                          </li>
                                          <li>
                                              <h4>0</h4>
                                              <i class="icon_check_alt2"></i> Completed
                                          </li>
                                          <li>
                                              <h4>0</h4>
                                              <i class="icon_plus_alt2"></i> Total Task
                                          </li>
                                      </ul>
                                  </div>
                          </div>
                          <!--<footer class="profile-widget-foot">
                            <div class="follow-task">
                                <span>
                                <a href="">
                                    <i class="icon_mail_alt tooltips" data-original-title="My Mail"></i>
                                    <span class="badge bg-important">4</span>
                                </a>
                                </span>
                                <span>
                                <a href="">
                                    <i class="icon_percent tooltips" data-original-title="My Profit"></i>                                                                       </a>
                                </span>
                                <span>
                                <a href="">
                                    <i class="icon_heart_alt tooltips" data-original-title="Favorits"></i>                                    
                                    <span class="badge bg-important">2</span>
                                </a>
                                </span>
                                <span>
                                <a href="">
                                    <i class="icon_cart_alt tooltips" data-original-title="Sell"></i>                                    
                                </a>
                                </span>
                                <span>
                                <a href="">
                                    <i class="icon_lightbulb_alt tooltips" data-original-title="Suggesation"></i>                                    
                                    <span class="badge bg-important">6</span>
                                </a>
                                </span>
                                <span>
                                <a href="">
                                    <i class="icon_piechart tooltips" data-original-title="Reports"></i>                                    
                                </a>
                                </span>
                                
                            </div>
                          </footer>-->
                      </div>
                  </section>
                  <!--user profile info end-->
                </div>
                <!-- statics start -->
                <div class="state col-lg-8">
                    <!--<div class="row">
                      <div class="col-lg-3 col-sm-6">
                          <section class="panel">
                              <div class="symbol">
                                  <i class="icon_globe"></i>
                              </div>
                              <div class="value">
                                  <h1>#175</h1>
                                  <p>Rank</p>
                              </div>
                          </section>
                      </div>
                      <div class="col-lg-3 col-sm-6">
                          <section class="panel">
                              <div class="symbol">
                                  <i class="icon_tags_alt"></i>
                              </div>
                              <div class="value">
                                  <h1>100%</h1>
                                  <p>Feedback</p>
                              </div>
                          </section>
                      </div>
                      <div class="col-lg-3 col-sm-6">
                          <section class="panel">
                              <div class="symbol">
                                  <i class="icon_cart_alt"></i>
                              </div>
                              <div class="value">
                                  <h1>25</h1>
                                  <p>Submissions</p>
                              </div>
                          </section>
                      </div>
                      <div class="col-lg-3 col-sm-6">
                          <section class="panel">
                              <div class="symbol">
                                  <i class="icon_currency"></i>
                              </div>
                              <div class="value">
                                  <h1>$0.00</h1>
                                  <p>Earnings</p>
                              </div>
                          </section>
                      </div>
                    </div>-->
                    <div class="row">
                      
                      <div class="col-lg-3 col-sm-6">
                          <section class="panel">
                              <div class="symbol">
                                  <i class="icon_tags_alt"></i>
                              </div>
                              <div class="value">
                                  <h1>0%</h1>
                                  <p>Feedback</p>
                              </div>
                          </section>
                      </div>
                      <div class="col-lg-3 col-sm-6">
                          <section class="panel">
                              <div class="symbol">
                                  <i class="icon_cart_alt"></i>
                              </div>
                              <div class="value">
                                  <h1>0</h1>
                                  <p>Submissions</p>
                              </div>
                          </section>
                      </div>
                      <div class="col-lg-3 col-sm-6">
                          <section class="panel">
                              <div class="symbol">
                                  <i class="icon_currency"></i>
                              </div>
                              <div class="value">
                                  <h1>$0.00</h1>
                                  <p>Earnings</p>
                              </div>
                          </section>
                      </div>
                    </div>
                    <div class="row ">
                        <div class="col-lg-12">
                            <div class="panel">
                                <div class="panel-body" style="margin-left:.8em; margin-right:.8em;">
                                    <div class="task-progress">
                                              <h1 style="margin-top:0.7em;">Setup your account</h1>  
                                    </div><br /><br /><br />
                                	<div class="progress">
                                          <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar"
                                          aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:50%;">
                                            50% Complete
                                          </div>
                                     </div>
                                     <div class="user-profile-progress-suggestion">Add your phone number (+4%)</div>
                                     <br />
                                      <!--<ul class="summary-list">
                                          <li>
                                              <a href="javascript:;">
                                                  <input class="knob" data-readonly="true" data-width="80" data-height="80" data-displayPrevious=true  data-thickness=".1" value="75" data-fgColor="#C53A51" data-bgColor="#F7F7F7">
                                                  <p><i class="icon_currency"></i> Sell</p>
                                              </a>
                                          </li>
                                          <li>
                                              <a href="javascript:;">
                                                  <input class="knob" data-readonly="true" data-width="80" data-height="80" data-displayPrevious=true  data-thickness=".1" value="25" data-fgColor="#34AADC" data-bgColor="#F7F7F7">
                                                  <p><i class="icon_cart_alt"></i> Purchase</p>
                                              </a>
                                          </li>
                                          <li>
                                              <a href="javascript:;">
                                                  <input class="knob" data-readonly="true" data-width="80" data-height="80" data-displayPrevious=true  data-thickness=".1" value="85" data-fgColor="#FF2D55" data-bgColor="#F7F7F7">
                                                  <p><i class="icon_easel"></i> Bounce Rate</p>
                                              </a>
                                          </li>
                                          <li>
                                              <a href="javascript:;">
                                                  <input class="knob" data-readonly="true" data-width="80" data-height="80" data-displayPrevious=true  data-thickness=".1" value="95" data-fgColor="#34AADC" data-bgColor="#F7F7F7">
                                                  <p><i class="icon_datareport"></i> New Visits</p>
                                              </a>
                                          </li>
                                          <li>
                                              <a href="javascript:;">
                                                  <input class="knob" data-readonly="true" data-width="80" data-height="80" data-displayPrevious=true  data-thickness=".1" value="65" data-fgColor="#C53A51" data-bgColor="#F7F7F7">
                                                  <p><i class="icon_search"></i> Search Traffic</p>
                                              </a>
                                          </li>
                                      </ul>-->
                                  </div>                                
                            </div>
                        </div>                        
                    </div>
                </div>    
                <!-- statics end -->
              </div>
              <!--overview end-->

              <!-- project team & activity start -->
              <div class="row">
                  <div class="col-lg-12">
                      <!--project team start-->
                      <section class="panel">
                        <div class="panel-body project-team">
                            <div class="task-progress">
                                  <h1>Projects</h1>  
                            </div>
                        </div>
                        <table class="table table-hover personal-task">
                              <tbody>
                                 <tr>
                                      
                                      <td><h4>Project Title</h4></td>
                                     <td><h4>Module</h4></td>
                                     <td><h4>Deadline</h4></td>
                                     <td><h4>Status</h4></td>
                                  </tr> 


                              <tr>
                                  <%--<td>
                                    <span class="profile-ava">
                                        <img alt="" class="simple" src="/img/birds-of-paradise-sq.jpg" width="40" height="40">
                                    </span>
                                  </td>--%>
                                  <td>
                                      
                                     <a class="" href="#"><p class="profile-name">Asp Website</p></a> 
                                      
                                  </td>
                                  <td>
                                      <p class="profile-name">UI</p>
                                      
                                  </td>
                                  <td>
                                      <p class="profile-name">20-12-2015</p>
                                      
                                  </td>
                                  <td>
                                      <p class="profile-name">Working</p>
                                      
                                  </td>
                                  
                                 <%-- <td>
                                      <span class="badge bg-success">75%</span>
                                  </td>--%>
                              </tr>
                                   <tr>
                                  <%--<td>
                                    <span class="profile-ava">
                                        <img alt="" class="simple" src="/img/birds-of-paradise-sq.jpg" width="40" height="40">
                                    </span>
                                  </td>--%>
                                  <td>
                                      
                                     <a class="" href="#"><p class="profile-name">Matlab Application</p></a> 
                                      
                                  </td>
                                  <td>
                                      <p class="profile-name">Network training</p>
                                      
                                  </td>
                                  <td>
                                      <p class="profile-name">29-12-2015</p>
                                      
                                  </td>
                                  <td>
                                      <p class="profile-name">Working</p>
                                      
                                  </td>
                                  
                                 <%-- <td>
                                      <span class="badge bg-success">75%</span>
                                  </td>--%>
                              </tr>



                             <%-- <tr>
                                  <td>
                                    <span class="profile-ava">
                                        <img alt="" class="simple" src="/img/birds-of-paradise-sq.jpg" width="40" height="40">
                                    </span>
                                  </td>
                                  <td>
                                      <p class="profile-name">Strategy Game</p>
                                      <p class="profile-occupation">Modeling & Texturing / UI Designing / VFX / Programming</p>
                                  </td>
                                  <td>
                                      <span class="badge bg-important">43%</span>
                                  </td>                                  
                              </tr>
                              <tr>
                                  <td>
                                    <span class="profile-ava">
                                        <img alt="" class="simple" src="/img/birds-of-paradise-sq.jpg" width="40" height="40">
                                    </span>
                                  </td>
                                  <td>
                                      <p class="profile-name">Shooter Game</p>
                                      <p class="profile-occupation">Modeling & Texturing / UI Designing / VFX / Programming</p>
                                  </td>
                                  <td>
                                      <span class="badge bg-info">67%</span>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                    <span class="profile-ava">
                                        <img alt="" class="simple" src="/img/birds-of-paradise-sq.jpg" width="40" height="40">
                                    </span>
                                  </td>
                                  <td>
                                      <p class="profile-name">Ufone</p>
                                      <p class="profile-occupation">UX Designer / UI Designer / PHP / MYSQL</p>
                                  </td>
                                  <td>
                                      <span class="badge bg-warning">30%</span>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                    <span class="profile-ava">
                                        <img alt="" class="simple" src="/img/birds-of-paradise-sq.jpg" width="40" height="40">
                                    </span>
                                  </td>
                                  <td>
                                      <p class="profile-name">Walmart</p>
                                      <p class="profile-occupation">UX Designer / UI Designer / PHP / MYSQL</p>
                                  </td>
                                  <td>
                                      <span class="badge bg-primary">15%</span>
                                  </td>
                              </tr>--%>
                              </tbody>
                          </table>
                      </section>
                      <!--Project Team end-->
                  </div>

             <%--     <div class="col-lg-8">
                      <!--Project Activity start-->
                      <section class="panel">
                          <div class="panel-body progress-panel">
                            <div class="row">
                              <div class="col-lg-8 task-progress pull-left" style="margin-bottom:11px;">
                                  <h1>Modules </h1>                                  
                              </div>
                              <!--<div class="col-lg-4">
                                <span class="profile-ava pull-right">
                                        <img alt="" class="simple" src="img/birds-of-paradise-sq.jpg" width="40" height="40">
                                        MSA
                                </span>                                
                              </div>-->
                            </div>



                          </div>
                          <table class="table table-hover personal-task">
                              <tbody>
                                  <tr>
                                      <td><h4>Closing Date</h4></td>
                                      <td><h4>Module Name</h4></td>
                                      <td><h4>Project Name</h4></td>
                                  </tr>

<% foreach (var item in Model.tbModule){ %>

                              <tr>
                                  <td><%: item.closeDate %></td>
                                  <td>
                                      <%: item.title %>
                                  </td>
                                  <td>
                                      <% Modupv1.dbModupContext db = new Modupv1.dbModupContext();
                                         var query1 = from a in db.tbProjects where a.projID.Equals(item.projID) select a;
                                         var res1 = query1.FirstOrDefault();
                                          %>
                                      <%: res1.title %>
                                  </td>
                                  <%--<td>
                                      <span class="badge bg-important">Upload</span>
                                  </td>
                                  
                              </tr>




                             <%-- <tr>
                                  <td>Yesterday</td>
                                  <td>
                                      Project Design Task
                                  </td>
                                  <td>
                                      <span class="badge bg-success">Task</span>
                                  </td>
                                  <td>
                                      <!--<div id="work-progress2"></div>-->
                                    <span class="profile-ava">
                                        <img alt="" class="simple" src="/img/birds-of-paradise-sq.jpg" width="40" height="40">
                                    </span>
                                  </td>
                              </tr>
                              <tr>
                                  <td>21.10.13</td>
                                  <td>
                                      Generate Invoice
                                  </td>
                                  <td>
                                      <span class="badge bg-success">Task</span>
                                  </td>
                                  <td>
                                      <!--<div id="work-progress3"></div>-->
                                    <span class="profile-ava">
                                        <img alt="" class="simple" src="img/birds-of-paradise-sq.jpg" width="40" height="40">
                                    </span>
                                  </td>
                              </tr>                              
                              <tr>
                                  <td>22.10.13</td>
                                  <td>
                                      Project Testing
                                  </td>
                                  <td>
                                      <span class="badge bg-primary">To-Do</span>
                                  </td>
                                  <td>
                                      <span class="profile-ava">
                                        <img alt="" class="simple" src="/img/birds-of-paradise-sq.jpg" width="40" height="40">
                                      </span>
                                  </td>
                              </tr>
                              <tr>
                                  <td>24.10.13</td>
                                  <td>
                                      Project Release Date
                                  </td>
                                  <td>
                                      <span class="badge bg-info">Milestone</span>
                                  </td>
                                  <td>
                                      <!--<div id="work-progress4"></div>-->
                                    <span class="profile-ava">
                                        <img alt="" class="simple" src="/img/birds-of-paradise-sq.jpg" width="40" height="40">
                                    </span>
                                  </td>
                              </tr>                              
                              <tr>
                                  <td>28.10.13</td>
                                  <td>
                                      Project Release Date
                                  </td>
                                  <td>
                                      <span class="badge bg-primary">To-Do</span>
                                  </td>
                                  <td>
                                      <!--<div id="work-progress5"></div>-->
                                    <span class="profile-ava">
                                        <img alt="" class="simple" src="/img/birds-of-paradise-sq.jpg" width="40" height="40">
                                    </span>
                                  </td>
                              </tr>
                              </tbody>
                          </table>
                      </section>
                      <!--Project Activity end-->
                  </div>--%>
              </div>
              <!-- project team & activity end -->

          </section>
      </section>
      <!--main content end-->
  </section>
  <!-- container section start -->

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
