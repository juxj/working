<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <jsp:include page="_header.jsp"></jsp:include>
    <script>
	  $(document).ready(function() {
	    $("#tabs").tabs();
	  });
  	</script>
  </head>
  
  <body style="font-size:62.5%;">
   	<div id="tabs"  class="ui-tabs ui-widget ui-widget-content ui-corner-all" >
	    <ul>
	        <li><a href="#tabAssets"><span>资产</span></a></li>
	        <li><a href="#tabLoans"><span>负债</span></a></li>
	        <li><a href="#tabEquities"><span>所有者权益</span></a></li>
	    </ul>
	    <div id="tabAssets">
	    	<jsp:include page="balance_sheet_assets.jsp"></jsp:include>
	    </div>
	    <div id="tabLoans">
	       <jsp:include page="balance_sheet_loans.jsp"></jsp:include>
	    </div>
	    <div id="tabEquities">
	        <jsp:include page="balance_sheet_equities.jsp"></jsp:include>
	    </div>
	</div>
  </body>
</html>
