<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>产品管理</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui-1.8.21.custom.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery-ui-1.8.21.custom.min.js" > </script>
</head>

<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--理财服务产品列表页面开始-->
<div class="apply_title" style="height:60px;">
	<p>产品管理</p>
</div>
  <div class="M_box" >
	<s:elseif test="product.proStatus == 197">
		<div class="C_title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产品已提交审核</span></div>
	</s:elseif>
	<s:elseif test="product.proStatus == 198">
		<div class="C_title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产品已发布</span></div>
	</s:elseif>
	<s:elseif test="product.proStatus == 199">
		<div class="C_title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产品已撤销</span></div>
	</s:elseif>
	<br />
	<table width="600">
		<tr>
			<td align="center"><input type="button" value="返回产品列表" onclick="window.location='/user/loan/financeProduct.act'" class="but_gray"/></td>
		</tr>
	</table>
	<br />
</div>
  <!--理财服务产品列表页面结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_20"> &nbsp; </div>
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
