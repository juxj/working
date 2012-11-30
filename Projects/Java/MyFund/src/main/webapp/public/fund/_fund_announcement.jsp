<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
      <tr class="top_color">
        <td class="capital_table_0">标题</td>
        <td class="capital_table_0">发布日期</td>
      </tr>
		<s:if test="fundAnnouncementList.size <=0">
		  <tr class="capital_table" >
	        <td class="capital_table_0">抱歉！未查询到相符的结果</td>
	      </tr>
		</s:if><s:else>
		<s:iterator value="fundAnnouncementList">
	      <tr class="capital_table" >
	        <td class="capital_table_0"><a target="_blank" href="http://${url}">${title }</a></td>
	        <td class="capital_table_0"><s:date name="issuedDate"/></td>
	      </tr>
		</s:iterator>
		</s:else>
</table>
