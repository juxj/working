<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui-1.8.21.custom.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery-ui-1.8.21.custom.min.js" > </script>
</head>

<body>
<!--头部2-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="container_950">
	<div class="apply_title" >
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
		<div class="hr_10"> &nbsp; </div>
		<div class="center" style="width:900px;">
			<div class="left_gray">&nbsp;</div>
			<div class="m_gray1">完善企业信息</div>
			<div class="m_gray1">填写申请信息</div>
			<div class="m_red">预审中</div>
			<div class="m_gray">提交资料</div>
			<div class="m_gray">资金网审核</div>
			<div class="m_gray">金融机构审核</div>
			<div class="right_gray">&nbsp;</div>	
		</div>
	</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="box_4">
		<div class="S_table_icon"><img src="/images/S_icon.png" /></div>
		<div class="S_table_connect">
			<s:if test="apply.applyNum==null or apply.applyNum==''">
				<span class="Prompt_01">${msg}</span>
			</s:if>
			<s:else>		
				<span class="Prompt_01">您的贷款申请已成功提交！</span><br/>
				<span class="Prompt_02">您本次贷款申请单号为<a href="/user/loan/userApplyManag!viewFinanceApply.act?apply.id=${apply.id }">${apply.applyNum }</a></span><br/>
				<span class="Prompt_02">中国资金网将会对您的贷款进行初步审核，我们会尽快将结果通过邮件及站内通知反馈给您，请您注意查收。<br/>
						 如您对此次贷款申请有任何疑问，可拨打客服热线400-8890-198，我们的客服人员将为您提供帮助。
						</span>
			</s:else>
		</div>
		<div class="hr_10"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div>
		<div class="center" style="width:200px;">
		  <input type="button" onfocus="this.blur()" onclick="window.location='/user/UserAction.act'" class="but_gray" style="width:200px;" value="确定" />
		</div>
		<div class="hr_10"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div>
	</div>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
