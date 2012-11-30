<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
		<s:if test="fundSalesList.size<=0">
		  <tr class="capital_table" >
	        <td class="capital_table_0">抱歉！未查询到相符的结果</td>
	      </tr>
		</s:if><s:else>
		<s:iterator value="fundSalesList">
	      <tr>
	        <td>直销机构</td>
	      </tr>
	      <tr>
	        <td>${fundName}</td>
	      </tr>
	      <tr>
	        <td>代销机构</td>
	      </tr>
	      <tr>
	        <td>${salesAgent}</td>
	      </tr>
	      </s:iterator>
		</s:else>
</table>
