<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>付款管理_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script type="text/javascript">
	function edit(){
		var url = "/service/requestInfoAction4User!edit.act";
		var user_status = "${session._user.auditstatus}";
		if (user_status != "2") {
			alert("您的注册资料尚未通过审核，暂不能发布此信息!");
		} else {
			window.location.href = url;
		}
	}
	
	function toPage(pageNo, useless) {
		document.getElementById("pageNo").value=pageNo;
		var frmQuery = document.getElementById("frmQueryRequestInfo");
		frmQuery.submit();
	}
</script>
</head>
<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<form id="frmQueryRequestInfo" action="/club/showRequestInfoHome.act"><input id="pageNo" type="hidden" name="pageNo"/> </form>

	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<div class="M_menu">
		账户管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;付款管理
	</div>
	<div class="hr_10"> &nbsp; </div> 
<div class="container_950">
		<div class="P_title box_4">付款管理</div>
		<s:if test="msg!=null">
		<div class="line"  style="height:28px;">${msg }</div>
		</s:if><s:else><div class="line"></div></s:else>
	<!-- 表格 -->
	<table class="gold-table" >
	<th style="text-align:left;">付款订单编号</th>
	<th style="text-align:left;">服务名称</th>
	<th style="text-align:left;">收款方</th>
	<th style="text-align:left;">付款金额</th>
	<th style="text-align:left;">订单状态</th>
	<th style="text-align:center;">操作</th>
	<s:if test="ordMSList != null || ordMSList.size>0">
    	<s:iterator value="ordMSList" id="od">
			<tr style="padding-left:8px;">
			<td>
				${od.id}&nbsp;
			</td>
			<td><s:if test="#od.memberType==1">资信通认证会员</s:if><s:elseif test="#od.memberType==2">资信通vip年费会员</s:elseif><s:else>普通会员</s:else>&nbsp;</td>
			<td>
    			中国资金网
			</td>
			<td>
				${od.payAmount}&nbsp;
			</td>
			<td><s:if test="#od.payStatus == 0">待付款</s:if><s:elseif test="#od.payStatus == 1">交易成功</s:elseif>&nbsp;</td>
	    	<td><s:if test="#od.payStatus == 0"><a href="/user/memberType!payNext.act?ordId=${od.id }">付款</a></s:if>
	    	<s:elseif test="#od.payStatus == 1"><a href="/user/memberType!deleteOrd.act?ordId=${od.id }">删除</a></s:elseif>&nbsp;</td>
			</tr>
		</s:iterator>
	</s:if>
	</table>
</div>
<div class="clear"> &nbsp; </div>
<s:if test="ordMSList == null || ordMSList.size<=0">
       <div class="container_950 ">
			<div class="txt_content box_4">
				<h5>没有找到需要付款的订单!</h5>
			</div>
       </div> 
</s:if> 
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>
