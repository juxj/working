<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>报表状态</title>
	<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
  </head>
  
  <body>
    <h6>查看可以填写的报表</h6>
    <hr />
    <s:if test="years.size()>0">
    	<table border="1">
    		<tr>
    			<td>年度</td>
    			<td colspan="10">未完成报表</td>
    		</tr>
    		
    			<s:iterator id="year" value="years">
    				<tr>
			   		<td><s:property value="year" /><br/></td>
				 	<s:iterator id="mlist" value="mapList[#year]">
				   		<td><a href="/cfs/showReportForm.act?code=${mlist }&dataYear=${year}">${mlist }</a></td>
				    </s:iterator>
					</tr>
			 	</s:iterator> 
			 
    		
    	</table>
    	
    </s:if>
  </body>
</html>
