<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
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
			<h2>会员管理»协议管理</h2>
			<ul>
				<li class="nobg"></li>
				<li><a href="/admin/userContract!createContract.act">新增合同资料</a></li>
			</ul>
		</div>
		<!-- .block_head ends -->
	  	<div class="M_out_L">
        <!--表格部分开始-->
		<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
			<thead>
				<tr>
					<th width="10">&nbsp;</th>
					<th>编号</th>
					<th>标题</th>
					<th>企业</th>
		   			<th>合同类型</th>
		   			<th>签署日期</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator id="item" value="userContractList.data" status="st">
					<s:if test="#st.even==true">
						<tr id="item_${item.id}" class="odd">
					</s:if>
					<s:else>
						<tr id="item_${item.id}" class="even">
					</s:else>
		   				<th>&nbsp;</th>
		   				<td><a href="/admin/userContract!editContract.act?contractId=${item.id}">${item.contractNumber }</a></td>
		   				<td>${item.title }&nbsp;</td>
		   				<td>${item.contractTypeName }&nbsp;</td>
		   				<td>${item.userName }&nbsp;</td>
		   				<td><s:date name="#item.signedDate" /> &nbsp;</td>
		   			</tr>
	   			</s:iterator>
			</tbody>
        <!--表格部分结束-->
    </div>
  	</div>
</div>
</div>
</body>
</html>
