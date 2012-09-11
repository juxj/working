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
$(function(){
	$(":button").button();
	$(".tablesorter").tablesorter();
});
function edit(id){
	document.location.href="/admin/Admin!editAdmUser.act?adminUid="+id;
}
function auth(id){
	document.location.href="/admin/Admin!editAdmAuth.act?adminUid="+id;
}
function bfAdd(){
	document.location.href="/admin/Admin!bfAddAdmUser.act";
}
</script>
</head>
<body>
<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
		<div class="block">
			<s:if test="msg!=null"><div class="message success">
			<p>${msg}</p>
			</div></s:if>
			<div class="block_head">
				<div class="bheadl"></div>
				<div class="bheadr"></div>
				<h2>系统管理 » 管理员与权限</h2>
				<ul>
					<li class="nobg"><input type="button" value="新增管理员" onclick="bfAdd();"/></li>
				</ul>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
					<thead>
						<tr>
							<th class="header" style="cursor: pointer; ">用户名</th>
							<th class="header" style="cursor: pointer; ">姓名</th>
							<th class="header" style="cursor: pointer; ">电话</th>
							<th class="header" style="cursor: pointer; ">手机号码</th>
							<th class="header" style="cursor: pointer; ">状态</th>
							<th width="120px;"></th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="admUserList" status="i">
						<tr <s:if test="#i.even">class="even"</s:if><s:else>class="odd"</s:else>>
							<td>${username}</td>
							<td>${realname }</td>
							<td>${mobile }</td>
							<td>${telephone }</td>
							<td><s:if test="status==0">正常</s:if><s:if test="status==1"><font color="red">禁用</font></s:if></td>
							<td><input type="button" value="修改" onclick="edit(${id});"/> <input type="button" value="授权" onclick="auth(${id});"/></td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
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