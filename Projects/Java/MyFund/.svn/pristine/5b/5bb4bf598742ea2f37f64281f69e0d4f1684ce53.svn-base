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

<body>
<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
	 	<div class="block">
			<div class="block_head">
				<div class="bheadl"></div>
				<div class="bheadr"></div>
				<h2>融资产品管理</h2>
				<ul>
					<li class="nobg"></li>
					<li></li>
				</ul>
			</div>
			<form action="/admin/loan/financePro!financeAdmin.act" method="post">
			<div class="block_content tab_content" id="tab1" style="display: block; ">
				<h3><s:elseif test="product.proStatus == 198">
					产品已发布
				</s:elseif>
				<s:elseif test="product.proStatus == 199">
					产品已撤销
				</s:elseif>
				<s:elseif test="product.proStatus == 200">
					产品已删除
				</s:elseif>
				</h3>
				<input type="submit" value="返回产品列表" class="submit small"/>
			</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>
