<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PM/PMMaster.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.projViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    projects
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main-content">
          <section class="wrapper">    
 <!-- project team & activity start -->
              <div class="row">
                  <div class="col-lg-12">
                      <!--project team start-->
                      <section class="panel">
                        <div class="panel-body project-team">
                            <div class="task-progress">
                                  <h1>My Projects</h1>  
                            </div>
                        </div>
                        <table class="table table-hover personal-task">
                              <tbody>
                                 <tr>
                                      
                                      <td><h4>Project Title</h4></td>
                                     
                                     <td><h4>Post Date</h4></td>
                                     <td><h4>Closing Date</h4></td>
                                     <td><h4>Estimated Budget</h4></td>
                                     <td><h4>Status</h4></td>
                                  </tr> 


<% foreach (var item in Model.tbProjects){ %>
                              <tr>
                                  <%--<td>
                                    <span class="profile-ava">
                                        <img alt="" class="simple" src="/img/birds-of-paradise-sq.jpg" width="40" height="40">
                                    </span>
                                  </td>--%>
                                  <td>
                                     <% string prjID = Convert.ToString(item.projID);
                                         string action="";
                                         if(item.status.Equals("Analysis") || item.status.Equals("Analyzed")){
                                              action= "Submission";
                                         }
                                         else if (item.status.Equals("Open"))
                                         {
                                             action = "viewBidsProj";
                                         }
                                         else if (item.status.Equals("Closed"))
                                         {
                                             action = "project";
                                         }
                                          %>
                                     <a class="" href="<%:@Url.Action(action, "PM", new {id = prjID })%>"><p class="profile-name"><%: item.title %></p></a> 
                                      
                                  </td>
                                  
                                  <td>
                                      <p class="profile-name"><%: item.postDate.AsDateTime().ToShortDateString() %></p>
                                      
                                  </td>
                                  <td>
                                      <p class="profile-name"><%: item.closeDate.AsDateTime().ToShortDateString() %></p>
                                      
                                  </td>
                                  <td>
                                      <p class="profile-name"><%: item.estimatedAmt %></p>
                                      
                                  </td>
                                  <td>
                                      <p class="profile-name"><%: item.status %></p>
                                      
                                  </td>
                                 <%-- <td>
                                      <span class="badge bg-success">75%</span>
                                  </td>--%>
                              </tr>


<%} %>

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
</asp:Content>
