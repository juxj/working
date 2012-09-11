<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="header">
	<div class="hdrl"></div>
	<div class="hdrr"></div>
	<h1><a href="/admin/Admin.act">管理平台</a></h1>
	<ul id="nav">
	<s:iterator value="#session._functionList" id="fun"><s:if test="#fun.parentid==0"><li><a href="#">${fun.remarks}</a>
		<ul><s:iterator value="#session._functionList" id="subFun"><s:if test="#fun.id==#subFun.parentid"><li><a href="${subFun.action}">${subFun.remarks}</a></li></s:if></s:iterator></ul>
		</li></s:if></s:iterator>
	</ul>
	<p class="user">${session._admin.realname} | <a href="/admin/Account!logout.act">退出</a></p>
</div>