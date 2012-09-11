<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script language="javascript">
$(function(){
	$(":button").button();
});
function authorize(orderId, status) {
	var url = '/admin/serviceInfoAuthorize!authorizeServiceOrder.act?orderId='+orderId+'&status='+status;
	$.ajax({
		url: url
	}).done(
		function(data, status, response) {
			var text = jQuery.parseJSON(response['responseText']);
			if (text.status =='success') {
				window.location.href = "/admin/serviceInfoAuthorize!showServiceOrderForm.act";//应该显示是否成功的结果（非alert提示），然后本页面有返回按钮
			} else {
				alert('操作失败');//应该页面显示错误，非alert提示
			}
		}		
	);	
}
</script>
</head>

<body>
<!--头部开始-->
<div id="hld">
<div class="wrapper">
	<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
 	<div class="block">
		<div class="block_head">
			<div class="bheadl"></div>
			<div class="bheadr"></div>
			<h2>订单管理 » 服务订单 » 订单详情</h2>
		</div>
		<!-- .block_head ends -->
	  	<div class="block_content">
        <!--表格部分开始-->
		<table cellpadding="0" cellspacing="0" width="100%">
			<thead>
				<tr class="even">
					<td width="200px;">订单号</td>
					<td colspan="3">${sinOrder.orderNo }</td>
				</tr>
				<tr class="odd">
					<td>申请单位名称</td>
					<td>${sinOrder.orgName }</td>
				</tr>
				<tr class="even">
					<td>申请人</td>
					<td>${sinOrder.contactName }</td>
				</tr>
				<tr class="odd">
					<td>服务类型</td>
					<td>${sinOrder.itemTypeName }</td>
				</tr>
				<tr class="even">
					<td>服务名称</td>
					<td>${sinOrder.itemTitle }</td>
				</tr>
				<tr class="odd">
					<td>服务提供方名称</td>
					<td>${sinOrder.vendorName }</td>
				</tr>
				<tr class="even">
					<td>服务等级</td>
					<td>${sinOrder.serviceLevel }</td>
				</tr>
				<tr class="odd">
					<td>服务等级描述</td>
					<td>${sinOrder.serviceLevelDesc }</td>
				</tr>
				<tr class="even">
					<td>评价日期</td>
					<td><s:date name="#sinOrder.expiredDate"/></td>
				</tr>
				<tr class="odd">
					<td>评价内容</td>
					<td>${sinOrder.assessment }</td>
				</tr>
				<tr class="even">
					<td>申请日期</td>
					<td><s:date name="#sinOrder.applyDate "/></td>
				</tr>
			</thead>
		</table>
		<div align="center">
       		<input type="button" onclick="javascript:authorize(${sinOrder.id},'1')" value="通过"/> 
       	</div>
        <!--表格部分结束-->
    </div>
  	</div>
</div>
</div>
</body>
</html>
