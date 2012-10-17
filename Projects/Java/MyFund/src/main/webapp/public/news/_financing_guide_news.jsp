<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<ul class="xxkbox first new_li">
<s:iterator id="item" value="financingGuideList">
<li>
	<s:if test="#item.url.length()>8">
		<div  class="news_title">
			<a href="${item.url}"  target="_blank">${item.title}</a></div>
	</s:if> 
	<s:else>
		<div  class="news_title">
			<a href="/news/Info.act?id=${item.id}" target="_blank">${item.title}</a></div>
	</s:else>
</li>
</s:iterator>
</ul>