<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PM/PMWorkroom.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.tbProjProposal>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Workroom - Proposal
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!--overview start-->
            <div class="row state-overview">

                <!-- statics start -->
                <div class="state col-lg-12">
                
                    <form class="form-validate form-horizontal " id="register_form" >

                        <!-- Start Of Modules Breakup Form-->

                        <div class="row">
                            <div class="col-lg-12">
                                <section class="panel" style="padding-bottom: 3%; margin-bottom: 3%;">
                                    <header class="panel-heading" style="padding-bottom: 3%; margin-bottom: 0%;">
                                       <div class="panel-body project-team" style="background-color:#f9f9f9;">
                            <div class="task-progress col-md-offset">
                                  <h1 style="margin-left:.5em; font-size:4em; font-weight:lighter;">Proposal Details</h1>  
                            </div>
                        </div> 
                             
                              
                                    </header>

                                    
                <div class="offset-to-mid-propTable" >
                    
                        <table class="table table-striped table-advance table-hover" border="1" bordercolor="#f1f1f1">
                            <tbody>
                                <tr>
                                    <th class="table-head">REQUIREMENT ENGINEER</th>
                                    <th class="table-head">EXPERIENCE</th>
                                    <th class="table-head">TOTAL EARNING</th>
                                    <th class="table-head">BID (USD)</th>
                                </tr>
                               
                                 
                                <tr id="parent">
                                    <td>
                                        <table>
                                            <tbody>
                                                <tr style="margin-left:2%;">
                                                    <td rowspan="3">
                                                        <img src="/img/msa_logo-280x280.jpg" class="img-responsive img-circle" style="display: inline; border: 3px solid rgba(0,0,0,0.1); margin-right: 15px;" alt="Bird" width="70px" height="70px">
                                                    </td>
                                                    <td>
                                                        <a style="font-size:25px;" href="<%: Url.Action("viewProfile", new { id = Model.tbRequirementEngineer.tbClient.userID})%>"><%: Model.tbRequirementEngineer.tbClient.tbUser.firstName %> <%: Model.tbRequirementEngineer.tbClient.tbUser.lastName %></a>      
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>

                                    <td>
                                        <%: Model.tbRequirementEngineer.tbClient.awardedProjects %> Projects Analysed
                                    </td>
                                    <td>$ <%: Model.tbRequirementEngineer.tbClient.totalEarning %>
                                    </td>
                                    <td>$ <%: Model.bidAmt %>
                                    </td>
                                </tr>
                               
                            </tbody>
                        </table>
                    </div>

                

                                    <div class="panel-body">
                                        <div class="form">

                                            <div class="form-group ">
                                                <label for="fullname"  class="control-label col-lg-2">Requirement Engineer Overview: </label>
                                                <div class="col-lg-10">
                                                    
                                                   <p><%:  Model.tbRequirementEngineer.tbClient.overview %></p> 
                                                </div>
                                                <br />
                                                 <label for="fullname" class="control-label col-lg-2">Cover Letter: </label>
                                                <div class="col-lg-10">
                                                    
                                                    <p><%:  Model.coverLetter %></p>
                                                </div>
                                            </div>
                                            

                                        </div>
                                    </div>
                                    <br />
                                    
                                    <div>
                                        <br />
                                    </div>
                                </section>
                               
                            </div>
                        </div>
                        <!-- End Of Modules Breakup Form-->

                    </form>
                    
                </div>
                <!-- statics end -->
            </div>
            <!--overview end-->

            <!-- project team & activity start -->

            <!-- project team & activity end -->

        </section>
    </section>
    <!--main content end-->

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
</asp:Content>
