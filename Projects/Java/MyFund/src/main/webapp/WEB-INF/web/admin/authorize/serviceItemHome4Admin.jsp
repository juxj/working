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
<script>
$(function(){
	$(":button").button();
	$(".tablesorter").tablesorter();
	$(".date_picker").datepicker();
});

function toPage(pageNo, useless) {
	document.getElementById("pageNo").value=pageNo;
	var frmQueryUnauthorizedItems = document.getElementById("frmQueryUnauthorizedItems");
	frmQueryUnauthorizedItems.submit();
}

function changeSinItemStatus(itemId, authenticated) {
	var url = '/admin/serviceInfoAuthorize!authorizeServiceInfo.act?itemId='+itemId+'&isAuthenticated='+authenticated;
	$.ajax({
		url: url
	}).done(
		function(data, status, response) {
			var text = jQuery.parseJSON(response['responseText']);
			if (text.status =='success') {
				var applyTag = '#authorizing_'+itemId;
				$(applyTag).html("操作成功");
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
			<h2>产品管理 » 服务产品</h2>
			<ul>
				<li class="nobg"></li>
				<li></li>
			</ul>
		</div>
		<div class="block_content">
			<form id="frmQueryUnauthorizedItems" action="/admin/serviceInfoAuthorize!showUnauthorizedServiceInfo.act" method="post"  class="sortable">
				<input type="hidden" id="pageNo" name="pageNo" value="1"/>
				<table width="100%">
					<tr>
						<td>标题:</td>
						<td>公司名称:</td> 
						<td>服务类型:</td>
						<td>发布日期:</td>
						<td>截止日期:</td>
						<td>状态:</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><s:textfield type="text" id="sinItem.title" name="sinItem.title" cssClass="text small" style="width:100px"/> </td>
						<td><s:textfield type="text" id="sinItem.companyName" name="sinItem.companyName" cssClass="text small" style="width:100px"/></td>
						<td><s:textfield type="text" id="sinItem.typeName" name="sinItem.typeName" cssClass="text small" style="width:100px"/></td>
						<td><s:textfield id="sinItem.issuedDate" name="sinItem.issuedDate" cssClass="text date_picker"/></td>
						<td><s:textfield id="sinItem.expiredDate" name="sinItem.expiredDate" cssClass="text date_picker"/></td>
						<td>
							<select id="sinItem.isAuthenticated"  name="sinItem.isAuthenticated" class="cmf-skinned-select" >
								<option value="1"> 启用中 </option>
								<option value="0" selected> 待审核 </option>
								<option value="2"> 已停用 </option>
							</select>
						</td>
						<td><input type="submit" value="查询" class="submit"/></td>
					</tr>
				</table>
				</p>
			</form>
		</div>
		
		<!-- .block_head ends -->
		<div class="block_content">
				<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
					<thead>
						<tr>
							<th width="26%">标题</th>
				   			<th width="12%">公司名称</th>
				   			<th >服务类型</th>
				   			<th >费用范围</th>
				   			<th >服务地区</th>
				   			<th >发布日期</th>
				   			<th >截止日期</th>
				   			<th >状态</th>
				   			<th >操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator id="item" value="pager.data" status="st">
						<s:if test="#st.even==true">
							<tr id="item_${item.id}" class="odd">
						</s:if>
						<s:else>
							<tr id="item_${item.id}" class="even">
						</s:else>
			   				<td><a href="/admin/serviceInfoAuthorize!showDetail.act?itemId=${item.id}">${item.title }</a></td>
			   				<td>${item.companyName }&nbsp;</td>
			   				<td>${item.typeName }&nbsp;</td>
			   				<td>${item.chargeRange }&nbsp;</td>
			   				<td>${item.regionName }&nbsp;</td>
			   				<td><s:date name="#item.issuedDate "/> &nbsp;</td>
			   				<td><s:date name="#item.expiredDate"/> &nbsp;</td>
			   				<td>
			   					<s:if test="#item.isAuthenticated==0">
			   						待审核
			   					</s:if>
			   					
			   					<s:if test="#item.isAuthenticated==1">
			   						已通过
			   					</s:if>
			   					
			   					<s:if test="#item.isAuthenticated==2">
			   						未通过
			   					</s:if>
			   				</td>
			   				<td id="authorizing_${item.id}">
			   					<s:if test="#item.isAuthenticated==0">
			   						<input type="button" onclick="changeSinItemStatus(${item.id},'1')" value="通过"/>
			   						<input type="button" onclick="changeSinItemStatus(${item.id},'2');" value="驳回"/></td>
			   					</s:if>
			   					
			   					<s:if test="#item.isAuthenticated==1">
			   						<input type="button" onclick="changeSinItemStatus(${item.id},'2');" value="停用"/></td>
			   					</s:if>
			   					
			   					<s:if test="#item.isAuthenticated==2">
			   						<input type="button" onclick="changeSinItemStatus(${item.id},'1')" value="启用"/> 
			   					</s:if>
			   			</tr>
			   			</s:iterator>
					</tbody>
				</table>
				<div class="tableactions">
				</div>
				<!-- .tableactions ends -->
				<div class="pagination right">
					<jsp:include page="/public/pagination.jsp"/>
				</div>
				<!-- .pagination ends -->
		</div>
 	</div>
 	</div>
</div>
</body>
</html>
