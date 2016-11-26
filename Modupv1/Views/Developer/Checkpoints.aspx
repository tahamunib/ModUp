<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Developer/DevWorkroomModule.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.tbModuleWorkroom>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Checkpoints
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
                            <div class="panel">
                                <div class="panel-body" style="margin-left:.8em; margin-right:.8em;">
                                    <br />
                                    <div class="state col-lg-8">
                                    		<div class="row">
                                                <div class="col-lg-12">
                                                    <div class="panel">
                                                        <div class="panel-body" style="margin-left:.8em; margin-right:.8em;">
                                                            <div class="task-progress">
                                                                      <h1 style="margin-top:0.7em;">Modules Checkpoints</h1>
                                                            </div><br /><br /><br />
                                                             <br />
                                                              
                                                          </div>      
                                                             
															 <div id='calendar'></div>                            
                                                    </div>
                                                </div>                        
                                            </div>
                                        
                                   </div>
                                    <div class="state col-lg-4">
                                    <div class="row">
                                        <div class="panel-body">
                                           <h1> <%:Model.tbAwardedModule.tbModule.title %></h1>
                                            <br />
                                            <h3 style="margin-top:0;"><%: Model.tbAwardedModule.tbModule.tbProject.title %></h3>
                                            <table class="table">
                                                <tr>
                                                    <%if(Model.tbModCheckpoints.Count > 0){ %>
                                                            
                                                         <% if(Model.tbModCheckpoints.Any(cp=>cp.status.Equals("Pending Approval") || cp.status.Equals("Working"))){%>
                                                            <td><h4>No Action Available.</h4></td>
                                                        <%}else{ %>
                                                                <% if(Model.tbModRequests.Count == 0){ %>
                                                                        <td><h4>Mark Module As Complete?</h4></td>
                                                                        <td id="btn"><button id="markComp" class="btn btn-success"><i class="glyphicon glyphicon-ok"></i></button></td>
                                                                <%} else if (Model.tbModRequests.FirstOrDefault().status.Equals("Pending Approval"))
                                                                   { %>
                                                                        <td><h4>Module Committed, request waiting for approval by client.</h4></td>
                                                                <%} else if(Model.tbModRequests.FirstOrDefault().status.Equals("Rejected")){ %>
                                                                        <td><h4>Mark Module As Complete?</h4></td>
                                                                        <td id="btn"><button id="markComp" class="btn btn-success"><i class="glyphicon glyphicon-ok"></i></button></td>
                                                                <%}else if (Model.tbModRequests.FirstOrDefault().status.Equals("Approved"))
                                                                   { %>
                                                                        <td><h4>Module Completed.</h4></td>
                                                                <%} %>
                                                            <%} %>
                                                    <%}else{ %>
                                                             <% if(Model.tbModRequests.Count == 0){ %>
                                                                        <td><h4>Mark Module As Complete?</h4></td>
                                                                        <td id="btn"><button id="markComp" class="btn btn-success"><i class="glyphicon glyphicon-ok"></i></button></td>
                                                                <%} else if (Model.tbModRequests.FirstOrDefault().status.Equals("Pending Approval"))
                                                                   { %>
                                                                        <td><h4>Module Committed, request waiting for approval by client.</h4></td>
                                                                <%} else if(Model.tbModRequests.FirstOrDefault().status.Equals("Rejected")){ %>
                                                                        <td><h4>Mark Module As Complete?</h4></td>
                                                                        <td id="btn"><button id="markComp" class="btn btn-success"><i class="glyphicon glyphicon-ok"></i></button></td>
                                                                <%}else if (Model.tbModRequests.FirstOrDefault().status.Equals("Approved"))
                                                                   { %>
                                                                        <td><h4>Module Completed.</h4></td>
                                                                <%} %>
                                                    <%} %>
                                                </tr>

                                            </table> 
                                            
                                                         
                                        </div>
                                    </div>
                                    </div>
                                	<div >
                                          <table class="table table-striped table-advance table-hover">
                                               <thead>                                                
                                                    <tr>
                                                     <td><i class="icon_profile"></i> List of Checkpoints </td>
                                                     <td><i class="icon_pin_alt"></i> Delivery Date</td>
                                                     <td>Status</td>
                                                     <td>Actions</td>
                                                  </tr>
                                                   </thead>

                                              <tbody id="tbChk">
                                                   <%foreach(var item in Model.tbModCheckpoints){ %>
                                                  <tr>
                                                     <td><a href="#"><%:item.title %></a></td>
                                                     <td><%:item.dueDate %></td>
                                                     <td id="stat<%:item.chkID%>"><%:item.status %></td>
                                                     <td>
                                                         <%if(item.status.Equals("Completed") || item.status.Equals("Pending Approval")){ %>
                                                                 No Actions Available.
                                                         <%}else{ %>
                                                         <div class="btn-group">
                                                          <a class="btn btn-success" href="#<%:item.chkID%>" data-toggle="modal"><i class="glyphicon glyphicon-ok"></i></a>
                                                          
                                                          <a class="btn btn-danger" href="#delModal" data-toggle="modal" data-id="<%:item.chkID%>"><i class="icon_close_alt2"></i></a>
                                                      </div>
                                                         <%} %>
                                                      </td>
                                                  </tr>
                                                            <%} %>
                                               </tbody>
                                            </table>
                                            
                                            <div class="form-group" style="width:300px;">
                                              <div>
                                                  <button class="btn btn-primary" type="submit"><i class="icon_calendar"></i> &nbsp;&nbsp;Create New Checkpoints</button>
                                                  <!--<button class="btn btn-default" type="button">Create a New Milestone</button>-->
                                              </div>
                                             </div>  
                                     </div>
                                     <br />
                                      
                                  </div>                                
                            </div>
                        </div>                        
                    </div>
                </div>    
                <!-- statics end -->
              </div>
              <!--overview end-->

              <!-- project team & activity start -->
              
              <!-- project team & activity end -->

          </section>
      </section>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#markComp').click(function () {
                    //alert("In complete Func");
                    var modID = parseInt('<%:Model.modID%>');
                    var countTotal = parseInt('<%:Model.tbModCheckpoints.Count%>');
                    var devType = '<%:Model.tbAwardedModule.tbModule.devType%>';
                    var countCompleted = parseInt('<%:Model.tbModCheckpoints.Where(m=>m.status.Equals("Completed")).Count()%>');
                    if (countTotal > 0) {
                        if (countCompleted == countTotal) {
                            if (devType == 'Test Driven Development') {
                                
                                $('#compModal').modal('show');
                                $('#compModal .modal-body #hideModID').val(modID);
                            }
                            else {
                                $('#compModal2').modal('show');
                                $('#compModal2 .modal-body #hideModID').val(modID);
                            }
                        }
                    }
                });
            });
    </script>
      <!--main content end-->
    <%-- Create Checkpint MOdal --%>
                        <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="padding: 35px 50px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h1><span class="glyphicon icon-form-1"></span>Create Checkpoint</h1>
                                    </div>
                                    <div class="modal-body" style="padding:8%;">
                                  

                                        <form class="form" role="form">
                                            <div class="form-group">
                                                <label for="title"><h2>Title:</h2></label>
                                                <input id="title" type="text" placeholder="Enter Title for the checkpoint.." class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="desc"><h2>Description:</h2></label>
                                                <input id="desc" type="text" placeholder="Description" class="form-control"/>
                                            </div>
                                             <button type="button" id="btnCreate" class="btn btn-success btn-block"><span class="glyphicon glyphicon-ok-circle"></span>Create</button>
                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>
    <%-- Del Confirm Message Modal --%>
      <div class="modal fade" id="delModal" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="padding: 35px 50px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h1><span class="glyphicon icon-form-1"></span>Confirmation</h1>
                                    </div>
                                    <div class="modal-body" style="padding:8%;">
                                       
                                        <p>Are you Sure you want to Delete this Checkpoint?</p>
                                       <input type="hidden" id="hidChk" name="hidChk" value=""/>
                                        <button type="button" id="btnYes" class="btn btn-success btn-block">Yes</button>
                                         <button type="button" id="btnNo" class="btn btn-danger btn-block">No</button>
                                    </div>

                                </div>

                            </div>
      </div>
    <%foreach(var item in Model.tbModCheckpoints){ %>
     <div class="modal fade" id="<%:item.chkID%>" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="padding: 35px 50px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h1><span class="glyphicon icon-form-1"></span>Attach Files with Request ?</h1>
                                    </div>
                                    <div class="modal-body" style="padding:8%;">
                                      
                                        <form class="form" role="form">
                                           
                                            <div class="form-group">
                                                <label for="file-upload<%:item.chkID%>" class="btn btn-primary">
                                                            Attach File
                                                        </label>
                                                <input type="file"  name="file" id="file-upload<%:item.chkID%>" />
                                                <br />
                                                <div style="display:none; padding-top:2%;" id="fileDiv<%:item.chkID%>">
                                                            <label for="fileLink<%:item.chkID%>"><b>File:</b> </label>
                                                            <a id="fileLink<%:item.chkID%>"></a>&nbsp; <i id="fileSize<%:item.chkID%>"></i>
                                                        
                                                </div>
                                                <label id="msg<%:item.chkID%>" style="display:none;"/>
                                            </div>
                                            <div>
                                             <a id="btnWithAtt<%:item.chkID%>" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-ok-circle"></span> Yes, Attach & Send</a>
                                             <a id="btnWithAtt1<%:item.chkID%>" class="btn btn-warning btn-block"><span class="glyphicon glyphicon-arrow-right"></span> No, Proceed without Attachment</a>
                                                </div>
                                        </form>
                                    </div>

                                </div>

                            </div>
         <script>
             $(document).ready(function () {
                 $('#file-upload<%:item.chkID%>').change(function () {
                     var f = document.getElementById('file-upload<%:item.chkID%>');
                     if ('files' in f) {
                         console.log("in file change");
                         if (f.files.length == 0) {
                             $("#msg").text("Select any file to upload!");
                         } else {
                             console.log("file uploaded");
                             var x = f.files[0];
                             if ('name' in x) {
                                 console.log("if name of file");
                                 if ('size' in x) {
                                     $("#msg<%:item.chkID%>").attr("style", "display:none;");
                                     $('#fileDiv<%:item.chkID%>').attr("style", "display:block;padding-top:2%;");
                                     
                                     $('#fileLink<%:item.chkID%>').text(x.name);
                                     $('#fileSize<%:item.chkID%>').text("(" + (x.size / 1024).toFixed(2) + "KB)");
                                 }
                             }

                         }
                     }

                 });


                 $('#testUpload').change(function () {
                     var f = document.getElementById('testUpload');
                     if ('files' in f) {
                         console.log("in test change");
                         if (f.files.length == 0) {
                             $("#msg").text("Select a file to upload!");
                         } else {
                             console.log("file uploaded");
                             var x = f.files[0];
                             if ('name' in x) {
                                 console.log("if name of file");
                                 if ('size' in x) {
                                     $("#msg").attr("style", "display:none;");
                                     $('#testDiv').attr("style", "display:block;padding-top:2%;");

                                     $('#testLink').text(x.name);
                                     $('#testSize').text("(" + (x.size / 1024).toFixed(2) + "KB)");
                                 }
                             }

                         }
                     }

                 });

                 $('#btnWithAtt<%:item.chkID%>').click(function () {
                     console.log('button1 clickd');
                     var f = document.getElementById('file-upload<%:item.chkID%>');
                     if ('files' in f) {
                         console.log("in file change");
                         if (f.files.length == 0) {
                             $("#msg<%:item.chkID%>").attr("style", "display:block;");
                             $("#msg<%:item.chkID%>").text("Select any file to upload!");
                         } else {
                             $("#msg<%:item.chkID%>").attr("style", "display:none;");
                             var formData = new FormData();
                             formData.append('reqAttach', f.files[0]);
                             formData.append('wrID', '<%:item.wrID%>');
                             formData.append('chkID', '<%:item.chkID%>');
                             formData.append('type', 'Checkpoint');
                             $.ajax({
                                 url: '<%:Url.Action("Requests","Developer")%>',
                                 method: 'post',
                                 data: formData,
                                 dataType: 'json',
                                 contentType: false,
                                 processData: false,
                                 success: function (result) {
                                     //alert('Request Sent !');
                                     $('#<%:item.chkID%>').modal().hide();
                                     $('#stat<%:item.chkID%>').text("Pending Approval");
                                     $('#stat<%:item.chkID%>').next('td').text("No Actions Available");
                                 }
                                 
                             });
                         }
                     }
                 });
                 
                 $('#btnWithAtt1<%:item.chkID%>').click(function () {
                     console.log('button2 clickd');
                 

                            var formData = new FormData();
                             
                             formData.append('wrID', '<%:item.wrID%>');
                             formData.append('chkID', '<%:item.chkID%>');
                             formData.append('type', 'Checkpoint');
                             $.ajax({
                                 url: '<%:Url.Action("Requests","Developer")%>',
                                 method: 'post',
                                 data: formData,
                                 dataType: 'json',
                                 contentType: false,
                                 processData: false,
                                 success: function (result) {
                                     //alert('Request Sent !');
                                     $('#<%:item.chkID%>').modal().hide();
                                     $('#stat<%:item.chkID%>').text("Pending Approval");
                                     $('#stat<%:item.chkID%>').next('td').text("No Actions Available");
                                 },
                                 error: function (result) {
                                     alert(result);
                                 }
                                 
                             });
                        
                 });
                

                 $('.btn.btn-danger').unbind().click(function () {
                     
                     
                     var chkID = $(this).data('id');
                     $(this).parents('tr').attr('id', chkID)
                     $("#delModal .modal-body #hidChk").val(chkID);
                    
                     
                 });


                 $('#btnNo').unbind().click(function () {
                     $('#delModal').modal('hide');
                 });


                 $('#btnYes').unbind().click(function () {
                     var chkID = $('#hidChk').val();
                    var tit = $('#' + chkID).find('a').text();
                     $.ajax({
                         url: '<%:Url.Action("DelCheckpoint","Developer")%>',
                         method: 'post',
                         data: { id: chkID },
                         datatype: 'json',
                         success: function (resp) {
                             $('#delModal').modal('hide');
                           
                             $('#' + chkID).remove();
                             reloadCalendar(tit);
                         }
                     });
                 });
                 function reloadCalendar(tit) {
                     
                     $('#calendar').fullCalendar('removeEvents', function (event) {
                         if (event.title == tit)
                             return true;
                     });
         
                 }

                 $('#btnProceed').unbind().click(function () {
                     var f = document.getElementById('testUpload');
                     if ('files' in f) {
                         console.log("in file change");
                         if (f.files.length == 0) {
                             $("#msg").attr("style", "display:block;");
                             $("#msg").text("Select any file to upload!");
                         } else {
                             $("#msg").attr("style", "display:none;");
                             var formData = new FormData();
                             formData.append('reqAttach', f.files[0]);
                             formData.append('wrID', '<%:item.wrID%>');
                             formData.append('type', 'Module');
                             $.ajax({
                                 url: '<%:Url.Action("Requests","Developer")%>',
                                 method: 'post',
                                 data: formData,
                                 dataType: 'json',
                                 contentType: false,
                                 processData: false,
                                 success: function (result) {
                                     //alert('Request Sent !');
                                     $('#compModal').modal().hide();
                                     $('#btn').prev('td').html('<h4>Test Log Committed, request waiting for approval by client.</h4>');

                                     $('#btn').remove();
                                     $('#calendar').css("display", "none");
                                 },
                                 error: function (resp) {
                                     alert(error+ ":" + resp);
                                 }

                             });
                         }
                     }
                 });

                 $('#btnCancel').unbind().click(function () {
                     $('#compModal').modal('hide');
                 });

                 $('#btnProceedGen').unbind().click(function () {
                     var formData = new FormData();
                     formData.append('wrID', '<%:item.wrID%>');
                     formData.append('type', 'Module');
                     $.ajax({
                         url: '<%:Url.Action("Requests","Developer")%>',
                                 method: 'post',
                                 data: formData,
                                 dataType: 'json',
                                 contentType: false,
                                 processData: false,
                                 success: function (result) {
                                     console.log("in success gen dev req module");
                                     $('#compModal2').modal().hide();
                                     $('#btn').prev('td').html('<h4>Module Committed, request waiting for approval by client.</h4>');
                                     $('#btn').remove();
                                 },
                                 error: function (resp) {
                                     alert(error + ":" + resp);
                                 }

                             });
                 });

                 $('#btnCancelGen').unbind().click(function () {
                     $('#compModal2').modal('hide');
                 });

             });
             
         </script>

                        </div>
    <%} %>

    <%-- Mark Complete Modal --%>
     <div class="modal fade" id="compModal" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="padding: 35px 50px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h1><span class="glyphicon icon-form-1"></span>Commit Test Log</h1>
                                    </div>
                                    <div class="modal-body" style="padding:8%;">
                                        <form class="form" role="form">
                                            <div class="form-group">
                                                <p class="profile-name">
                                                    Please Upload Tests Log of this Module
                                                </p>
                                            </div>
                                           <div class="form-group">
                                                <label for="testUpload" class="btn btn-primary">
                                                            Attach File
                                                        </label>
                                                <input type="file"  name="file" id="testUpload" />
                                                <br />
                                                <div style="display:none; padding-top:2%;" id="testDiv">
                                                            <label for="testLink"><b>File:</b> </label>
                                                            <a id="testLink"></a>&nbsp; <i id="testSize"></i>
                                                        
                                                </div>
                                                <label id="msg" style="display:none;"/>
                                            </div>
                                           
                                             <button type="button" id="btnProceed" class="btn btn-success btn-block"><span class="glyphicon glyphicon-ok-circle"></span>Commit</button>
                                            <button type="button" id="btnCancel" class="btn btn-danger btn-block"><span class="icon_close"></span>Cancel</button>
                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>


     <div class="modal fade" id="compModal2" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="padding: 35px 50px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h1><span class="glyphicon icon-form-1"></span>Confirmation</h1>
                                    </div>
                                    <div class="modal-body" style="padding:8%;">
                                        <form class="form" role="form">
                                            <div class="form-group">
                                                <p class="profile-name">
                                                    Do you want to send module completion request ?
                                                </p>
                                            </div>
                                           
                                           
                                             <button type="button" id="btnProceedGen" class="btn btn-success btn-block"><span class="glyphicon glyphicon-ok-circle"></span>Commit</button>
                                            <button type="button" id="btnCancelGen" class="btn btn-danger btn-block"><span class="icon_close"></span>Cancel</button>
                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">

     <style>
    
        body {
            margin: 40px 10px;
            padding: 0;
            font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
            font-size: 14px;
        }

        #calendar {
            max-width: 900px;
            margin: 0 auto;
        }
     
        input[type="file"] {
            display: none;
        }

        .custom-file-upload {
            border: 1px solid #ccc;
            display: inline-block;
            padding: 6px 12px;
            cursor: pointer;
        }

        .fc-event-time{
            display : none;
        }
    
    </style>
     
    <script src="/js/moment.min.js"></script>
    <script src="/js/fullcalendar.min.js"></script>
     <link href="/web-css/checkpoints_dev.css" rel="stylesheet">
     <link href="/web-css/fullcalendar.css" rel="stylesheet" />
     <link href="/web-css/fullcalendar.print.css" rel="stylesheet" media="print" />

     <script>

         $(document).ready(function () {
            <% if(Model.tbModCheckpoints.Count > 0){
                   if (Model.tbModRequests.Count > 0) { 
                   %>
             var status = '<%:Model.tbModRequests.FirstOrDefault().status%>';
             if (status == "Pending Approval" || status == "Approved") {
                 $('#calendar').css("display", "none");
                 
             }
             <%} }%>
             var moment = $('#calendar').fullCalendar('getDate');
            
             var n = moment.toString();
             
             
             
             $('#calendar').fullCalendar({
                 header: {
                     left: 'prev,next',
                     center: 'title',
                     right: 'month,agendaWeek,agendaDay'
                 },
                 defaultDate: moment,
                 selectable: true,
                 selectHelper: true,
                 select: function (start, end) {
                     console.log(start);
                     var title,desc;
                     $('#myModal').modal();
                     $('#btnCreate').click(function () {
                         title = $('#title').val();
                         desc = $('#desc').val();
                         $('#myModal').hide();
                         
                         
                         var eventData;
                         if (title) {
                             eventData = {
                                 title: title,
                                 start: start,
                                 description: desc,
                                 end: end
                             };
                             console.log(eventData);
                             $('#calendar').fullCalendar('renderEvent', eventData, true);
                         }
                         
                          

                         $('#calendar').fullCalendar('unselect');
                        
                          $.ajax({
                             url: '<%:Url.Action("Checkpoints","Developer")%>',
                             method: 'post',
                             data: {id:'<%:TempData["wrid"].ToString()%>',name:eventData.title,date:eventData.start.toString(),desc:eventData.description,end:eventData.end.toString()},
                             success: function (resp) {
                                 console.log("Success:" + resp);
                                 location.reload();
                                // $('#tbChk').prepend("<tr><td><a href='#'>" + + "</a></td><td>"+ +"</td> <td id='stat4'>Working</td><td><div class='btn-group'><a class=btn btn-success' href='#4' data-toggle='modal'><i class='glyphicon glyphicon-ok'></i></a><a class='btn btn-danger' href='#'><i class='icon_close_alt2'></i></a></div></td> </tr>");
                             },
                             error: function (resp) {
                                 console.log("Error:" + resp);
                                 alert("Error Creating Checkpoint");
                             }
                         });

                     });

                    
                 },
                 editable: true,
                 eventLimit: true,

             });
             <%foreach (var item in Model.tbModCheckpoints){%>
             var evData = {
                 title: '<%:item.title%>',
                 start: '<%:item.dueDate%>',
                 description: '<%:item.description%>',
                 end:'<%:item.end%>'
                
             };
             $('#calendar').fullCalendar('renderEvent', evData, true);
             <%}%>

             
         });

    </script>
</asp:Content>
