<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/xheditor-1.1.14-zh-cn.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(function(){
	$(":button,:submit,:reset").button();
	$(".date_picker").datepicker();
});
function toPage(pageNum, pageSize){
	var url = "/admin/loan/loanRequest!getRequests.act";
	$('#currentPage').val(pageNum);
	$('#pageCount').val(pageSize);
	$('#frmLoanManage').attr('action',url);
	$('#frmLoanManage').submit();
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
					<h2>融资需求管理</h2>
					<ul>
						<li class="nobg"></li>
						<li></li>
					</ul>
				</div>
				<!-- .block_head ends -->
				<form id="frmLoanManage" action="/admin/loan/loanRequest!getRequests.act" method="post">
				<s:hidden name="pager.currentPage" id="currentPage"></s:hidden>
				<s:hidden name="pager.pageCount" id="pageCount"></s:hidden>
				<div class="block_content">
					<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
						<tr>
							<td>
								<label>发布时间:</label><s:textfield name="spModel.startDt" cssClass="text date_picker"></s:textfield>
								<label>&nbsp;~</label><s:textfield name="spModel.endDt" cssClass="text date_picker"></s:textfield>
							</td>
						</tr>
						<tr>
							<td>
								<label>类别:</label><common:select name="spModel.financeType" valueSetId="27" headerKey="-1" headerValue="不限" cssClass="styled" style="height:25px; "/>
							</td>
						</tr>
						<tr>
							<td>
								<label>状态:</label><common:select name="spModel.status" valueSetId="29" headerKey="-1" headerValue="不限" cssClass="styled" style="height:25px; "/>
							</td>
						</tr>
						<tr>
							<td>
							<input type="submit" value="查询"/>
							</td>
						</tr>
					</table>
						<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
							<thead>
					     		<tr>
						            <th>需求编号</th>
						            <th>发布时间</th>
						            <th>需求金额</th>
						            <th>意向类别</th>
						            <th>期限</th>
						            <th>可接受年利率</th>
						            <th>有效期截止</th>
						            <th>状态</th>
						            <th align="center">操作</th>
					          	</tr>
				          	</thead>
				          	<tbody>
						 	<s:iterator id ="item" value="pager.data" status="st">
								<td>${item.applyNum}</td>
					   			<td><s:date name="#item.createdt" format="yyyy-MM-dd"/></td></td>
					   			<td>${item.loanAmount}万元</td>
					   			<td><common:print valueId="#item.applyType"/></td>
					   			<td>${item.loanMonth}月</td>
					   			<td>${item.rateUpperLimit}~${item.rateLowerLimit}%</td>
					   			<td>${item.effectiveDateend}</td>
					   			<td><common:print valueId="#item.applyStatus"/></td>
					   			<td class="view_detail">     
					   				<a href="/admin/loan/loanRequest!getRequest.act?requestId=${item.id }">查看</a>
					   			</td>
							</tr>
							</s:iterator>
							</tbody>
				        </table>
						<div class="tableactions">
						</div>
						<!-- .tableactions ends -->
						<s:include value="/public/pagination.jsp"/>
						<!-- .pagination ends -->
				</div>
				</form>
   	</div>
   </div>
</div>





        

</body>
</html>
