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
function payCost(id){
	if(id!=null && id!=0){
		$.post("/admin/payment/manage!payCost.act",{cost:id},function(a){
			if(a=='success'){
				$("#umsg").html("付款成功。").show();
			}else{
				$("#umsg").html("付款失败。").show();
			}
		});
	}else{
		$("#umsg").html("请选择用户。").show();
	}
}
function toPage(pageNo,pageSize){
	$("#pageNo").val(pageNo);
	search();
}
function details(id){
	if(id!=null && id!=0){
		$.post("/admin/payment/manage!showOrd.act",{ordId:id},function(a){
			$("#ord_info").html(a).dialog({width:500,modal: true});
			$(":button").button();
			$(".tablesorter").tablesorter();
		});
	}else{
		$("#umsg").html("请选择订单。").show();
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
				<form id="searchform" action="" method="post">
				<input type="hidden" id="pageNo" name="pageNo"/>
				<!-- 
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
					 -->
					</form>
			<div class="block_content">
				<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
					<thead>
						<tr style="background:#DDDDDD;">
							<th class="header" style="cursor: pointer; ">付款订单编号</th>
							<th class="header" style="cursor: pointer; ">用户名</th>
							<th class="header" style="cursor: pointer; ">服务名称</th>
							<th class="header" style="cursor: pointer; ">付款金额</th>
							<th class="header" style="cursor: pointer; ">付款状态</th>
							<th class="header" style="cursor: pointer; ">订单状态</th>
							<th class="header" style="cursor: pointer; ">付款方式</th>
							<th class="header" style="cursor: pointer; ">操作</th>
							<th width="180px;">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pager.data" var="u" status="i">
						<tr <s:if test="#i.even">class="even"</s:if><s:else>class="odd"</s:else>>
							<td>${u.id}&nbsp;</td>
							<td>${u.username}&nbsp;</td>
							<td>
							<s:if test="#u.memberType==1">资信通认证会员</s:if>
							<s:elseif test="#u.memberType==2">资信通vip会员</s:elseif><s:else>未选择</s:else>
							</td>
							<td><s:if test="#u.memberType==1">365￥</s:if>
							<s:elseif test="#u.memberType==2">5000￥</s:elseif><s:else>0￥</s:else>&nbsp;</td>
							<td><s:if test="#u.payStatus==0">未付款</s:if>
							<s:elseif test="#u.payStatus==1">已付款</s:elseif>&nbsp;</td>
							<td><s:if test="#u.iscancelled==0">正常</s:if>
							<s:elseif test="#u.iscancelled==1">取消</s:elseif>&nbsp;</td>
							<td><s:if test="#u.payWay==2">网银付款</s:if>
							<s:elseif test="#u.payWay==1">银行汇款</s:elseif>&nbsp;</td>
							<td colspan="2">
								<input type="button" onclick="details(${u.id});" value="详细"/> 
								<s:if test="#u.payStatus==0"><input type="button" onclick="payCost(${u.id});" value="已付款"/> </s:if>
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
	</div>
	<div id="ord_info" style="display:none;" title="付费单"></div>
</div>
</body>
</html>