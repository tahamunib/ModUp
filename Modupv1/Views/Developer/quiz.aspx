<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.quizViewModel>" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Modup Dashboard">
    <meta name="author" content="Modup">
    <meta name="keyword" content="modup, dashboard">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Evaluation</title>

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
    <link href="/web-css/test_dev.css" rel="stylesheet">
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

            
      </header>      
      <!--header end-->

      <!--sidebar start-->
      
      <!--sidebar end-->
      
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">      
             <%-- <% int no = Model.tbQuestion.Count;
                 
                  %>--%>
              <!-- Quiz Description -->
              <div class="row">
                  <div class="">
                      <!--Quiz start-->
                      <section class="panel">
                        <div class="panel-body project-team">
                            <div class="task-progress col-md-offset-2">
                                  <h1 style="margin-left:0em; font-size:4em; font-weight:lighter;">Skill Test</h1>  
                            </div>
                        </div>
                        
                        <div class="offset-to-mid">
                        	<div class="row margin-top">
                            	<div class="pull-left col-lg-4" style="padding-left:0px;">
                        			<h1 class="h4 cust-h">Question</h1>
                                </div>
                            	<div class="pull-right col-lg-4">
                        			<h1 class="h4 cust-h pull-right">Time Remaining: 01:00</h1>
                                </div>
                            </div>
                        	<div class="row margin-top">
                        		<h1 class="h3 cust-h"><%:Model.tbQuestion[Model.i].question %></h1>
                            </div>
                             <% int iter = Model.i + 1; %>
                            <form method="post" action="<%: Url.Action("quiz", "Developer", new { id =iter })%>">
                            <div class="row margin-top padding-left">
                            <div data-toggle="buttons" class="">
                               
                               
                             <% foreach(var item in Model.tbAnswer){ %>   
                                
                                 <label class="btn btn-default radio-check">
                                    <%--<input type="radio" name="options" id="option2" autocomplete="off">--%>
                                     <%: Html.RadioButtonFor(model => model.selectedAns,item.answer) %>
                                    <span class="glyphicon glyphicon-ok"></span>
                                </label>
                                <span class="h4 cust-radio-ans"><%:item.answer %></span>
                                <br/><br/>
                                

                                <%} %>
                                   
                                <%--<label class="btn btn-default radio-check">
                                    <input type="radio" name="options" id="option2" autocomplete="off">
                                    <span class="glyphicon glyphicon-ok"></span>
                                </label>
                                <span class="h4 cust-radio-ans">Create original</span>
                                <br/><br/>
                                <label class="btn btn-default radio-check">
                                    <input type="radio" name="options" id="option2" autocomplete="off">
                                    <span class="glyphicon glyphicon-ok"></span>
                                </label>
                                <span class="h4 cust-radio-ans">Create Flash movies</span>
                                <br/><br/>
                                <label class="btn btn-default radio-check">
                                    <input type="radio" name="options" id="option2" autocomplete="off">
                                    <span class="glyphicon glyphicon-ok"></span>
                                </label>
                                <span class="h4 cust-radio-ans">Open TIFF files</span>--%>
                            </div>
                            </div>
                                
                                
                                            <!--<label class="btn btn-success active">
                                                <input type="radio" name="options" id="option2" autocomplete="off" chacked>
                                                <span class="glyphicon glyphicon-ok"></span>
                                            </label>
                                
                                            <label class="btn btn-primary">
                                                <input type="radio" name="options" id="option1" autocomplete="off">
                                                <span class="glyphicon glyphicon-ok"></span>
                                            </label>
                                
                                            <label class="btn btn-info">
                                                <input type="radio" name="options" id="option2" autocomplete="off">
                                                <span class="glyphicon glyphicon-ok"></span>
                                            </label>-->
                                
                                            
                                
                                            <!--<label class="btn btn-warning">
                                                <input type="radio" name="options" id="option2" autocomplete="off">
                                                <span class="glyphicon glyphicon-ok"></span>
                                            </label>
                                
                                            <label class="btn btn-danger">
                                                <input type="radio" name="options" id="option2" autocomplete="off">
                                                <span class="glyphicon glyphicon-ok"></span>
                                            </label>-->

                                <input type="hidden" id="scr" name="scr" value="<%:Model.score %>"/>       
                                <input type="hidden" id="dev" name="dev" value="<%:Model.tbDeveloper.devID %>"/>
                                <input type="hidden" id="skills" name="skills" value="<%:Model.tbSkill.skillID %>"/>
                                <input type="hidden" id="skill" name="skill" value="<%:Model.tbSkill.name %>"/>
                            <div class="row margin-top">
                             <div class="col-lg-3 pull-right">
                                <div class="pull-right margin-left">
                                    
                                    
                                        <button type="submit" class="btn btn-danger cust-btn">Next</button>
                                    
                                </div>
                                <div class="pull-left">
                                    
                                        <button type="button" class="btn btn-danger cust-btn">Prev</button>
                                    
                                </div>
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
