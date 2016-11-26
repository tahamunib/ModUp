<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IPagedList<Modupv1.tbProject>>" %>
<%@ Import namespace="PagedList.Mvc" %>
<%@ Import namespace="PagedList" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <meta name="description" content="Modup Dashboard">
    <meta name="author" content="Modup">
    <meta name="keyword" content="modup, dashboard">
    <link rel="shortcut icon" href="/img/favicon.png">
    <title>Browse</title>
     <link href="/Content/PagedList.css" rel="stylesheet">
     <link href="/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="/css/elegant-icons-style.css" rel="stylesheet" />
    <link href="/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />    

    <!-- Custom styles -->
    <script>

        function budgetChg() {
            var skl = document.getElementById("skillSel");
            var bdgt = document.getElementById("budgetSel");
            if (skl == "") {
                skl = "<%: (String)ViewBag.skill %>";
                var url = "/Developer/Browse?budget=" + bdgt.value + "&skill=" + skl.value;
            }
            
            var url = "/Developer/Browse?budget="+bdgt.value+"&skill="+skl.value ;
            
            window.location.href = url;
            
        }
        function skillChg() {
            
            var skl = document.getElementById("skillSel");
            var bdgt = document.getElementById("budgetSel");
            var url = "/Developer/Browse";
            $.ajax({
                type: "GET",
                url: url,
                data: { budget: bdgt.value, skill: skl.value },
                dataType: "html",
                success: function (resp) {
                    document.write(resp);
                }
            });
        }
    </script>
    
    <link href="/web-css/searchMods_dev.css" rel="stylesheet">
    <link href="/css/style-responsive.css" rel="stylesheet" />
    <link href="/web-css/submitModules_pm.css" rel="stylesheet">
    
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
            <a href="#" class="logo"><img src="/web-img/modup_256.png" alt="" width="80" height="36" /></a>
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
                            <%--<span class="badge bg-important">5</span>--%>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 5 new messages</p>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="/img/birds-of-paradise-sq.jpg" width="40" height="40"></span>
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
                        <a class="" href="<%:@Url.Action("Home", "RequirementEngineer")%>">
                            <i class="icon_house"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="sub-menu">
                        <% 
                           
                           
                            //int prjID = Convert.ToInt16(ViewBag.projID);
                            
                        %>

                        <a class="" href="<%:@Url.Action("profileRA", "RequirementEngineer")%>">
                            <i class="icon_house_alt"></i>
                            <span>Profile</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="#" class="">
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
                                  <h1 style="margin-left:0em; font-size:4em; font-weight:lighter;">Search Projects</h1>  
                            </div>
                        </div>
                        <br>

                        <div class=" offset-to-mid">
                          <section class="panel">
                              <div class="panel-body">
                                  <form class="form-horizontal " method="get">
                                      <div class="form-group">
                                          <div class="col-sm-12">
                                              <input id="q" type="text" style="width:20em;" runat="server" class="form-control search-form-control" placeholder="Search for Projects">
                                              
                                              
                                             
                                              <select id="budget" class="form-control widthPrice-form-control" runat="server">
                                                 <option value="0" selected="selected">Select Budget</option>
                                                   <option value="1" >$0 to $50</option>
                                                  <option value="2">$51 to $100</option>
                                                  <option value="3">$101 to $150</option>
                                                  <option value="4">Above $150</option>
                                              </select>

                                             <input type="submit" style="width: 11em;margin-left: 4%;" value="Search" title="Search" class="form-control btn btn-primary" />
                                          </div>
                                          
                                      </div>
                                      
                                      
                                  </form>
                              </div>
                          </section>
                      
                      
                      
                  </div>
                         
                         <div class="panel-body offset-to-mid" style="margin-left:.8em; margin-right:.8em;">
                                	<div >
                                          <table id="mTable" class="table table-striped table-advance table-hover" border="1" bordercolor="#f1f1f1">
                                               <tbody>
                                                  <tr>
                                                     <th class="table-head">Project</th>
                                                     <th class="table-head">Requirement Description</th>
                                                     
                                                     <th class="table-head">Test Cases or Other Files</th>
                                                     <th class="table-head">Price(USD)</th>
                                                     
                                                      <th class="table-head">Posted On</th>
                                                      <th class="table-head">Closing Date</th>
                                                  </tr>

                                                   <%
                                                       foreach (var item in Model)
                                                       { %>
                                                  <tr>
                                                     <td>
                                                         <table>
                                                         <tbody>
                                                         <tr>
                                                         	<th><%string prjID = Convert.ToString(item.projID); %>
                                                     		<a href="<%:@Url.Action("submitProposalProj", "RequirementEngineer", new { id = prjID })%>"><%:item.title%></a>
                                                            </th>
                                                         </tr>
                                                           
                                                         </tbody>
                                                         </table>
                                                     </td>
                                                      <%if (item.description.Length > 150) { %>
                                                                
                                                        
                                                     <td><%:item.description.Substring(0,149)%>....</td>
                                                     <% } else{%>
                                                      <td><%:item.description%></td>
                                                      <%} %>
                                                     <% if(!(item.fileName.IsEmpty())){ %>
                                                      <td>
                                                         <a href="<%:Url.Action("Download", new {filename = item.fileName , of = "Project" })%>"> <%:item.fileName %> </a>
                                                      </td>
                                                     <%}else{ %>
                                                       <td>
                                                         N/A
                                                      </td>
                                                      <%} %>
                                                     <td>$<%: item.estimatedAmt%></td>
                                                     <td><%: item.postDate%></td>
                                                     <td><%:item.closeDate.AsDateTime().ToShortDateString()%></td>
                                                  </tr>
                                                   <%} %>
                                                                               
                                               </tbody>
                                            </table>
                                     </div>
                                      
                                  </div>
                                  
                                  
                                  
                                  <div class=" offset-to-mid">
                                      <section class="panel">
                                          <div class="panel-body">
                                              <form class="form-horizontal" method="get">
                                                  
                                                  <div class="form-group">
                                                      <div class="col-lg-10">
                                                         <% String q = Convert.ToString(ViewBag.query); %>
                                                         <%: Html.PagedListPager(Model,page => Url.Action("BrowseProj",new {page,ViewBag.budget,q}))  %>
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
      <!-- Modal Message start -->

                        <div class="modal fade" id="myModal2" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <%--<div class="modal-header" style="padding: 35px 50px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h2><span class="glyphicon icon-form-1"></span>Submission Message</h2>
                                    </div>--%>
                                    <div class="modal-body" style="padding: 40px 50px;">
                                        <form role="form" action="<%:Url.Action("BrowseProj","RequirementEngineer") %>">

                                            <div class="form-group">
                                                <p class="h3 cust-p">
                                                   <% try
                                                       { %>
                                                    <%: TempData["message"].ToString()%>
                                                    <%}
                                                       catch { 
                                                       
                                                       } %>
                                                </p>
                                                
                                                
                                            </div>
                                            
                                           <%-- <input type="hidden" id="prj" name="prj" value="<%:prjID %>" />--%>
                                            <%--<button type="submit" data-dismiss="modal" class="btn btn-primary btn-block"><span class="glyphicon "></span>Ok</button>--%>
                                           <%-- <button type="submit" class="btn btn-success btn-block"><span class="glyphicon "></span>No</button>--%>
                                             <button class="btn btn-primary" type="submit">Ok</button>
                                             

                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>
                      <!-- Modal No of Mod end -->
      <!--main content end-->
      <script type="text/javascript">
          $(document).ready(function () {
            <% string message;try {message  = TempData["message"].ToString();}catch{message="";}%>
              var mess = "<%:message%>";
              if (mess != "") {
                  $("#myModal2").modal();
              }
          });
    </script>
  </section>
 
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
