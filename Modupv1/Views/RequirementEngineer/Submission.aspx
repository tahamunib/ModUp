<%@ Page Title="" Language="C#" MasterPageFile="~/Views/RequirementEngineer/RAWorkroom.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.projViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Submission
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!--overview start-->
            <div class="row state-overview">

                <!-- statics start -->
                <div class="state col-lg-12">

                <!-- Project start -->

                    <form class="form-validate form-horizontal " id="form" method="post" action="<%:Url.Action("Submission","RequirementEngineer") %>" id="register_form">

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
                                                    <h4>Required Skill Level</h4>
                                                </th>
                                                <th>
                                                    <h4>Post Date</h4>
                                                </th>
                                                <th>
                                                    <h4>Estimated Amount</h4>
                                                </th>
                                                
                                                <th>
                                                    <h4>Status</h4>
                                                </th>
                                                 <th>
                                                    <h4>Test Cases</h4>
                                                </th>
                                                <th>
                                                    <h4>Development</h4>
                                                </th>
                                            </tr>
                                            </thead>
                                        <tbody>
                                            <% string status="";
                                      foreach (var item in Model.tbProject.tbModules.Where(m=>m.status.Equals("Analysis")))
                                                { %>

                                            <tr>

                                                <td>
                                                    <% string modID = Convert.ToString(item.modID);
                                                       int wrID = Convert.ToInt32(ViewBag.wrID);
                                                        %>
                                                    
                                                        <a href="<%: Url.Action("editMod", "RequirementEngineer", new { id = item.modID, wrID = wrID})%>" data-toggle="modal" ><p class="profile-name"><%: item.title %></p></a>
                                                    
                                                    
                                                </td>

                                                <td>
                                                    <p class="profile-name"><%: item.devSkillLevel %></p>

                                                </td>
                                                <td>
                                                    <p class="profile-name"><%: item.tbProject.postDate %></p>

                                                </td>
                                                <td>
                                                    <p class="profile-name"><%: item.budget %></p>

                                                </td>
                                                
                                                <td>
                                                    <p class="profile-name"><%: item.status %></p>
                                                    

                                                </td>
                                                <td>
                                                    <a href="<%:Url.Action("Download", new { filename = item.filename, of = "Module"})%>"><p class="profile-name"><%: item.filename %></p></a>

                                                </td>
                                               <td>
                                                    <p class="profile-name"><%: item.devType %></p>

                                                </td>
                                                <td>
                                                    <span id="sprycheckbox1"><td>
                                                    <input type="checkbox" name="modIDs" value="<%:item.modID%>"/>
                                                </td><span id="checkboxRequiredMsg" class="checkboxRequiredMsg">Please make a selection.</span></span>

                                                </td>
                                            </tr>
                                            

                                            <%} %>
                                        </tbody>
                                    </table>
                                      
                                     </section>
                         <%if (Model.tbProject.status.Equals("Analysis"))
                           {
                               if (Model.tbProject.tbModules.Count > 0)
                               {
                                %>
                                    <div class="center-block">
                                        <%--<button type="button"  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Submit Modules</button>--%>
                                        <button type="submit" class="btn btn-primary btn-lg">Submit Modules</button>
                                        </div>
                                <%}
                               else
                               {%>
                                  <div class="center-block">
                                    <p class="h3 cust-p"> Project Not Divided Yet </p>
                                    </div>
                                  <%}
                           }
                           else if (Model.tbProject.status.Equals("Analyzed"))
                           { %>
                                <div class="center-block">
                                    <p class="h3 cust-p"> Modules Submitted To Client </p>
                                    </div>
                                <%}%>
                           <br />
                                 <section class="panel" style="padding-bottom: 2%; margin-bottom: 3%;">
                                    <header class="panel-heading" style="padding-bottom: 2%; margin-bottom: 1%;">
                                        <h3>Submitted Modules:</h3>
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
                                                    <h4>Required Skill Level</h4>
                                                </th>
                                                <th>
                                                    <h4>Post Date</h4>
                                                </th>
                                                <th>
                                                    <h4>Estimated Amount</h4>
                                                </th>
                                                
                                                <th>
                                                    <h4>Status</h4>
                                                </th>
                                                 <th>
                                                    <h4>Test Cases</h4>
                                                </th>
                                                <th>
                                                    <h4>Development</h4>
                                                </th>
                                            </tr>
                                            </thead>
                                        <tbody>
                                            <% 
                                      foreach (var item in Model.tbProject.tbModules.Where(m=>m.status.Equals("Analyzed")))
                                                { %>

                                            <tr>

                                                <td>
                                                    <% string modID = Convert.ToString(item.modID); %>
                                                    
                                                        <a href="#<%:modID%>" data-toggle="modal" ><p class="profile-name"><%: item.title %></p></a>
                                                    
                                                    
                                                </td>

                                                <td>
                                                    <p class="profile-name"><%: item.devSkillLevel %></p>

                                                </td>
                                                <td>
                                                    <p class="profile-name"><%: item.tbProject.postDate %></p>

                                                </td>
                                                <td>
                                                    <p class="profile-name"><%: item.budget %></p>

                                                </td>
                                                
                                                <td>
                                                    <p class="profile-name"><%: item.status %></p>
                                                    

                                                </td>
                                                <td><%if (item.filename.Equals("") || item.filename.Equals("N/A"))
                                                      { %>
                                                    <p class="profile-name"><%: item.filename %></p><%} %>
                                                    <%else{ %>
                                                    <a href="<%:Url.Action("Download", new { filename = item.filename, of = "Module"})%>"><p class="profile-name"><%: item.filename %></p></a>
                                                    <%} %>
                                                </td>
                                               <td>
                                                    <p class="profile-name"><%: item.devType %></p>

                                                </td>
                                                
                                            </tr>
                                            

                                            <%} %>
                                        </tbody>
                                    </table>
                                      
                                     </section>


                            </div>
                        </div>
                        <!-- End Of Modules Breakup Form-->

                    </form>

                    <!-- Project end -->
                     <!-- Modal No of Mod start -->

                        <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="padding: 35px 50px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h2><span class="glyphicon icon-form-1"></span>Confirmation ?</h2>
                                    </div>
                                    <div class="modal-body" style="padding: 40px 50px;"><%string id = Convert.ToString(ViewBag.wrID); %>
                                        <form role="form" method="post" action="<%: Url.Action("Submission", "RequirementEngineer", new { id =id })%>">

                                            <div class="form-group">
                                                <p class="h4 cust-p">
                                                    Do you want to submit these modules to the Client ?
                                                </p>
                                                
                                                
                                            </div>
                                            
                                          
                                             <button class="btn btn-primary" type="submit">Submit</button>
                                             <button class="btn btn-danger" type="button">Cancel</button>

                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>
                      <!-- Modal No of Mod end -->

                    <!-- Modal No of Mod start -->

                        <div class="modal fade" id="myModal1" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="padding: 35px 50px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h2><span class="glyphicon icon-form-1"></span>Submission Message</h2>
                                    </div>
                                    <div class="modal-body" style="padding: 40px 50px;">
                                        <form role="form" action="<%:Url.Action("Home","RequirementEngineer") %>">

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
                                            <button type="submit" data-dismiss="modal" class="btn btn-primary btn-block"><span class="glyphicon "></span>Ok</button>
                                           <%-- <button type="submit" class="btn btn-success btn-block"><span class="glyphicon "></span>No</button>--%>
                                             <%--<button class="btn btn-primary" type="submit">Submit</button>
                                             <button class="btn btn-danger" type="button">Cancel</button>--%>

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
                                        <form role="form">

                                            <div class="form-group">
                                                <h3>Title:</h3><p>
                                                   <%:module.title %>
                                                </p>
                                                <h3>Description:</h3><p>
                                                   <%:module.description %>
                                                </p>
                                                
                                                <h3>Estimated Amount:</h3><p>
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
                                            
                                         
                                             
                                            
                                            
                                            
                                             <button class="btn btn-danger" data-dismiss="modal" type="button">Close</button>
                                            
                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>
                      <!--Module Modal end -->
                   
                    <%} %>

                    </div>
                </div>
            </section>

        </section>
    <script type="text/javascript">
        $(document).ready(function () {
            <% string message;try {message  = TempData["message"].ToString();}catch{message="";}%>
            var mess = "<%:message%>";
            if (mess != "") {
                $("#myModal1").modal();
            }
        });
        $("#form").submit(function (e) {
            if (!$('input[type=checkbox]:checked').length) {
                alert("Please select any module to submit !");

                //stop the form from submitting
                return false;
            }

            return true;
        });
    </script>
     <script type="text/javascript">
         var sprycheckbox1 = new Spry.Widget.ValidationCheckbox("sprycheckbox1", { validateOn: ["change"] });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
</asp:Content>
