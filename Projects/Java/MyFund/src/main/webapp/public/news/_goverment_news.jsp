<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:iterator id="item" value="govermentNewsList">
<li>
	<s:if test="#item.url.length()>8">
		<div class="news_title">
			<a href="${item.url}"  target="_blank">${item.title}</a></div>
	</s:if> 
	<s:else>
		<div class="news_title">
			<a href="/news/Info.act?id=${item.id}" target="_blank">${item.title}</a></div>
	</s:else>
</li>
</s:iterator>