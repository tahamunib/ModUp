<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PM/PMWorkroomModule.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.tbModule>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Module Progress - Workroom
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


<section id="main-content">
        <section class="wrapper">
            <!--overview start-->
            <div class="row state-overview">

                <!-- statics start -->
                <div class="state col-lg-12">

                <!-- Project start -->

                    

                        <!-- Start Of Modules Breakup Form-->

                        <div class="row">
                            <div class="col-lg-12">
                              <section class="panel" style="padding-bottom: 3%; margin-bottom: 2%;">
                                    <header class="panel-heading" style="padding-top: 2%; margin-bottom: 3%; font-size: 1.8em; font-weight: lighter;">
                                        <p>Live Progress of <%:Model.title %></p>
                                    </header>
                                    <div class="panel-body">

                                        <div>
                                            <table class="table table-hover">
                                                <tbody>
                                                   
                                                    <tr>
                                                        
                                                        <td>
                                                            <% double totCP = Model.tbAwardedModule.tbModuleWorkrooms.FirstOrDefault().tbModCheckpoints.Count;
                                                               double Comp = Model.tbAwardedModule.tbModuleWorkrooms.FirstOrDefault().tbModCheckpoints.Where(cp => cp.status.Equals("Completed")).Count();
                                                               double per = Math.Round(((Comp / totCP)*100)); 
                                                               %>
                                                            <div class="progress"  style="margin-bottom: 0;">
                                                                <div class="progress-bar progress-bar-info progress-bar-striped" id="<%:Model.modID %>" role="progressbar"
                                                                    aria-valuenow="<%:per %>" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                                                    0% Complete
                                                                </div>
                                                            </div>
                                                            <input id="h" type="hidden" value="<%:per%>"/>
                                                        </td>
                                                    </tr>
                                                   
                                                   
                                                </tbody>
                                            </table>
                                        </div>


                                    </div>



                                </section>
                                
                                 <section class="panel" style="padding-bottom: 2%; margin-bottom: 3%;">
                                    <header class="panel-heading" style="padding-bottom: 2%; margin-bottom: 1%;">
                                        <h3>Checkpoints:</h3>
                                        
                                    </header>
                                    
                                        <table class="table table-hover personal-task">
                                        <thead>
                                            <tr>

                                                <th>
                                                    <h4>Checkpoint</h4>
                                                </th>
                                                
                                                <th>
                                                    <h4>Completion Date</h4>
                                                </th>
                                               
                                                
                                                <th>
                                                    <h4>Status</h4>
                                                </th>
                                                 
                                               
                                            </tr>
                                            </thead>
                                            <%foreach(var item in Model.tbAwardedModule.tbModuleWorkrooms.FirstOrDefault().tbModCheckpoints){ %>
                                            <tr>
                                                <td><%:item.title %></td>
                                                <td><%:item.dueDate %></td>
                                                <td><%:item.status %></td>
                                            </tr>
                                            <%} %>
                                            <tbody>

                                            </tbody>
                                            </table>
                                     </section>
                                </div>
                            </div>
                       
                    </div>
                </div>
            </section>
    </section>

    <script>
        $(document).ready(function () {
            var per = $('#h').val();
            $('#<%:Model.modID%>').width(per + '%');
            $('#<%:Model.modID%>').text(per + '% Completed')
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    
</asp:Content>
