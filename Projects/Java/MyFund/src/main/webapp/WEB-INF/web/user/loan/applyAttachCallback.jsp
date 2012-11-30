<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="attachType ==1">
	<s:if test="apply.agreeStatus == 213">
		<font color="#426D7D">已上传，未审核</font>
		<br/>已上传份数：1
	</s:if>
	<s:if test="apply.agreeStatus == 218">
		<font color="#426D7D">已邮寄，未审核</font><br/>
		快递公司：${apply.agreeMemo }<br/>
		快递单号：${apply.agreeFileUpload }
	</s:if>
</s:if>
<s:if test="attach.uploadStatus == 213">
	<font color="#426D7D">已上传，未审核</font>
	<br/>已上传份数：<span id="attCount${attach.id }"></span>
</s:if>
<s:if test="attach.uploadStatus == 218">
	<font color="#426D7D">已邮寄，未审核</font><br/>
	快递公司：${attach.attachMemo }<br/>
	快递单号：${attach.postid }
</s:if>