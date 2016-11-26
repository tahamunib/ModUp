<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PM/PMMaster.Master" Inherits="System.Web.Mvc.ViewPage<Modupv1.Models.moduleViewModel>" %>
<%@ Import namespace="PagedList.Mvc" %>
<%@ Import namespace="PagedList" %>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
        
     <style>
       .table-head{
	font-size:1.3em;
}
th{
	font-size:1em;/*
	padding:3%;*/
	padding-bottom:3%;
}
td p{
	font-size:1em;/*
	padding-left:3%;
	padding-right:3%;*/
}
.col-centered{
    float: none;
    margin: 0 auto;
}
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
	padding:1%;
}
.btn span.glyphicon {    			
	opacity: 0;				
}
.btn.active span.glyphicon {				
	opacity: 1;				
}
.bidProposal-header-head{
  border: 1px solid #f1f1f1;
}
.bidProposal-header{
  /* background-color: #474e5d; Dark Blue */
}
.bidProposal-header-left{
  text-align:center;
  padding-top: 10px;
  padding-bottom: 10px;
  /*  background-color: #111;Dark Blue */
  border: 1px solid #f1f1f1;
  min-width:340px;
}

.bidProposal-header-right{
  padding-top: 6px;
  padding-bottom: 6px;
cursor:pointer;
  
  background: rgba(204,90,79,1);
background: -moz-linear-gradient(top, rgba(204,90,79,1) 0%, rgba(217,86,74,1) 50%, rgba(197,70,58,1) 51%, rgba(197,58,93,1) 100%);
background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(204,90,79,1)), color-stop(50%, rgba(217,86,74,1)), color-stop(51%, rgba(197,70,58,1)), color-stop(100%, rgba(197,58,93,1)));
background: -webkit-linear-gradient(top, rgba(204,90,79,1) 0%, rgba(217,86,74,1) 50%, rgba(197,70,58,1) 51%, rgba(197,58,93,1) 100%);
background: -o-linear-gradient(top, rgba(204,90,79,1) 0%, rgba(217,86,74,1) 50%, rgba(197,70,58,1) 51%, rgba(197,58,93,1) 100%);
background: -ms-linear-gradient(top, rgba(204,90,79,1) 0%, rgba(217,86,74,1) 50%, rgba(197,70,58,1) 51%, rgba(197,58,93,1) 100%);
background: linear-gradient(to bottom, rgba(204,90,79,1) 0%, rgba(217,86,74,1) 50%, rgba(197,70,58,1) 51%, rgba(197,58,93,1) 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cc5a4f', endColorstr='#c53a5d', GradientType=0 );
}
.bidProposal-header-right:hover{
  padding-top: 6px;
  padding-bottom: 6px;
cursor:pointer;
  
  background: rgba(217,86,74,1);
background: -moz-linear-gradient(top, rgba(217,86,74,1) 0%, rgba(197,58,93,1) 50%, rgba(204,90,79,1) 82%, rgba(197,70,58,1) 100%);
background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(217,86,74,1)), color-stop(50%, rgba(197,58,93,1)), color-stop(82%, rgba(204,90,79,1)), color-stop(100%, rgba(197,70,58,1)));
background: -webkit-linear-gradient(top, rgba(217,86,74,1) 0%, rgba(197,58,93,1) 50%, rgba(204,90,79,1) 82%, rgba(197,70,58,1) 100%);
background: -o-linear-gradient(top, rgba(217,86,74,1) 0%, rgba(197,58,93,1) 50%, rgba(204,90,79,1) 82%, rgba(197,70,58,1) 100%);
background: -ms-linear-gradient(top, rgba(217,86,74,1) 0%, rgba(197,58,93,1) 50%, rgba(204,90,79,1) 82%, rgba(197,70,58,1) 100%);
background: linear-gradient(to bottom, rgba(217,86,74,1) 0%, rgba(197,58,93,1) 50%, rgba(204,90,79,1) 82%, rgba(197,70,58,1) 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d9564a', endColorstr='#c5463a', GradientType=0 );
}
.bidButton{
	text-align:center;
	line-height:1.5;
	font-size:1.5em;
  	color: #fff;
	font-weight:bold;
}
#hover-content {
	 visibility: hidden;
}
#parent:hover #hover-content {
	 visibility: visible;
}
.bidProposal-footer{
	padding: 2% 2% 2% 2%;
  /*background-color: #ccc;  Dark Blue */
}
   </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    viewBids
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!--main content start-->
      <section id="main-content">
          <section class="wrapper">      
              <div class="row state-overview">

                <!-- statics start -->
                <div class="state col-lg-12">
                
                    <form class="form-validate form-horizontal " id="register_form" >
              <!-- Quiz Description -->
              <div class="row">
                  <div class="">
                      <!--Quiz start-->
                      <section class="panel" style=" margin-left: 10px; margin-right: 10px;">
                        	<%--<h1 style="margin-left:0em; font-size:2em; font-weight:lighter;">View Bids</h1><br />--%>
                           <div class="panel-body project-team" style="background-color:#f9f9f9;">
                                <div class="task-progress col-md-offset-2">
                                      <h1 style="font-size: 3.2em;font-weight: lighter; margin-bottom: 5px;margin-top: 5px; font-weight:lighter;">Proposals for <%:Model.tbMod.title %></h1>  
                                </div>
                            </div>
                         <!-- <section class="panel bidProposal-header-head">
                                  <div class="bidProposal-header">
                                  	<div class="col-md-10 pull-left bidProposal-header-left">
                                        <div class="bidProposal-header-left-firDiv">
                                            <h5>Bids</h5>
                                            <p>12</p>
                                        </div>
                                        <div class="bidProposal-header-left-secDiv">
                                            <h5>Avg Bid (USD)</h5>
                                            <p>$400</p>
                                        </div>
                                        <div class="bidProposal-header-left-thiDiv">
                                            <h5>Module Budget (USD)</h5>
                                            <p>$300 - $900</p>
                                        </div>
                                        <div class="bidProposal-header-left-fourDiv">
                                            <h5>6 days, 22 hours left</h5>
                                            <p>OPEN</p>
                                        </div>
                                    </div>
                                   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
                                    <script type="text/javascript" language="javascript">
									   $(document).ready(function() {
										 $(".hidetext").click(function () {
										 $(".text").toggle("slow")
									  });
									  
									  });
								   </script>
                                    <a href="#">
                                    <div class="col-md-2 pull-right bidProposal-header-right hidetext">
                                            <h5 class="bidButton">Bid on This Module</h5>
                                    </div>
                                    </a>
                                  </div>
                                  <div class="clearfix"></div>
                                  
                                  <div class="bidProposal-footer text" style="display:none; border-bottom:2px solid #f1f1f1;">
                                            <h3>Bid: </h3>
                                                    <form class="form-horizontal " method="get">
                                                          <div class="form-group">
                                                              <div class="col-sm-12">
                                      						  <label class="col-sm-2 control-label"><div style="font-size:1.3em;">Paid to you:</div></label>
                                                                  <input type="number"  class="form-control dollar-form-control" placeholder="30">
                                                              </div>
                                                          </div>
                                                          <div class="form-group">
                                                              <div class="col-sm-12">
                                      						  <label class="col-sm-2 control-label"><div style="font-size:1.3em;">Our Module Fee:</div></label><label class="col-sm-2 control-label"><div style="font-size:1.3em;">$5 USD</div></label>
                                                              </div>
                                                          </div>
                                                          
                                                          <div class="form-group">
                                                              <div class="col-sm-12">
                                      						  <label class="col-sm-2 control-label"><div style="font-size:1.3em;">Your bid:</div></label><label class="col-sm-2 control-label"><div style="font-size:1.3em;">$35 USD</div></label>
                                                              </div>
                                                          </div>
                                                    </form>
                                            
                                            
                                            <br/>
                                            <div class="row">
                                                <div class="text-center pull-right">
                                                    <a href="#">
                                                        <button type="button" class="btn btn-primary cust-btn hidetext">Cancel</button>
                                                    </a>
                                                    <a href="#">
                                                        <button type="button" class="btn btn-danger cust-btn hidetext">Submit</button>
                                                    </a>
                                                </div>
                                            </div>
                                  </div>
                                  
                                  
                                  <div class="bidProposal-footer">
                                            <h3>Project Description</h3>
                                            <p>Our wholesale bakery is named- Strugelach Bakery -- and its prime products is a baked good that is something of a cross between strudel and rugelach. Past experience with bakery or good product logos appreciated but not required. Helpful if bid accompanies with ideas for this project or past logos developed.</p>
                                            <h3>About the employer</h3>
                                            <p>5 Star Ratings here - Australia</p>
                                            <h3>Skills required</h3>
                                            <p>Graphic Design, Logo Design</p>
                                            <h3>Additional Files: </h3>
                                            <p><a href="#">nike.jpg</a></p>
                                  </div>
                          </section>-->
                      
                      
                      
                  
                         
                         <div class="offset-to-mid">
                                	<div >
                                          <table class="table table-striped table-advance table-hover" border="1" bordercolor="#f1f1f1">
                                               <tbody>
                                                  <tr>
                                                     <th class="table-head">DEVELOPERS BIDDING (<%:Model.tbMod.tbProposals.Count %>)</th>
                                                     <th class="table-head">SKILL LEVEL</th>
                                                     <th class="table-head">EXPERIENCE</th>
                                                     <th class="table-head">TOTAL EARNING</th>
                                                     <th class="table-head">BID (USD)</th>
                                                  </tr>
                                                   <%foreach(var prop in Model.tbProposals){ %>
                                                  <tr id="parent">
                                                     <td>
                                                         <table>
                                                         <tbody>
                                                         <tr>
                                                         	
                                                            <td>
                                                                 <table>
                                                                 <tbody>
                                                                 <tr>
                                                                    <th>
                                                                    <a href="#"><%: prop.tbDeveloper.tbClient.tbUser.firstName %> <%: prop.tbDeveloper.tbClient.tbUser.lastName %></a>
                                                                    </th>
                                                                 </tr>
                                                                 <tr><td><p><%: prop.tbDeveloper.tbClient.overview %> </p></td></tr>
                                                                 
                                                                 </tbody>
                                                                 </table>
                                                            </td>
                                                         </tr>
                                                         </tbody>
                                                         </table>
                                                     </td>
                                                     <td><%string skill; try { skill = prop.tbDeveloper.tbSkills.First(s => s.name.Equals(Model.tbMod.skillReq.ToString())).skillLevel; }
                                                            catch { skill = "Not Tested."; } %> <%: skill %></td>
                                                     <td>
                                                         <%: prop.tbDeveloper.tbClient.awardedProjects %> Proects Completed
                                                     </td>
                                                       <td>
                                                        $ <%: prop.tbDeveloper.tbClient.totalEarning %>
                                                     </td>
                                                     <td>
                                                     	<span class="pull-left" style=" padding-top:4%; padding-right:5%;"><%: prop.hourlyRate %></span>
                                                     	<span class="pull-left"> 
                                                            <a href="<%:Url.Action("viewProposalModule", "PM", new { id = prop.propID})%>" id="hover-content">
                                                            <button type="button" class="btn btn-danger cust-btn">View Proposal</button>
                                                            </a>
                                                        </span>
                                                     </td>
                                                  </tr>
                                                     <%} %>                        
                                               </tbody>
                                            </table>
                                     </div>
                                      
                                  </div>
                                  
                                  
                                  
                                  <div class=" offset-to-mid">
                                      <section class="panel">
                                          <div class="panel-body">
                                              <form class="form-horizontal " method="get">
                                                  
                                                  <div class="form-group">
                                                      <div class="col-lg-10">
                                                          <%: Html.PagedListPager(Model.tbProposals,page => Url.Action("viewBids",new {Model.tbMod.modID,page}))  %>
                                                      </div>
                                                  </div>
                                              </form>
                                          </div>
                                      </section>
                                  
                                  
                                  
                              </div>
                      </section>
                      <!--Quiz end-->
                  </div>

                  
              </div>
              <!-- Quiz Description end -->
                        </form>
                    </div>
                  </div>
          </section>
          </section>
      
      <!--main content end-->

</asp:Content>
