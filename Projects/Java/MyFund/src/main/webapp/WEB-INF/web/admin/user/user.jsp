<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<script>
$(function(){
	$(".tablesorter").tablesorter();
	$(":button,:submit,:reset").button();
	$(".date_picker").datepicker();
});
function edit(id){
	document.location.href="/admin/Admin!editAdmUser.act?adminUid="+id;
}
function profile(id,type,au){
	document.location.href="/admin/user/Profile.act?userId="+id+"&"+"type="+type+"&"+"audit="+au;
}
function search(){
	if($("#uname").val()=="用户名..."){
		$("#uname").val("");
	}
	if($("#rname").val()=="姓名..."){
		$("#rname").val("");
	}
	$("#searchform").submit();
}
function toPage(pageNo,pageSize){
	$("#pageNo").val(pageNo);
	search();
}
function details(id){
	if(id!=null && id!=0){
		$.post("/admin/user/User!details.act",{uid:id},function(a){
			$("#pop_info").html(a).dialog({width:500,modal: true});
			$(":button").button();
			$(".tablesorter").tablesorter();
		});
	}else{
		$("#umsg").html("请选择用户。").show();
	}
}
function adminLoginUser(id,type,au){
	if(id !=null && id != 0){
		window.open("/admin/user/aLoginU.act?userId="+id+"&"+"type="+type+"&"+"audit="+au+"&"+"alu="+1);
		//document.location.href="/admin/user/aLoginU.act?userId="+id+"&"+"type="+type+"&"+"audit="+au+"&"+"alu="+1;
	}else{
		$("#umsg").html("请选择用户。").show();
	}
}
</script>
</head>
<body>
<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
		<div class="block">
		    <div id="umsg" class="message success" style="display: none;"></div>
			<s:if test="msg!=null"><div class="message success">
			<p>${msg}</p>
			</div></s:if>
			<div class="block_head">
				<div class="bheadl"></div>
				<div class="bheadr"></div>
				<h2>会员管理 » 帐户管理</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				<form id="searchform" action="/admin/user/User!search.act" method="post">
				<input type="hidden" id="pageNo" name="pageNo"/>
				<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td>
								<label>用户名</label><input value="${username }" type="text" name="username" class="text" style="width: 100px;"/>
							</td>
							<td>
								<label>真实姓名</label><input value="${realname }" type="text" name="realname" class="text" style="width: 100px;"/>
							</td>
							<td>
								<label>手机号码</label><input value="${mobile }" type="text" name="mobile" class="text" style="width: 150px;"/>
							</td>
							<td>
								<label>注册时间</label><input id="cd1" name="createdt" class="text date_picker" value="<s:date name="createdt[0]"/>"/> 
								<label>~</label><input id="cd2" name="createdt" class="text date_picker" value="<s:date name="createdt[1]"/>"/> 
							</td>
							<td></td>
						</tr>
						<tr>
							<td>
								<label>用户类型</label><s:select name="userType" list="#{'-1':'--用户类型--','1':'个人','6':'银行','2-5':'企业','7-12':'金融机构','13-18':'服务机构'}" listKey="key" listValue="value"/>
							</td>
							<td>
								<label>审核状态</label><s:select name="auditStatus" list="#{-1:'--审核状态--',0:'未审核',1:'待审核',2:'已审核'}" listKey="key" listValue="value"/>
							</td>
							<td>
								<label>电子邮箱</label><input value="${email }" type="text" name="email" class="text" style="width: 150px;"/>
							</td>
							<td>
								<label>最后登录</label><input id="lg1" name="logindt" class="text date_picker" value="<s:date name="logindt[0]"/>"/>
								<label>~</label><input id="lg2" name="logindt" class="text date_picker" value="<s:date name="logindt[1]"/>"/>
							</td>
							<td>
								<input type="submit" value="查 询"/>
							</td>
						</tr>
					</table>
					</form>
				<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
					<thead>
						<tr style="background:#DDDDDD;">
							<th class="header" style="cursor: pointer; ">用户名</th>
							<th class="header" style="cursor: pointer; ">姓名</th>
							<th class="header" style="cursor: pointer; ">用户类型</th>
							<th class="header" style="cursor: pointer; ">Email</th>
							<th class="header" style="cursor: pointer; ">手机号码</th>
							<th class="header" style="cursor: pointer; ">状态</th>
							<th class="header" style="cursor: pointer; ">审核状态</th>
							<th width="180px;">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pager.data" var="u" status="i">
						<tr <s:if test="#i.even">class="even"</s:if><s:else>class="odd"</s:else>>
							<td>${u.username}&nbsp;</td>
							<td>${u.realname}&nbsp;</td>
							<td>
							<s:if test="#u.type==0">未定</s:if>
							<s:if test="#u.type==1">个人</s:if>
							<s:elseif test="#u.type>=2 && #u.type<=5">企业</s:elseif>
							<s:elseif test="#u.type==6">银行</s:elseif>
							<s:elseif test="#u.type>=7 && #u.type<=12">金融机构</s:elseif>
							<s:elseif test="#u.type>=13 && #u.type<=18">服务机构</s:elseif>
							</td>
							<td>${u.email}<s:if test="#u.activetype==1 || #u.activetype==3"> <font color="red">√</font></s:if>&nbsp;</td>
							<td>${u.mobile}<s:if test="#u.activetype==2 || #u.activetype==3"> <font color="red">√</font></s:if>&nbsp;</td>
							<td id="status${u.id}"><s:if test="#u.status==0">正常</s:if><s:if test="#u.status==1"><font color="red">阻止</font></s:if></td>
							<td><s:if test="#u.auditstatus==0">未审核</s:if><s:elseif test="#u.auditstatus==1">待审核</s:elseif><s:elseif test="#u.auditstatus==2">已审核</s:elseif></td>
							<td><input type="button" value="注册信息" onclick="details(${u.id});"/> 
							<input type="button" value="详细信息" onclick="profile(${u.id},${u.type },${u.auditstatus });" <s:if test="#u.type==0">disabled="disabled"</s:if>/> 
							<input type="button" value="模拟用户登录" onclick="adminLoginUser(${u.id},${u.type },${u.auditstatus });" <s:if test="#u.type==0">disabled="disabled"</s:if>/></td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
				<div class="pagination right">
					<s:include value="/public/pagination.jsp"></s:include>
				</div>
			</div>
			<!-- .block_content ends -->
			<div class="bendl"></div>
			<div class="bendr"></div>
		</div>
		<!-- .block ends -->
	</div>
	<div id="pop_info" style="display:none;" title="用户注册信息"></div>
</div>
</body>
</html>