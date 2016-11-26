<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PM/PMWorkroom.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.projViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Submission
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<section id="main-content">
        <section class="wrapper">
            <!--overview start-->
            <div class="row state-overview">

                <!-- statics start -->
                <div class="state col-lg-12">

                <!-- Project start -->

                    <form class="form-validate form-horizontal" id="form" name="form" action="<%:Url.Action("Submission", "PM", new { accept = "true"})%>" method="post" id="register_form">

                        <!-- Start Of Modules Breakup Form-->

                        <div class="row">
                            <div class="col-lg-12">
                              
                                
                                 <section class="panel" style="padding-bottom: 2%; margin-bottom: 3%;">
                                    <header class="panel-heading" style="padding-bottom: 2%; margin-bottom: 1%;">
                                        <h3>Project Modules:</h3>
                                        <%--<div class="pull-right">
                                        <button type="button" style="margin-top:-37px;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">Add Module</button>
                                        </div>--%>
                                    </header>
                                    
                                        <table class="table table-hover personal-task">
                                        <thead>
                                            <tr>

                                                <th>
                                                    <h4>Module Title</h4>
                                                </th>
                                                
                                                <th>
                                                    <h4>Post Date</h4>
                                                </th>
                                               
                                                
                                                <th>
                                                    <h4>Status</h4>
                                                </th>
                                                 
                                                <th>
                                                    <h4>Requirement Engineer</h4>
                                                </th>
                                            </tr>
                                            </thead>
                                        <tbody>
                                            <%if(Model.tbProject.status.Equals("Analysis") || Model.tbProject.status.Equals("Analyzed")){ 
                                                                       

                                                  if (Model.tbProject.tbModules.Where(m => m.status.Equals("Analyzed")).Count() > 0)
                                                  {

                                                      foreach (var item in Model.tbProject.tbModules.Where(m => m.status.Equals("Analyzed")))
                                                      { %>

                                            <tr>

                                                <td>
                                                    <% string modID = Convert.ToString(item.modID); %>
                                                    
                                                        <a href="#<%:modID%>" data-toggle="modal" ><p class="profile-name"><%: item.title%></p></a>
                                                    
                                                    
                                                </td>

                                                
                                                <td>
                                                    <p class="profile-name"><%: item.tbProject.postDate%></p>

                                                </td>
                                                
                                                
                                                <td>
                                                    <p class="profile-name"><%: item.status%></p>
                                                   

                                                </td>
                                                <%--<td>
                                                    <a href="<%:Url.Action("Download", new { filename = item.filename, of = "Module"})%>"><p class="profile-name"><%: item.filename %></p></a>

                                                </td>--%>
                                              
                                                <td>
                                                    <p class="profile-name"><%: item.tbProject.tbAwardedProj.tbRequirementEngineer.tbClient.tbUser.firstName%> <%: item.tbProject.tbAwardedProj.tbRequirementEngineer.tbClient.tbUser.lastName%></p>

                                                </td>
                                                 <span id="sprycheckbox1"><td>
                                                    <input type="checkbox" name="modIDs" value="<%:item.modID%>"/>
                                                </td><span id="checkboxRequiredMsg" class="checkboxRequiredMsg">Please make a selection.</span></span>
                                            </tr>
                                            

                                            <%}
                                                  }
                                                  else
                                                  {%>
                                                      <tr>
                                                          <th>
                                                              <h5>No Modules Submitted Yet.</h5>
                                                          </th>
                                                      </tr>
                                                  <%}
                                              }%>
                                        </tbody>
                                    </table>
                                      
                                     </section>
                         <%if (Model.tbProject.tbModules.Where(m=>m.status.Equals("Analyzed")).Count() > 0)
                           { %>
                                <input type="hidden" id="accept" name="accept" value=""/>
                                    <div class="center-block">
                                        <button type="button" id="btnAccept" class="btn btn-primary btn-lg" >Accept Modules</button>
                                        <button type="button" id="btnReview" class="btn btn-danger btn-lg" >Request Review</button>
                                   </div>
                                <%} %>
                                <br />
                                <%-- Accepted Modules Section --%>
                               <section class="panel" style="padding-bottom: 2%; margin-bottom: 3%; margin-top:1%">
                                    <header class="panel-heading" style="padding-bottom: 2%; margin-bottom: 1%;">
                                        <h3>Accepted Modules:</h3>
                                        <%--<div class="pull-right">
                                        <button type="button" style="margin-top:-37px;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">Add Module</button>
                                        </div>--%>
                                    </header>
                                    
                                        <table class="table table-hover personal-task">
                                        <thead>
                                            <tr>

                                                <th>
                                                    <h4>Module Title</h4>
                                                </th>
                                                
                                                <th>
                                                    <h4>Post Date</h4>
                                                </th>
                                               
                                                
                                                <th>
                                                    <h4>Status</h4>
                                                </th>
                                                 
                                                <th>
                                                    <h4>Requirement Engineer</h4>
                                                </th>
                                            </tr>
                                            </thead>
                                        <tbody>
                                            <%if (Model.tbProject.status.Equals("Analysis") || Model.tbProject.status.Equals("Analyzed"))
                                              { if(Model.tbProject.tbModules.Where(m => m.status.Equals("Open")).Count() == 0){%>
                                            <tr>
                                                <th>
                                                    <h5>No Modules Accepted Yet.</h5>
                                                </th>
                                            </tr>
                                            

                                            <%} 
                                              else 
                                              { 
                                      foreach (var item in Model.tbProject.tbModules.Where(m=>m.status.Equals("Open")))
                                                { %>

                                            <tr>

                                                <td>
                                                    <% string modID = Convert.ToString(item.modID); %>
                                                    
                                                        <a href="#<%:modID%>" data-toggle="modal" ><p class="profile-name"><%: item.title %></p></a>
                                                    
                                                    
                                                </td>

                                               
                                                <td>
                                                    <p class="profile-name"><%: item.tbProject.postDate %></p>

                                                </td>
                                                
                                                
                                                <td>
                                                    <p class="profile-name"><%: item.status %></p>
                                                   

                                                </td>
                                                <%--<td>
                                                    <a href="<%:Url.Action("Download", new { filename = item.filename, of = "Module"})%>"><p class="profile-name"><%: item.filename %></p></a>

                                                </td>--%>
                                               
                                                <td>
                                                    <p class="profile-name"><%: item.tbProject.tbAwardedProj.tbRequirementEngineer.tbClient.tbUser.firstName %> <%: item.tbProject.tbAwardedProj.tbRequirementEngineer.tbClient.tbUser.lastName %></p>

                                                </td>
                                                  <td>
                                                    <a href="<%:Url.Action("viewBidsMod", "PM", new { id=item.modID})%>"><p class="profile-name">View Proposals</p></a>

                                                </td>
                                            </tr>
                                            

                                            <%} }}%>
                                        </tbody>
                                    </table>
                                      
                                     </section>
                            </div>
                        </div>
                        <!-- End Of Modules Breakup Form-->

                    </form>

                    <!-- Project end -->
                     <!-- Modal Accept start -->

                        <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="padding: 35px 50px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h2><span class="glyphicon icon-form-1"></span>Confirmation ?</h2>
                                    </div>
                                    <div class="modal-body" style="padding: 40px 50px;">
                                        <form role="form" method="post" action="<%: Url.Action("Submission", "PM", new { id = Model.tbProject.projID , accept ="true"})%>">

                                            <div class="form-group">
                                                <p class="h4 cust-p">
                                                    Do you want to accept these modules ?
                                                </p>
                                                
                                                
                                            </div>
                                            
                                           <%-- <input type="hidden" id="prj" name="prj" value="<%:prjID %>" />--%>
                                            <%--<button type="submit" class="btn btn-success btn-block"><span class="glyphicon "></span>Yes</button>
                                            <button type="submit" class="btn btn-success btn-block"><span class="glyphicon "></span>No</button>--%>
                                             <button class="btn btn-primary" type="submit">Yes</button>
                                             <button class="btn btn-danger" data-dismiss="modal" type="button">Cancel</button>

                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>
                      <!-- Modal No of Mod end -->
