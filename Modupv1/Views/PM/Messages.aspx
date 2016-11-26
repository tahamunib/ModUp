<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PM/PMWorkroom.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.tbProjWorkroom>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Workroom - Messages
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- container section start -->
    <section id="container" class="">
        <!--header start-->



        <!--main content start-->
        <section id="main-content">
            <section class="wrapper">
                <!--overview start-->
                <div class="row state-overview">

                    <!-- statics start -->
                    <div class="state col-lg-12">




                        <div class="row">
                            <div class="col-lg-12">
                                <section class="panel" style="">
                                    <header class="panel-heading" style="padding-top: 2%; margin-bottom: 3%; font-size: 1.2em;">
                                        <p>Messages</p>
                                    </header>
                                   
                                    <div class="panel-body msg_div col-lg-7" style="padding: 1% 0 1% 1%; background-color: #f2f2f2;">
                                        <div class="form">
                                            <%--<form class="form-validate form-horizontal " id="frmFileMes" method="post">--%>
                                                <div class="form-group ">

                                                    <div class="col-lg-11">
                                                        <textarea id="msg" name="msg" class="form-control" rows="5" id="comment"></textarea>
                                                    </div>
                                                </div>

                                                <div class="form-group" style="width: 600px;">
                                                    <div class="col-lg-12">
                                                        <button id="btnSend"  class="btn btn-primary" style="margin-top:2%;" type="submit">Post Message</button>
                                                        <label for="file-upload" class="btn btn-primary" style="margin-top:2%;">
                                                            Attach File
                                                        </label>
                                                        <input type="file"  name="file" id="file-upload" />
                                                        <button class="btn btn-default" style="margin-top:2%;" type="button">Reset</button>
                                                        <br />
                                                        <div style="display:none; padding-top:2%" id="fileDiv">
                                                            <label for="fileLink"><b>File:</b> </label>
                                                            <a id="fileLink"></a>&nbsp; <i id="fileSize"></i>
                                                        
                                                        </div>
                                                    </div>
                                                   <input type="hidden" id="hidFilename"/>

                                                </div>
                                           <%-- </form>--%>


                                        </div>
                                    </div>
                                      
                                    <script type="text/javascript">
                                        $(document).ready(function () {

                                            //SignalR code

                                            var chat = $.connection.messageHub;
                                            chat.client.broadcast = function (name, message, date, attachment) {
                                                $('#hidFilename').val(attachment);
                                               
;                                                var $tr = $('<tr>').append(
                                                                        $('<td>').html('<a href="#">' + name + '</a>'),
                                                                        $('<td>').text(message),
                                                                        $('<td>').text(date),
                                                                        $('<td>').html("<a href='http://localhost:49699/PM/DownloadWR?id=" + <%:Model.wrID%> + "&filename=" + attachment + "'>" + attachment + "</a>")
                                                                    ).prependTo('#tblBody');
                                            };


                                            //End SignalR

                                            $.connection.hub.start().done(function () {
                                                $('#btnSend').click(function (e) {
                                                
                                                    console.log("in button click");
                                                    var sender = '<%:Model.tbAwardedProj.tbProject.tbPM.tbUser.firstName + Model.tbAwardedProj.tbProject.tbPM.tbUser.lastName%>';
                                                    var date = '<%:DateTime.Today.ToString()%>';

                                                    var f = document.getElementById('file-upload');

                                                    
                                                    var mesg = $('#msg').val();
                                                    
                                                    document.getElementById("msg").value = "";

                                                    if (f.files.length > 0) {
                                                        console.log("in file IF");
                                                        if (window.FormData !== undefined) {
                                                            var data = new FormData();
                                                            for (var x = 0; x < f.files.length; x++) {
                                                                data.append("file" + x, f.files[x]);
                                                                console.log('for loop');
                                                            }

                                                            data.append("id", '<%:Model.wrID%>');
                                                            data.append("message", mesg);
                                                            
                                                            console.log('out loop');
                                                            $.ajax({
                                                                url: 'http://localhost:49699/PM/Messages',
                                                                method: 'POST',
                                                                data: data,
                                                                processData: false,
                                                                contentType: false,
                                                                success: function (resp) {
                                                                    $('#fileDiv').css('display', 'none');
                                                                },
                                                                error: function () {
                                                                    alert("Error");
                                                                }
                                                            });
                                                        }
                                                    } else {
                                                        console.log("in else");
                                                        $.ajax({
                                                        url: 'http://localhost:49699/PM/Messages',
                                                        method: 'POST',
                                                        data: { id: '<%:Model.wrID%>', message: mesg },
                                                        success: function (resp) {

                                                            
                                                        },
                                                        error: function () {
                                                            alert("Error");
                                                        }
                                                    });
                                                    }
                                                    $('#msg').text("");
                                                });
                                                
                                            });
                                           

                                            $('#file-upload').change(function () {
                                                var f = document.getElementById('file-upload');
                                                if ('files' in f)
                                                {
                                                    if (f.files.length == 0)
                                                    {
                                                        $("#msg").text("Select any file to upload!");
                                                    } else {
                                                        var x = f.files[0];
                                                        if ('name' in x) {
                                                            if ('size' in x) {
                                                                
                                                                $('#fileDiv').attr("style", "display:block;padding-top:2%;");
                                                                $("#fileLink").text(x.name);
                                                                $("#fileSize").text("("+(x.size/1024).toFixed(2) + "KB)");
                                                            }
                                                        }
                                                        
                                                    }
                                                }
                                                
                                            });

                                });

                                    </script>

                                    <div class="col-lg-4 msg_div pull-right" style="padding: 1% 0 1% 1%; background-color: #f2f2f2;">
                                        <h2 style="margin-top: 0;">Workroom Members:</h2>
                                        <p><a href=""><%: Model.tbAwardedProj.tbProject.tbPM.tbUser.firstName + " " + Model.tbAwardedProj.tbProject.tbPM.tbUser.lastName %></a></p>
                                        <p><a href=""><%: Model.tbAwardedProj.tbRequirementEngineer.tbClient.tbUser.firstName + " " + Model.tbAwardedProj.tbRequirementEngineer.tbClient.tbUser.lastName %></a></p>

                                    </div>
                                </section>
                            </div>
                        </div>




                        <div class="row" style="margin-top: 3%;">
                            <div class="col-lg-12">
                                <div class="panel">
                                    <div class="panel-body" style="margin-left: .8em; margin-right: .8em;">
                                        <div class="task-progress">
                                            <h1 style="margin-top: 0.7em;">Messages</h1>
                                        </div>
                                        <br />
                                        <br />
                                        <br />
                                        <div>
                                            <table id="tblMsg" class="table table-striped table-advance table-hover">
                                                <thead>

                                                    <tr id="header">
                                                        <th class="col-md-2"><i class="icon_profile"></i>Sender </th>
                                                        <th class="col-md-8"><i class="icon_calendar"></i>Message </th>
                                                        <th class="col-md-2"><i class="icon_pin_alt"></i>Date/Time </th>
                                                        <th class="col-md-2"><i class="icon_pin_alt"></i>Attachment </th>
                                                    </tr>
                                                </thead>

                                                <tbody id="tblBody">
                                                </tbody>
                                            </table>

                                        </div>
                                        <br />

                                    </div>
                                </div>
                            </div>
                        </div>

                        <script type="text/javascript">
                            $(document).ready(function () {

                                updateMessagesAll();
                                function updateMessagesAll() {
                                    $("#tblMsg > tbody").html("");
                                    $.ajax({
                                        url: '<%:Url.Action("Messages","PM")%>',
                               method: 'GET',
                               contentType: 'application/json; charset=utf-8',
                               dataType: 'json',
                               success: function (response) {

                                   $.each(response, function (i, item) {
                                       var attach = "";
                                       if (item['attachment'] == "No Attachment") {
                                           attach = "#";
                                       } else {
                                           attach = "http://localhost:49699/PM/DownloadWR?id=" + <%:Model.wrID%> + "&filename=" + item['attachment'];
                                       }
                                       var $tr = $('<tr>').append(
                                                        $('<td>').html('<a href="#">' + item['mfrom'] + '</a>'),
                                                        $('<td>').text(item['text']),
                                                        $('<td>').text(item['dateTime']),
                                                        $('<td>').html("<a href='"+ attach +"'>" + item['attachment'] + "</a>")
                                                    ).appendTo('#tblBody');


                                   });


                               },
                               error: function (XMLHttpRequest, textStatus, errorThrown) {

                                   alert(errorThrown);
                                   alert(textStatus);
                               }
                           });
                     
                       }
                           //function end

                           // call function every 5 seconds


                       });
                        </script>




                    </div>
                    <!-- statics end -->
                </div>
                <!--overview end-->

                <!-- project team & activity start -->

                <!-- project team & activity end -->

            </section>
        </section>
        <!--main content end-->
    </section>
    <!-- container section start -->

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    
    <script src="../../Scripts/jquery.signalR-2.2.0.js"></script>
    <script src="/signalr/hubs"></script>
    <link href="/web-css/msg_pm_dev.css" rel="stylesheet">
    <style>
        input[type="file"] {
            display: none;
        }

        .custom-file-upload {
            border: 1px solid #ccc;
            display: inline-block;
            padding: 6px 12px;
            cursor: pointer;
        }
    </style>
    

    
</asp:Content>
