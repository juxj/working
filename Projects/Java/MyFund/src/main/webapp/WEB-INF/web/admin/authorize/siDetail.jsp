<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script>
$(function(){
	$(":button").button();
});
function authorize(itemId, authenticated) {
	var url = '/admin/serviceInfoAuthorize!authorizeServiceInfo.act?itemId='+itemId+'&isAuthenticated='+authenticated;
	$.ajax({
		url: url
	}).done(
		function(data, status, response) {
			var text = jQuery.parseJSON(response['responseText']);
			if (text.status =='success') {
				window.location.href = "/admin/serviceInfoAuthorize!showUnauthorizedServiceInfo.act";
			} else {
				alert('操作失败');
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
			<h2>产品管理 » 服务产品 » 产品详细</h2>
		</div>
		<!-- .block_head ends -->
	  	<div class="block_content">
        <!--表格部分开始-->
        <table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
			<tbody>
				<tr class="even">
					<td width="200px;">服务标题</td>
		            <td>${sinItem.title}</td>
				</tr>
				<tr class="odd">
					<td>服务类别</td>
					<td>${sinItem.typeName}</td>
				</tr>
				<tr class="even">
					<td>收费标准</td>
					<td>${sinItem.chargeRange}</td>
				</tr>
				<tr class="odd">
					<td>面向区域</td>
					<td>${sinItem.regionName}</td>
				</tr>
				<tr class="even">
					<td>面向区域</td>
					<td>${sinItem.targetName}</td>
				</tr>
				<tr class="odd">
					<td>服务内容</td>
					<td colspan="3">${sinItem.serviceInfo}</td>
				</tr>
				<tr class="even">
					<td>服务评价</td>
					<td colspan="3">${sinItem.assessment}</td>
				</tr>
			</tbody>
		</table>
		<div align="center">
       		<input type="button" onclick="javascript:authorize(${sinItem.id},'1')" value="通过"/> 
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" onclick="javascript:authorize(${sinItem.id},'2')" value="驳回"/> 
       	</div>
        <!--表格部分结束-->
    </div>
  	</div>
</div>
</div>
</body>
</html>
