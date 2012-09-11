<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资放款</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
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
	$("#loanForm").validate();
    $("#timeOne").datepicker();
    $("#timeTwo").datepicker();
});
/*
function paymentway(capitalWay){
	//手动填写多少个月
	var loanmonth = $("#appLoan_loanMonth").val();
	//手动填写贷款金额
	var loanamount = $("#appLoan_loanAmount").val();
	if(capitalWay == 205){
		$("#repayment_block").html("");
	}else if(capitalWay == 206){//月
		loanamount = loanamount/loanmonth;
		blocktable(loanmonth, loanamount);
	}else if(capitalWay == 207){
		loanmonth = parseInt((loanmonth-1)/3) +1;
		loanamount = loanamount/loanmonth;
		blocktable(loanmonth, loanamount);
	}else if(capitalWay == 208){
		loanmonth = parseInt((loanmonth-1)/12) +1;
		loanamount = loanamount/loanmonth;
		blocktable(loanmonth, loanamount);
	}
	
}
function blocktable(loanmonth, loanamount){
	var blockTable = $("#block_table");
	if(blockTable.length == 0){
		blockTable = $("<table id='block_table' border='1'></table>");
	}else{
		blockTable.remove();
		blockTable = $("<table id='block_table' border='1'></table>");
	}
	var blockLabel = "<tr><td>期数</td>";
	var blockInput = "<tr><td>应还金额（元）</td>";
	for(var i = 0; i<loanmonth; i++){
		blockLabel = blockLabel + "<td>第" + (i+1) + "期</td>";
		blockInput = blockInput + "<td><input type='text' name='capitalBlock' value='" + loanamount + "'/></td>";
		if(i > 0 && (i+1) % 6 == 0){
			blockLabel = blockLabel + "</tr>";
			blockInput = blockInput + "</tr>";
			blockTable.append($(blockLabel));
			blockTable.append($(blockInput));
			if(i != loanmonth-1){
				blockLabel = "<tr><td>期数</td>";
				blockInput = "<tr><td>应还金额（元）</td>";
			}
		}
		if(i == (loanmonth-1) && (i+1) % 6 != 0){
			blockLabel = blockLabel + "</tr>";
			blockInput = blockInput + "</tr>";
			blockTable.append($(blockLabel));
			blockTable.append($(blockInput));
		}
	}
	$("#repayment_block").append(blockTable);
}

function onSubmit(){
	console.info($("#capitalBlock"));
	$("input[name=capitalBlock]").each(function(){
		alert($(this).text())
	})
	return false;
	$("#loanForm").submit();;
	
}*/
</script>
<style type="">

input{
	width: 10px;
}
	
</style>
  </head>
  
  <body>
<!--头部2-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="apply_form">
<form action="/user/loan/loanAfter!loanAfterAdd.act" id="loanForm"  cssClass="box_form" style="margin:0px;" method="post">
			<s:hidden name="appId"></s:hidden>
			<div class="apply_form_title"><p align="center" style="font-size: 20px;">填写融资放款信息</p></div>
			<div class="C_form">
		            <dl>
		              <dd style="width:900px;">
		               <h6>合同编号：</h6>
		                <s:textfield name="appLoan.contractNum" cssClass="input-text required" id="appLoan_contractNum"></s:textfield>
		                <label for="appLoan_contractNum" class="error" generated="true" style="display:none; float: left;"></label>		                
		               <h6>借款方名称：</h6>
		                <s:textfield name="appLoan.customerName" cssClass="input-text required"  id="appLoan_customerName"></s:textfield>
		                <label for="appLoan_customerName" class="error" generated="true" style="display:none;"></label>
		              </dd>
		              <dd style="width:900px;">
		             <h6>贷款金额(万元)：</h6>
		                <s:textfield name="appLoan.loanAmount" cssClass="input-text required number"  id="appLoan_loanAmount"></s:textfield>
		                <label for="appLoan_loanAmount" class="error" generated="true" style="display:none; float: left;"></label>
		              <h6>贷款期限(月)：</h6>
		                <s:textfield name="appLoan.loanMonth" cssClass="input-text required digits"  id="appLoan_loanMonth"></s:textfield>
		                <label for="appLoan_loanMonth" class="error" generated="true" style="display:none;"></label>
		              </dd>
		              <dd>
		               <h6>执行利率(%)：</h6>
		                <s:textfield name="appLoan.interestRate" id="appLoan_interestRate" cssClass="input-text required number" ></s:textfield>
		                <label for="appLoan_interestRate" class="error" generated="true" style="display:none; float: left;"></label>
		               <h6>担保方式：</h6>
		                <common:select name="appLoan.mortgageType" cssClass="input-text " valueSetId="35"></common:select>
		              </dd>
		              <dd style="width:900px;">
		               <h6>担保机构：</h6>
		                <s:textfield name="appLoan.mortgageOrg" id="appLoan_mortgageOrg" cssClass="input-text required"></s:textfield>
		               <label for="appLoan_mortgageOrg" class="error" generated="true" style="display:none; float: left;"></label>
		               <h6>保证金：</h6>
		                <s:radio value="1" name="appLoan.ensureRate" list="%{#{1:'有',0:'无'}}" cssClass="required"></s:radio>
		              </dd>
		              <dd style="width:900px;">
		               <h6>贷款发放日期：</h6>
		                <s:textfield name="appLoan.loanDate" id="timeOne" readonly="readonly" cssClass="input-text required"></s:textfield>
		                <label for="timeOne" class="error" generated="true" style="display:none; float: left;"></label>
		               <h6>贷款到期日期：</h6>
		                <s:textfield name="appLoan.loanEndDate"   cssClass="input-text required" readonly="readonly" id="timeTwo"></s:textfield>
		                <label for="timeTwo" class="error" generated="true" style="display:none;"></label> 
		              </dd>
		              <dd>
		             <h6>利息还款方式：</h6>
		                <common:select name="appLoan.interestWay" cssClass="input-text " valueSetId="55"></common:select> 
		             <h6>本金还款方式：</h6>
		              	<common:select name="appLoan.capitalWay" cssClass="input-text required" valueSetId="43" onchange="paymentway(this.value)"></common:select>
		              </dd>
		              <dd>
		               <h6>贷款类型：</h6>
		                <common:select name="appLoan.financeType" cssClass="input-text " valueSetId="32"></common:select>
		              </dd>
				    </dl>
			</div>
			<div class="clear"></div>
			<div id="repayment_block"></div>



			<div class="hr_10">&nbsp;</div>
			<div class="center" style="width:200px;">
				<s:submit  value="确认" cssClass="but_gray" style="width:200px;"></s:submit>
			</div>
			<div class="hr_10">&nbsp;</div>
			<div class="hr_10">&nbsp;</div>
		</form>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
