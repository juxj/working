<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script>
$(function(){$(":button").button();});
function checkform(){
	if($("#username").val() && $("#password").val()){
		$("#addform").submit();
	}
}
function returnList(){
	document.location.href="/admin/Admin!listAdmUser.act";
}
</script>
</head>
<body>
<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
		<div class="block">
			<div class="block_head">
				<div class="bheadl"></div>
				<div class="bheadr"></div>
				<h2>系统管理 » 管理员与权限 » 新增管理员</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				<p><s:if test="errorMsg!=null">
				<div class="message errormsg">
					<p>${errorMsg}</p>
				</div>
				</s:if></p>
				<form action="/admin/Admin!addAdmUser.act" method="post" id="addform">
					<p>
						<label>用户名:</label> <s:textfield cssClass="text" id="username" name="admUser.username" /> <span class="note">允许英文字母、数字和下划线，6-16位长</span>
					</p>
					<p>
						<label>姓&nbsp;&nbsp;&nbsp;名:</label> <s:textfield cssClass="text" name="admUser.realname"/> <span class="note">管理员真实姓名</span>
					</p>
					<p>
						<label>密&nbsp;&nbsp;&nbsp;码:</label> <input id="password" id="password" type="password" name="admUser.password" class="text"/> <span class="note">密码必须8位以上长度</span>
					</p>
					<p>
						<label>手&nbsp;&nbsp;&nbsp;机:</label> <s:textfield cssClass="text" name="admUser.mobile"/> <span class="note">紧急联系用手机号码，16位以下长度</span>
					</p>
					<p>
						<label>电&nbsp;&nbsp;&nbsp;话:</label> <s:textfield cssClass="text"  name="admUser.telephone"/> <span class="note">公司内部联系电话，16位以下长度</span>
					</p>
					<p>
						<label>状&nbsp;&nbsp;&nbsp;态:</label> <s:radio name="admUser.status" list="#{0:'正常',1:'禁用'}" cssClass="radio" value="0"/> 
					</p>
					<hr/>
					<p>
						<input type="button" value="返 回" onclick="returnList();"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="保 存 " onclick="checkform();"/>
					</p>
				</form>
			</div>
			<!-- .block_content ends -->
			<div class="bendl"></div>
			<div class="bendr"></div>
		</div>
		<!-- .block ends -->
	</div>
</div>
</body>
</html>