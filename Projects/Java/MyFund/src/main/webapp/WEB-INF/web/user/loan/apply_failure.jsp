<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>快速申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/load-loan.js" > </script>
</head>

<body>
<!--头部2-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>

<!--主体部分开始-->
<div class="apply_title">
	<p>
	<s:if test="product.financeType == 151">
		企业经营贷款申请
	</s:if>
	<s:elseif test="product.financeType == 152">
		个人经营性贷款申请
	</s:elseif>
	</p>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
	<div class="apply_menu">
        <div class="finance_apply_menu app_menu001" >1、完善企业信息</div>
        <div class="finance_apply_menu app_menu02" >2、填写申请信息</div>
        <div class="finance_apply_menu app_menu002">3、申请失败</div>
        <div class="finance_apply_menu app_menu02">4、提交资料</div>
        <div class="finance_apply_menu app_menu02">5、资金网审核</div>
        <div class="finance_apply_menu app_menu03">6、金融机构审核</div>	
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
	<div class="S_table_icon"><img src="/images/wrong_ico.png" /></div>
	<div class="S_table_connect">
		<span class="Prompt_01">
		${msg }
		</span>
	</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
	<div class="center" style="width:300px;">
	  <input type="button" onclick="window.location='/loan/financeProduct!cusViewFinance.act?product.id=${product.id}';" class="but_gray" style="width:200px;" value="返回产品页面" />
	</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
