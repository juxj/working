<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script language="javascript">
$(function(){
	$(":button").button();
	$(".tablesorter").tablesorter();
});
function toPage(pageNo, useless) {
	$("#pageNo").val(pageNo);
	$("#frmQueryServiceOrders").submit();
}
function changeSinorderStatus(orderId, status) {
	var url = '/admin/serviceInfoAuthorize!authorizeServiceOrder.act?orderId='+orderId+'&status='+status;
	$.ajax({
		url: url
	}).done(
		function(data, status, response) {
			var text = jQuery.parseJSON(response['responseText']);
			if (text.status =='success') {
				var applyTag = '#authorizing_'+orderId;
				$(applyTag).html("已审核");
			} else {
				alert('操作失败');
			}
		}		
	);	
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
				<h2>订单管理 » 服务订单</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
					<form id="frmQueryServiceOrders" action="serviceInfoAuthorize!showServiceOrderForm.act">
						<input type="hidden" id="pageNo" name="pageNo"/>
					</form>
					<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
						<thead>
							<tr>
								<th class="header" style="cursor: pointer; ">订单号</th>
					   			<th class="header" style="cursor: pointer; ">申请单位名称</th>
					   			<th class="header" style="cursor: pointer; ">申请人</th>
					   			<th class="header" style="cursor: pointer; ">服务类型</th>
					   			<th class="header" style="cursor: pointer; ">服务名称</th>
					   			<th class="header" style="cursor: pointer; ">服务提供方名称</th>
					   			<th class="header" style="cursor: pointer; ">服务等级</th>
					   			<th class="header" style="cursor: pointer; ">评价内容</th>
					   			<th class="header" style="cursor: pointer; ">申请日期</th>
					   			<th class="header" style="cursor: pointer; ">评价日期</th>
					   			<th class="header" style="cursor: pointer; ">操作</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator id="order" value="pager.data" status="st">
							<s:if test="#st.even==true">
								<tr id="order_${order.id}" class="odd">
							</s:if>
							<s:else>
								<tr id="order_${order.id}" class="even">
							</s:else>
				   				<td><a href="/admin/serviceInfoAuthorize!showOrderForm.act?orderId=${order.id}">${order.orderNo }</a></td>
				   				<td>${order.orgName }</td>
				   				<td>${order.contactName }</td>
				   				<td>${order.itemTypeName }</td>
				   				<td>${order.itemTitle }</td>
				   				<td>${order.vendorName }</td>
				   				<td>${order.serviceLevel }</td>
				   				<td>${order.assessment }</td>
				   				<td><s:date name="#order.applyDate "/> </td>
				   				<td><s:date name="#order.expiredDate"/> </td>
				   				<td id="authorizing_${order.id}"><input type="button" onclick="changeSinorderStatus(${order.id},'1')" value="通过"/></td>
				   			</tr>
				   			</s:iterator>
						</tbody>
					</table>
					<div class="tableactions">
					</div>
					<!-- .tableactions ends -->
					<div class="pagination right">
						<jsp:include page="/public/pagination.jsp" />
					</div>
					<!-- .pagination ends -->
			</div>
  	</div>
  	</div>
</div>
</body>
</html>
