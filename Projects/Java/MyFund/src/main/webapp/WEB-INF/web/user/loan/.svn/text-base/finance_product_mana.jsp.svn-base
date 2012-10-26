<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资产品管理</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui-1.8.21.custom.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery-ui-1.8.21.custom.min.js" > </script>
<!-- 文字自动截取 -->
<style>
.ctl {
	table-layout: fixed
}

.ctl td {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	padding: 2px
}
</style>
<script type="text/javascript">
	 function add(){
	 	window.location.href="/user/loan/financeProduct!newfin.act";
	 }
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
  <!--理财服务产品列表页面开始-->
  <div class="M_menu">
  	<div style="float: left;">融资管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;融资产品管理</div> 	
  </div>
  <div class="hr_10"> &nbsp;</div>
  <div class="container_950 box_4">
	<div class="P_title">融资产品管理</div>
	<div class="line" style="height:25px;"><input name="" type="button" value="发布新产品"  class="but_gray" style="float: right; margin-right: 20px;" onclick="add()"/></div>  		
  </div>
  <div class="hr_10"> &nbsp;</div>
  <form id="financeManage" action="/user/loan/financeProduct.act">
  <div>
        <table class="container_950 center box_4">
     		<tr class="top_color">
     		<td width="12%" style="padding-left:25px;">产品编号</td>
            <td width="20%">产品名称</td>
            <td width="10%">类别</td>
            <td width="10%">年利率</td>
            <td width="10%">发布时间</td>
            <td width="12%">额度范围</td>
            <td width="10%">期限</td>
            <td >状态</td>
            <td width="10%" align="center">操作</td>
          </tr>
          <s:if test="productList.size()>0">
          <tbody>
		 	<s:iterator id ="item" value="productList">
			<tr class="top_color01">
				<td style="padding-left:25px;">${item.financeNum }</td>
				<td style="width:120px;word-wrap:break-word;word-break:break-all;">
					${financeName }
				</td>
				<td><common:print valueId="#item.financeType"/></td>
				<td><common:print valueId="#item.interestType"/></td>
	   			<td><s:date name="#item.createdt" format="yyyy-MM-dd"/></td>
	   			<td><s:number name="financeLittleamount" />-<s:number name="financeBigamount" />万元</td>
	   			<td>${item.financeLittledt}-${item.financeMostdt}个月</td>
	   			<td><common:print valueId="#item.proStatus"/></td>
	   			<td align="right" class="view_detail01" style="padding-right:20px;">
	   				<a href="/user/loan/financeProduct!viewFinance.act?productId=${item.id }" >查看</a>
	   				
	   			</td>
			</tr>
			</s:iterator>
			</tbody>
			</s:if>
        </table>
  </div>
    </form>
    
    <div class="hr_10">&nbsp;</div>
       <div class="container_950 box_4">
			<s:else>
			<div class="l_out">
			<h1 class="l_title">您还没有发布过融资产品</h1>
					<p> 
					您可以<a href="/user/loan/financeProduct!newfin.act">点此发布融资产品</a><br/>
					</p>
					</div>
			</s:else>
       </div>  

  <!--理财服务产品列表页面结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
