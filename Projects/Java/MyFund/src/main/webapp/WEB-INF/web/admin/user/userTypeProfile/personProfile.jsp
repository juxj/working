<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>个人用户详细信息</title>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script language="javascript">
$(function(){
	$(":button").button();
});
function audit(id,audit){
	$("#auditDisplay").attr("disabled", true);
	$.post("/admin/user/Profile!audit.act",{userId:id,audit:audit},function(a){
		if(a=='1'){
			$("#umsg").html("已修改为待审核状态。").show();
			$("#auditMsg").html("待审核");
		}else if(a=='2'){
			$("#umsg").html("已审核。").show();
			$("#auditMsg").html("已审核");
		}else{
			$("#umsg").html(a).show();
		}
	});
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
				<h2>账户管理 » 用户类型详细信息</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
			<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
				<tbody>
					<tr class="even" style="color:#97181d;font-weight: bold;"><td>个人详细信息</td><td>
						<s:if test="usrPerson==null">
							<div class="graph_red"><span style="width:0%"></span></div>
						</s:if>
			          	<s:elseif test="usrPerson.completerate<60">
							<div class="graph_red"><span style="width:${usrPerson.completerate}%"></span></div>
						</s:elseif><s:elseif test="60<=usrPerson.completerate && usrPerson.completerate<100">
							<div class="graph_orange"><span  style="width:${usrPerson.completerate}%"></span></div>
						</s:elseif><s:else>
							<div class="graph_green"><span  style="width:${usrPerson.completerate}%"></span></div>
						</s:else>
					</td></tr>
				<s:if test="usrPerson!=null">
					<tr class="odd" style="color:#97181d;font-weight: bold;"><td>用户类型  ：个人</td><td>&nbsp;</td></tr>
					<tr><td>姓名 </td><td> ${profileMap['realname']}&nbsp;</td></tr>
					<tr><td>出生年月  </td><td> <s:date name="usrPerson.birthday" />&nbsp;</td></tr>
					<tr><td>教育程度 </td><td> ${profileMap['eduAtion'] }&nbsp;</td></tr>
					<tr><td>身份证号码 </td><td> ${usrPerson.cid}&nbsp;</td></tr>
					<tr><td>所在地 </td><td> ${profileMap['address'] }&nbsp;</td></tr>
					<tr><td>详细地址 </td><td> ${usrPerson.address }&nbsp;</td></tr>
					<tr><td>邮政编码 </td><td> ${usrPerson.postcode }&nbsp;</td></tr>
					<tr><td>职业 </td><td> ${profileMap['psersoncareer'] }&nbsp;</td></tr>
					<tr><td>固定电话 </td><td> ${usrPerson.telephone }&nbsp;</td></tr>
					<tr><td>联系方式 </td><td> ${profileMap['imtype1'] }&nbsp;&nbsp;${usrPerson.im1 }</td></tr>
					<tr><td>&nbsp;</td><td>${profileMap['imtype2'] }&nbsp;&nbsp;${usrPerson.im2 }</td></tr>
					<tr><td>&nbsp;</td><td>${profileMap['imtype3'] }&nbsp;&nbsp;${usrPerson.im3 }</td></tr>
					<tr><td>&nbsp;</td><td align="center">
						<label>当前状态：<span id="auditMsg"><s:if test="audit == 0">未审核</s:if><s:elseif test="audit == 1">待审核</s:elseif><s:if test="audit == 2">已审核</s:if></span></label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="auditDisplay" type="button" value="<s:if test="audit != 2">审核通过</s:if><s:else>待审核</s:else>" onclick="audit(${usrPerson.userid},${audit });"/>
						<input type="button" value="返 回" onclick="javascript:window.history.back();" />
					</td></tr>
					</s:if><s:else><tr><td colspan="2">用户未填充信息</td></tr>
						<tr><td>&nbsp;</td><td align="center">
							<input type="button" value="返 回" onclick="javascript:window.history.back();" />
						</td></tr>
					</s:else>
				</tbody>
			</table>
			<!-- .block_content ends -->
			<div class="bendl"></div>
			<div class="bendr"></div>
		</div>
	</div>
</div>
</div>
</body>
</html>