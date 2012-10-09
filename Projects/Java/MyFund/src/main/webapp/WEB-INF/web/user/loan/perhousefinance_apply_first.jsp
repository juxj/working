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
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery-ui-1.8.21.custom.min.js" > </script>
<script type="text/javascript" src="/script/public.js" > </script>
<script language="javascript">
//文本框触发焦点效果s
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
});

$(function(){
	$("#loanForm").validate();
});
 $(function() {
        $("table.gold-table tr:nth-child(odd)").addClass("gold-table-altrow");
    });

	$(document).ready(function() {
        $('.xxkbox:gt(0)').hide(); //让从大于0开始的div都隐藏 
        $('.first').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
        var sb = $('.tab_menu ul li');
        sb.hover(function() {
            $(this).addClass('hover').siblings().removeClass();
            var nb = sb.index(this);
            $('.xxkbox').eq(nb).show().siblings().hide();
        });
        //} 
    });
</script>

  </head>
  
  <body>
<!--头部2-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="apply_title" >
	<p>个人住房贷款快速申请</p>
	<div class="apply_menu">
        <div class="finance_apply_menu app_menu01" >1、填写申请信息</div>
        <div class="finance_apply_menu app_menu02">2、预审中</div>
        <div class="finance_apply_menu app_menu02">3、提交补充材料</div>
        <div class="finance_apply_menu app_menu02">4、审核中</div>
        <div class="finance_apply_menu app_menu03">5、审核通过</div>	
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
<form action="/user/loan/financeApply!applySecond.act" id="loanForm" method="post" class="box_form" style="margin:0px;" >
<!-- 企业经营贷款快速申请类型=136 -->
<s:hidden name="product.id"></s:hidden>
	<div class="apply_form_title">个人住房贷款</div>
	<div class="C_title">融资需求信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span>
	</div>
	<div class="C_form">
            <dl>
              <dd>
                <h6><span class="txt-impt">*</span>房屋性质：</h6>
                <common:select name="apply.houseNature" valueSetId="25" cssClass="S_width input-text"></common:select>
                <h6>贷款金额：</h6>
                <s:textfield name="apply.loanAmount" cssClass="input-text required number"  id="apply.loanAmount"></s:textfield>&nbsp;&nbsp;万元
                <label for="apply.loanAmount" class="error" generated="true" style="display:none;"></label>
              </dd>
              <dd>
                <h6>贷款期限：</h6>
                <s:textfield name="apply.loanMonth" cssClass="input-text required digits"  id="apply.loanMonth"></s:textfield>&nbsp;&nbsp;个月
                <label for="apply.loanMonth" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
                <h6>是否有抵押物：</h6>
				  <input id="radio1" type="radio" name="apply.haveMortgage" value="1" class="required" checked/><label for="radio1">能提供</label>
				  <input id="radio2" type="radio" name="apply.haveMortgage" value="0" /><label for="radio2">无法提供</label>
				</dd>
			 </dl>
	</div>
	<div class="clear"></div>
	<div class="C_title">个人信息</div>
	<div class="C_form">
		<dl>
			<dd>
						<h6>现单位性质：</h6>
						<common:select name="apply.companyType"
							cssClass="S_width input-text" valueSetId="6"
							id="apply.companyType"></common:select>
						<label for="apply.companyType" class="error" generated="true"
							style="display:none;"></label>
					</dd>
					<dd>
						<h6>现单位工作时长：</h6>
						<common:radio name="apply.workTime" valueSetId="19"
							cssClass="required"></common:radio>
						<label for="apply.workTime" class="error" generated="true"
							style="display:none;"></label>
					</dd>
					<dd>
						<h6>税后月收入：</h6>
						<common:select name="apply.salaryLevel" valueSetId="20"
							cssClass="S_width"></common:select>
						<label for="apply.salaryLevel" class="error" generated="true"
							style="display:none;"></label>
					</dd>
					<dd>
						<h6>发薪形式：</h6>
						<common:select name="apply.putSalaryType" valueSetId="21"
							cssClass="S_width"></common:select>
						<label for="apply.putSalaryType" class="error" generated="true"
							style="display:none;"></label>
					</dd>
					<dd>
						<h6>银行借款经历：</h6>
						<s:radio name="apply.hostoryapply" value="1"
							list="%{#{1:'有',0:'无'}}" cssClass="required"></s:radio>
						<label for="apply.hostoryapply" class="error" generated="true"
							style="display:none;"></label>
					</dd>
					<dd>
						<h6>使用信用卡经历：</h6>
						<s:radio name="apply.userCreditCard" value="1"
							list="%{#{1:'有',0:'无'}}" cssClass="required"></s:radio>
						<label for="apply.userCreditCard" class="error" generated="true"
							style="display:none;"></label>
					</dd>
		</dl>
		<div class="hr_10"> &nbsp; </div>
		<div class="center" style="width:200px;">
		<s:submit value="下一步"  cssClass="but_gray" style="width:200px;"></s:submit>
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
