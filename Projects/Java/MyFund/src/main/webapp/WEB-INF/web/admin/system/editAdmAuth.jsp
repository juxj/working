<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.checkboxtree.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/admin/style.css"/>
<link rel="stylesheet" type="text/css" href="/css/admin/jquery-ui-1.8.21.custom.css"/>
<link rel="stylesheet" type="text/css" href="/css/admin/jquery.checkboxtree.min.css"/>
<script>
$(function(){
	$(":button").button();
	$("#tree").checkboxTree();
});
function authorization(){
	var check = $(":checkbox:checked");
	var newvalue=0;
	check.each(function(i){
		newvalue = newvalue+Number($(this).val());
	});
	$("#newRights").val(newvalue);
	$("#authform").submit();
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
				<h2>系统管理 » 管理员与权限 » 管理授权</h2>
				<ul>
					<li class="nobg">当前操作对象</li>
					<li>${admUser.username}/${admUser.realname}</li>
				</ul>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				<s:if test="msg!=null"><div class="message success">
				<p>${msg}</p>
				</div></s:if>
				<ul id="tree">
				<s:iterator value="functionList" id="p"><s:if test="#p.parentid==0">
					<li><input type="checkbox" value="${p.rights }" <s:if test="#p.ismenu==-1">checked="checked"</s:if>/><label>${p.remarks}</label>
						<ul><s:iterator value="functionList" id="s"><s:if test="#s.parentid==#p.id">
							<li><input type="checkbox" value="${s.rights }" <s:if test="#s.ismenu==-1">checked="checked"</s:if>/><label>${s.remarks}</label></li></s:if></s:iterator>
						</ul>
					</li></s:if></s:iterator>
				</ul>
				<br/>
				<p>
					<input type="button" value="返 回" onclick="returnList();"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="保 存 " onclick="authorization();"/>
				</p>
			</div>
			<!-- .block_content ends -->
			<div class="bendl"></div>
			<div class="bendr"></div>
		</div>
		<!-- .block ends -->
	</div>
</div>
<form id="authform" style="display:none" action="/admin/Admin!updateAdmAuth.act" method="post">
	<input type="hidden" name="adminUid" value="${admUser.id}"/><input type="hidden" id="newRights" name="newRights" value=""/>
</form>
</body>
</html>