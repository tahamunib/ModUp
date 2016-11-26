<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.moduleViewModel>" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Modup Dashboard">
    <meta name="author" content="Modup">
    <meta name="keyword" content="modup, dashboard">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Project Breakup</title>

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
    <link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <!-- Custom styles -->
    <link href="/web-css/submitModules_pm.css" rel="stylesheet">
    <link href="/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->



    <script type="text/javascript">
        $(document).ready(function () {
            //Jquery code here

            document.getElementById('close').onclick = function () {
                this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode
                .removeChild();
                return false;
            };
        });
    </script>

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
                            <%-- <span class="badge bg-important">5</span>--%>
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
                            <%--<span class="badge bg-important">5</span--%>>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 5 new messages</p>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo">
                                        <img alt="avatar" src="/img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
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
                                        <img alt="avatar" src="/img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
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
                                        <img alt="avatar" src="/img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
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
                                        <img alt="avatar" src="/img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
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
                                <img alt="" src="/img/birds-of-paradise-sq.jpg" width="35" height="35">
                            </span>
                            <span class="username"><%  Modupv1.dbModupContext db = new Modupv1.dbModupContext();
                                                       var queryU = from a in db.tbUserCredentials where a.username.Contains(WebMatrix.WebData.WebSecurity.CurrentUserName) select a.userID;
                                                       var cUserID = queryU.FirstOrDefault();

                                                       var queryUn = from a in db.tbUsers where a.userID.Equals(cUserID) select a;
                                                       var cUsern = queryUn.FirstOrDefault(); 
            
                            %><%: cUsern.firstName %><%: cUsern.lastName %></span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <li class="eborder-top">
                                <a href="<%:@Url.Action("profileDev", "Developer")%>"><i class="icon_profile"></i>My Profile</a>
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
                                <a href="<%:@Url.Action("LogOff", "Account")%>"><i class="icon_key_alt"></i>Log Out</a>
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
            <div id="sidebar" class="nav-collapse ">
                <!-- sidebar menu start-->
                <ul class="sidebar-menu">
                    <li class="active">
                        <a class="" href="<%:@Url.Action("Home", "PM")%>">
                            <i class="icon_house_alt"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="sub-menu">
                        <a href="javascript:;" class="">
                            <i class="icon_desktop"></i>
                            <span>Notifications</span>
                            <!--<span class="menu-arrow arrow_carrot-right"></span>-->
                        </a>
                        <!--
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
                        <a href="<%:@Url.Action("initiateProj", "PM")%>" class="">
                            <i class="icon_piechart"></i>
                            <span>Project</span>
                        </a>
                    </li>
                    <li class="sub-menu">
                        <a href="#" class="">
                            <i class="icon_piechart"></i>
                            <span>Modules</span>
                        </a>
                    </li>
                    <li class="sub-menu">
                        <a href="javascript:;" class="">
                            <i class="icon_document_alt"></i>
                            <span>Messages</span>
                            <!--<span class="menu-arrow arrow_carrot-right"></span>-->
                        </a>
                        <!--
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
                        </a>
                        <!--
                      <ul class="sub">
                          <li><a class="" href="basic_table.html">Basic Table</a></li>
                      </ul>-->
                    </li>

                    <li class="sub-menu">
                        <a href="#" class="">
                            <i class="icon_documents_alt"></i>
                            <span>My Profile</span>
                            <!--<span class="menu-arrow arrow_carrot-right"></span>-->
                        </a>
                        <!--
                      <ul class="sub">                          
                          <li><a class="" href="profile.html">Profile</a></li>
                          <li><a class="" href="login.html"><span>Login Page</span></a></li>
                          <li><a class="" href="blank.html">Blank Page</a></li>
                          <li><a class="" href="404.html">404 Error</a></li>
                      </ul>-->
                    </li>
                    <li class="sub-menu">
                        <a href="javascript:;" class="">
                            <i class="glyphicon glyphicon-globe"></i>
                            <span>Browse</span>
                            <span class="menu-arrow arrow_carrot-right"></span>
                        </a>
                        <ul class="sub">
                            <li><a class="" href="#">Category</a></li>
                            <li><a class="" href="#"><span>Developers</span></a></li>
                            <li><a class="" href="#">Jobs</a></li>
                        </ul>
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

                    <!-- statics start -->
                    <div class="state col-lg-12">
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

                        <% int no = Convert.ToInt16(ViewBag.no);
                           int prjID = Convert.ToInt16(ViewBag.projID);
                           int noMod = Convert.ToInt16(ViewBag.noMod);
                        %>

                        <form class="form-validate form-horizontal " id="register_form" method="post" enctype="multipart/form-data" action="<%: Url.Action("modulesBreak", "PM") %>">


                            <% for (int i = 0; i < no; i++)
                               { %>

                            <!-- Start Of Modules Breakup Form-->

                            <div class="row">
                                <div class="col-lg-12">
                                    <section class="panel" style="padding-bottom: 3%; margin-bottom: 3%;">
                                        <header class="panel-heading" style="padding-bottom: 3%; margin-bottom: 3%;">
                                            Module <%: noMod %>

                                            <div class="btn-group pull-right">

                                                <a class="btn btn-danger" id="close" href="#"><i class="icon_close_alt2"></i></a>
                                            </div>
                                        </header>
                                        <div class="panel-body">
                                            <div class="form">

                                                <div class="form-group ">
                                                    <label for="fullname" class="control-label col-lg-2">Name Of Module: <span class="required">*</span></label>
                                                    <div class="col-lg-10">
                                                        <%-- <input class=" form-control" id="fullname" name="fullname" type="text" />--%>
                                                        <%: Html.TextBoxFor(model => model.tbModule[i].title, new { @class = "form-control"})%>
                                                        <%: Html.ValidationMessageFor(model => model.tbModule[i].title) %>
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="address" class="control-label col-lg-2">Estimated Amount: <span class="required">*</span></label>
                                                    <div class="col-lg-10">
                                                        <%--<input class=" form-control" id="address" name="address" type="text" />--%>
                                                        <%: Html.TextBoxFor(model => model.tbModule[i].budget, new { @class = "form-control"}) %>
                                                        <%-- <%: Html.ValidationMessageFor(model => model[i].budget) %>--%>
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="username" class="control-label col-lg-2">Description <span class="required">*</span></label>
                                                    <div class="col-lg-10">
                                                        <%--<textarea class="form-control" rows="5" id="comment"></textarea>--%>
                                                        <%: Html.TextAreaFor(model => model.tbModule[i].description, new { @class = "form-control", @rows = "5"}) %>
                                                        <%--<%: Html.ValidationMessageFor(model => model[i].description) %>--%>
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="username" class="control-label col-lg-2">Skill Required <span class="required">*</span></label>
                                                    <div class="col-lg-10">
                                                        <%--<textarea class="form-control" rows="5" id="comment"></textarea>--%>
                                                        <%: Html.TextBoxFor(model => model.tbModule[i].skillReq, new { @class = "form-control"}) %>
                                                        <%--<%: Html.ValidationMessageFor(model => model[i].description) %>--%>
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="confirm_password" class="control-label col-lg-2">Development Type <span class="required">*</span></label>
                                                    <div class="col-lg-10">
                                                 <%:
                   Html.DropDownListFor(model => model.tbModule[i].devType,new List<SelectListItem> { 
                       new SelectListItem { Value = "General Development" , Text = "General" },
                       new SelectListItem { Value = "Test Driven Development" , Text = "TDD" },
                      
                       
                    }, new { @class = "form-control"}
                  )%>
                                                        </div>
                                                    </div>
                                                <div class="form-group ">
                                                    <label for="file" class="control-label col-lg-2">Upload File:</label>
                                                    <div class="col-lg-10">
                                                        <%: Html.TextAreaFor(model => model.file, new { @class = "form-control", @type = "file"}) %>
                                                    </div>
                                                </div>
                                                <%--<div class="form-group ">
                                          <label for="password" class="control-label col-lg-2">Deadline <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <input class="form-control " id="username" name="username" type="text" />
                                              <%: Html.TextBoxFor(model => model.tbModule[i].closeDate, new { @class = "form-control"}) %>
                                               <%: Html.ValidationMessageFor(model => model[i].closeDate) %>
                                          </div>
                                      </div>--%>

                                                <div class="form-group">
                                                    <label for="dtp_input1" class="col-md-2 control-label">DateTime Picking: <span class="required">*</span></label>
                                                    <div class="input-group date form_datetime col-md-5" data-date="2016-01-18T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1" style="padding-left: 15px;">
                                                        <input class="form-control" size="16" type="text" value="" maxlength="0">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                                    </div>
                                                    <%: Html.TextBoxFor(model => model.tbModule[i].closeDate, new { @class = "form-control", @id = "dtp_input1", @type = "hidden"}) %><br />
                                                </div>

                                                <div class="form-group ">
                                                    <label for="confirm_password" class="control-label col-lg-2">Developer Skill Level: <span class="required">*</span></label>
                                                    <div class="col-lg-10">
                                                        <%--<input class="form-control " id="username" name="username" type="number" />--%>
                                                           <%:
                   Html.DropDownListFor(model => model.tbModule[i].devSkillLevel,new List<SelectListItem> { 
                       new SelectListItem { Value = "Beginner" , Text = "Beginner" },
                       new SelectListItem { Value = "Intermediate" , Text = "Intermediate" },
                       new SelectListItem { Value = "Expert" , Text = "Expert" },
                       
                    }, new { @class = "form-control"}
                  )%>

                                                        <%--<%: Html.ValidationMessageFor(model => model[i].devSkillLevel) %>--%>
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="confirm_password" class="control-label col-lg-2">Select Category: <span class="required">*</span></label>
                                                    <div class="col-lg-10">
                                                        <%--<input class="form-control " id="username" name="username" type="number" />--%>
                                                            <%:
                   Html.DropDownListFor(model => model.tbModule[i].category,new List<SelectListItem> { 
                       new SelectListItem { Value = "UI-HTML" , Text = "UI-HTML" },
                       new SelectListItem { Value = "Back End-Development" , Text = "Back End-Development" },
                       new SelectListItem { Value = "UI-Javascript" , Text = "UI-Javascript" },
                       new SelectListItem { Value = "Integration" , Text = "Integration" },
                       new SelectListItem { Value = "Back End-Database" , Text = "Back End-Database" },
                       new SelectListItem { Value = "Web API" , Text = "Web API" },
                       
                       
                    }, new { @class = "form-control"}
                  )%>

                                                        <%-- <%: Html.ValidationMessageFor(model => model[i].category) %>--%>
                                                    </div>
                                                </div>

                                                <input type="hidden" id="count" name="count" value="<%:no %>" />
                                                <input type="hidden" id="prj" name="prj" value="<%:prjID %>" />

                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                            <!-- End Of Modules Breakup Form-->


                            <%} %>
                            <div class="form-group pull-right" style="width: 300px; padding-top: 3%;">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <button class="btn btn-primary" type="submit">Submit</button>
                                    <button class="btn btn-default" type="button">Cancel</button>
                                </div>
                            </div>


                        </form>




                    </div>
                    <!-- statics end -->
                </div>
                <!--overview end-->

                <!-- project team & activity start -->

                <!-- project team & activity end -->

            </section>
        </section>
        <!--main content end-->
    </section>
    <!-- container section start -->

    <!-- javascripts -->
    <!--
    <script src="js/jquery.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>-->
    <script src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
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


    <script type="text/javascript" src="/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript">
        $('.form_datetime').datetimepicker({
            //language:  'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            showMeridian: 1
        });
        $('.form_date').datetimepicker({
            language: 'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('.form_time').datetimepicker({
            language: 'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 1,
            minView: 0,
            maxView: 1,
            forceParse: 0
        });
    </script>
</body>
</html>

