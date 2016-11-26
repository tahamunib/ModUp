<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PM/PMMaster.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.projViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    initiateProj
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!--overview start-->
            <div class="row state-overview">

                <!-- statics start -->
                <div class="state col-lg-12">




                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel" style="padding-bottom: 3%; margin-bottom: 3%;">
                                <header class="panel-heading" style="padding-bottom: 3%; margin-bottom: 3%;">
                                    Project
                                </header>
                                <div class="panel-body">
                                    <div class="form">
                                        <form class="form-validate form-horizontal " id="register_form" method="post" enctype="multipart/form-data" >
                                            <span id="sprytextfield3">
                                                <div class="form-group ">
                                                    <label for="fullname" class="control-label col-lg-2">Project Title: <span class="required">*</span></label>
                                                    <div class="col-lg-10">
                                                        <%--<input class=" form-control" id="fullname" name="fullname" type="text" />--%>
                                                        <%: Html.TextBoxFor(model => model.tbProject.title, new { @class = "form-control"}) %>
                                                        <%: Html.ValidationMessageFor(model => model.tbProject.title) %>
                                                    </div>
                                                </div>
                                                <span class="textfieldRequiredMsg">* This field is required</span></span>
                                            
                                                <div class="form-group ">
                                                    <label for="dtp_input1" class="col-md-2 control-label">Estimated Completion Date: <span class="required">*</span></label>
                                                    <div class="input-group date form_datetime col-md-5" data-date="<%:System.DateTime.Today.ToString("yyyy-MM-dd")%>" data-date-format="dd MM yyyy " data-link-field="dtp_input1" style="padding-left: 15px;">
                                                        <input class="form-control" size="16" type="text" value="" maxlength="15">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                                    </div>
                                                   <span id="sprytextfield4"> <div class="col-lg-10">
                                                        <%-- <input class=" form-control" id="address" name="address" type="text" />--%>
                                                        <%: Html.TextBoxFor(model => model.tbProject.closeDate, new { @class = "form-control", @id = "dtp_input1", @type = "hidden"}) %>
                                                        <%: Html.ValidationMessageFor(model => model.tbProject.closeDate) %>
                                                    </div><span class="textfieldRequiredMsg">* This field is required</span></span>
                                                </div>
                                            
                                            <span id="sprytextarea1">
                                                <div class="form-group ">
                                                    <label for="username" class="control-label col-lg-2">Project Requirement Description:<span class="required">*</span></label>
                                                    <div class="col-lg-10">
                                                        <%--	<textarea class="form-control" rows="5" id="comment"></textarea>--%>
                                                        <%: Html.TextAreaFor(model => model.tbProject.description, new { @class = "form-control",@row = "8"}) %>
                                                        <%: Html.ValidationMessageFor(model => model.tbProject.description) %>
                                                    </div>
                                                </div><span class="textfieldRequiredMsg">* This field is required</span>
                                            </span>
                                            <div class="form-group ">
                                                <label for="confirm_password" class="control-label col-lg-2">File Upload:</label>
                                                <div class="col-lg-10">
                                                    <%: Html.TextBoxFor(model => model.file, new {type = "file", accept=".doc,.docx,.pdf"}) %>
                                                </div>
                                            </div>
                                             <span id="spryselect2">
                                                <div class="form-group ">
                                                    <label for="confirm_password" class="control-label col-lg-2">Project Technology: <span class="required">*</span></label>
                                                    <div class="col-lg-10">
                                                        
                                                       <%:
                   Html.DropDownListFor(model => model.tbProject.technology,new List<SelectListItem> { 
                       
                       new SelectListItem { Value = "DotNet" , Text = ".Net" },
                       new SelectListItem { Value = "PHP" , Text = "PHP" },
                       new SelectListItem { Value = "JSP" , Text = "Java Server Pages" },
                       new SelectListItem { Value = "Python" , Text = "Python" },
                       new SelectListItem { Value = "Bootstrap" , Text = "Bootstrap" },
                       new SelectListItem { Value = "Other" , Text = "Other" }
                       
                    }, new { @class = "form-control", @id="ddTech"}
                  )%>

                                                        <%: Html.TextBoxFor(model => model.tbProject.technology, new { @class = "form-control", @id = "tbTech", style = "margin-top:1%;"})%>
                                                    </div>
                                                </div><span class="textfieldRequiredMsg">* This field is required</span>
                                            </span>
                                            <span id="sprytextfield6">
                                                <div class="form-group ">
                                                    <label for="confirm_password" class="control-label col-lg-2">Estimated Amount of Whole Project: <span class="required">*</span></label>
                                                    <div class="col-lg-10">
                                                        <%--<input class="form-control " id="username" name="username" type="number" />--%>
                                                        <%: Html.TextBoxFor(model => model.tbProject.estimatedAmt, new { @class = "form-control"}) %>
                                                    </div>
                                                </div><span class="textfieldRequiredMsg">* This field is required</span>
                                            </span>
                                            <span id="sprycheckbox1">
                                                <div class="form-group ">
                                                    <label for="agree" class="control-label col-lg-2 col-sm-3">Agree to Our Policy <span class="required">*</span></label>
                                                    <div class="col-lg-10 col-sm-9">
                                                        <input type="checkbox" style="width: 20px" class="checkbox form-control" id="agree" name="agree" />
                                                    </div>
                                                </div><span id="checkboxRequiredMsg" class="checkboxRequiredMsg">Please make a selection.</span>
                                            </span>
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
                        </div>
                    </div>


                    <!-- Start Of Modules Breakup Form-->

<script type="text/javascript">
    
    var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "none", { validateOn: ["change"] });
    
    
    
    var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1", { validateOn: ["change"] });
   
    var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6", "none", { validateOn: ["change"] });
    var spryselect2 = new Spry.Widget.ValidationSelect("spryselect2", { validateOn: ["change"] });
    var sprycheckbox1 = new Spry.Widget.ValidationCheckbox("sprycheckbox1", { validateOn: ["change"] });
</script>
    







                </div>
                <!-- statics end -->
            </div>
            <!--overview end-->

            <!-- project team & activity start -->

            <!-- project team & activity end -->
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
                                        <form role="form" action="<%:Url.Action("Projects","PM") %>">

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
                                            <%--<button type="submit" data-dismiss="modal" class="btn btn-primary btn-block"><span class="glyphicon "></span>Ok</button>--%>
                                           <%-- <button type="submit" class="btn btn-success btn-block"><span class="glyphicon "></span>No</button>--%>
                                             <button class="btn btn-primary btn-block" type="submit">OK</button>
                                             

                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>
                      <!-- Modal No of Mod end -->


        </section>
    </section>
     <script type="text/javascript">
         $(document).ready(function () {
             $('#tbTech').hide();

            <% string message;try {message  = TempData["message"].ToString();}catch{message="";}%>
             var mess = "<%:message%>";
             if (mess != "") {
                 $("#myModal2").modal();
             }

             $('#ddTech').change(function () {
                 if ($(this).val() == "Other") {
                     $('#tbTech').toggle("Show");
                     
                 } else {
                     $('#tbTech').toggle("Hide");
                 }

             });

         });
    </script>
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
</asp:Content>
