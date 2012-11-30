<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>银行金融用户详细信息</title>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script language="javascript">
$(function(){
	$(":button").button();
});
function audit(id,audit,type){
	$("#auditDisplay").attr("disabled", true);
	$.post("/admin/user/Profile!audit.act",{userId:id,audit:audit,type:type},function(a){
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
					<tr class="even" style="color:#97181d;font-weight: bold;"><td>银行详细信息</td><td>
						<s:if test="usrBank==null">
							<div class="graph_red"><span style="width:0%;"></span></div>
						</s:if>
			          <s:elseif test="usrBank.completerate<60">
							<div class="graph_red"><span style="width:${usrBank.completerate}%;"></span></div>
						</s:elseif><s:elseif test="60<=usrBank.completerate && usrBank.completerate<100">
							<div class="graph_orange"><span style="width:${usrBank.completerate}%;"></span></div>
						</s:elseif><s:else>
							<div class="graph_green"><span style="width:${usrBank.completerate}%;"></span></div>
						</s:else>
					</td></tr>
				<s:if test="usrBank!=null">
					<tr style="color:#97181d;font-weight: bold;"><td>用户类型 ：银行</td><td>&nbsp;</td></tr>
					<tr><td>银行名称</td><td><s:if test="audit == 0">${profileMap['bankName'] } ${usrBank.detailname }</s:if><s:elseif test="audit == 1 || audit == 2">${usrBank.detailname }</s:elseif>&nbsp;</td></tr>
					<tr><td>联系人姓名</td><td>&nbsp;<s:if test="usrBank.linkgenderr==1">${usrBank.linkname} 先生</s:if><s:elseif test="usrBank.linkgenderr==0">${usrBank.linkname} 女士</s:elseif></td></tr>
					<tr><td>联系人地址 </td><td>${profileMap['address'] }&nbsp;</td></tr>
					<tr><td>联系人详细地址 </td><td>${usrBank.address }&nbsp;</td></tr>
					<tr><td>联系人邮政编码</td><td>${usrBank.postcode }&nbsp;</td></tr>
					<tr><td>联系人邮箱 </td><td>${usrBank.linkemail }&nbsp;</td></tr>
					<tr><td>联系人电话</td><td>${usrBank.linktelephone }&nbsp;</td></tr>
					<tr><td>所属部门 ${usrBank.department }&nbsp;</td><td>职位 ${usrBank.position }&nbsp;</td></tr>
					<tr><td>服务介绍</td><td>${usrBank.remarks }&nbsp;</td></tr>
					<tr><td>&nbsp;</td><td align="center">
						<label>当前状态：<span id="auditMsg"><s:if test="audit == 0">未审核</s:if><s:elseif test="audit == 1">待审核</s:elseif><s:if test="audit == 2">已审核</s:if></span></label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="auditDisplay" type="button" value="<s:if test="audit != 2">审核通过</s:if><s:else>待审核</s:else>" onclick="audit(${usrBank.userid},${audit },${type });"/>
						<input type="button" value="返 回" onclick="javascript:window.history.back();" />
					</td></tr>
				</s:if>
				<s:else><tr><td colspan="2">用户未填充信息</td></tr>
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