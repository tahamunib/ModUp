<%@ Page Title="" Language="C#" MasterPageFile="~/Views/RequirementEngineer/RAWorkroom.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.projViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    modulesBreak
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!--overview start-->
            <div class="row state-overview">

                <!-- statics start -->
                <div class="state col-lg-12">


                    <% int no = Convert.ToInt16(ViewBag.no);
                       int prjID = Model.tbProject.projID;
                       int noMod = Convert.ToInt16(ViewBag.noMod);
                       int wrID = Convert.ToInt32(ViewBag.wrID);
                    %>

                    

                    <!-- Project start -->

                    <form class="form-validate form-horizontal " id="register_form">

                        <!-- Start Of Modules Breakup Form-->

                        <div class="row">
                            <div class="col-lg-12">
                                <section class="panel" style="padding-bottom: 3%; margin-bottom: 3%;">
                                    <header class="panel-heading" style="padding-bottom: 3%; margin-bottom: 3%;">
                                        <h3>Project Details:</h3>
                                        <div class="pull-right">
                                        <button type="button" style="margin-top:-25px;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Project Division -></button>
                                        </div>
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
                                                <label for="address" class="control-label col-lg-2">Description: </label>
                                                <div class="col-lg-10">
                                                    <%--<input class=" form-control" id="address" name="address" type="text" />--%>
                                                    <%: Model.tbProject.description %>
                                                </div>
                                            </div>
                                            <%if(Model.tbProject.fileName.Equals("")){ %>
                                            <div class="form-group ">
                                                <label for="address" class="control-label col-lg-2">Project File: </label>
                                                <div class="col-lg-10">
                                                    <a href="#">N/A</a>
                                                   
                                                </div>
                                            </div>
                                            <%} else{%>
                                                 <div class="form-group ">
                                                <label for="address" class="control-label col-lg-2">Project File: </label>
                                                <div class="col-lg-10">
                                                    
                                                    <a href="<%:Url.Action("Download", new {fileame = Model.tbProject.fileName })%>"><%: Model.tbProject.fileName %></a>
                                                </div>
                                            </div>
                                            <%} %>
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
                                                    <%: Model.tbProject.closeDate.AsDateTime().ToShortDateString() %>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="confirm_password" class="control-label col-lg-2">Project Status: </label>
                                                <div class="col-lg-10">
                                                    <%--<input class="form-control " id="username" name="username" type="number" />--%>
                                                    <%: Model.tbProject.status %>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="confirm_password" class="control-label col-lg-2">Client </label>
                                                <div class="col-lg-10">
                                                    <%: Model.tbProject.tbPM.tbUser.firstName %>  <%: Model.tbProject.tbPM.tbUser.lastName %>
                                                </div>
                                            </div>

                                            <div class="form-group ">
                                                <label for="confirm_password" class="control-label col-lg-2">No of Modules: </label>
                                                <div class="col-lg-10">

                                                    <%: Model.tbProject.tbModules.Count %>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </section>
                                <%if(Model.tbProject.tbModules.Count > 0){ %>
                                 <section class="panel" style="padding-bottom: 3%; margin-bottom: 3%;">
                                    <header class="panel-heading" style="padding-bottom: 2%; margin-bottom: 1%;">
                                        <h3>Project Modules:</h3>
                                        <div class="pull-right">
                                        <button type="button" style="margin-top:-37px;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">Add Module</button>
                                        </div>
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
                                      foreach (var item in Model.tbProject.tbModules)
                                                { %>

                                            <tr>

                                                <td>
                                                    <% string modID = Convert.ToString(item.modID); %>
                                                    
                                                        <p class="profile-name"><%: item.title %></p>
                                                    
                                                    
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
                                            </tr>


                                            <%} %>
                                        </tbody>
                                    </table>
                                       
                                     </section>
                                <%} %>
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
                                        <h2><span class="glyphicon icon-form-1"></span>Project Division</h2>
                                    </div>
                                    <div class="modal-body" style="padding: 40px 50px;">
                                        <form role="form" method="get" action="<%: Url.Action("submitModules", "RequirementEngineer")%>">

                                            <div class="form-group">
                                                <label for="usrname">Number of Modules</label>
                                                <%--<input class="form-control " id="username" name="username" type="number" />--%>
                                                <input class="form-control" type ="text" id="count" placeholder="Enter the number of modules for this project.." name="count"/>
                                                
                                            </div>
                                            
                                            <input type="hidden" id="prj" name="prj" value="<%:prjID %>" />
                                            <input type="hidden" id="wr" name="wr" value="<%:wrID %>"/>
                                            <button type="submit" class="btn btn-success btn-block"><span class="glyphicon "></span>Add</button>
                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>
                      <!-- Modal No of Mod end -->

                      <!-- Modal Add Mod start -->

                            
                         <div class="modal fade" id="myModal1" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="padding: 35px 50px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4><span class="glyphicon icon-form-1"></span>Add Module</h4>
                                    </div>
                                    <div class="modal-body" style="padding: 40px 50px;">
                                        <form role="form" method="post" action="<%: Url.Action("submitModules", "RequirementEngineer") %>">


                                            
                                                <!--project team start-->
                              
                                     <div class="form-group ">
                                                <label for="fullname" class="control-label col-lg-2">Name Of Module: <span class="required">*</span></label>
                                                <div class="col-lg-10">

                                                    <%: Html.TextBoxFor(model => model.tbModules[0].title, new { @class = "form-control"})%>
                                                    <%: Html.ValidationMessageFor(model => model.tbModule.title) %>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="address" class="control-label col-lg-2">Estimated Amount: <span class="required">*</span></label>
                                                <div class="col-lg-10">

                                                    <%: Html.TextBoxFor(model => model.tbModule.budget, new { @class = "form-control"}) %>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="username" class="control-label col-lg-2">Description <span class="required">*</span></label>
                                                <div class="col-lg-10">

                                                    <%: Html.TextAreaFor(model => model.tbModule.description, new { @class = "form-control", @rows = "8"}) %>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="username" class="control-label col-lg-2">Skill Required <span class="required">*</span></label>
                                                <div class="col-lg-10">

                                                    <%: Html.TextBoxFor(model => model.tbModule.skillReq, new { @class = "form-control"}) %>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="confirm_password" class="control-label col-lg-2">Development Type <span class="required">*</span></label>
                                                <div class="col-lg-10">
                                                    <%:
                   Html.DropDownListFor(model => model.tbModule.devType,new List<SelectListItem> { 
                       new SelectListItem { Value = "General Development" , Text = "General" },
                       new SelectListItem { Value = "Test Driven Development" , Text = "Test Driven Development" },
                      
                       
                    }, new { @class = "form-control", id="typeDev", onchange="selChange(this.value)"}
                  )%>
                                                </div>
                                            </div>
                                           
                                            <div class="form-group" style="display: none;" id="fileUpload">
                                                <label for="confirm_password" class="control-label col-lg-2">Test Cases: <span class="required">*</span></label>
                                                <div class="col-lg-10">
                                                    <%: Html.TextBoxFor(model => model.file, new {type = "file" }) %>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label for="dtp_input1" class="col-md-2 control-label">DateTime Picking: <span class="required">*</span></label>
                                                <div class="input-group date form_datetime col-md-5" data-date="<%:System.DateTime.Today.ToString("yyyy-MM-dd")%>" data-date-format="dd MM yyyy" data-link-field="dtp_input1" style="padding-left: 15px;">
                                                    <input class="form-control" size="16" type="text" value="" maxlength="15">
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                                </div>
                                                <%: Html.TextBoxFor(model => model.tbModule.closeDate, new { @class = "form-control", @id = "dtp_input1", @type = "hidden"}) %><br />
                                            </div>

                                            <div class="form-group ">
                                                <label for="confirm_password" class="control-label col-lg-2">Developer Skill Level: <span class="required">*</span></label>
                                                <div class="col-lg-10">

                                                    <%:
                   Html.DropDownListFor(model => model.tbModule.devSkillLevel,new List<SelectListItem> { 
                       new SelectListItem { Value = "Beginner" , Text = "Beginner" },
                       new SelectListItem { Value = "Intermediate" , Text = "Intermediate" },
                       new SelectListItem { Value = "Expert" , Text = "Expert" },
                       
                    }, new { @class = "form-control"}
                  )%>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="confirm_password" class="control-label col-lg-2">Select Category: <span class="required">*</span></label>
                                                <div class="col-lg-10">

                                                    <%:
                   Html.DropDownListFor(model => model.tbModule.category,new List<SelectListItem> { 
                       new SelectListItem { Value = "UI-HTML" , Text = "UI-HTML" },
                       new SelectListItem { Value = "Back End-Development" , Text = "Back End-Development" },
                       new SelectListItem { Value = "UI-Javascript" , Text = "UI-Javascript" },
                       new SelectListItem { Value = "Integration" , Text = "Integration" },
                       new SelectListItem { Value = "Back End-Database" , Text = "Back End-Database" },
                       new SelectListItem { Value = "Web API" , Text = "Web API" },
                       
                       
                    }, new { @class = "form-control"}
                  )%>
                                                </div>
                                            </div>

                                            <input type="hidden" id="count" name="count" value="<%:no %>" />
                                            <input type="hidden" id="prj" name="prj" value="<%:prjID %>" />

                                
                                <!--Project Team end-->


                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>

                     <!-- Modal Add Mod end -->

                </div>
                <!-- statics end -->
            </div>

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
    <script>
        function selChange(value) {
            var fInput = document.getElementById("fileUpload");
            if (value == "Test Driven Development") {
                
                fInput.style.display = "block";
            } else {
                fInput.style.display = "none";
            }
        }
        </script>
</asp:Content>
