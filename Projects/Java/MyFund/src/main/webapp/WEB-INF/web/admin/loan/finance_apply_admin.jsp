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
</head>
<script language="javascript">
    $(function() {
    	$(":button,:submit,:reset").button();
        $("#timeOne").datepicker();
    	$("#timeTwo").datepicker();
    });
    function toPage(pageNum, pageSize){
		var url = '/admin/loan/financeApply!adminFinanceApply.act?pager.currentPage=' + pageNum + "&pager.pageCount=" + pageSize;
		$('#applyadmin').attr('action',url);
		$('#applyadmin').submit();
	}
</script>
<body>

<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
	 	<div class="block">
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>融资申请管理</h2>
					<ul>
						<li class="nobg"></li>
						<li></li>
					</ul>
				</div>
				<!-- .block_head ends -->
				<form action="/admin/loan/financeApply!adminFinanceApply.act" method="post" id="applyadmin">
				<div class="block_content">
						<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
							<tr>
								<td  align="right">申请编号:</td>
								<td style="padding:5px;"><s:textfield name="spModel.applyNum"/></td>
								<td  align="right">融资产品名称:</td>
								<td  style="padding:5px;"><s:textfield name="spModel.productName"/></td>
							</tr>
							<tr>
								<td  align="right">类型:</td>
								<td  style="padding:5px;">
									<common:select name="spModel.applyType" headerKey="" headerValue="--请选择类型--" valueSetId="32"></common:select>
								</td>
								<td  align="right">申请方名称:</td>
								<td  style="padding:5px;"><s:textfield name="spModel.userName"/></td>
							</tr>
							<tr>
								<td  align="right">申请时间:</td>
								<td  style="padding:5px;"><s:textfield name="spModel.applyStartDt" id="timeOne" readonly="readonly"/>~<s:textfield name="spModel.applyEndDt" id="timeTwo" readonly="readonly"/></td>
								<td  align="right">申请金额:</td>
								<td  style="padding:5px;"><s:textfield name="spModel.applyAmountLittle"/>~<s:textfield name="spModel.applyAmountBig"/></td>
							</tr>
							<tr>
								<td  align="right">期限:</td>
								<td style="padding:5px;"><s:textfield name="spModel.startMonth"/>~<s:textfield name="spModel.endMonth"/></td>
								<td  align="right">状态:</td>
								<td  style="padding:5px;">
									<common:select name="spModel.applyStatus" headerKey="" headerValue="--请选择类型--" valueSetId="80"></common:select>
								</td>
							</tr>
							<tr>
								<td colspan="4"  align="center">
								<input type="submit" value="查询"/>
								</td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
						<thead>
				     	  <tr>
				            <th>申请编号</th>
				            <th>融资产品名称</th>
				            <th>发行机构</th>
				            <th>类型</th>
				            <th>申请方名称</th>
				            <th>申请时间</th>
				            <th>申请金额</th>
				            <th>期限</th>
				            <th>协议编号</th>
				            <th>状态</th>
				            <th>操作</th>
				          </tr>
				          </thead>
				          <tbody>
						 	<s:iterator id ="item" value="pager.data" status="st">
								<s:if test="#st.even==true">
									<tr id="item_${item.id}" class="odd">
								</s:if>
								<s:else>
									<tr id="item_${item.id}" class="even">
								</s:else>
								<td>${item.applyNum}</td>
								<td width="120px;">${item.productName}</td>
								<td><common:print valueId="productUserId" type="user"/><br/></td>
								<td><common:print valueId="#item.applyType"/></td>
								<td>${item.applyUserName}</td>
					   			<td><s:date name="#item.createdt" format="yyyy-MM-dd"/></td>
								<td><s:number name="loanAmount" />万元</td>
					   			<td>${item.loanMonth}月</td>
					   			<td>${agreeNum }</td>
					   			<td><common:print valueId="applyStatus"/></td>
					   			<td class="view_detail">
					   			<a href="/admin/loan/financeApply!adminViewApply.act?apply.id=${item.id }">查看</a>
					   			</td>
							</tr>
							</s:iterator>
							</tbody>
				        </table>
				        <div class="tableactions">
						</div>
						<!-- .tableactions ends -->
						<div class="pagination right">
							<s:include value="/public/pagination.jsp"/>
						</div>
						<!-- .pagination ends -->
				</div>
				</form>
   	</div>
   </div>
</div>
  
</body>
</html>
