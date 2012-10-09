<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>理财服务产品页_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/load-finance.js" > </script>
<script language="javascript" >
	function toPage(pageNo, pageCount) {
		document.getElementById("pageNo").value = pageNo;
		form = document.getElementById("frmQueryBankProduct");
		form.submit();
	}
	
	function resetQueryForm(){
		$("#q0").attr("value", "58");
		$("#q1").attr("value", "不限");
		$("#q2").attr("value", "41");
		$("#q3").attr("value", "47");
		$("#q4").attr("value", "53");
		$("#q5").attr("value", "");
	}
</script>
</head>
<body>
<!--头部开始-->
<div class="header index_header">
	<jsp:include page="/public/head1.jsp" />
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
  <!--理财服务产品列表页面开始-->
  <div class="M_menu">
  	<a href="/finance/financeProduct.act">理财服务</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;银行理财产品
  </div>
  <div class="hr_10"> &nbsp; </div> 
	<!--main1-->
	<div class="center box_6_gray" style="width:908px; padding-left:20px; padding-bottom:10px;">
	  <form id="frmQueryBankProduct" action="/finance/bankProduct!search.act" method="post"  >
  		<input type="hidden" id="pageNo" name="pageNo" /> 	
			<table width="100%" border="0" cellspacing="0" cellpadding="0" >
			  <tr>
			    <td width="80" height="28" style="padding-bottom:15px;">产品状态：</td>
			    <td width="180" >&nbsp;<s:select id="q0" name="query" list="productStatus" label="name" listValue="name" listKey="id" value="query[0]"></s:select></td>
			    <td width="80" >发行银行：</td>
			    <td width="225" >&nbsp;<s:select id="q1" name="query" list="bankList" label="name" listValue="name" listKey="name" value="query[1]"/></td>
			    <td width="80" align="right">产品期限：</td>
			    <td width="194" >&nbsp;<s:select id="q2" name="query" list="investmentCycle" label="name" listValue="name" listKey="id" value="query[2]"></s:select></td>
			    <td height="28" align="right" ><input type="submit" value="查询" style="width:90px;" class="btnsub bred" /></td>
			  </tr>
			  <tr>
			    <td height="28" style="padding-bottom:15px;">年化收益率：</td>
			    <td >&nbsp;<s:select id="q3" name="query" list="investmentReturnRate" label="name" listValue="name" listKey="id" value="query[3]"></s:select></td>
			    <td >起购金额：</td>
			    <td >&nbsp;<s:select id="q4" name="query" list="investmentQuota" label="name" listValue="name" listKey="id" value="query[4]"></s:select></td>
			    <td align="right">产品名称：</td>
			    <td >&nbsp;<input id="q5" type="text" name="query" value="${query[5]}" class="input-text1" onclick="this.value=''"/></td>
			    <td ><input type="button" onclick="resetQueryForm();" value="重置" style="width:90px;" class="btnsub bred"/></td>
			  </tr>
			</table>
	   </form>		
		<div class="clear">&nbsp;</div>
	</div>
	<!--main1-->

  <div class="hr_10"> &nbsp;</div>
	<div class="M_box">
		<!--银行理财列表开始-->
		<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
		      <tr class="top_color">
		        <td class="capital_table_0">产品名称</td>
		        <td class="capital_table_0">发行银行</td>
		        <td class="capital_table_0">起销日期</td>
		        <td class="capital_table_1">投资期限</td>
		        <td class="capital_table_0">起点金额</td>
		        <td class="capital_table_4">预期年化收益率</td>
		        <td width="100px;"></td>
		      </tr>
				<s:if test="pager.data.size()<0">
				  <tr class="capital_table" >
			        <td class="capital_table_0">抱歉！未查询到相符的结果</td>
			      </tr>
				</s:if>	
				<s:iterator id="item" value="pager.data">		      
		      <tr class="capital_table" >
		        <td class="capital_table_0"><a href="/finance/bankProduct!showDetails.act?id=${item.id}"> ${item.name} </a></td>
		        <td class="capital_table_0">${item.bank}</td>
		        <td class="capital_table_0"><s:date name="#item.sellstart" format="yyyy-MM-dd"/></td>
		        <td class="capital_table_1">${item.manageperiod}</td>
		        <td class="capital_table_0">${item.minamount}</td>
		        <td class="capital_table_4">${item.benefitrate}</td>
		        <td class="view_detail capital_table_z2"  style="padding-right:20px;"><a href="/finance/bankProduct!showDetails.act?id=${item.id}">查看</a></td>
		      </tr>
		      </s:iterator>
		      <tr class="top_color">
			        <td style="padding-left:20px; font-size:14px;" colspan="9">
			        <div class="pagination right">
					<s:include value="/public/pagination.jsp"/>
					</div>
					</td>
			   </tr>
		      	      
		</table>
		<!--银行理财项目列表结束-->		
	</div>   
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--foot-->
	<div class="clear"> &nbsp; </div>
	<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
