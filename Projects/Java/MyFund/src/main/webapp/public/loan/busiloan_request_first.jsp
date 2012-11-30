<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>企业经营贷款快速申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/load-loan.js" > </script>
<script language="javascript">
$(function(){
	$("#loanForm").validate();
});
</script>
</head>
  
<body>
<!--头部2-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<!--主体部分开始-->
<div class="hr_10"> &nbsp; </div>
<div class="apply_title" >
	<p>融资意向单-企业经营贷款</p>
	<div class="apply_menu" >
        <div class="apply_menu_text01" >1、填写申请信息</div>
        <div class="apply_menu_text02">2、完善需求</div>
        <div class="apply_menu_text03">3、提交成功</div>	
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
<form action="/loan/LoanRequest!loanSecond.act" id="loanForm"  class="box_form" style="margin:0px;" method="post">
<!-- 企业经营贷款快速申请类型=136 -->
<s:hidden name="loan.applyType" value="136"></s:hidden>
	<div class="apply_form_title">第一步&nbsp;&nbsp;填写意向信息</div>
	<div class="C_title">融资意向信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span>
	</div>
	<div class="hr_20"> &nbsp; </div>
	<div class="C_form">
            <dl>
              <dd>
                <h6><span class="txt-impt">*</span>用途：</h6>
                <s:select name="loan.loanPurpose" list="dataMap['loanpurpose']" listKey="id" listValue="name" cssClass="S_width" style="width:200px;"></s:select>
                <h6><span class="txt-impt">*</span>金额：</h6>
                <s:textfield name="loan.loanAmount" cssClass="input-text required digits"  id="loan.loanAmount" maxlength="6"></s:textfield>&nbsp;&nbsp;万元
                <label for="loan.loanAmount" class="error" generated="true" style="display:none;"></label>
              </dd>
              <dd>
                <h6><span class="txt-impt">*</span>期限：</h6>
                <s:textfield name="loan.loanMonth" cssClass="input-text required digits"  id="loan.loanMonth" maxlength="2"></s:textfield>&nbsp;&nbsp;个月
                <label for="loan.loanMonth" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
                <h6><span class="txt-impt">*</span>是否有抵押物：</h6>
				  <input id="radio1" type="radio" name="loan.haveMortgage" value="1" class="required" checked/><label for="radio1">能提供</label>
				  <input id="radio2" type="radio" name="loan.haveMortgage" value="0" /><label for="radio2">无法提供</label>
				</dd>
			 </dl>
	</div>
	<div class="clear"></div>
	<div class="C_title">企业信息</div>
	<div class="hr_20"> &nbsp; </div>
	<div class="C_form">
		<dl>
			<dd>
				<h6><span class="txt-impt">*</span>企业经营类型：</h6>
				<s:select name="loan.busiRunningType" value="#session._user.type" list="userTypeList" listKey="id" listValue="name" cssClass="S_width" style="width:200px;"></s:select>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>上年度销售额：</h6>
				<s:textfield name="loan.lastyearVolume" cssClass="input-text required number"  id="loan.lastyearVolume" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
				<label for="loan.lastyearVolume" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>上年度资产负债率：</h6>
				<s:textfield name="loan.lastyearDebt" cssClass="input-text required number"  id="loan.lastyearDebt" maxlength="10"></s:textfield>&nbsp;&nbsp;%
				<label for="loan.lastyearDebt" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>上年度销售成本：</h6>
				<s:textfield name="loan.lastyearCost" cssClass="input-text required number"  id="loan.lastyearCost" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
				<label for="loan.lastyearCost" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>上年度净利润：</h6>
				<s:textfield name="loan.lastyearProfit" cssClass="input-text required number"  id="loan.lastyearProfit" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
				<label for="loan.lastyearProfit" class="error" generated="true" style="display:none;"></label>
			</dd>
		</dl>
		<div class="hr_10"> &nbsp; </div>
		<div class="center" style="width:200px;">
		<s:submit value="下一步"  cssClass="btnsub bred" style="width:200px;"></s:submit>
		</div>
		<div class="hr_10"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div>
	</div>
</form>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
