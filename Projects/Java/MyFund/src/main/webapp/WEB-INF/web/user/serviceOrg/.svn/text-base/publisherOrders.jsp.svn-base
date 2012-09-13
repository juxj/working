<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>服务机构用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script language="javascript">
function changeOrderStatus(orderId, orderStatus) {
	var url = "/service/serviceOrder!changeOrderStatus.act?orderId="+orderId+"&orderStatus="+orderStatus;
	$.ajax({
		url: url,
		success: function(data, status, response){
			result = jQuery.parseJSON(response.responseText);
			if (result.status=='success'){
				$("#operation_"+orderId).html("操作成功");
				if (orderStatus==1) {
					$("#status_"+orderId).html("已受理");
				} else {
					$("#status_"+orderId).html("已拒绝");
				}
			}
		}
	});
}
function toPage(pageNo){
	document.location.href="/service/serviceOrder!showPublisherOrders.act?pageNo="+pageNo;
}
</script>
</head>
<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_960">
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<!-- 当取得的结果值大于０,才显示下面的表格 -->
	<div class="M_menu">
  		服务管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;服务申请管理
    </div>
    <div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
    <div style="text-align:center">
    	<h3>服务申请管理</h3>
    </div>
    <div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
		<!-- 表格 -->
		<div class="hr_10"> &nbsp; </div> 
		<div class="M_box">
		   	<table border="0" cellspacing="0" cellpadding="0" style="width:100%"  >
		   		<tr class="BankProductHeader">
		   			<th>申请编号</th>
		   			<th>服务编号</th>
		   			<th>服务标题</th>
		   			<th>服务类型</th>
		   			<th>申请方名称</th>
		   			<th>申请时间</th>
		   			<th>状态</th>
		   			<!--  
		   			<th>操作</th>
		   			-->
		   		</tr>
		   		<s:if test="pager.data.size>0">
			   		<s:iterator id="item" value="pager.data">
		  			<tr  class="gold_connect">
		  				<td>${item.orderNo }</td>
		  				<td>${item.serviceNo }</td>
		  				<td title="点击查看服务详情"><a href="/service/serviceItem!showSinItemDetail.act?itemId=${item.itemId }">${item.itemTitle}</a></td>
		  				<td>${item.itemTypeName }</td>
		  				<td>${item.contactName }</td>
		  				<td><s:date name="#item.applyDate"/></td>
		  				<td id="status_${item.id}">
		  					<s:if test="#item.status==0">
				          		待确认
				          	</s:if>
				          	<s:if test="#item.status==1">
				          		已受理
				          	</s:if>
				          	<s:if test="#item.status==-1">
				          		已拒绝
				          	</s:if>
				          	&nbsp;
		  				</td>
		  				<!--  
		  				<td id="operation_${item.id}">
		  					<s:if test="#item.status==1">
				          		<a href="javascript:changeOrderStatus(${item.id}, 1)">接受</a>,　<a href="javascript:changeOrderStatus(${item.id}, -1)">拒绝</a>
				          	</s:if>
				          	<s:else>
				          		--
				          	</s:else>
				          	&nbsp;
		  				</td>
		  				-->
		  			</tr>
		  			</s:iterator>
		  		</s:if><s:else>
		  			<tr  class="gold_connect">
		  				<td colspan="8">无数据</td>
		  			</tr>
	  			</s:else>
			</table>
		  </div>
		  
		  <div style="width:960px; margin:0 auto; text-align:right;">
	        <div class="pages01">
				<jsp:include page="/public/pagination.jsp" />
		    </div>
	     </div>
     
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>