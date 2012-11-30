<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>基金详细信息</title>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/xheditor-1.1.14-zh-cn.min.js"></script>
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
				<h2>产品管理 » 基金 » 基金详细信息</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
			<form action="/admin/fund/fund!updateFundProfile.act" method="post">
			<input type="hidden" name="fund.id" value="${fund.id }"/>
			<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
				<tbody>
					<tr class="even" style="color:#97181d;font-weight: bold;"><td colspan="2">基金详细信息</td></tr>
				<s:if test="fund!=null">
					<tr><td>代码</td><td><input name="fund.code" value="${fund.code }" class="text"/></td></tr>
					<tr><td>全称</td><td> <input name="fund.fullName" value="${fund.fullName }" class="text"/></td></tr>
					<tr><td>简称</td><td> <input name="fund.shortName" value="${fund.shortName }" class="text"/></td></tr>
					<tr><td>发行日期</td><td> <input name="fund.issuedDate" value="${fund.issuedDate }" class="text"/></td></tr>
					<tr><td>类目</td><td> <input name="fund.catelogName" value="${fund.catelogName }" class="text"/></td></tr>
					<tr><td>基金经理</td><td> <input name="fund.manager" value="${fund.manager }" class="text"/></td></tr>
					<tr><td>管理人</td><td> <input name="fund.administrator" value="${fund.administrator }" class="text"/></td></tr>
					<tr><td>托管人</td><td> <input name="fund.custodian" value="${fund.custodian }" class="text"/></td></tr>
					<tr><td>投资目标</td><td> <input name="fund.investmentGoal" value="${fund.investmentGoal }" class="text"/></td></tr>
					<tr><td>投资愿景</td><td> <input name="fund.investmentVision" value="${fund.investmentVision }" class="text"/></td></tr>
					<tr><td>投资范围</td><td><textarea name="fund.investmentScale" class="required xheditor">${fund.investmentScale}</textarea></td></tr>
					<tr><td>投资策略</td><td> <input name="fund.investmentStrategy" value="${fund.investmentStrategy }" class="text"/></td></tr>
					<tr><td>风险特征</td><td><textarea name="fund.characteristics" class="required xheditor">${fund.characteristics}</textarea></td></tr>
					<tr><td>比较基准</td><td> <input name="fund.benchmark" value="${fund.benchmark }" class="text"/></td></tr>
					<tr><td>运作模式</td><td> <input name="fund.operationMode" value="${fund.operationMode }" class="text"/></td></tr>
					<tr><td>基金公司名称</td><td> <input type="hidden" name="fund.fundCompanyId" value="${fund.fundCompanyId }"/> <input name="fund.fundCompanyName" value="${fund.fundCompanyName }" class="text"/></td></tr>
					<tr><td>类目id</td><td> <input name="fund.catelogId" value="${fund.catelogId }" class="text"/></td></tr>
					<tr><td>状态</td><td><s:select name="fund.status" list="#{0:'未发布',1:'已发布'}" listKey="key" listValue="value"></s:select></td></tr>
					<tr><td>创建时间</td><td><input name="fund.createdTime" value="${fund.createdTime}" class="text"/></td></tr>
					<tr><td>更新时间</td><td><input name="fund.lastUpdatedTime" value="${fund.lastUpdatedTime}" class="text"/></td></tr>
					<tr><td colspan="2" align="center">
					<input type="button" value="确认提交" onclick="this.form.submit();" />&nbsp;
					<input type="button" value="返 回" onclick="javascript:window.history.back();" />
					&nbsp;</td></tr>
				</s:if><s:else>
						<tr><td>&nbsp;</td><td align="center">
							<input type="button" value="返 回" onclick="javascript:window.history.back();" />
						</td></tr>
					</s:else>
				</tbody>
			</table>
			</form>
			<!-- .block_content ends -->
			<div class="bendl"></div>
			<div class="bendr"></div>
		</div>
	</div>
</div>
</div>
</body>
</html>