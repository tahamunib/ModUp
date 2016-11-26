<%@ Page Title="" Language="C#" MasterPageFile="~/Views/RequirementEngineer/RAWorkroom.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.projViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Module Details - Project Workroom
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <section id="main-content">
        <section class="wrapper">
            <!--overview start-->
            <div class="row state-overview">

                <!-- statics start -->
                <div class="state col-lg-12">
                    <% int no = Convert.ToInt16(ViewBag.no);
                       int prjID = Convert.ToInt16(ViewBag.projID);
                       int noMod = Convert.ToInt16(ViewBag.noMod);
                       int wrID = Convert.ToInt32(ViewBag.wrID);
                    %>
                    <form class="form-validate form-horizontal " id="register_form" method="post" enctype="multipart/form-data" action="<%: Url.Action("editMod", "RequirementEngineer", new { id = Model.tbModule.modID, wrID = wrID})%>">
                    

                        

                        <!-- Start Of Modules Breakup Form-->

                        <div class="row">
                            <div class="col-lg-12">
                                <section class="panel" style="padding-bottom: 3%; margin-bottom: 3%;">
                                    <header class="panel-heading" style="padding-bottom: 3%; margin-bottom: 3%;">
                                        Module Deatils

                                        
                                    </header>
                                    <div class="panel-body">
                                        <div class="form">

                                            <div class="form-group ">
                                                <label for="fullname" class="control-label col-lg-2">Name Of Module: <span class="required">*</span></label>
                                                <div class="col-lg-10">

                                                    <%: Html.TextBoxFor(model => model.tbModule.title, new { @class = "form-control"})%>
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
                                               <a href="<%:Url.Action("Download", "RequirementEngineer", new { filename=Model.tbModule.filename,of="Module"})%>"> <%:Model.tbModule.filename %> </a>
                                                <div class="col-lg-10">
                                                    <%: Html.TextBoxFor(model => model.file, new {type = "file" }) %>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                
                                                <label for="dtp_input1" class="col-md-2 control-label">Closing Date: <span class="required">*</span></label>
                                                   
                                               
                                                <div class="input-group date form_datetime col-md-5" data-date="<%:System.DateTime.Today.ToString("dd-MM-yyyy")%>" data-date-format="dd MM yyyy" data-link-field="dtp_input1" style="padding-left: 15px;">
                                                   
                                                    <%: Html.TextBoxFor(model => model.tbModule.closeDate, new { @class = "form-control",@size="16",@onchange="valDate(this.value)",@maxlength = "15", @id = "dtp_input1", @type = "text"}) %>
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
                                            <input type="hidden" id="wr" name="wr" value="<%:wrID %>" />
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                        <!-- End Of Modules Breakup Form-->


                       
                        <div class="form-group pull-right" style="width: 300px; padding-top: 3%;">
                            <div class="col-lg-offset-2 col-lg-10">
                                <button class="btn btn-primary" type="submit">Submit</button>
                                <button class="btn btn-default" type="button">Cancel</button>
                            </div>
                        </div>


                    </form>
                </div>
            </div>
        </section>
    </section>
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

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
   
</asp:Content>
