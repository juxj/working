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
function profile(id){
	document.location.href="/admin/fund/fund!fundProfile.act?fundId="+id;
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
function toPage(pageNo, pageCount) {
	document.getElementById("pageNo").value = pageNo;
	form = document.getElementById("frmfundInfo");
	form.submit();
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
				<h2>产品管理 » 基金管理</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				<form id="frmfundInfo" action="/admin/fund/fund!fundList.act" method="post"  >
  				<input type="hidden" id="pageNo" name="pageNo" /> 	
				<!-- <table cellpadding="0" cellspacing="0" width="100%">
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
					</table> -->
					</form>
				<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
					<thead>
						<tr style="background:#DDDDDD;">
							<th class="header" style="cursor: pointer; ">全称</th>
							<th class="header" style="cursor: pointer; ">简称</th>
							<th class="header" style="cursor: pointer; ">类目</th>
							<th class="header" style="cursor: pointer; ">基金经理</th>
							<th class="header" style="cursor: pointer; ">托管人</th>
							<th class="header" style="cursor: pointer; ">投资目标</th>
							<th class="header" style="cursor: pointer; ">基金公司名称</th>
							<th width="180px;">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pager.data" var="u" status="i">
						<tr <s:if test="#i.even">class="even"</s:if><s:else>class="odd"</s:else>>
							<td>${u.fullName}&nbsp;</td>
							<td>${u.shortName}&nbsp;</td>
							<td>${u.catelogName }</td>
							<td>${u.manager}&nbsp;</td>
							<td>${u.custodian}&nbsp;</td>
							<td>${u.investmentGoal}&nbsp;</td>
							<td>${u.fundCompanyName}&nbsp;</td>
							<td><input type="button" value="详细信息" onclick="profile(${u.id});"/></td>
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
</div>
</body>
</html>