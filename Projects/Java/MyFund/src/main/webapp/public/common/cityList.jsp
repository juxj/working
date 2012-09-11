<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:iterator value="listCity">
	<option value="${id}">${name}</option>
</s:iterator>