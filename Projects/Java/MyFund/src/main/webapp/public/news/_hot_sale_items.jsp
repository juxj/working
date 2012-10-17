<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:iterator id="item" value="hotSaleItemsList">
<li>
	<s:if test="#item.url.length()>8">
		<s:if test="#item.title.length()>25">
			<a href="${item.url}"><s:property value="#item.title.substring(0,25)"></s:property>...</a>
		</s:if>
		<s:else>
			<a href="${item.url}">${item.title}</a>
		</s:else>
	</s:if> 
	<s:else>
		<s:if test="#item.title.length()>25">
			<a href="/news/Info.act?id=${item.id}" target="_blank">
			<s:property value="#item.title.substring(0,25)"></s:property>...</a>
		</s:if><s:else>
			<a href="/news/Info.act?id=${item.id}" target="_blank">${item.title}</a>
		</s:else>
	</s:else>
</li>
</s:iterator>