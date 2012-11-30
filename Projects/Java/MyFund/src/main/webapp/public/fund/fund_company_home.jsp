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
  	<a href="/finance/fund!companyHome.act">基金公司列表</a>
  </div>
  <div class="M_menu">
  	<a href="/finance/fund!fundHome.act">基金信息列表</a>
  </div>
  <div class="hr_10"> &nbsp;</div>
	<div class="M_box">
	<form id="frmfundInfo" action="/finance/fund!companyHome.act" method="post"  >
  		<input type="hidden" id="pageNo" name="pageNo" /> 	
  		</form>
		<!--银行理财列表开始-->
		<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
		      <tr class="top_color">
		        <td class="capital_table_0">基金公司全称</td>
		        <td class="capital_table_0">基金公司简称</td>
		        <td class="capital_table_1">网站</td>
		      </tr>
				<s:if test="pager.data.size()<0">
				  <tr class="capital_table" >
			        <td class="capital_table_0">抱歉！未查询到相符的结果</td>
			      </tr>
				</s:if>	
				<s:iterator id="item" value="pager.data">		      
		      <tr class="capital_table" >
		        <td class="capital_table_0">${item.fullName}</td>
		        <td class="capital_table_0">${item.shortName }</td>
		        <td class="capital_table_1">${item.webSite}</td>
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