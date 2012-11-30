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
				<h2>财务管理 » 付款管理</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				<form id="searchform" action="/admin/payment/member.act" method="post">
				<input type="hidden" id="pageNo" name="pageNo"/>
				<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td>
								<label>会员名称&nbsp;&nbsp;&nbsp;</label><input value="${ordName }" type="text" name="ordName" class="text" style="width: 100px;"/>
							</td>
							<td>
								<label>会员类型</label><s:select name="ordType" list="#{'-1':'--会员类型--','1':'资信通认证会员','2':'资信通vip会员'}" listKey="key" listValue="value"/>
							</td>
							<td>
								<label>开始时间</label><input id="cd1" name="startdt" class="text date_picker" value="<s:date name="startdt[0]"/>"/> 
								<label>~</label><input id="cd2" name="startdt" class="text date_picker" value="<s:date name="startdt[1]"/>"/> 
							</td>
							<td></td>
						</tr>
						<tr>
							<td>
								<label>付费订单号</label><input value="${ordId }" type="text" name="ordId" class="text" style="width: 100px;"/>
							</td>
							<td>
								<label>会员状态</label><s:select name="ordStatus" list="#{'-1':'--会员状态--',0:'未使用',1:'使用中',2:'已过时'}" listKey="key" listValue="value"/>
							</td>
							<td>
								<label>创建时间</label><input id="lg1" name="createdt" class="text date_picker" value="<s:date name="createdt[0]"/>"/>
								<label>~</label><input id="lg2" name="createdt" class="text date_picker" value="<s:date name="createdt[1]"/>"/>
							</td>
							<td>
								<input type="submit" value="查 询"/>
							</td>
						</tr>
					</table>
					</form>
			<div class="block_content">
				<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
					<thead>
						<tr style="background:#DDDDDD;">
							<th class="header" style="cursor: pointer; ">会员名称</th>
							<th class="header" style="cursor: pointer; ">会员类型</th>
							<th class="header" style="cursor: pointer; ">开始时间</th>
							<th class="header" style="cursor: pointer; ">结束时间</th>
							<th class="header" style="cursor: pointer; ">剩余天数</th>
							<th class="header" style="cursor: pointer; ">创建时间</th>
							<th class="header" style="cursor: pointer; ">付费订单号</th>
							<th class="header" style="cursor: pointer; ">状态</th>
							<th class="header" style="cursor: pointer; ">操作</th>
							<th width="80px;">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pager.data" var="u" status="i">
						<tr <s:if test="#i.even">class="even"</s:if><s:else>class="odd"</s:else>>
							<td>${u.username}&nbsp;</td>
							<td><s:if test="#u.memberType == 1">资信通认证会员</s:if><s:elseif test="#u.memberType == 2">资信通vip会员</s:elseif><s:else>未选择</s:else>&nbsp;</td>
							<td><s:date name="#u.memberStart"/>&nbsp;</td>
							<td><s:date name="#u.memberEnd"/>&nbsp;</td>
							<td>${u.days }&nbsp;</td>
							<td><s:date name="#u.createTime"/>&nbsp;</td>
							<td>${u.orderId}&nbsp;</td>
							<td>
							<s:if test="#u.status==0">未开始</s:if>
							<s:elseif test="#u.status==1">使用中</s:elseif><s:elseif test="#u.status==1">未选择</s:elseif><s:else>没有状态</s:else>
							</td>
							<td colspan="2">
								未定
							</td>
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