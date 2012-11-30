<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>报表</title>
  </head>
  
  <body>
  		<table>
  			<tr>
  				<th>报表类型</th>
  				<th colspan="10">年度</th>
  			</tr>
  			<tr>
  				<td>财务比率分析表 </td>
  				<s:iterator id="item" value="fiscalYears">
		    		<td><a href="cfs/showFinacingMetricReport.act?fiscalYear=${item }">${item }</a> </td>
		    	</s:iterator>
  			</tr>
  			<tr>
  				<td>共同比资产负债表 </td>
  				<s:iterator id="item" value="fiscalYears">
		    		<td><a href="cfs/showComparedReport.act?fiscalYear=${item }&rptCode=01">${item }</a> </td>
		    	</s:iterator>
  			</tr>
  			<tr>
  				<td>共同比利润及利润分配表 </td>
  				<s:iterator id="item" value="fiscalYears">
		    		<td><a href="cfs/showComparedReport.act?fiscalYear=${item }&rptCode=02">${item }</a> </td>
		    	</s:iterator>
  			</tr>
  			<tr>
  				<td>共同比现金流量表 </td>
  				<s:iterator id="item" value="fiscalYears">
		    		<td><a href="cfs/showComparedReport.act?fiscalYear=${item }&rptCode=03">${item }</a> </td>
		    	</s:iterator>
  			</tr>
  			<tr>
  				<td>杜邦分析</td>
  				<s:iterator id="item" value="fiscalYears">
		    		<td><a href="cfs/showRpt05.act?fiscalYear=${item }">${item }</a> </td>
		    	</s:iterator>
  			</tr>
  		</table>
  
    	
  </body>
</html>
