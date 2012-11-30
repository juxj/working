<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
		<s:if test="fundChargeList.size<=0">
		  <tr class="capital_table" >
	        <td class="capital_table_0">抱歉！未查询到相符的结果</td>
	      </tr>
		</s:if><s:else>
		<s:iterator value="fundChargeList">
	      <tr>
	        <td><s:if test="application == null">----</s:if><s:else>${application }</s:else></td>
	      </tr>
	      <tr>
	        <td>${redemption }</td>
	      </tr>
	      <tr>
	        <td>${extra }</td>
	      </tr>
	      </s:iterator>
		</s:else>
</table>
