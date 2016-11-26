<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PM/PMMaster.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.projViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Project Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!--overview start-->
            <div class="row state-overview">

                <!-- statics start -->
                <div class="state col-lg-12">

                    <form class="form-validate form-horizontal " id="register_form">

                        <!-- Start Of Modules Breakup Form-->

                        <div class="row">
                            <div class="col-lg-6" style="padding-right: 0;">
                                <section class="panel" style="padding-bottom:3%; margin-bottom:2%;margin-top:5%;">
                                    <header class="panel-heading" style="padding-bottom: 3%; margin-bottom: 3%;">
                                        <h3>Project Details:</h3>


                                    </header>
                                    <div class="panel-body">
                                        <div class="form">

                                            <div class="form-group ">
                                                <label for="fullname" class="control-label col-lg-2">Project Title: </label>
                                                <div class="col-lg-10">
                                                    <%-- <input class=" form-control" id="fullname" name="fullname" type="text" />--%>
                                                    <%:  Model.tbProject.title %>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="address" style="padding-left:4%;" class="control-label col-lg-2">Description: </label>
                                                <div class="col-lg-10">
                                                    <%--<input class=" form-control" id="address" name="address" type="text" />--%>
                                                    <%: Model.tbProject.description %>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="username" class="control-label col-lg-2">Post on: </label>
                                                <div class="col-lg-10">
                                                    <%--<textarea class="form-control" rows="5" id="comment"></textarea>--%>
                                                    <%: Model.tbProject.postDate %>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="password" class="control-label col-lg-2">Deadline: </label>
                                                <div class="col-lg-10">
                                                    <%--<input class="form-control " id="username" name="username" type="text" />--%>
                                                    <%: Model.tbProject.closeDate %>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="confirm_password" class="control-label col-lg-2">Project Status: </label>
                                                <div class="col-lg-10">
                                                    <%--<input class="form-control " id="username" name="username" type="number" />--%>
                                                    <%: Model.tbProject.status %>
                                                </div>
                                            </div>
                                            <%if (Model.tbProject.status.Equals("Analyzed") || Model.tbProject.status.Equals("Analysis"))
                                              { %>
                                            <div class="form-group ">
                                                <label for="confirm_password" class="control-label col-lg-2">Requirement Engineer </label>
                                                <div class="col-lg-10">
                                                    <%: Model.tbProject.tbAwardedProj.tbRequirementEngineer.tbClient.tbUser.firstName %>  <%: Model.tbProject.tbAwardedProj.tbRequirementEngineer.tbClient.tbUser.lastName %>
                                                </div>
                                            </div>
                                            <%} %>
                                            <% if (Model.tbProject.status.Equals("Closed"))
                                               { %>
                                            <div class="form-group ">
                                                <label for="confirm_password" class="control-label col-lg-2">No of Modules: </label>
                                                <div class="col-lg-10">

                                                    <%: Model.tbProject.tbModules.Count %>
                                                </div>
                                            </div>
                                            <%} %>
                                        </div>
                                    </div>
                                </section>
                                <!--project team start-->

                            </div>
                            <div class="col-lg-6">
                                <section class="panel" style="padding-bottom: 3%; margin-bottom: 2%; margin-top: 5%;">
                                    <header class="panel-heading" style="padding-top: 2%; margin-bottom: 3%; font-size: 1.8em; font-weight: lighter;">
                                        <p>Live Progress of Awarded Modules</p>
                                    </header>
                                    <div class="panel-body">

                                        <div>
                                            <table class="table table-hover">
                                                <tbody>
                                                    <%foreach(var mod in Model.tbProject.tbModules.Intersect(Model.tbProject.tbModules.Where(m=>m.status.Equals("Working") || m.status.Equals("Pending Approval") || m.status.Equals("Completed")))){ %>
                                                    <tr>
                                                        <td><a href="#"><%:mod.title %></a></td>
                                                        <td>
                                                            <% double totCP = mod.tbAwardedModule.tbModuleWorkrooms.FirstOrDefault().tbModCheckpoints.Count;
                                                               double Comp = mod.tbAwardedModule.tbModuleWorkrooms.FirstOrDefault().tbModCheckpoints.Where(cp => cp.status.Equals("Completed")).Count();
                                                               double per = Math.Round(((Comp / totCP)*100)); 
                                                               %>
                                                            <div class="progress"  style="margin-bottom: 0;">
                                                                <div class="progress-bar progress-bar-info progress-bar-striped" id="<%:mod.modID %>" role="progressbar"
                                                                    aria-valuenow="<%:per %>" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                                                    0% Complete
                                                                </div>
                                                            </div>
                                                            <input id="h<%:mod.modID%>" type="hidden" value="<%:per%>"/>
                                                        </td>
                                                    </tr>
                                                   
                                                   <%} %>
                                                </tbody>
                                            </table>
                                        </div>


                                    </div>



                                </section>
                            </div>
                        </div>
                        <!-- End Of Modules Breakup Form-->
                        <div class="row">
                            <div class="col-lg-12">
                                <% if (Model.tbProject.status.Equals("Closed"))
                                   { %>

                                <section class="panel">
                                    <header class="panel-heading" style="padding-bottom: 3%; margin-bottom: 3%;">
                                        <h3>Project Modules:</h3>

                                        <%--<div class="btn-group pull-right">

                                  <a class="btn btn-danger"  data-toggle="modal" data-target="#myModal" id="plus" href="#"><i class="icon_plus-box"></i></a>
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
                                                    <h4>Closing Date</h4>
                                                </th>
                                                <th>
                                                    <h4>Status</h4>
                                                </th>
                                                <th>
                                                    <h4>Bids</h4>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% 
                                       foreach (var item in Model.tbProject.tbModules)
                                       { %>

                                            <tr>

                                                <td>
                                                    <% string modID = Convert.ToString(item.modID);
                                                       string action = "";
                                                       if (item.status.Equals("Working") || item.status.Equals("Pending Approval") || item.status.Equals("Completed")) { action = "MessagesMod"; }
                                                       else if (item.status.Equals("Open")) { action = "viewBidsMod"; }
                                                    %>

                                                    <a class="" href="<%:Url.Action(action, "PM", new { id=item.modID})%>">
                                                        <p class="profile-name"><%: item.title %></p>
                                                    </a>

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
                                                    <p class="profile-name"><%: item.closeDate %></p>

                                                </td>
                                                <td>
                                                    <p class="profile-name"><%: item.status %></p>

                                                </td>
                                                <td>
                                                    <p class="profile-name"><%: item.tbProposals.Count %></p>

                                                </td>
                                            </tr>


                                            <%} %>
                                        </tbody>
                                    </table>
                                </section>
                                <!--Project Team end-->
                                <%} %>
                            </div>
                        </div>
                    </form>

                    <!--Project Breakup -->
                    <%--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">Add Modules</button>--%>
                    <%--<div class="modal fade" id="myModal1" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header" style="padding: 35px 50px;">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4><span class="glyphicon icon-form-1"></span>Add Module</h4>
                                </div>
                                <div class="modal-body" style="padding: 40px 50px;">
                                    <form role="form" method="get" action="<%: Url.Action("modulesBreak", "PM") %>">

                                        <div class="form-group">
                                            <label for="usrname">No of Modules:</label>
                                            <input type="text" class="form-control" id="no" name="no" placeholder="Enter Number of Modules">
                                        </div>

                                         <% string prjID = Convert.ToString(Model.tbProject.projID);%>
                                        <input type="hidden" id="prj" name="prj" value="<%:prjID %>" />
                                        <button type="submit" class="btn btn-success btn-block"><span class="glyphicon icon-task-l"></span>Break</button>
                                    </form>
                                </div>

                            </div>

                        </div>
                    </div>--%>

                    <%--<div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="padding: 35px 50px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4><span class="glyphicon icon-form-1"></span>Add Module</h4>
                                    </div>
                                    <div class="modal-body" style="padding: 40px 50px;">
                                        <form role="form" method="post" action="<%: Url.Action("modulesBreak", "PM") %>">

                                            <div class="form-group">
                                                <label for="usrname">Title</label>

                                                <%: Html.TextBoxFor(model => model.tbModules[0].title, new { @class = "form-control"}) %>
                                            </div>
                                            <div class="form-group">
                                                <label for="psw">Description</label>
                                                <%: Html.TextBoxFor(model => model.tbModules[0].description, new { @class = "form-control"}) %>
                                               
                                            </div>

                                            <div class="form-group">
                                                <label for="psw">Estimated Amount</label>
                                                <%: Html.TextBoxFor(model => model.tbModules[0].budget, new { @class = "form-control"}) %>
                                                
                                            </div>
                                            <div class="form-group">
                                                <label for="dtp_input1">DateTime Picking: <span class="required">*</span></label>
                                                <div class="input-group date form_datetime" data-date="2015-09-16T05:25:07Z" data-date-format="dd MM yyyy " data-link-field="dtp_input1" style="padding-left: 15px;">
                                                    <input class="form-control" type="text" value="" maxlength="0">
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                                </div>

                                                <%: Html.TextBoxFor(model => model.tbModules[0].closeDate, new { @class = "form-control", @id = "dtp_input1", @type = "hidden"}) %><br />

                                            </div>
                                            <div class="form-group">
                                                <label for="psw">Developer Skill Level</label>
                                                <%:
                   Html.DropDownListFor(model => model.tbModules[0].devSkillLevel,new List<SelectListItem> { 
                       new SelectListItem { Value = "Beginner" , Text = "Beginner" },
                       new SelectListItem { Value = "Intermediate" , Text = "Intermediate" },
                       new SelectListItem { Value = "Expert" , Text = "Expert" },
                       
                    }, new { @class = "form-control"}
                  )%>

                                                
                                            </div>
                                            <div class="form-group">
                                                <label for="psw">Category</label>
                                                <%: Html.TextBoxFor(model => model.tbModules[0].category, new { @class = "form-control"}) %>
                                                
                                            </div>
                                            <input type="hidden" id="prj" name="prj" value="<%:prjID %>" />
                                            <button type="submit" class="btn btn-success btn-block"><span class="glyphicon "></span>Add</button>
                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>--%>
                </div>
                <!-- statics end -->
            </div>
            <!--overview end-->

            <!-- project team & activity start -->

            <!-- project team & activity end -->

        </section>
    </section>
    <!--main content end-->
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
    <script type="text/javascript">
        $(document).ready(function () {
            <%foreach (var mod in Model.tbProject.tbModules.Intersect(Model.tbProject.tbModules.Where(m => m.status.Equals("Working") || m.status.Equals("Pending Approval") || m.status.Equals("Completed"))))
              { %>
            var per = $('#h<%:mod.modID%>').val();
            
            $('#<%:mod.modID%>').width(per + '%');
            $('#<%:mod.modID%>').text(per + '% Completed')
            <%}%>
        });
    </script>
</asp:Content>
