<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Developer/DevWorkroomModule.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.FileModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Files - Workroom
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
                                    <div class="task-progress">
                                              <h1 style="margin-top:1em; font-weight: 400;">Files</h1>  
                                    </div><br /><br /><br />
                                	<div >
                                          <table class="table table-striped table-advance table-hover">
                                              <thead>
                                                  <tr>
                                                     <td><i class="icon_profile"></i>File</td>
                                                     <td>Size</td>
                                                     <td><i class="icon_pin_alt"></i> Date Uploaded</td>
                                                     <td><i class="icon_pin_alt"></i> By</td>
                                                     <td><input type="file" id="file" name="file" multiple="multiple" style="display:none;"/><button id="btnUpload" class="btn btn-primary" onclick="$('#file').click()"><i class="icon_calendar"></i> Upload Now</button></td>
                                                      
                                                  </tr>
                                              </thead> 
                                              <tbody id="tblBody">
                                                  
                                                  <% foreach(var file in Model.modFiles){ %>
                                                  <tr>
                                                     <td><a href="<%:Url.Action("DownloadWRMod", "PM", new { id = ViewBag.wr, filename = file.filename })%>"><%: file.filename  %></a></td>
                                                     <td><%:Convert.ToInt32(file.size)/1024 %> KB</td>
                                                     <td><%: file.date %></td>
                                                      <td><%: file.uploadedBy %></td>
                                                     <td>
                                                        <% String myname = Session["devname"].ToString();
                                                            if(file.uploadedBy.Equals(myname)){ %>
                                                      <div class="btn-group">
                                                          
                                                          <a  class="btn btn-danger" href="#" data-id="<%:file.filename %>"><i class="icon_close_alt2"></i></a>
                                                      </div>
                                                         <%}else{ %>
                                                         No Action Available.
                                                         <%} %>
                                                      </td>
                                                  </tr>
                                                <%} %> 
                                               </tbody>
                                            </table>
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
      <!--main content end-->
     <script type="text/javascript">
         $(document).ready(function () {
             $('#file').change(function () {

                 var f = document.getElementById("file");
                 if (f.files.length > 0) {
                     console.log("in file IF");
                     if (window.FormData !== undefined) {
                         var data = new FormData();
                         for (var x = 0; x < f.files.length; x++) {
                             data.append("file" + x, f.files[x]);
                             console.log('for loop' + x);
                         }

                         data.append("wr", '<%:ViewBag.wr%>');
                        console.log("2");
                        $.ajax({
                            url: '<%:Url.Action("filesMod","Developer")%>',
                            method: 'POST',
                            data: data,
                            processData: false,
                            contentType: false,
                            datatype: 'json',
                            success: function (resp) {
                                $.each(resp, function (index, row) {
                                    $.each(row, function (key, value) {

                                        var $tr = $('<tr>').append(
                                           $('<td>').html("<a href='http://localhost:49699/Developer/DownloadWRMod/?id=" +<%:ViewBag.wr%> +"&filename=" + value.filename + "'>" + value.filename + "</a>"),
                                           $('<td>').text(parseInt(parseInt(value.size) / 1024) + "KB"),
                                           $('<td>').text(value.date),
                                           $('<td>').html(value.uploadedBy),
                                           $('<td>').html("<td><div class='btn-group'> <a class='btn btn-danger' href='#' data-id='" + value.filename + "'><i class='icon_close_alt2'></i></a></div> </td>")
                                        ).prependTo('#tblBody');
                                    });
                                });
                            },
                            error: function () {
                                alert("Error");
                            }
                        });

                    }
                }
            });


            $('.btn.btn-danger').unbind().click(function () {
                console.log('delete');
                var fName = $(this).data('id');
                var wrID = '<%:ViewBag.wr%>';
                $(this).parents('tr').attr('id', wrID);
                $.ajax({
                    url: '<%:Url.Action("remFileModWR","Developer")%>',
                    method: 'POST',
                    data: { id: wrID, name: fName },

                    datatype: 'json',
                    success: function (resp) {
                        console.log('delSuccess');
                        $('#' + wrID).remove();
                    }
                });
            });

        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    <link href="/web-css/files_pm_dev.css" rel="stylesheet">
    <style>
    input[type="file"] {
            display: none;
        }
        </style>
</asp:Content>
