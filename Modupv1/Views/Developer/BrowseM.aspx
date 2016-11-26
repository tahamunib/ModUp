<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/DEVMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<Modupv1.tbModule>>" %>
<%@ Import namespace="PagedList.Mvc" %>
<%@ Import namespace="PagedList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Browse
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<!-- container section start -->
  
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
                                  <h1 style="margin-left:0em; font-size:4em; font-weight:lighter;">Search Modules</h1>  
                            </div>
                        </div>
                        <br>

                        <div class=" offset-to-mid">
                          <section class="panel">
                              <div class="panel-body">
                                  <form class="form-horizontal" action="<%:Url.Action("Browse", "Developer")%>" method="get">
                                      <div class="form-group">
                                          <div class="col-sm-12">
                                              <input id="q" type="text" style="width:20em;" runat="server" class="form-control search-form-control" placeholder="Search for modules">
                                              
                                              <select id="skill" title="Skill" class="form-control width-form-control" runat="server">
    											  <option value="" selected="selected">Select Skill</option>
                                                  <option value="C#">C#</option>
                                                  <option value="PHP">PHP</option>
                                                  <option value="ASP">ASP</option>
                                                  <option value="VBA">VBA</option>
                                              </select>
                                             
                                              <select id="budget" class="form-control widthPrice-form-control" runat="server">
                                                 <option value="0" selected="selected">Select Budget</option>
                                                   <option value="1" >$0 to $50</option>
                                                  <option value="2">$51 to $100</option>
                                                  <option value="3">$101 to $150</option>
                                                  <option value="4">Above $150</option>
                                              </select>

                                             <input type="submit" style="width:8em;" value="Search" title="Search" class="form-control btn btn-primary" />
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
                                                     <th class="table-head">Modules</th>
                                                     <th class="table-head">Skill</th>
                                                     
                                                     
                                                     <th class="table-head">Price(USD)</th>
                                                     <th class="table-head">Skill Level</th>
                                                      <th class="table-head">Posted On</th>
                                                  </tr>

                                                   <%
                                                       foreach (var item in Model)
                                                       { %>
                                                  <tr>
                                                     <td>
                                                         <table>
                                                         <tbody>
                                                         <tr>
                                                         	<th><%string modID = Convert.ToString(item.modID); %>
                                                     		<a href="<%:@Url.Action("submitProposal", "Developer", new { id = modID })%>"><%:item.title%></a>
                                                            </th>
                                                         </tr>
                                                         <tr><td><p><%:item.description%></p></td></tr>
                                                         <tr><td><a href="#"><%:item.tbProject.title%></a></td></tr>
                                                         <tr><td><p>Total Proposals: <%:item.tbProposals.Count%></p></td></tr>    
                                                         </tbody>
                                                         </table>
                                                     </td>
                                                     <td><%:item.skillReq%></td>
                                                     
                                                     
                                                     <td><%: item.budget%></td>
                                                     <td><%: item.devSkillLevel%></td>
                                                     <td><%:item.tbProject.postDate%></td>
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
                                                         
                                                         <%: Html.PagedListPager(Model,page => Url.Action("Browse",new {page,ViewBag.budget,ViewBag.skill}))  %>
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
 
  <!-- container section start -->

</asp:Content>
