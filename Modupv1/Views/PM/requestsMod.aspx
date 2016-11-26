<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PM/PMWorkroomModule.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.RequestModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Requests
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
                                <% if(Model.ModRequests.Count > 0){%>
                                 <section id="secMod" class="panel" style="padding-bottom: 2%; margin-bottom: 3%;">
                                    <header class="panel-heading" style="padding-bottom: 2%; margin-bottom: 1%;">
                                        <h3>Module Request:</h3>


                                    </header>

                                    <table class="table table-striped table-advance">
                                        <thead>
                                            <tr>

                                                <th>
                                                    <h4>Request</h4>
                                                </th>

                                                <th>
                                                    <h4>Issue Date</h4>
                                                </th>


                                                <th>
                                                    <h4>Attachment</h4>
                                                </th>
                                                <th>
                                                    <h4>Status</h4>
                                                </th>
                                                <th>
                                                    <h4>Action</h4>
                                                </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                           




                                                  <%foreach (var item in Model.ModRequests)
                                                  { %>

                                            <tr>

                                                <td>
                                                    <% string modID = Convert.ToString(item.title); %>

                                                    <a href="#<%:modID%>" data-toggle="modal">
                                                        <p class="profile-name"><%: item.title%></p>
                                                    </a>


                                                </td>


                                                <td>
                                                    <p class="profile-name"><%: item.date%></p>

                                                </td>
                                                <%if (item.filename.Equals("N/A"))
                                                  { %>
                                                <td>

                                                    <p class="profile-name">No File Attached.</p>
                                                </td>
                                                <%}
                                                  else if (!(item.filename.Equals("")))
                                                  {%>
                                                <td>
                                                    <a class="profile-name" href="<%:Url.Action("DownloadTestLog", "PM", new { id = item.tbModuleWorkroom.wrID, filename = item.filename})%>"><%: item.filename%></a>

                                                </td>
                                                <%} %>
                                                <td>
                                                    <p class="profile-name"><%: item.status%></p>


                                                </td>
                                                <%if (item.status.Equals("Pending Approval"))
                                                  { %>
                                                <td>

                                                    <a id="btnModYes" class="btn btn-primary" href="#modYes" data-toggle="modal" data-id="<%:item.reqID%>"><i class="glyphicon glyphicon-ok"></i></a>
                                                    <a id="btnModNo" class="btn btn-warning" href="#modNo" data-toggle="modal" data-id="<%:item.reqID%>"><i class="icon_close_alt2"></i></a>


                                                </td>
                                                <%}
                                                  else
                                                  { %>
                                                <td>
                                                    <p class="profile-name">No Actions Available. </p>
                                                </td>
                                                <%} %>
                                            </tr>


                                            <%
                                              }
                                             %>
                                            
                                        </tbody>
                                    </table>
                                   
                                </section>
                                <%} %>
                                <section class="panel" style="padding-bottom: 2%; margin-bottom: 3%;">
                                    <header class="panel-heading" style="padding-bottom: 2%; margin-bottom: 1%;">
                                        <h3>Checkpoint Requests:</h3>


                                    </header>

                                    <table class="table table-striped table-advance">
                                        <thead>
                                            <tr>

                                                <th>
                                                    <h4>Request</h4>
                                                </th>

                                                <th>
                                                    <h4>Issue Date</h4>
                                                </th>


                                                <th>
                                                    <h4>Attachment</h4>
                                                </th>
                                                <th>
                                                    <h4>Status</h4>
                                                </th>
                                                <th>
                                                    <h4>Action</h4>
                                                </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%if (Model.ChPRequests.Count > 0)
                                              {




                                                  foreach (var item in Model.ChPRequests)
                                                  { %>

                                            <tr>

                                                <td>
                                                    <% string modID = Convert.ToString(item.title); %>

                                                    <a href="#<%:modID%>" data-toggle="modal">
                                                        <p class="profile-name"><%: item.title%></p>
                                                    </a>


                                                </td>


                                                <td>
                                                    <p class="profile-name"><%: item.date%></p>

                                                </td>
                                                <%if (item.files.Equals("N/A"))
                                                  { %>
                                                <td>

                                                    <p class="profile-name">No File Attached.</p>
                                                </td>
                                                <%}
                                                  else if (!(item.files.Equals("")))
                                                  {%>
                                                <td>
                                                    <a class="profile-name" href="<%:Url.Action("DownloadChk", "PM", new { id = item.chkID, filename = item.files})%>"><%: item.files%></a>

                                                </td>
                                                <%} %>
                                                <td>
                                                    <p class="profile-name"><%: item.status%></p>


                                                </td>
                                                <%if (item.status.Equals("Pending Approval"))
                                                  { %>
                                                <td>

                                                    <a class="btn btn-success" href="#reqYes" data-toggle="modal" data-id="<%:item.reqID%>"><i class="glyphicon glyphicon-ok"></i></a>
                                                    <a class="btn btn-danger" href="#reqNo" data-toggle="modal" data-id="<%:item.reqID%>"><i class="icon_close_alt2"></i></a>


                                                </td>
                                                <%}
                                                  else
                                                  { %>
                                                <td>
                                                    <p class="profile-name">No Actions Available. </p>
                                                </td>
                                                <%} %>
                                            </tr>


                                            <%}
                                              }
                                              else
                                              {%>
                                            <tr>
                                                <th>
                                                    <h5>No Request Submitted Yet.</h5>
                                                </th>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                   
                                </section>

                            </div>
                        </div>
                        <!-- End Of Modules Breakup Form-->

                   

                    <!-- Project end -->
                    <!-- Accept CPRequest start -->

                    <div class="modal fade" id="reqYes" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header" style="padding: 35px 50px;">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h2><span class="glyphicon icon-form-1"></span>Confirmation ?</h2>
                                </div>
                                <div class="modal-body" style="padding: 40px 50px;">
                                    <form role="form" method="post">

                                        <div class="form-group">
                                            <p class="h4 cust-p">
                                                Mark Checkpoint as Completed ?
                                            </p>


                                        </div>
                                        <input type="hidden" id="hidReq" name="hidReq" value="" />

                                        <button type="button" id="btnYes" class="btn btn-success btn-block">Yes</button>
                                        <button type="button" id="btnNo" class="btn btn-danger btn-block">No</button>

                                    </form>
                                </div>

                            </div>

                        </div>
                    </div>

                    <!-- Reject CPRequest start -->

                    <div class="modal fade" id="reqNo" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header" style="padding: 35px 50px;">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h2><span class="glyphicon icon-form-1"></span>Confirmation ?</h2>
                                </div>
                                <div class="modal-body" style="padding: 40px 50px;">
                                    <form role="form" method="post">

                                        <div class="form-group">
                                            <p class="h4 cust-p">
                                                Reject Request of Completion ?
                                            </p>


                                        </div>
                                        <input type="hidden" id="hidReqNo" name="hidReqNo" value="" />

                                        <button type="button" id="btnYesn" class="btn btn-success btn-block">Yes</button>
                                        <button type="button" id="btnNon" class="btn btn-danger btn-block">No</button>

                                    </form>
                                </div>

                            </div>

                        </div>
                    </div>

                     <!-- Module Request Accept -->

                    <div class="modal fade" id="modYes" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header" style="padding: 35px 50px;">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h2><span class="glyphicon icon-form-1"></span>Confirmation ?</h2>
                                </div>
                                <div class="modal-body" style="padding: 40px 50px;">
                                    <form role="form" method="post">

                                        <div class="form-group">
                                            <p class="h4 cust-p">
                                                Mark Checkpoint as Completed ?
                                            </p>


                                        </div>
                                        <input type="hidden" id="hidReqMod" name="hidReq" value="" />

                                        <button type="button" id="btnYesMod" class="btn btn-primary btn-block">Yes</button>
                                        <button type="button" id="btnNoMod" class="btn btn-default btn-block">No</button>

                                    </form>
                                </div>

                            </div>

                        </div>
                    </div>

                    <!-- Moule Request Reject -->

                    <div class="modal fade" id="modNo" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header" style="padding: 35px 50px;">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h2><span class="glyphicon icon-form-1"></span>Confirmation ?</h2>
                                </div>
                                <div class="modal-body" style="padding: 40px 50px;">
                                    <form role="form" method="post">

                                        <div class="form-group">
                                            <p class="h4 cust-p">
                                                Reject Request of Completion ?
                                            </p>


                                        </div>
                                        <input type="hidden" id="hidReqNoMod" name="hidReqNoMod" value="" />

                                       <button type="button" id="btnYesModn" class="btn btn-primary btn-block">Yes</button>
                                        <button type="button" id="btnNoModn" class="btn btn-default btn-block">No</button>

                                    </form>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
    <script>
        $(document).ready(function () {

            $('#btnModYes').unbind().click(function () {
                var reqID = $(this).data('id');
                $(this).parents('td').prev('td').attr('id', reqID);
                $("#modYes .modal-body #hidReqMod").val(reqID);
                //alert(reqID);
            });

            $('#btnYesMod').unbind().click(function () {
                console.log('in accept mod Yes');
                var reqID = $('#hidReqMod').val();
                alert(reqID);
                $.ajax({
                    url: '<%:Url.Action("requestsHandler","PM")%>',
                method: 'post',
                data: { id: reqID, req: 'Yes', reqType: 'Module' },
                datatype: 'json',
                success: function (resp) {
                    if (resp.ChReq == "Accepted") {
                        console.log('success -> accepted');
                        $('#modYes').modal('hide');
                        $('#' + reqID).html('<p class="profile-name">Approved</p>');
                        $('#' + reqID).next('td').html('<p class="profile-name">No Actions Available.</p>');
                    }
                    else if (resp.ChReq == "Rejected") {
                        console.log('success -> rejected');
                        $('#modYes').modal('hide');
                        $('#' + reqID).html('<p class="profile-name">Rejected</p>');
                        $('#' + reqID).next('td').html('<p class="profile-name">No Actions Available.</p>');
                    }
                },
                error: function () {
                    console.log('error');
                }
            });
            });
            $('#btnYesModn').unbind().click(function () {
                var reqID = $('#hidReqNoMod').val();
                alert(reqID);
                $.ajax({
                    url: '<%:Url.Action("requestsHandler","PM")%>',
                method: 'post',
                data: { id: reqID, req: 'No', reqType: 'Module' },
                datatype: 'json',
                success: function (resp) {
                    if (resp.ChReq == "Accepted") {
                        console.log('success -> accepted');
                        $('#modNo').modal('hide');
                        $('#' + reqID).html('<p class="profile-name">Approved</p>');
                        $('#' + reqID).next('td').html('<p class="profile-name">No Actions Available.</p>');
                    }
                    else if (resp.ChReq == "Rejected") {
                        console.log('success -> rejected');
                        $('#modNo').modal('hide');
                        $('#' + reqID).html('<p class="profile-name">Rejected</p>');
                        $('#' + reqID).next('td').html('<p class="profile-name">No Actions Available.</p>');
                    }
                },
                error: function () {
                    console.log('error');
                }
            });
            });

            $('#btnNoMod').click(function () {
                $('#modYes').modal('hide');
            });
            $('#btnNoModn').click(function () {
                $('#modNo').modal('hide');
            });

            $('#btnModNo').unbind().click(function () {
                var reqID = $(this).data('id');
                $(this).parents('td').prev('td').attr('id', reqID);
                $("#modNo .modal-body #hidReqNoMod").val(reqID);
                //alert(reqID);
            });

            $('.btn.btn-success').unbind().click(function () {

                console.log('btn success');
                var reqID = $(this).data('id');
                
                //alert();
                $(this).parents('td').prev('td').attr('id', reqID);
                $("#reqYes .modal-body #hidReq").val(reqID);


            });

            $('.btn.btn-danger').unbind().click(function () {


                var reqID = $(this).data('id');
                alert(reqID);
                $(this).parents('td').prev('td').attr('id', reqID);
                $("#reqNo .modal-body #hidReqNo").val(reqID);


            });

            $('#btnNo').unbind().click(function () {
                $('#reqYes').modal('hide');
            });

            $('#btnNon').unbind().click(function () {
                $('#reqNo').modal('hide');
            });

            $('#btnYes').unbind().click(function () {
                var reqID = $('#hidReq').val();
                alert(reqID);
                $.ajax({
                    url: '<%:Url.Action("requestsHandler","PM")%>',
                method: 'post',
                data: { id: reqID, req: 'Yes', reqType: 'Checkpoint' },
                datatype: 'json',
                success: function (resp) {
                    if (resp.ChReq == "Accepted") {
                        console.log('success -> accepted');
                        $('#reqYes').modal('hide');
                        $('#' + reqID).html('<p class="profile-name">Approved</p>');
                        $('#' + reqID).next('td').html('<p class="profile-name">No Actions Available.</p>');
                    }
                    else if (resp.ChReq == "Rejected") {
                        console.log('success -> rejected');
                        $('#reqYes').modal('hide');
                        $('#' + reqID).text('Rejected');
                    }
                },
                error: function () {
                    console.log('error');
                }
            });
        });

            $('#btnYesn').unbind().click(function () {
                var reqID = $('#hidReqNo').val();
                alert(reqID);
                $.ajax({
                    url: '<%:Url.Action("requestsHandler","PM")%>',
                    method: 'post',
                    data: { id: reqID, req: 'No', reqType: 'Checkpoint' },
                    datatype: 'json',
                    success: function (resp) {
                        if (resp.ChReq == "Accepted") {
                            console.log('success -> accepted');
                            $('#reqNo').modal('hide');
                            $('#' + reqID).html('<p class="profile-name">Approved</p>');
                            $('#' + reqID).next('td').html('<p class="profile-name">No Actions Available.</p>');
                        }
                        else if (resp.ChReq == "Rejected") {
                            console.log('success -> rejected');
                            $('#reqNo').modal('hide');
                            $('#' + reqID).html('<p class="profile-name">Rejected</p>');
                            $('#' + reqID).next('td').html('<p class="profile-name">No Actions Available.</p>');
                        }
                    },
                    error: function () {
                        console.log('error');
                    }
                });
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
</asp:Content>
