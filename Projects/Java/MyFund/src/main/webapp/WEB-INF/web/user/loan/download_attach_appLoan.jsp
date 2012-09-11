<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
	<s:iterator value="loanUploadList">
		<li>
			${oldFileName }&nbsp;&nbsp;<a href="/user/loan/downloadAttach.act?type=1&falistId=${id }">下载</a>
		</li>
	</s:iterator>
