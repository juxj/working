<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>理财服务产品页_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/load-finance.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script language="javascript" >
$(document).ready(function(){
	$(".datepicker" ).datepicker({changeMonth: true,changeYear: true});
});
function toPage(pageNo, pageCount) {
	document.getElementById("pageNo").value = pageNo;
	form = document.getElementById("frmfundInfo");
	form.submit();
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
  	<a href="/finance/financeProduct.act">理财服务</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;基金产品
  </div>
  <div class="hr_10"> &nbsp; </div> 
	<!--main1-->
	<div class="center box_6_gray" style="width:908px; padding-left:20px; padding-bottom:10px;">
	  <form id="frmfundInfo" action="/finance/fund!fundHome.act" method="post"  >
  		<input type="hidden" id="pageNo" name="pageNo" /> 	
			<table width="100%" border="0" cellspacing="0" cellpadding="0" >
			  <tr>
			    <td width="80" height="28" style="padding-bottom:15px;">基金类型：</td>
			    <td width="180" ><input name="catelogName" value="${ catelogName}" class="input-text1"/>&nbsp;</td>
			    <td width="80" >成立日期：</td>
			    <td width="225" ><input name="issuedDt" class="input-text1 datepicker dateISO" value="<s:date name="issuedDt[0]"/>"/>&nbsp;</td>
			    <td width="80" align="right">到：</td>
			    <td width="194" ><input name="issuedDt" class="input-text1 datepicker" value="<s:date name="issuedDt[1]"/>"/>&nbsp;</td>
			    <td height="28" align="right" >&nbsp;</td>
			  </tr>
			  <tr>
			    <td height="28" style="padding-bottom:15px;">基金公司：</td>
			    <td ><input name="companyName" value="${companyName }" class="input-text1"/>&nbsp;</td>
			    <td >基金代码：</td>
			    <td ><input name="fundCode" value="${fundCode }" class="input-text1"/>&nbsp;</td>  
			    <td align="right">基金全称：</td>
			    <td >&nbsp;<input name="fullName" value="${fullName }" class="input-text1" onclick="this.value=''"/></td>
			    <td ><input type="submit" value="查询" style="width:90px;" class="btnsub bred" /></td>
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
		        <td style="padding-left:15px;">基金代码</td>
		        <td >基金全称</td>
		        <td >基金公司</td>
		        <td >基金类型</td>
		        <td >基金经理</td>
		        <td >成立日期</td>
		        <td >操作</td>
		      </tr>
				<s:if test="pager.data.size()<=0">
				  <tr class="capital_table" >
			        <td class="capital_table_0" colspan="7">抱歉！未查询到相符的结果</td>
			      </tr>
				</s:if>	
				<s:iterator id="item" value="pager.data">		      
		      <tr class="top_color01" >
		        <td style="padding-left:15px;">${item.code}</td>
		        <td > <common:ifNull value="#item.fullName" /></td>
		        <td >
		        	<div class="ellipsis_text_70"><common:ifNull value="#item.fundCompanyName" /></div>
		        </td>
		        <td ><common:ifNull value="#item.catelogName" /></td>
		        <td >
   					<div class="ellipsis_text_120"><common:ifNull value="#item.manager" /></div>	
		        </td>
		        <td><common:ifNull value="#item.issuedDate" /></td>
		        <td class="view_detail" style="padding-right:10px;"><a href="/finance/fund!fundDetails.act?fundId=${item.id}&companyId=${item.fundCompanyId}" >查看</a></td>
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