<%foreach(var module in Model.tbProject.tbModules){ %>
                     <!--Module Modal start -->

                        <div class="modal fade" id="<%:module.modID%>" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="padding: 35px 50px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h2><span class="glyphicon icon-form-1"></span>Module Details</h2>
                                    </div>
                                    <div class="modal-body" style="padding: 40px 50px;">
                                        <form role="form" method="post" action="<%:Url.Action("Submission","PM",new {id=module.projID,accept = "true",modIDs=module.modID})%>">

                                            <div class="form-group">
                                                <h3>Title:</h3><p>
                                                   <%:module.title %>
                                                </p>
                                                <h3>Description:</h3><p>
                                                   <%:module.description %>
                                                </p>
                                                
                                                <h3>Estimated Amount:</h3>(Suggested By Requirement Engineer)<p>
                                                   <%:module.budget %>
                                                </p>
                                                <h3>Category:</h3><p>
                                                   <%:module.category %>
                                                </p>
                                                <h3>Development Type:</h3><p>
                                                   <%:module.devType %>
                                                </p>
                                                <%if(module.devType.Equals("Test Driven Development")){ %>
                                                <h3>Test Cases:</h3><p>
                                                    <a href="<%:Url.Action("Download", new { filename = module.filename, of = "Module"})%>"><p class="profile-name"><%: module.filename %></p></a>
                                                </p>
                                                <%} %>
                                                <h3>Skill Required:</h3><p>
                                                   <%:module.skillReq %>
                                                </p>
                                                <h3>Skill Level:</h3><p>
                                                   <%:module.devSkillLevel %>
                                                </p>
                                            </div>
                                            
                                          <%if(module.status.Equals("Open")){ %>
                                             <a href="<%:Url.Action("viewBidsMod", "PM", new { id=module.modID})%>" class="btn btn-primary">View Bids</a>
                                             <button class="btn btn-danger" data-dismiss="modal" type="button">Close</button>
                                            <%}else{ %>
                                            <button type="submit" class="btn btn-primary">Accept Module</button>
                                             <button class="btn btn-danger" data-dismiss="modal" type="button">Close</button>
                                            <%} %>
                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>
                      <!--Module Modal end -->
                   
                    <%} %>
                    <!-- Modal Review Mod start -->

                        <div class="modal fade" id="myModal1" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="padding: 35px 50px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h2><span class="glyphicon icon-form-1"></span>Review Confirmation</h2>
                                    </div>
                                    <div class="modal-body" style="padding: 40px 50px;">
                                        <form role="form" method="post" action="<%:Url.Action("Submission","PM", new { id = Model.tbProject.projID, accept="false"}) %>">

                                            <div class="form-group">
                                                <p class="h3 cust-p">
                                                   Do you want to send modules for review ?
                                                </p>
                                                
                                                
                                            </div>
                                            
                                           <%-- <input type="hidden" id="prj" name="prj" value="<%:prjID %>" />--%>
                                            <%--<button type="submit" data-dismiss="modal" class="btn btn-primary btn-block"><span class="glyphicon "></span>Ok</button>--%>
                                           <%-- <button type="submit" class="btn btn-success btn-block"><span class="glyphicon "></span>No</button>--%>
                                             <button class="btn btn-primary" type="submit">Yes</button>
                                             <button class="btn btn-danger" data-dismiss="modal" type="button">Cancel</button>

                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>
                      <!-- Modal No of Mod end -->

                    <!-- Modal Message start -->

                        <div class="modal fade" id="myModal2" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="padding: 35px 50px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h2><span class="glyphicon icon-form-1"></span>Submission Message</h2>
                                    </div>
                                    <div class="modal-body" style="padding: 40px 50px;">
                                        <form role="form" >

                                            <div class="form-group">
                                                <p class="h3 cust-p">
                                                   <% int pID;
                                                       try
                                                       { %>
                                                    <%: TempData["message"].ToString()%>
                                                    <%  pID= Convert.ToInt16(TempData["projID"]);
                                                    }
                                                       catch {
                                                           pID = 0;
                                                       } %>
                                                </p>
                                                
                                                
                                            </div>
                                            
                                           <%-- <input type="hidden" id="prj" name="prj" value="<%:prjID %>" />--%>
                                            <%--<button type="submit" data-dismiss="modal" class="btn btn-primary btn-block"><span class="glyphicon "></span>Ok</button>--%>
                                           <%-- <button type="submit" class="btn btn-success btn-block"><span class="glyphicon "></span>No</button>--%>
                                             <a class="btn btn-primary" href="<%:Url.Action("Submission", "PM", new { id= pID})%>">OK</a>
                                             

                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>
                      <!-- Modal No of Mod end -->


                    </div>
                </div>
            </section>
     <script type="text/javascript">
         $(document).ready(function () {
            <% string message;try {message  = TempData["message"].ToString();}catch{message="";}%>
            var mess = "<%:message%>";
            if (mess != "") {
                $("#myModal2").modal();
            }
        

         $('#btnAccept').click(function () {
             $('#accept').val('true');
             $('#form').submit();
         });
         $('#btnReview').click(function () {
             $('#accept').val('false');
             $('#form').submit();
         });
         $("#form").submit(function (e) {

             if (!$('input[type=checkbox]:checked').length) {
                 alert("Please select any module to submit !");


                 //stop the form from submitting
                 return false;
             }

             return true;
         });
         });
    </script>

    <script type="text/javascript">
        var sprycheckbox1 = new Spry.Widget.ValidationCheckbox("sprycheckbox1", { validateOn: ["change"] });
    </script>
        </section>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
</asp:Content>
