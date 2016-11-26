<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.proposalViewModel>" %>
<%@ Import namespace="PagedList.Mvc" %>
<%@ Import namespace="PagedList" %>

<!DOCTYPE html>

<html>
 <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Modup Dashboard">
    <meta name="author" content="Modup">
    <meta name="keyword" content="modup, dashboard">
    <link rel="shortcut icon" href="/img/favicon.png">

    <title>Modup Dashboard</title>

    <!-- Bootstrap CSS -->    
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="/css/elegant-icons-style.css" rel="stylesheet" />
    <link href="/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />    

    <!-- Custom styles -->
<link href="/web-css/stylemain.css" rel="stylesheet" type="text/css">
    <link href="/web-css/dashboard_dev.css" rel="stylesheet">
    <link href="/web-css/modsDescription_dev.css" rel="stylesheet">
    <link href="/css/style-responsive.css" rel="stylesheet" />
     <link href="/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
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

     <script>
         function rateChange() {
             
             var bidAmount = document.getElementById("bid").value;
             var bidfee = bidAmount * 0.1;
             var paidAmount = bidAmount - bidfee;
             document.getElementById("fee").innerHTML = bidfee.toFixed(2);
             document.getElementById("paid").innerHTML = paidAmount.toFixed(2);
         }
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
            <a href="index.html" class="logo"><img src="/web-img/modup_256.png" alt="" width="80" height="36" /></a>
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
                            <%--<span class="badge bg-important">5</span>--%>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 5 new messages</p>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
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
                                    <span class="photo"><img alt="avatar" src="img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
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
                                    <span class="photo"><img alt="avatar" src="img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
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
                                    <span class="photo"><img alt="avatar" src="img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
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
                           <%-- <span class="badge bg-important">7</span>--%>
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
                                <img alt=""  src="/img/msa_logo-280x280.jpg" width="35" height="35">
                            </span>
                            <span class="username"><%  Modupv1.dbModupEntities db = new Modupv1.dbModupEntities();
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
                                <a href="<%:@Url.Action("profileDev", "Developer")%>"><i class="icon_profile"></i> My Profile</a>
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
       <aside>
            <div id="sidebar" class="nav-collapse ">
                <!-- sidebar menu start-->
                <ul class="sidebar-menu">
                    <li class="sub-menu">
                        <a class="" href="<%:@Url.Action("Home", "Developer")%>">
                            <i class="icon_house"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="sub-menu">
                        <% 
                           
                           
                            //int prjID = Convert.ToInt16(ViewBag.projID);
                            
                        %>

                        <a class="" href="<%:@Url.Action("profileDev", "Developer")%>">
                            <i class="icon_house_alt"></i>
                            <span>Profile</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="<%:@Url.Action("Browse", "Developer")%>" class="">
                            <i class="icon_desktop"></i>
                            <span>Browse</span>
                            <!--<span class="menu-arrow arrow_carrot-right"></span>-->
                        </a>
                        <!--
                      <ul class="sub">
                          <li><a class="" href="general.html">General</a></li>
                          <li><a class="" href="buttons.html">Buttons</a></li>
                          <li><a class="" href="grids.html">Grids</a></li>
                      </ul>-->
                    </li>
                    <li class="sub-menu">
                        <a class="" href="#">
                            <i class="icon_house"></i>
                            <span>Jobs</span>
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

              <!-- Quiz Description -->
              <div class="row">
                  <div class="">
                      <!--Quiz start-->
                      <section class="panel" >
                          <div class="panel-body project-team" style="background-color:#f9f9f9;">
                            <div class="task-progress col-md-offset-1">
                                  <h1 style="margin-left:0em; font-size:4em; font-weight:lighter;">Submit a Proposal</h1>  
                            </div>
                        </div>
                          <br>

                        <div class=" offset-to-mid">
                        	<section class="panel">
                              
                          	</section><br />
                        	<h1 style="margin-left:0em; font-size:2em; font-weight:bolder;"><%: Model.tbModule.title %></h1><br />
                          <section class="panel bidProposal-header-head">
                                  <div class="bidProposal-header">
                                  	<div class="col-md-10 pull-left bidProposal-header-left">
                                        <div class="bidProposal-header-left-firDiv">
                                            <h5>Bids</h5>
                                            <p><%: Model.tbModule.tbProposals.Count %></p>
                                        </div>
                                        
                                        <div class="bidProposal-header-left-secDiv">
                                            <h5>Module Budget (USD)</h5>
                                            <p><%: Model.tbModule.budget %></p>
                                        </div>
                                        <div class="bidProposal-header-left-secDiv">
                                            <h5>Status</h5>
                                            <p><%: Model.tbModule.status %></p>
                                        </div>
                                          <div class="bidProposal-header-left-fourDiv">
                                            <h5>Days Left</h5>
                                            <p><%: Convert.ToInt16(((DateTime)Model.tbModule.closeDate - DateTime.Now).TotalDays) %></p>
                                        </div>
                                    </div>
                                   <script src="/js/jquery.min.js"></script>
                                    <script type="text/javascript" language="javascript">
                                        $(document).ready(function () {
                                            $(".hidetext").click(function () {
                                                $(".text").toggle("slow")
                                            });

                                        });
								   </script>
                                    <a href="#">
                                    <div class="col-md-2 pull-right bidProposal-header-right hidetext">
                                            <h5 class="bidButton">Bid on This Module</h5>
                                    </div>
                                    </a>
                                  </div>
                                  <div class="clearfix"></div>
                                  <% string mId = Convert.ToString(Model.tbModule.modID); %>
                                  <div class="bidProposal-footer text" style="display:none; border-bottom:2px solid #f1f1f1;">
                                            <h3>Bid: </h3>
                                                    <form class="form-horizontal" method="post" action="<%: Url.Action("submitProposal", "Developer", new { id = mId})%>">
                                                         
                                                          
                                                          
                                                         
                                                         <div class="form-group">
                                                              <div class="col-sm-12">
                                      						  <label class="col-sm-2 control-label"><div style="font-size:1.3em;">Your Bid:</div></label>
                                                                  <%--<input type="number" id="bid" class="form-control dollar-form-control" placeholder="0" onchange="rateChange()">--%>
                                                                  <%: Html.TextBoxFor(model => model.tbProposal.hourlyRate, new {@id="bid",@class = "form-control dollar-form-control", @placeholder="0",@onchange="rateChange()",@type = "number" })%>
                                                              </div>
                                                          </div>
                                                         
                                                        <div class="form-group">
                                                              <div class="col-sm-12">
                                      						  <label class="col-sm-2 control-label"><div style="font-size:1.3em;">Our Module Fee:(10%)</div></label><label class="col-sm-2 control-label"><div id="fee" style="font-size:1.3em;"></div></label>
                                                              </div>
                                                          </div>
                                                        <div class="form-group">
                                                              <div class="col-sm-12">
                                      						  <label class="col-sm-2 control-label"><div style="font-size:1.3em;">Paid to you:</div></label><label class="col-sm-2 control-label"><div id="paid" style="font-size:1.3em;"></div></label>
                                                              </div>
                                                          </div>
                                                         <div class="form-group">
                                                              <div class="col-sm-12">
                                      						  <label class="col-sm-2 control-label"><div style="font-size:1.3em;">Cover Letter:</div></label><label class="col-sm-2 control-label"><div style="font-size:1.3em;"><%: Html.TextAreaFor(model => model.tbProposal.covLetter, new { @class = "form-control", @rows = "5", @style="width:750px"}) %></div></label>
                                                              </div>
                                                          </div>
                                                        <div class="form-group">
                                                              <div class="col-sm-12">
                                      						  <label class="col-sm-2 control-label"><div style="font-size:1.3em;">Estimated Completion Date:</div></label> <label for="dtp_input1" class="col-md-2 control-label">DateTime Picking: <span class="required">*</span></label>
                                            <div class="input-group date form_datetime col-md-5" data-date="<%:System.DateTime.Today.ToString("yyyy-MM-dd") %>" data-date-format="dd MM yyyy " data-link-field="dtp_input1" style="padding-left:15px;">
                                                <input class="form-control" size="16" type="text" value="" maxlength="0">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                                              </div>
                                                                   <%: Html.TextBoxFor(model => model.tbProposal.estCompletion, new { @class = "form-control", @id = "dtp_input1", @type = "hidden"}) %>
                                                                   
                                                          </div>

                                                            </div>
                                                    
                                           <!-- <p>Freelancer Project Fee: $5 USD</p>
                                            <h3>About the employer</h3>
                                            <p>5 Star Ratings here - Australia</p>
                                            <h3>Skills required</h3>
                                            <p>Graphic Design, Logo Design</p>
                                            <h3>Additional Files: </h3>
                                            <p><a href="#">nike.jpg</a></p>-->
                                            
                                            
                                            <br/>
                                            <div class="row">
                                                <div class="text-center pull-right">
                                                    <a href="#">
                                                        <button type="button" class="btn btn-primary cust-btn hidetext">Cancel</button>
                                                    </a>
                                                    <a href="#">
                                                        <button type="submit" class="btn btn-danger cust-btn hidetext">Submit</button>
                                                    </a>
                                                </div>
                                            </div>
                                                        </form>
                                  </div>
                                  
                                  
                                  <div class="bidProposal-footer">
                                            <h3>Module Description</h3>
                                            <p><%: Model.tbModule.description %></p>
                                            <h3>Development Type</h3>
                                            <p><%: Model.tbModule.devType %></p>
                                            <h3>Skills required</h3>
                                            <p><%: Model.tbModule.skillReq %></p>
                                            <h3>Skill Level (Minimum)</h3>
                                            <p><%: Model.tbModule.devSkillLevel %></p>
                                      <%if(!(Model.tbModule.filename.IsEmpty())){ %>
                                            <h3>Test Cases </h3>
                                            <p><a href="<%:Url.Action("Download", new { filename = Model.tbModule.filename,of = "Module"})%>"><%:Model.tbModule.filename %></a></p>
                                      <%} %>
                                  </div>
                          </section>
                      
                      
                      
                  </div>
                         
                         <div class="offset-to-mid">
                                	<div >
                                          <table class="table table-striped table-advance table-hover" border="1" bordercolor="#f1f1f1">
                                               <tbody>
                                                  <tr>
                                                     <th class="table-head">FREELANCERS BIDDING (<%: Model.tbModule.tbProposals.Count %>)</th>
                                                     <th class="table-head">SKILL LEVEL</th>
                                                     <th class="table-head">TOTAL EARNING</th>
                                                  </tr>
                                                  <tr>
                                                      <% foreach(var prop in Model.tbModule.tbProposals){ %>
                                                     <td>
                                                         <table>
                                                         <tbody>
                                                         <tr>
                                                         	<td rowspan="3">
                                        <img src="/img/msa_logo-280x280.jpg" class="img-responsive img-circle" style="display:inline; border:3px solid rgba(0,0,0,0.1); margin-right:15px;" alt="Bird" width="100px" height="100px">
                                                            </td>
                                                            <td>
                                                                 <table>
                                                                 <tbody>
                                                                 <tr>
                                                                    <th>
                                                                    <a href="<%:Url.Action("viewProfile","Developer", new {id = prop.tbDeveloper.tbClient.userID }) %>"><%: prop.tbDeveloper.tbClient.tbUser.firstName %> <%: prop.tbDeveloper.tbClient.tbUser.lastName %></a>
                                                                    </th>
                                                                 </tr>
                                                                 </tbody>
                                                                 </table>
                                                            </td>
                                                         </tr>
                                                         </tbody>
                                                         </table>
                                                     </td>
                                                     <td><%string skill; try { skill = prop.tbDeveloper.tbSkills.First(s => s.name.Equals(Model.tbModule.skillReq.ToString())).skillLevel; }
                                                            catch { skill = "Not Tested."; } %> <%: skill %></td>
                                                     <td><%: prop.tbDeveloper.tbClient.totalEarning %></td>
                                                  </tr>
                                                     <%} %>                          
                                               </tbody>
                                            </table>
                                     </div>
                                      
                                  </div>
                                  
                                  
                                  
                                  <div class=" offset-to-mid">
                                      <section class="panel">
                                          <div class="panel-body">
                                              <form class="form-horizontal " method="get">
                                                  
                                                  <div class="form-group">
                                                      <div class="col-lg-10">
                                                          <%: Html.PagedListPager(Model.tbProposals,page => Url.Action("submitProposal",new {Model.tbModule.modID,page}))  %>
                                                      </div>
                                                  </div>
                                              </form>
                                          </div>
                                      </section>
                                  
                                  
                                  
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
 
    <!-- javascripts --><!--
    <script src="js/jquery.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>-->
    <script src="/js/jquery-1.11.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui-1.9.2.custom.min.js"></script>
    <!-- bootstrap -->
    <script src="/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="/js/jquery.scrollTo.min.js"></script>
    <script src="/js/jquery.nicescroll.js" type="text/javascript"></script>
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
