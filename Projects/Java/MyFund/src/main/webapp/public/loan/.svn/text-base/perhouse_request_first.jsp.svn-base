<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>个人购房贷款快速申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/public.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script language="javascript">
//文本框触发焦点效果s
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    })
})

$(function(){
	$("#birthday").datepicker();
	$("#loanForm").validate();
	document.getElementsByName('loan.repaymentType')[0].checked=true;
	document.getElementsByName('loan.teachLevel')[0].checked=true;
	document.getElementsByName('loan.workTime')[0].checked=true;
});
</script>
  </head>
  
  <body>
<!--头部2-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="apply_title" >
	<p>个人购房贷款快速申请</p>
	<div class="apply_menu">
        <div class="apply_menu_text01" >1、填写申请信息</div>
        <div class="apply_menu_text02">2、完善需求</div>
        <div class="apply_menu_text03">3、申请成功</div>	
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
<form action="/loan/LoanRequest!loanSecond.act" id="loanForm" style="width:950px;" class="box_form" >

<s:hidden name="loan.applyType" value="139"></s:hidden>
	<div class="apply_form_title">第一步&nbsp;&nbsp;填写申请信息</div>
	<div class="C_title">贷款需求信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span>
	</div>
	<div class="C_form">
            <dl>
              <dd>
                <h6><span class="txt-impt">*</span>房屋性质：</h6>
                <s:select name="loan.houseNature" list="dataMap['housenaturn']" listKey="id" listValue="name" cssClass="S_width"></s:select>
                <h6>贷款金额：</h6>
                <s:textfield name="loan.loanAmount" cssClass="input-text required number" ></s:textfield>&nbsp;&nbsp;万元
                <label for="loan.loanAmount" class="error" generated="true" style="display:none;"></label>
              </dd>
              <dd>
                <h6>贷款期限：</h6>
                <s:textfield name="loan.loanMonth" cssClass="input-text required digits"></s:textfield>年
                <label for="loan.loanMonth" class="error" generated="true" style="display:none;"></label>
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;还款方式：
				  <s:radio name="loan.repaymentType" list="dataMap['repaymenttype']" listKey="id" listValue="name" cssClass="required"></s:radio>
				  <label for="loan.repaymentType" class="error" generated="true" style="display:none;"></label>
			  </dd>
			 </dl>
	</div>
	<div class="clear"></div>
	<div class="C_title">个人信息</div>
	<div class="C_form">
		<dl>
			
			<dd>
				<h6>出生年月：</h6>
				<s:textfield name="loan.birthday" id="birthday" readonly="readonly" cssClass="required"></s:textfield>
				<label for="loan.birthday" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6>教育程度：</h6>
				<s:radio name="loan.teachLevel" list="dataMap['teachlevel']" listKey="id" listValue="name" cssClass="required"></s:radio>
				<label for="loan.teachLevel" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6>现单位性质：</h6>
				<s:select name="loan.companyType" list="dataMap['companynature']" listKey="id" listValue="name"  cssClass="S_width"></s:select>
				<label for="loan.companyType" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6>现单位工作时长：</h6>
				<s:radio name="loan.workTime" list="dataMap['worktime']" listKey="id" listValue="name" cssClass="required"></s:radio>
				<label for="loan.workTime" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6>税后月收入：</h6>
				<s:radio value="1" name="loan.salaryLevel" list="%{#{1:'有',0:'无'}}" cssClass="required"></s:radio>
				<label for="loan.salaryLevel" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6>发薪形式：</h6>
				<s:radio value="1" name="loan.putSalaryType" list="%{#{1:'有',0:'无'}}" cssClass="required"></s:radio>
				<label for="loan.putSalaryType" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6>使用信用卡经历：</h6>
				<s:radio value="1" name="loan.userCreditCard" list="%{#{1:'有',0:'无'}}" cssClass="required"></s:radio>
				<label for="loan.userCreditCard" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6>银行流水：</h6>
				<s:radio value="1" name="loan.bankSalaryList" list="%{#{1:'能提供',0:'无法提供'}}" cssClass="required"></s:radio>
				<label for="loan.bankSalaryList" class="error" generated="true" style="display:none;"></label>
			</dd>
		</dl>
		<div class="hr_10"> &nbsp; </div>
		<div class="center" style="width:200px;">
		<s:submit value="下一步"  cssClass="btnsub bred" style="width:200px;"></s:submit>
		</div>
		<div class="hr_10"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div>
</form>
	</div>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
