<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
<s:if test="fundInvestList.size<=0">
  <tr class="capital_table" >
       <td class="capital_table_0">抱歉！未查询到相符的结果</td>
     </tr>
</s:if><s:else>
<s:iterator value="fundInvestList">
      <tr class="top_color">
        <td class="capital_table_0">1.投资组合</td>
       </tr>
       <tr>
       	<td>${overall}</td>
       </tr>
       <tr class="top_color">
        <td class="capital_table_0">2.分行业股票投资组合</td>
       </tr>
       <tr>
       	<td>${stockIndustry}</td>
       </tr>
       <tr class="top_color">
        <td class="capital_table_0">3.前10名股票明细</td>
       </tr>
       <tr>
       	<td>${stockTop}</td>
       </tr>
       <tr class="top_color">
        <td class="capital_table_0">4.分类债券投资</td>
     </tr>
       <tr>
       	<td>${bondCatelog}</td>
       </tr>
       <tr class="top_color">
        <td class="capital_table_0">5.前5名债券明细</td>
     </tr>
       <tr>
       	<td>${bondTop}</td>
       </tr>
       </s:iterator>
</s:else>
</table>
