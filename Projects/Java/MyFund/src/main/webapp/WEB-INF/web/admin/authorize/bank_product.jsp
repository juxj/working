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
	<script language="javascript" >
		function toPage(pageNo, pageCount) {
			document.getElementById("pageNo").value = pageNo;
			form = document.getElementById("frmQueryBankProduct");
			form.submit();
		}
		
		$(function(){
			$(".date_picker").datepicker();
		});
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
					<h2>产品管理 » 理财产品</h2>
					<ul>
						<li class="nobg"></li>
						<li></li>
					</ul>
				</div>
				<div class="block_content">
					<form id="frmQueryBankProduct" action="/admin/bankProductAction.act" method="post">
						<input type="hidden" id="pageNo" name="pageNo" value="1"/>
						<table width="100%">
							<tr>
								<td>产品名称:</td>
								<td>发行银行:</td> 
								<td>起销日期日期:</td>
								<td>截止日期:</td>
								<td>状态:</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td><s:textfield type="text" id="prdBankfinance.name" name="prdBankfinance.name" cssClass="text small" style="width:100px"/> </td>
								<td><s:textfield type="text" id="prdBankfinance.bank" name="prdBankfinance.bank" cssClass="text small" style="width:100px"/></td>
								<td><s:textfield id="prdBankfinance.sellstart" name="prdBankfinance.sellstart" cssClass="text date_picker"/></td>
								<td><s:textfield id="prdBankfinance.sellend" name="prdBankfinance.sellend" cssClass="text date_picker"/></td>
								<td>
									<select id="recommendationStatus"  name="recommendationStatus" class="cmf-skinned-select" >
										<option value="0" selected> 未荐 </option>
										<option value="1"> 已荐 </option>
										<option value="2"> 停用 </option>
									</select>
								</td>
								<td><input type="submit" value="查询" class="submit"/></td>
							</tr>
						</table>
						</p>
					</form>
				</div>
				<div class="block_content">
					<form action="" method="post">
						<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
							<thead>
								<tr>
									  <th>产品名称</th>
						            <th>发行银行</th>
						            <th>起销日期</th>
						            <th>投资期限</th>
						            <th>起点金额</th>
						            <th>预期年化收益率</th>
						            <th>状态</th>
						            <th>操作</th>
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
					   				<td><a href="/finance/bankProduct!showDetails.act?id=${item.id}"> ${item.name} </a> </td>
						   			<td>${item.bank}</td>
						   			<td><s:date name="#item.sellstart"/></td>
						   			<td>${item.manageperiod}</td>
						   			<td>${item.minamount}</td>
						   			<td>${item.benefitrate}</td>
						   			<td>
						   				<s:if test="recommendationStatus == 0">
						   					未荐产品
						   				</s:if>
						   				<s:if test="recommendationStatus == 1">
						   					已荐产品
						   				</s:if>
						   				<s:if test="recommendationStatus == 2">
						   					停用产品
						   				</s:if>
						   			</td>
						   			<td>
						   				<s:if test="recommendationStatus == 0">
						   					<a href="/admin/bankProductAction!editPrdRecommedation.act?typeId=1&prodId=${item.id}">推荐</a>
						   				</s:if>
						   				<s:if test="recommendationStatus == 1">
						   					<a href="/admin/bankProductAction!editPrdRecommedation.act?typeId=1&prodId=${item.id}">修改</a>
						   				</s:if>
						   				<s:if test="recommendationStatus == 2">
						   					<a href="/admin/bankProductAction!editPrdRecommedation.act?typeId=1&prodId=${item.id}">启用</a>
						   				</s:if>
						   				
						   			</td>
						   			</tr>
					   			</s:iterator>
							</tbody>
						</table>
						<div class="tableactions"></div>
						<!-- .tableactions ends -->
						<div class="pagination right">
							<jsp:include page="/public/pagination.jsp"/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>
