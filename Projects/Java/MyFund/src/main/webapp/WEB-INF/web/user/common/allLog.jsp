<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<style>
.sq_t {
	border-top: 1px solid #d6d6d6;
	border-right: 1px solid #d6d6d6;
	width: 460px;
	margin: 0 auto;
}

.sq_t th {
	background: #edf0ff;
	height: 28px;
	line-height: 28px;
	border-bottom: 1px solid #d6d6d6;
	border-left: 1px solid #d6d6d6;
}

.sq_t td {
	padding: 10px;
	border-bottom: 1px solid #d6d6d6;
	border-left: 1px solid #d6d6d6;
}

.ui-widget-header {
	border: 1px solid #225376;
	background: #225376 url(images/ui-bg_gloss-wave_0_97181d_500x100.png)
		50% 50% repeat-x;
	color: #ffffff;
	font-weight: bold;
}
</style>
<table border="0" cellspacing="0" cellpadding="0" class="sq_t">
	<tr>
		<th width="40%">操作时间</th>
		<th width="50%">处理信息</th>
		<th width="10%">操作人</th>		
	</tr>
	<s:iterator value="applyCheckList">
		<tr>
			<td><s:date name="createdt" format="yyyy-MM-dd hh:mm:ss" />
			</td>
			<td>${checkView }</td>			
			<td>${createUserName }</td>
		</tr>
	</s:iterator>
</table>