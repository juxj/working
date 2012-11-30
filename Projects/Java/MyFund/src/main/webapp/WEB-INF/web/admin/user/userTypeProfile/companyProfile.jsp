<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>企业用户详细信息</title>
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
			<span style="float: right; padding-right: 100px;"><a target="_blank" href="http://www.nacao.org.cn/">组织机构代码证查询</a></span>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
			<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
				<tbody>
					<tr class="even" style="color:#97181d;font-weight: bold;"><td>企业详细信息</td><td>
					  <s:if test="usrCompany==null">
							<div class="graph_red"><span style="width:0%;"></span></div>
						</s:if>
			       		 <s:elseif test="usrCompany.completeratebase<60">
							<div class="graph_red"><span style="width:${usrCompany.completeratebase}%;"></span></div>
						</s:elseif><s:elseif test="60<=usrCompany.completeratebase && usrCompany.completeratebase<100">
							<div class="graph_orange"><span  style="width:${usrCompany.completeratebase}%;"></span></div>
						</s:elseif><s:else>
							<div class="graph_green"><span  style="width:${usrCompany.completeratebase}%;"></span></div>
						</s:else>
					</td></tr>
				<s:if test="usrCompany!=null">
					<tr style="color:#97181d;font-weight: bold;"><td>用户类型 ：<s:if test="type==2">生产型企业</s:if><s:elseif test="type==3">贸易型企业</s:elseif><s:elseif test="type==4">工贸一体型企业</s:elseif><s:elseif test="type==5">服务型企业</s:elseif></td><td>&nbsp;</td></tr>
					<tr><td>企业名称  ${usrCompany.companyname }&nbsp;</td><td>营业执照号码  ${usrCompany.licensecode }&nbsp;</td></tr>
					<tr><td>组织机构代码证号码 </td><td> ${usrCompany.organizationcode }&nbsp;</td></tr>
					<tr><td>所属行业 </td><td> ${profileMap['industry'] }&nbsp;</td></tr>
					<tr><td>企业经营地址 </td><td> ${profileMap['bizaddress'] }&nbsp;</td></tr>
					<tr><td>详细地址 </td><td> ${usrCompany.bizaddress }&nbsp;</td></tr>
					<tr><td>邮编 </td><td>${usrCompany.bizpostcode }&nbsp;</td></tr>
					<tr><td>联系人姓名</td><td>&nbsp;<s:if test="usrCompany.linkgender==1">${usrCompany.linkname} 先生</s:if><s:elseif test="usrCompany.linkgender==0">${usrCompany.linkname} 女士</s:elseif></td></tr>
					<tr><td>联系人邮箱 ${usrCompany.linkemail }&nbsp;</td><td>联系人电话 ${usrCompany.linktelephone }&nbsp;</td></tr>
					<tr class="even" style="color:#97181d;font-weight: bold;"><td>企业详细信息</td><td>&nbsp;</td></tr>
					<tr><td>税务登记证号码</td><td>${usrCompany.faxcode }&nbsp;</td></tr>
					<tr><td>开户许可证号码 ${usrCompany.bankpermitcode }&nbsp; </td><td>贷款卡号 ${usrCompany.loancard }&nbsp;</td></tr>
					<tr><td>法定代表人</td><td>${usrCompany.legalperson }&nbsp;</td></tr>
					<tr><td>注册地址</td><td>${profileMap['regaddress'] }&nbsp;</td></tr>
					<tr><td>详细地址</td><td>${usrCompany.regaddress }&nbsp;</td></tr>
					<tr><td>邮编</td><td>${usrCompany.regpostcode }&nbsp;</td></tr>
					<tr><td>注册日期 <s:date name="usrCompany.registerdate" /> &nbsp;</td><td>注册资本 <s:if test="usrCompany.registeredcapital!=null"><s:text name="format.float"><s:param value="usrCompany.registeredcapital"></s:param></s:text>&nbsp;万元</s:if></td></tr>
					<tr><td>企业类型 ${profileMap['companyType'] }&nbsp;</td><td>员工人数 ${profileMap['companyTmployee'] }</td></tr>
					<tr><td>经营范围</td><td>${usrCompany.bizscope }&nbsp;</td></tr>
					<tr><td>所属部门  ${usrCompany.department }</td><td>职位  ${usrCompany.position }</td></tr>
					<tr><td>法定代表人</td><td>${usrCompany.legalperson }&nbsp;</td></tr>
					<tr><td>学历</td><td>${profileMap['eduAtion'] }&nbsp;</td></tr>
					<tr><td>婚姻状况 ${profileMap['marry'] }</td><td>从事所属行业年限  ${profileMap['workYears'] }</td></tr>
					<tr><td>身份证号码</td><td>${usrCompany.lpcid }&nbsp;</td></tr>
					<tr><td>手机  ${usrCompany.lpmobile}</td><td>家庭电话  ${usrCompany.lphometel }</td></tr>
					<tr><td>常住地址</td><td>${profileMap['lpliveaddress'] }&nbsp;</td></tr>
					<tr><td>详细地址</td><td>${usrCompany.lpliveaddress }&nbsp;</td></tr>
					<tr><td>邮编</td><td>${usrCompany.lplivepostcode }&nbsp;</td></tr>
					<tr><td>户籍所在地</td><td>${profileMap['lphkaddress'] }&nbsp;</td></tr>
					<tr><td>邮编</td><td>${usrCompany.lphkpostcode }&nbsp;</td></tr>
					<tr><td>&nbsp;</td><td align="center">
						<label>当前状态：<span id="auditMsg"><s:if test="audit == 0">未审核</s:if><s:elseif test="audit == 1">待审核</s:elseif><s:if test="audit == 2">已审核</s:if></span></label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="auditDisplay" type="button" value="<s:if test="audit != 2">审核通过</s:if><s:else>待审核</s:else>" onclick="javascript:audit(${usrCompany.userid},${audit});"/>
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