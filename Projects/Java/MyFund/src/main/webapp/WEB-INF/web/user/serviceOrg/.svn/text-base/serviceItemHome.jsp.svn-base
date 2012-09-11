<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>融资服务信息_中国资金网</title>
	<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
	<script type="text/javascript">
		function toPage(pageNo, useless) {
			document.getElementById("pageNo").value=pageNo;
			var frmServiceItemQuery = document.getElementById("frmServiceItemQuery");
			frmServiceItemQuery.submit();
		}
	</script>
  </head>
  <body>
	<div class="header index_header">
	<jsp:include page="/public/head1.jsp" />
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
	<div class="M_menu">
		<a href="/">首页</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="/loan/LoanService.act">融资服务</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;
		<a href="/service/serviceItem!showHome.act?typeId=0">服务列表</a>
	</div>
	<div class="hr_10"> &nbsp; </div> 	 
	<!--主体部分-->
	<table class="container_950 center box_4">
	      <tr class="top_color">
	        <td style="padding-left:22px; font-size:14px;">选择服务类型</td>
	      </tr>
	</table>	
	<div class="container_950">
		<!-- 菜单项 -->
		<div id="box2" class="M_menu" style="width:926px; padding-left:22px; border-top:none;">
			<form id="frmServiceItemQuery" action="/service/serviceItem!showHome.act">
				<input type="hidden" id="typeId" name="typeId" value="${typeId}"/>
				<input type="hidden" id="pageNo" name="pageNo" value="${pageNo }"/>
			</form>
			<s:if test="typeId==0">
		 		<a href="/service/serviceItem!showHome.act?typeId=0" class="seled">全部</a>
		 	</s:if><s:else>
		 		<a href="/service/serviceItem!showHome.act?typeId=0">全部</a>
		 	</s:else>
		 	&nbsp;&nbsp;&nbsp;&nbsp;
			<s:iterator id ="item" value="sinTypeList">
				<s:if test="#item.id==typeId">
					<a href="/service/serviceItem!showHome.act?typeId=${item.id}"  class="seled">${item.name}</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</s:if> <s:else>
					<a href="/service/serviceItem!showHome.act?typeId=${item.id}">${item.name}</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</s:else>
			</s:iterator>
		 </div>
		<div class="clear"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div> 
		<!--服务列表开始-->
		<table class="ctl container_950 center box_4"> 
		      <tr class="top_color">
		        <td class="capital_table_z1">服务主题</td>
		        <td class="capital_table_z2">服务类型</td>
		        <td class="capital_table_z2">费用范围</td>
		        <td class="capital_table_z2">服务区域</td>
		        <td class="capital_table_z2">发布时间</td>
		        <td class="capital_table_z2">截止日期</td>
		        <td class="capital_table_z2"></td>
		      </tr>
				<s:if test="pager.data.size()>0">
				<s:iterator id="item" value="pager.data">
		      <tr class="capital_table" >
				<td class="capital_table_z1">${item.title }</td>
				<td class="capital_table_z2">${item.typeName }</td>
				<td class="capital_table_z2">${item.chargeRange }</td>
				<td class="capital_table_z2">${item.regionName }</td>
				<td class="capital_table_z2"><s:date name="#item.issuedDate"/></td>
				<td class="capital_table_z2"><s:date name="#item.expiredDate"/></td>
				<td class="view_detail capital_table_z2"  style="padding-right:20px;"><a href="/service/serviceItem!showSinItemDetail.act?itemId=${item.id}" >查看</a></td>
		      </tr>
		      </s:iterator>
		      <tr class="top_color">
			        <td style="padding-left:20px; font-size:14px;" colspan="9">
			        <div class="pagination right">
					<s:include value="/public/pagination.jsp"/>
					</div>
					</td>
			   </tr>
		      </s:if>
		      <s:else>
		      	<tr class="top_color01 red">
			        <td style="padding-left:20px; font-size:14px;">
						无匹配内容，请查询其它分类！
						</td>
			      </tr>
		      </s:else>
			</table>
			</form>
		<!--服务列表结束-->		
	</div>
	<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
  </body>
</html>