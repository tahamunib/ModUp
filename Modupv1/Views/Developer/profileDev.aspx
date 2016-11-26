<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Developer/DEVMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.profileViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Developer Profile
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<!--main content start-->
      <section id="main-content">
          <section class="wrapper">      

              <!-- Quiz Description -->
              <div class="row">
                  <div class="">
                      <!--Quiz start-->
                      <section class="panel" >
                        <div class="panel-body project-team" style="background-color:#f9f9f9;">
                            <div class="task-progress col-md-offset-2">
                                  <h1 style="margin-left:.5em; font-size:4em; font-weight:lighter;">My Profile</h1>  
                            </div>
                        </div>
                        
                        <div class="offset-to-mid">
                        	<!--<div class="row margin-top">
                            	
                            	<div class="pull-left col-lg-4" style="padding-left:0px;">
                        			<h1 class="h4 cust-h">Question 1 of 40</h1>
                                </div>
                            	<div class="pull-right col-lg-4">
                        			<h1 class="h4 cust-h pull-right">Time Remaining: 01:00</h1>
                                </div>
                            </div>-->
                        	<div class="row margin-top-more">
                        		<!--<h1 class="h3 cust-h">Which of the following can you NOT do with Photoshop?</h1>-->
                                <div class="col-md-2" style="padding-top:1em; padding-left:0;">
                                	<img src="/img/default_avatar_male.jpg" class="img-responsive img-circle" style="display:inline; border:3px solid rgba(0,0,0,0.1);" alt="Bird" width="100px" height="100px">
                                </div>
                                <div class="col-md-7">
                                	<h1 id="name" class="h3 cust-h hidden-xs" style="margin:0;"><%: Model.tbUser.firstName %> <%: Model.tbUser.lastName %> </h1>
                                	<h1  class="h3 cust-h margin-top visible-xs"><%: Model.tbUser.firstName %> <%: Model.tbUser.lastName %> </h1>
                                	<%if (!(Model.tbDeveloper.tbClient.tagLine.Equals(""))) { %><h1 class="h4 cust-h" style="margin-bottom:0;"><%: Model.tbDeveloper.tbClient.tagLine %></h1><%}else{%><h1 class="h4 cust-h" style="margin-bottom:0;">No Tagline Mentioned</h1>  <%} %>
                                    <h1 class="h4" id="num"><%: Model.tbUser.contactNumber %> </h1>
                                    <h1 class="h4" id="add"><%: Model.tbUser.address %> </h1>
                                	<h1 class="h4" id="loc"><%: Model.tbUser.city %> | <%: Model.tbUser.country %></h1>
                                </div>
                                <script type="text/javascript">
                                    

                                    $('#name').editable('<%:Url.Action("profileDev","Developer")%>', {
                                        method: 'post',
                                        submitdata:{id: '<%:Model.tbUser.userID%>',type:'name'},
                                        event:'click',
                                        onblur: 'submit',
                                        indicator: 'Saving',
                                        callback: function (value, settings) {
                                            var res = $.parseJSON(value);
                                            $('#name').text(res['name']);
                                        }
                                             });
                                         
                                </script>
                               
                                <div class="col-md-3">
                                    <h2 class="h2">Skills</h2>
                                    <%foreach(var skill in Model.tbSkills){ %>
                                    <% int skid = skill.skillID; %>
                                	<h1 class="h3 cust-h" style="margin:0;"><%: skill.name %> -> <%: skill.hourlyRate  %><a style="margin-left:11%;" class="btn btn-primary" href="<%: Url.Action("quizVerify", "Developer", new { id=skid})%>" style="width:120px;">Re-Evaluate</a></h1><%} %>
                                	<h1 class="h2" style="margin-bottom:0;">Availability</h1>
                                	<h1 class="h5 cust-h">More than 30 hrs/week</h1>
                                    
                                	<h1 class="h2" style="margin-bottom:0;">Languages</h1>
                                	<h1 class="h5 cust-h">English: Conversational Self-Assessed</h1>
                                </div>
                            </div>
                            
                            <div class="row margin-top-more">
                                <div class="col-md-12">
                                	<h1 class="h3 cust-h">Overview</h1>
                                	<%if(!(Model.tbDeveloper.tbClient.overview.Equals(""))){ %><h1 class="h4" id="over1"><%:Model.tbDeveloper.tbClient.overview %></h1><%}else{%><h1 class="h4" id="over">Not yet Added.</h1><%} %>
                                </div>
                                <div class="col-md-12">
                                	<h1 class="h3 cust-h">Specialities</h1>
                                    <% foreach(var skill in Model.tbDeveloper.tbSkills){ %>
                                	<h1 class="h4 cust-h"><%: skill.name %></h1>
                                	<%} %>
                                </div>
                                <div class="col-md-12">
                                	<h1 class="h3 cust-h">Portfolio</h1>
                                	<%if(Model.tbDeveloper.tbPortfolios.Count > 0){ foreach(var portfolio in Model.tbDeveloper.tbPortfolios){ %><h1 class="h4 cust-h"><%:portfolio.title %></h1><%}}else{%><h1 class="h4 cust-h">No items available.</h1><%} %>
                                </div>
                                
                                <div class="col-md-12">
                                	<h1 class="h3 cust-h">Education</h1>
                                    <%if(Model.tbDeveloper.tbClient.tbEducations.Count > 0){ foreach(var education in Model.tbDeveloper.tbClient.tbEducations){ %><h1 class="h4 cust-h"><%:education.degree %> | <%: education.year %></h1><%}}else{%><h1 class="h4 cust-h">No items available.</h1><%} %>
                                	
                                	
                                </div>
                                <div class="col-md-12">
                                	<h1 class="h3 cust-h">Experiences</h1>
                                	<%if(Model.tbDeveloper.tbClient.tbExperiences.Count > 0){ foreach(var experience in Model.tbDeveloper.tbClient.tbExperiences){ %><h1 class="h4 cust-h"><%:experience.workedAs %> | <%: experience.duration %></h1><%}}else{%><h1 class="h4 cust-h">No items available.</h1><%} %>
                                </div>
                                <!--<div class="col-md-3">
                                	<h1 class="h3 cust-h" style="margin:0;">$30.33/hr</h1>
                                	<h1 class="h4 cust-h" style="margin-bottom:0;">Availability</h1>
                                	<h1 class="h5 cust-h">More than 30 hrs/week</h1>
                                    
                                	<h1 class="h4 cust-h" style="margin-bottom:0;">Languages</h1>
                                	<h1 class="h5 cust-h">English: Conversational Self-Assessed</h1>
                                </div>-->
                            </div>

                            
                         </div>
                      </section>
                      <!--Quiz end-->
                  </div>

                  
              </div>
              <!-- Quiz Description end -->

          </section>
      </section>
      <!--main content end-->
     <script type="text/javascript">
                                    $('.h4').each(function () {
                                        var currelem = this;
                                        var type = "";
                                        if (currelem.id == 'over' || currelem.id == 'over1') {  $(currelem).editable('<%:Url.Action("profileDev","Developer")%>', {
                                        method: 'post',
                                        submitdata: {
                                            id: '<%:Model.tbUser.userID%>', type: currelem.id },
                                        event:'click',
                                        onblur: 'submit',
                                        type: 'textarea',
                                        height:'150px',
                                        indicator: 'Saving',
                                        callback: function (value, settings) {
                                            var res = $.parseJSON(value);
                                            $(currelem).text(res['name']);
                                        }
                                    });} else {  $(currelem).editable('<%:Url.Action("profileDev","Developer")%>', {
                                        method: 'post',
                                        submitdata: {
                                            id: '<%:Model.tbUser.userID%>', type: currelem.id },
                                        event:'click',
                                        onblur: 'submit',
                                        type: 'text',
                                        
                                        indicator: 'Saving',
                                        callback: function (value, settings) {
                                            var res = $.parseJSON(value);
                                            $(currelem).text(res['name']);
                                        }
                                    }); }
                                   

                                    });
                                </script>
</asp:Content>
