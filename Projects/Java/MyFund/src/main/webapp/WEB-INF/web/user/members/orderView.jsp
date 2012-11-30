<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>资信通_付款_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js"></script>
<link href="/css/jquery-validate.css" rel="stylesheet" type="text/css" />

</head>
<body>

<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
		 
<div class="hr_10"> &nbsp; </div>
<div class="M_menu">
<a href="/user/payment.act">资信通详情</a>&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;<s:if test="ordMembership.memberType == 1">资信通认证会员服务费</s:if><s:elseif test="ordMembership.memberType == 2">资信通vip会员服务费</s:elseif>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="container_950">
		${msg }
	<div class="menu_blue white"><h6>订单确认</h6></div>
<!--发布新资金信息-->
	<div class="box_6">
	<div class="f_box">	
		<div class="f_sqxx">
		<span class="f_gz">付款信息</span>		
		<table class="special_psfs_tb">
			<tr>
				<td class="a_right">服务名称：</td>
				<td ><s:if test="ordMembership.memberType == 1">资信通认证会员服务费</s:if><s:elseif test="ordMembership.memberType == 2">资信通vip会员服务费</s:elseif></td>
			</tr>
			<tr>
				<td class="a_right">收款方：</td>
				<td>中国资金网</td>
			</tr>
			<tr>
				<td class="a_right">付款金额：</td>
				<td ><span class="red" style="padding-right:40px;">${ordMembership.payAmount } 元</span><span>1年会员费</span></td>
			</tr>
			</table>
			<div class="hr_20"> &nbsp;</div>			      			
		 </div>
		<div class="hr_20"> &nbsp;</div> 
		<div class="f_sqxx">
		<span class="f_gz">发票信息</span>			 			
			<table class="special_psfs_tb">
			<tr>
				<td class="a_right">发票类型：</td>
				<td>普通发票</td>
			</tr>
			<tr>
				<td class="a_right">发票抬头：</td>
				<td >${ordMembership.invoiceTitle }</td>
			</tr>
			<tr>
				<td class="a_right">发票内容：</td>
				<td><s:if test="ordMembership.invoiceContent == 1">服务</s:if><s:elseif test="ordMembership.invoiceContent == 2">咨询</s:elseif></td>
			</tr>
			<tr>
				<td class="a_right">寄送方式：</td>
				<td><s:if test="ordMembership.invoiceSendway == 1">快递 中国资金网通过快递寄送给您</s:if><s:elseif test="ordMembership.invoiceSendway == 2">自取 您前往指定地点领取发票</s:elseif></td>
			</tr>
			</table>
			<div class="hr_20"> &nbsp;</div>     			
		 </div>			
			<div class="hr_20"> &nbsp;</div>			
			<div class="f_sqxx">
			<span class="f_gz">收件地址</span>				
			<table class="special_psfs_tb">
				<tr>
					<td class="a_right">&nbsp;</td>
					<td style="padding-left:20px;">
						<s:if test="ordMembership.invoiceSendway == 1">
							收件人：${ordMembership.invoiceReceiver}	&nbsp;&nbsp; 联系电话: ${ordMembership.telphone }<br/>收件地址：${profileMap['address'] } ${ordMembership.address }&nbsp;&nbsp;邮编：${ordMembership.postcode }
						</s:if><s:elseif test="ordMembership.invoiceSendway == 2">
							上海市浦东新区张杨路707号生命人寿大厦5楼&nbsp;&nbsp;中国资金网上海总部 <a target="_bank" href="http://ditu.google.cn/maps/place?q=%E4%B8%8A%E6%B5%B7%E5%B8%82%E7%94%9F%E5%91%BD%E4%BA%BA%E5%AF%BF%E5%A4%A7%E5%8E%A6&hl=zh-CN&ie=UTF8&cid=14739133017521868503" class="red">
							查看交通路线</a>
						</s:elseif>
					</td>
				</tr>
			</table>
			<div class="hr_20"> &nbsp;</div>			      			
			</div>					
			<div class="hr_20"> &nbsp;</div>			
			<div >
			<span class="f_gz">支付方式</span>			
			<table class="special_psfs_tb">
				<s:if test="ordMembership.payWay == 1">
					<tr>
						<td  class="a_right">线下支付：</td>
						<td>
							<div id="payw">
							<table >
							<tr >
								<td >
								（收款人）鼎辉信息技术（上海）有限公司<br/>（开户行）中国银行股份有限公司上海市浦东分行<br/>（账号）4494-6126-8396
								</td>
							</tr>
							</table>
							</div>					
						</td>
					</tr>
				</s:if><s:elseif test="ordMembership.payWay == 2">
					<tr>
						<td  class="a_right">在线支付：</td>
						<td>
							<div id="payw">
							<table >
							<tr >
								<td ><span class="fl" style="border : #d6d6d6 solid 1px;height:40px;padding:5px;width:190px;"><img src="/images/unionpay.png"/></span></td>
							</tr>
							</table>
							</div>					
						</td>
					</tr>
				</s:elseif>
			</table>
		<div class="hr_20"> &nbsp;</div>		
		<div class="center" align="center"><input type="button" value="确认支付" onclick="javascript:window.location.href='/user/member/payment!payment.act?ordId=${ordMembership.id}'" class="but_gray" style="width:200px;"/>&nbsp;&nbsp;<input type="button" value="修改订单" onclick="javascript:window.location.href='/user/member/payment!orderEdit.act?ordId=${ordMembership.id}'" class="but_gray" style="width:200px;"/></div>
		<div class="hr_10"> &nbsp;</div>						      			      	
	</div>
	</div>			
	</div>	

</div>    
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>