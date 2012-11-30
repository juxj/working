<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="msg == 1">
	已上传，未审核
	<br/>上传份数：<span id="attCount${attach.id }"></span>
</s:if>
<s:else>
	error
</s:else>
