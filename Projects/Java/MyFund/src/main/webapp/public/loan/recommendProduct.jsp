<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<table class="qyrz-top_table">
  <s:iterator value="recommendProducts">
   <tr>
     <td style="vertical-align: middle;">
      <s:if test="logo == null || logo == ''">
		 <img src="/images/banklogo/zj198.jpg"  class="td_img" style="white-space: nowrap;"/>
		</s:if>
		<s:else>
			<img src="/images/banklogo/${logo }"  class="td_img" style="white-space: nowrap;"/>
		</s:else>
     </td>
     <td class="hot_connect">
     	<a href="/loan/financeProduct!cusViewFinance.act?product.id=${prodId}">
     		<s:if test="title != null && title.length()>15">
				<s:property value="title.substring(0,15)"></s:property>...
			</s:if><s:else>
				${title}
			</s:else>
     	</a>
     </td>
   </tr>
  </s:iterator>
</table>