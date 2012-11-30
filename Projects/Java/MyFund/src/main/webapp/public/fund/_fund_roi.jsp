<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<table width="100%" border="1" cellspacing="1" cellpadding="1"> 
		<s:if test="fundRoiList==null">
		  <tr class="capital_table" >
	        <td class="capital_table_0">抱歉！未查询到相符的结果</td>
	      </tr>
		</s:if><s:else>
		<s:iterator value="fundRoiList">
	      <tr class="top_color" >
	        <td>时间</td>
	      	<td>当日</td>
	      	<td>最近一周</td>
	      	<td>最近一月</td>
	      	<td>三个月</td>
	      	<td>半年</td>
	      	<td>今年以来</td>
	      	<td>一年</td>
	      	<td>二年</td>
	      	<td>三年</td>
	      	<td>成立以来</td>
	      </tr>
	      <tr>
	      	<td>表现（%）</td>
	        <td><common:ifNull value="day1"/></td>
	        <td><common:ifNull value="week1"/></td>
	        <td><common:ifNull value="month1"/></td>
	       	<td><common:ifNull value="month3"/></td>
	        <td><common:ifNull value="month6"/></td>
	        <td><common:ifNull value="year0"/></td>
	        <td><common:ifNull value="year1"/></td>
	        <td><common:ifNull value="year2"/></td>
	        <td><common:ifNull value="year3"/></td>
	        <td><common:ifNull value="accumulated"/></td>
	      </tr>
	      </s:iterator>
		</s:else>
</table>
