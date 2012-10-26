<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>放款详细信息</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script language="javascript">
//文本框触发焦点效果s
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).atrClass("input-focus");
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

  </head>
  
  <body>
<!--头部-->
	<div class="header user_header">
	<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
	  <div class="clear"> &nbsp; </div>
	</div>
	<div class="hr_10"> &nbsp; </div>
	<!--头部结束-->
	<div class="M_menu">
  		融资管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="/user/loan/loanAfter!loanAfterList.act">贷后管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;放款详情
 	</div>
	<!--主体部分开始-->
	<div class="hr_10"> &nbsp; </div>
  <div class="container_950  box_4">
	<div class="P_title" style="border-bottom:5px solid #003961;">放款详细信息</div>
		<div class="C_title">合同编号：<s:property value="appLoan.contractNum" />&nbsp;&nbsp;&nbsp;&nbsp;借款方名称：<s:property value="appLoan.customerName" /></div>
		<div class="C_form">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size:14px; line-height: 28px;">
			  <tr>
			    <td width="100" align="right">类型：</td>
			    <td><common:print valueId="appLoan.financeType" /></td>
			  </tr>
			  <tr>
			    <td align="right">
			    金额：</td>
			    <td><s:number name="appLoan.loanAmount" />万元</td>
			  </tr>
			  <tr>
			    <td align="right">期限：</td>
			    <td><s:property value="appLoan.loanMonth" />个月</td>
			  </tr>
			  <tr>
			    <td align="right">执行利率：</td>
			    <td><s:property value="appLoan.interestRate" />%</td>
			  </tr>
			  <tr>
			    <td align="right">利息还款方式：</td>
			    <td><common:print valueId="appLoan.interestWay" /></td>
			  </tr>
			  <tr>
			    <td align="right">本金还款方式：</td>
			    <td><common:print valueId="appLoan.capitalWay" /></td>
			  </tr>
			  <tr>
			    <td align="right">担保方式：</td>
			    <td><common:print valueId="appLoan.mortgageType" /></td>
			  </tr>
			  <tr>
			    <td align="right">担保机构：</td>
			    <td><s:property value="appLoan.mortgageOrg" /></td>
			  </tr>
			  <tr>
			    <td align="right">保证金：</td>
			    <td><s:if test="appLoan.ensureRate==1">有</s:if><s:if test="appLoan.ensureRate==0">无</s:if></td>
			  </tr>
			  <tr>
			    <td align="right">贷款发放日期：</td>
			    <td><s:date name="appLoan.loanDate" /></td>
			  </tr>
			  <tr>
			    <td align="right">贷款到期日期：</td>
			    <td><s:date name="appLoan.loanEndDate" /></td>
			  </tr>
		</table>
		<div class="hr_20"> &nbsp; </div>
	</div>
	</div>	
	<!--主体部分结束-->
	<div class="hr_10">&nbsp;</div>
	<!--尾部-->
	<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
