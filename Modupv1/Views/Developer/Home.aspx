﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Developer/DEVMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.devViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

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
                              <h4><%:Model.tbUser.firstName %> <%:Model.tbUser.lastName %></h4>               
                              <div class="follow-ava">
                                  <img src="/img/birds-of-paradise-sq.jpg" alt="">
                              </div>
                            </div>
                            <div class="col-lg-8 col-sm-8 follow-info">
                                <p>Welcome back <%:Model.tbUser.firstName %>, Please check your pending work.</p>
                                
                                <h6>
                                    <span><i class="icon_clock_alt"></i><%:System.DateTime.Now.ToString("hh:mm") %></span>
                                    <span><i class="icon_calendar"></i><%:System.DateTime.Now.ToString("dd:mm:yyyy") %></span>
                                </h6>
                                <h6 style="margin-top:7px;">
                                    <span><i class="icon_pin_alt"></i><%:Model.tbUser.country %></span>
                                </h6>
                            </div>
                            <div class="weather-category twt-category">
                                      <ul>
                                          <li class="active">
                                              <h4><%:Model.tbAwardedModules.Where(aw => aw.status.Equals("Working")).Count() %></h4>
                                              <i class="icon_close_alt2"></i> Pending Task
                                          </li>
                                          <li>
                                              <h4>0</h4>
                                              <i class="icon_check_alt2"></i> Completed
                                          </li>
                                          <li>
                                              <h4><%: Model.tbAwardedModules.Count %></h4>
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
                                  <h1>Modules</h1>  
                            </div>
                        </div>
                        <table class="table table-hover personal-task">
                              <tbody>
                                 <tr>
                                      
                                      <td><h4>Module Title</h4></td>
                                     <td><h4>Category</h4></td>
                                     <td><h4>Deadline</h4></td>
                                     <td><h4>Status</h4></td>
                                  </tr> 
<%foreach(var item in Model.Proposals){ %>
            
                              <tr>
                                  
                                  <td>
                                      <%if(item.tbModule.status.Equals("Open")){ %>
                                     <a class="" href="<%:Url.Action("viewProposal", "Developer", new { id=item.tbModule.modID})%>"><p class="profile-name"><%:item.tbModule.title %></p></a> 
                                      <%}
                                        else if (item.tbModule.tbAwardedModule.devID == Model.tbDeveloper.devID)
                                        {%>
                                       <a class="" href="<%:Url.Action("Checkpoints", "Developer", new { id= item.tbModule.tbAwardedModule.tbModuleWorkrooms.First().wrID})%>"><p class="profile-name"><%:item.tbModule.title %></p></a> 
                                      <%}
                                        else if (item.tbModule.status.Equals("Closed")){ %>
                                      <a class="" href="<%:Url.Action("Checkpoints", "Developer", new { id=item.tbAwardedModules})%>"><p class="profile-name"><%:item.tbModule.title %></p></a> 
                                      <%} %>
                                  </td>
                                  <td>
                                      <p class="profile-name"><%:item.tbModule.category %></p>
                                      
                                  </td>
                                  <td>
                                      <p class="profile-name"><%: item.tbModule.closeDate%></p>
                                      
                                  </td>
                                  <td>
                                      <p class="profile-name"><%: item.tbModule.status %></p>
                                      
                                  </td>
                                  
                                 <%-- <td>
                                      <span class="badge bg-success">75%</span>
                                  </td>--%>
                              </tr>
                           

                                  <%} %>
                          
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

</asp:Content>
