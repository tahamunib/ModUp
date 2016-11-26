<%@ Page Language="C#"  Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.LoginModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="store">
   
    
     <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>modup</title>
    <!--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.10/angular.js" type="text/javascript"></script>
    -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/angularjs-min.js"></script>

        
    <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link href="web-css/stylemain.css" rel="stylesheet" type="text/css">
    </head>


    



    <body>
        <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
 <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" >
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
               <%: Html.TextBoxFor(model => model.UserName) %>
               <%: Html.ValidationMessageFor(model => model.UserName) %>
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <%--<input type="text" class="form-control" id="psw" placeholder="Enter password">--%>
                 <%: Html.TextBoxFor(model => model.Password) %>
               <%: Html.ValidationMessageFor(model => model.Password) %>
            </div>
            <div class="checkbox">
              <%--<label><input type="checkbox" value="" checked style="margin-top:13px">Remember me</label>--%>
               <%:Html.CheckBoxFor(model => model.RememberMe) %> 

            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <!--<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>-->
          <p>Not a member? <span data-dismiss="modal" data-toggle="modal" data-target="#myModal2" id="myBtnSignUp"><a href="#">Sign Up</a></span></p>
          <p>Forgot <a href="#">Password?</a></p>
        </div>
      </div>
        </div>
            </div>
        </body>
    </html>