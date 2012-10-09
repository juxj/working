<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
	<s:iterator value="faList">
		<li>
			${oldFileName } &nbsp;&nbsp;<a href="/user/loan/downloadAttach.act?type=0&falistId=${id }">下载</a>
			<s:if test="ext=='.png'||ext=='.jpg'||ext=='.jpeg'||ext=='.bmp'">| <a href="javascript:void(0);" onclick="watchIt('${id}')">预览</a></s:if>
			<s:else><a href="javascript:void(0);" onclick="openIt('${id}')">打开</a></s:else>
		</li>
	</s:iterator>

