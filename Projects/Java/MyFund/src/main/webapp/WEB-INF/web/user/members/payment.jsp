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
<script type="text/javascript">
$(document).ready(function(){
	$("#frmRequestInfo").validate();
});
function radion1(qq){
	if(qq.checked){
		$("#kuaidi").show();
		$("#ziti").hide();
	}else{
		$("#kuaidi").hide();
	}
}
function radion3(qq){
	if(qq.checked){
		$("#ziti").show();
		$("#kuaidi").hide();
	}else{
		$("#ziti").hide();
	}
}
function radionAddre(qq){
	if(qq.checked){
		$("#newAddress").hide();
	}else{
		$("#newAddress").show();
	}
}
function anewAddre(qq){
	if(qq.checked){
		$("#newAddress").show();
	}else{
		$("#newAddress").hide();
	}
}
function radionPay(qq){
	if(qq.checked){
		$("#payw").hide();
	}else{
		$("#payw").show();
	}
}
function payW(qq){
	if(qq.checked){
		$("#payw").show();
	}else{
		$("#payw").hide();
	}
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
<div class="M_menu">
<a href="/user/details.act">资信通详情</a>&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;<s:if test="mType == 1">资信通认证会员</s:if><s:elseif test="mType == 2">资信通vip会员</s:elseif>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="container_950">
	<div class="P_title box_4" style="border-bottom:5px solid #003961;">申请<s:if test="mType == 1">资信通认证会员</s:if><s:elseif test="mType == 2">资信通vip会员</s:elseif></div>
<!--发布新资金信息-->
	<div class="box_3">
	<form id="frmRequestInfo" action="/user/memberType!next.act" method="post">
		<input type="hidden" name="ordMembership.memberType" value="${mType }"/>
	<div class="f_box">	
		<div class="f_sqxx">
		<span class="f_gz">确认付款信息</span>		
		<table class="special_psfs_tb">
			<tr>
				<td class="a_right">服务名称：</td>
				<td ><s:if test="mType == 1">资信通认证会员服务费</s:if><s:elseif test="mType == 2">资信通vip会员服务费</s:elseif></td>
			</tr>
			<tr>
				<td class="a_right">收款方：</td>
				<td>中国资金网</td>
			</tr>
			<tr>
				<td class="a_right">付款金额：</td>
				<td ><s:if test="mType == 1"><span class="red" style="padding-right:40px;">365元</span><span><input type="radio" name="a" value="1" checked="checked"/>1年会员费&nbsp;&nbsp; <input type="radio" name="b" value="2" />2年会员费&nbsp;&nbsp; <input type="radio" name="c" value="3" />3年会员费</span>
					</s:if><s:elseif test="mType == 2"><span class="red" style="padding-right:40px;">5000元</span><span><input type="radio" name="a" value="1" checked="checked"/>1年会员费&nbsp;&nbsp; <input type="radio" name="b" value="2" />2年会员费&nbsp;&nbsp; <input type="radio" name="c" value="3" />3年会员费</span></s:elseif></td>
			</tr>
			</table>
			<div class="hr_20"> &nbsp;</div>			      			
		 </div>
		<div class="hr_20"> &nbsp;</div> 
		<div class="f_sqxx">
		<span class="f_gz">确认发票信息</span>			 			
			<table class="special_psfs_tb">
			<tr>
				<td class="a_right">发票类型：</td>
				<td> <input type="radio" name="ordMembership.invoiceType" value="1" checked="checked"/>普通发票</td>
			</tr>
			<tr>
				<td class="a_right">发票抬头：</td>
				<td ><input type="text" name="ordMembership.invoiceTitle" value="" maxlength="50"/></td>
			</tr>
			<tr>
				<td class="a_right">发票内容：</td>
				<td><input type="radio" name="ordMembership.invoiceContent" value="1" checked="checked"/>服务
				<input type="radio" name="ordMembership.invoiceContent" value="2" />咨询
				</td>
			</tr>
			<tr>
				<td class="a_right">寄送方式：</td>
				<td><input type="radio" id="wayKD" name="ordMembership.invoiceSendway" value="1" onclick="radion1(this)" checked="checked"/>快递 中国资金网通过快递寄送给您</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="radio" name="ordMembership.invoiceSendway" value="2" onclick="radion3(this)"/>自取 您前往指定地点领取发票
				</td>
			</tr>
			</table>
			<div class="hr_20"> &nbsp;</div>			      			
		 </div>			
			<div id="kuaidi">
			<div class="hr_20"> &nbsp;</div>			
			<div class="f_sqxx">
			<span class="f_gz">确认收件地址</span>				
			<table class="special_psfs_tb">
				<tr>
					<td class="a_right">收件地址：</td>
					<td><input type="radio" name="sendway" onclick="radionAddre(this)" value="1"/>企业经营地址</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td style="padding-left:20px;">收件地址：上海市浦东新区张杨路707号501室 邮编：200120<br/>收件人：张三 联系电话: 13455444506</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="radio" name="sendway" value="2" onclick="anewAddre(this)" checked="checked"/>新建收件地址</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td  style="padding-left:20px;">
						<div id="newAddress">
						<table >
						<tr>							
							<td>收件人&nbsp;&nbsp;<input type="text" name="ordMembership.invoiceReceiver" class="required"/>
							</td>
						</tr>
						<tr>							
							<td>地址&nbsp;&nbsp;<s:select id="province" name="ordMembership.provinceid" cssClass="tb_sele" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province','city','district');"/><span style="float:left;">省/直辖市&nbsp;</span>
			            <select id="city" name="ordMembership.cityid" onchange="changeCity('city','district');" class="tb_sele">
			          	 <option value="0">--请选择--</option>
			          	 <s:iterator value="cityMap['city']">
							<option value="${id}">${name}</option>
						 </s:iterator>
			          	</select><span style="float:left;">市&nbsp;</span>
			            <select id="district" name="ordMembership.districtid" class="tb_sele">
			          	 <option value="0">--请选择--</option>
			          	 <s:iterator value="districtMap['district']">
							<option value="${id}">${name}</option>
						 </s:iterator>
			          	</select><span style="float:left;">区/县&nbsp;</span> 
							</td>
						</tr>
						<tr>
							
							<td>详细地址&nbsp;&nbsp;<input type="text" size="100px;" name="ordMembership.address"/>
							</td>
						</tr>
						<tr>
							
							<td>邮编&nbsp;&nbsp;<input type="text" name="ordMembership.postcode"/>
							</td>
						</tr>
						<tr>
							<td>联系电话&nbsp;&nbsp;<input type="text" name="ordMembership.telphone"/>
							</td>
						</tr>
						</table>
						</div>								
					</td>
				</tr>
			</table>
			<div class="hr_20"> &nbsp;</div>			      			
		 </div>					
			</div>
			<div id="ziti" style="display:none;">
				<div class="hr_20"> &nbsp;</div>				
				<div class="f_sqxx">
					<span class="f_gz">发票领取地址</span>				
					<table class="special_psfs_tb">
					<tr>
						<td  class="a_right">&nbsp;</td>
						<td>上海市浦东新区张杨路707号生命人寿大厦5楼&nbsp;&nbsp;中国资金网上海总部<br/><a target="_bank" href="http://ditu.google.cn/maps/place?q=%E4%B8%8A%E6%B5%B7%E5%B8%82%E7%94%9F%E5%91%BD%E4%BA%BA%E5%AF%BF%E5%A4%A7%E5%8E%A6&hl=zh-CN&ie=UTF8&cid=14739133017521868503" class="red">
						查看交通路线</a>
						</td>
					</tr>
					</table>
					<div class="hr_20"> &nbsp;</div>	
				</div>
			</div>
			<div class="hr_20"> &nbsp;</div>			
			<div >
			<span class="f_gz">选择支付方式</span>			
			<table class="special_psfs_tb">
				<tr>
					<td  class="a_right"><input type="radio" onclick="radionPay(this);" name="ordMembership.payWay" value="1"/>银行电汇：</td>
					<td>（收款人）鼎辉信息技术（上海）有限公司<br/>（开户行）中国银行股份有限公司上海市浦东分行<br/>（账号）4494-6126-8396</td>
				</tr>
				<tr>
					<td  class="a_right"><input type="radio" name="ordMembership.payWay" value="2" onclick="payW(this);" checked="checked"/>在线支付：</td>
					<td>银联在线支付支持大部分银行。</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td >
						<div id="payw">
						<table >
						<tr >
							<td ><span class="fl" style="border : #d6d6d6 solid 1px;height:40px;padding:5px;width:190px;"><img src="/images/unionpay.png"/></span></td>
						</tr>
						</table>
						</div>
					</td>
				</tr>
			</table>
		<div class="hr_20"> &nbsp;</div>		
		<div class="center" style="width:200px;"><input type="submit" value="确认提交" class="but_gray" style="width:200px;"/><a href="/WEB-INF/web/user/members/paymentConfirm.jsp">提交订单</a></div>
		<div class="hr_10"> &nbsp;</div>						      			      	
	</div>
	</div>			
	</form>
	</div>	

</div>    
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>