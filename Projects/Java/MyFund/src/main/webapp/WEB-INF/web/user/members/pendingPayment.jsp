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
<div class="container_950 box_4">
	<div class="f_box">	
		<div class="fl"><img src="/images/right_ico.png" /></div>
		<div style="margin-left:80px;"><h5 style="color:#00a650;font-weight : normal;padding-bottom:10px;">订单提交成功，正等待付款！</h5><h6 style="font-weight : normal;"><span style="padding-right:20px;">订单号：99000000</span>应付金额：<span class="red" style="padding-right:20px;">0000.00元</span><span style="padding-right:20px;">订购服务：资信通普通会员</span>1年服务费</h6></div>
		<div class="clear"> &nbsp; </div>
		<div class="hr_20"> &nbsp; </div> 
		<div class="top_color box_4" style="padding:0 0 0 20px;font-weight : normal;color:#ff6600;"><h6>在线支付</h6></div>
		<div class="box_3" style="background: #fffdee;">
			<table width=100% >
			<tr ><td style="padding:20px;">
			<div style="border: #d6d6d6 solid 1px;background: #fff;height:40px;padding:5px;width:190px;"><img src="/images/unionpay.png"/></div>
			</td ></tr>
			<tr ><td style="padding:20px;"><span><input type="button" onfocus="" onclick="" class="btnsub blue1" value="确定进入网银支付" /></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span ><input type="button" onfocus="" onclick="" class="btnsub blue1" value="管理我的订单" /></span></td></tr>
			</table>
		</div>
	</div>
</div>

  ${msg }<br/>
    付款页面
    <hr />
    <s:if test="ordMembership.payWay==1">
    	银行电汇<br/>
    	<hr/>
    	通过银行转账或现金直接存入资金网指定账号（查看汇款单填写范本），[汇款用途]一栏需注明订单号<br/>
    	银行转账流水号 <input type="text"/>
	<a href="/user/memberType!paymentManagement.act?ordId=${ordMembership.id }">付款成功确定</a>
    </s:if><s:elseif test="ordMembership.payWay==2">
    	在线支付   通过网上银行或支付平台在线付款
    	<hr/>
    	中国  银行   招商银行
	<a href="/user/memberType!paymentManagement.act?ordId=${ordMembership.id }">付款成功确定</a>
    </s:elseif><s:else>
    	没有选择付款类型 可以修改<a href="/user/details.act">资信通详情</a>
    </s:else><br />
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>
