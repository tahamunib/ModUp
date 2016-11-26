<%@ Page Title="" Language="C#" MasterPageFile="~/Views/RequirementEngineer/RAMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.profileViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    profileDevM
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
                                	<img src="/img/msa_logo-280x280.jpg" class="img-responsive img-circle" style="display:inline; border:3px solid rgba(0,0,0,0.1);" alt="Bird" width="100px" height="100px">
                                </div>
                                <div class="col-md-7">
                                	<h1 class="h3 cust-h hidden-xs" style="margin:0;"><%: Model.tbUser.firstName %> <%: Model.tbUser.lastName %> </h1>
                                	<h1 class="h3 cust-h margin-top visible-xs"><%: Model.tbUser.firstName %> <%: Model.tbUser.lastName %> </h1>
                                	<h1 class="h4 cust-h" style="margin-bottom:0;"><%: Model.tbDeveloper.tagLine %></h1>
                                    <h1 class="h4 cust-h"><%: Model.tbUser.contactNumber %> </h1>
                                    <h1 class="h4 cust-h"><%: Model.tbUser.address %> </h1>
                                	<h1 class="h4 cust-h"><%: Model.tbUser.city %> | <%: Model.tbUser.country %></h1>
                                </div>
                                <div class="col-md-3">
                                    <% int skid = Model.tbSkills[0].skillID; %>
                                	<h1 class="h3 cust-h" style="margin:0;"><%: Model.tbSkills[0].name %> <%: Model.tbSkills[0].hourlyRate %></h1><a class="btn btn-primary" href="<%: Url.Action("quizVerify", "Developer", new { id=skid})%>" style="width:120px;">Re-Evaluate</a>
                                	<h1 class="h4 cust-h" style="margin-bottom:0;">Availability</h1>
                                	<h1 class="h5 cust-h">More than 30 hrs/week</h1>
                                    
                                	<h1 class="h4 cust-h" style="margin-bottom:0;">Languages</h1>
                                	<h1 class="h5 cust-h">English: Conversational Self-Assessed</h1>
                                </div>
                            </div>
                            
                            <div class="row margin-top-more">
                                <div class="col-md-12">
                                	<h1 class="h3 cust-h">Overview</h1>
                                	<h1 class="h4 cust-h"><%:Model.tbDeveloper.overview %></h1>
                                </div>
                                <div class="col-md-12">
                                	<h1 class="h3 cust-h">Specialities</h1>
                                    <% foreach(var skill in Model.tbDeveloper.tbSkills){ %>
                                	<h1 class="h4 cust-h"><%: skill.name %></h1>
                                	<%} %>
                                </div>
                                <div class="col-md-12">
                                	<h1 class="h3 cust-h">Portfolio</h1>
                                	<h1 class="h4 cust-h">No items to display.</h1>
                                </div>
                                <div class="col-md-12">
                                	<h1 class="h3 cust-h">Certifications</h1>
                                	<h1 class="h4 cust-h">No items to display.</h1>
                                </div>
                                <div class="col-md-12">
                                	<h1 class="h3 cust-h">Education</h1>
                                	<h1 class="h4 cust-h">Bachelor's, Computer science | Bachelors in Computer Science</h1>
                                	<h1 class="h4 cust-h">Diploma | Arena Multimedia Specialist Program</h1>
                                </div>
                                <div class="col-md-12">
                                	<h1 class="h3 cust-h">Experiences</h1>
                                	<h1 class="h4 cust-h">Gaming | 1998 - present</h1>
                                	<h1 class="h4 cust-h"></h1>
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

</asp:Content>
