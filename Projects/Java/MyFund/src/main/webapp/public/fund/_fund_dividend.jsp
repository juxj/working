<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
      <tr class="top_color">
        <td class="capital_table_0">序号</td>
        <td class="capital_table_0">每10分收益分配金额</td>
        <td class="capital_table_0">权益登记日</td>
        <td class="capital_table_0">除权日</td>
        <td class="capital_table_0">红利发放日</td>
        <td class="capital_table_0">解决方案</td>
        <td class="capital_table_0">分配方式</td>
      </tr>
		<s:if test="fundDividendList.size<=0">
		  <tr class="capital_table" >
	        <td class="capital_table_0" colspan="7">抱歉！未查询到相符的结果</td>
	      </tr>
		</s:if><s:else>
		<%int i=1; %>
		<s:iterator value="fundDividendList">
	      <tr class="capital_table" >
	        <td class="capital_table_0"><%=i++ %></td>
	        <td class="capital_table_0">${unit}</td>
	        <td class="capital_table_0"><s:date name="registerDate"/></td>
	        <td class="capital_table_0"><s:date name="exDividendDate"/></td>
	        <td class="capital_table_0"><s:date name="deliveredDate"/></td>
	        <td class="capital_table_0">${solution}</td>
	        <td class="capital_table_0">${distributionType}</td>
	      </tr>
	     </s:iterator>
		</s:else>
</table>
