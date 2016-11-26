<%@ Page Title="" Language="C#" MasterPageFile="~/Views/RequirementEngineer/RAMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.RAModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    HomeM
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
                              <h4><%:Model.tbReqEngineer.tbClient.tbUser.firstName %> <%:Model.tbReqEngineer.tbClient.tbUser.lastName %></h4>               
                              <div class="follow-ava">
                                  <img src="/img/birds-of-paradise-sq.jpg" alt="">
                              </div>
                            </div>
                            <div class="col-lg-8 col-sm-8 follow-info">
                                <p>Welcome back <%:Model.tbReqEngineer.tbClient.tbUser.firstName %>, Please check your pending work.</p>
                                
                                <h6>
                                    <span><i class="icon_clock_alt"></i><%:System.DateTime.Now.ToString("hh:mm") %></span>
                                    <span><i class="icon_calendar"></i><%:System.DateTime.Now.ToString("dd:mm:yyyy") %></span>
                                </h6>
                                <h6 style="margin-top:7px;">
                                    <span><i class="icon_pin_alt"></i><%:Model.tbReqEngineer.tbClient.tbUser.country %></span>
                                </h6>
                            </div>
                            <div class="weather-category twt-category">
                                      <ul>
                                          <li class="active">
                                              <%string count; int count2; try { count = Model.tbReqEngineer.tbClient.awardedProjects;}catch{count = "0";}try{ count2 = Model.proposals.Count(m=>m.tbProject.status.Equals("Analysis") || m.tbProject.status.Equals("Analyzed")); }
                                                catch {  count2 = 0; }
                                                int total = Convert.ToInt16(count) + count2;%>
                                              <h4><%:count2 %></h4>
                                              <i class="icon_close_alt2"></i> Pending Task
                                          </li>
                                          <li>
                                              <h4><%: count %></h4>
                                              <i class="icon_check_alt2"></i> Completed
                                          </li>
                                          <li>
                                              <h4><%:total %></h4>
                                              <i class="icon_plus_alt2"></i> Total Task
                                          </li>
                                      </ul>
                                  </div>
                          </div>
                     
                      </div>
                  </section>
                  <!--user profile info end-->
                </div>
                <!-- statics start -->
                <div class="state col-lg-8">
                   
                    <div class="row">
                      
                      <div class="col-lg-3 col-sm-6">
                          <section class="panel">
                              <div class="symbol">
                                  <i class="icon_tags_alt"></i>
                              </div>
                              <div class="value">
                                  
                                  <%  double all = (double)Model.proposals.Count;  
                                      double feedback = (double)(total / all) * 100; %>
                                  <h1><%: Math.Round(feedback) %>%</h1>
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
                                  
                                  <h1><%: Model.proposals.Count %></h1>
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
                                  <h1>$<%:Model.tbReqEngineer.tbClient.totalEarning %></h1>
                                  <p>Earnings</p>
                              </div>
                          </section>
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
                                     <td><h4>Client</h4></td>
                                     <td><h4>Deadline</h4></td>
                                     <td><h4>Status</h4></td>
                                  </tr> 
                                  
<% foreach(var item in Model.proposals){ %>
                              <tr>
                                
                                  <td>
                                      <%string action = "", id = ""; if (item.tbProject.status.Equals("Open")) { action = "viewProposal"; id = Convert.ToString(item.projID); }
                                        else if (item.tbProject.tbAwardedProj.raID == Model.tbReqEngineer.raID) {
                                             id = Convert.ToString(Model.workrooms.Where(wr=>wr.projID.Equals(item.tbProject.tbAwardedProj.projID)).First().wrID);
                                            action = "modulesBreak"; } %>
                                     <a class="" href="<%:Url.Action(action, new { id = id })%>"><p class="profile-name"><%: item.tbProject.title %></p></a> 
                                    
                                  </td>
                                  <td>
                                      <p class="profile-name"><%:item.tbProject.tbPM.tbUser.firstName %> <%:item.tbProject.tbPM.tbUser.lastName %></p>
                                      
                                  </td>
                                  <td>
                                      <p class="profile-name"><%: item.tbProject.closeDate.AsDateTime().ToShortDateString() %></p>
                                      
                                  </td>
                                  <td>
                                      <p class="profile-name"><%: item.tbProject.status %></p>
                                      
                                  </td>
                                  
                                 
                              </tr>
                                  <%} %>
                                  



                            
                              </tbody>
                          </table>
                      </section>
                      <!--Project Team end-->
                  </div>

            
              </div>
              <!-- project team & activity end -->

          </section>
      </section>
      <!--main content end-->

</asp:Content>
