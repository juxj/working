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
	<div class="P_title box_4" style="border-bottom:5px solid #003961;"><s:if test="mType == 1">资信通认证会员</s:if><s:elseif test="mType == 2">资信通vip会员</s:elseif></div>
<!--发布新资金信息-->
	<div class="box_3">
	<form id="frmRequestInfo" action="/user/memberType!next.act" method="post">
		<input type="hidden" name="ordMembership.memberType" value="${mType }"/>
		<table class="form_table">
			<tr>
				<td class="form_table field_name" style="float: left;">确认付款信息</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>服务名称：</td>
				<td><s:if test="mType == 1">资信通认证会员</s:if><s:elseif test="mType == 2">资信通vip会员</s:elseif></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>收款方：</td>
				<td>中国资金网</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>付款金额：</td>
				<td><s:if test="mType == 1">365￥</s:if><s:elseif test="mType == 2">5000￥</s:elseif></td>
			</tr>
			</table>
			<table class="form_table">
			<tr>
				<td class="form_table field_name"style="float: left;">确认发票信息</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>发票类型：</td>
				<td> <input type="radio" name="ordMembership.invoiceType" value="1" checked="checked"/>普通发票</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>发票抬头：</td>
				<td><input type="text" name="ordMembership.invoiceTitle" value="" maxlength="30"/></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>发票内容：</td>
				<td><input type="radio" name="ordMembership.invoiceContent" value="1" checked="checked"/>服务
				<input type="radio" name="ordMembership.invoiceContent" value="2" />咨询
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>寄送方式：</td>
				<td><input type="radio" id="wayKD" name="ordMembership.invoiceSendway" value="1" onclick="radion1(this)" checked="checked"/>快递 中国资金网通过快递寄送给您</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><input type="radio" name="ordMembership.invoiceSendway" value="2" onclick="radion3(this)"/>自取 您前往指定地点领取发票
				</td>
			</tr>
			</table>
			<div id="kuaidi">
			<table class="form_table">
				<tr>
					<td class="form_table field_name"style="float: left;">确认收件地址</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td><input type="radio" name="sendway" onclick="radionAddre(this)" value="1"/>企业经营地址
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>收件地址：上海市浦东新区张杨路707号501室 邮编：200120
					</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
					<td>收件人：张三 联系电话: 13455444506
					</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
					<td><input type="radio" name="sendway" value="2" onclick="anewAddre(this)" checked="checked"/>新建收件地址
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td colspan="2">
				<div id="newAddress">
				<table class="form_table">
				<tr>
					
					<td>收件人 <input type="text" name="ordMembership.invoiceReceiver" class="required"/>
					</td>
				</tr>
				<tr>
					
					<td>地址<s:select id="province" name="ordMembership.provinceid" cssClass="tb_sele" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province','city','district');"/><span style="float:left;">省/直辖市&nbsp;</span>
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
					
					<td>详细地址：<input type="text" size="100px;" name="ordMembership.address"/>
					</td>
				</tr>
				<tr>
					
					<td>邮编：<input type="text" name="ordMembership.postcode"/>
					</td>
				</tr>
				<tr>
					<td>联系电话：<input type="text" name="ordMembership.telphone"/>
					</td>
				</tr>
				</table>
				</div>
				</td></tr>
				</table>
			</div>
			<div id="ziti" style="display:none;">
			<table class="form_table">
			<tr>
				<td class="form_table field_name" style="float: left;">发票自提点地址</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
				<td>中国资金网上海总部
				</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
				<td>上海市浦东新区张杨路707号生命人寿大厦501室
				</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
				<td><a target="_bank" href="http://ditu.google.cn/maps/place?q=%E4%B8%8A%E6%B5%B7%E5%B8%82%E7%94%9F%E5%91%BD%E4%BA%BA%E5%AF%BF%E5%A4%A7%E5%8E%A6&hl=zh-CN&ie=UTF8&cid=14739133017521868503">
				查看交通路线</a>
				</td>
			</tr>
			</table>
			</div>
			<table class="form_table">
				<tr>
					<td class="form_table field_name"style="float: left;">选择付款方式</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td rowspan="2"><input type="radio" onclick="radionPay(this);" name="ordMembership.payWay" value="1"/> 银行电汇</td>
					<td>通过银行转账或现金直接存入资金网指定账号</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>收件地址：上海市浦东新区张杨路707号501室 邮编：200120</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="radio" name="ordMembership.payWay" value="2" onclick="payW(this);" checked="checked"/>在线支付</td>
					<td>通过网上银行或支付平台在线付款</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td colspan="2">
				<div id="payw">
				<table class="form_table">
				<tr>
					<td>中国银行</td>
				</tr>
				<tr>
					<td>工商银行</td>
				</tr>
				<tr>
					<td>农业银行</td>
				</tr>
				<tr>
					<td>邮政银行</td>
				</tr>
				</table>
				</div>
				</td></tr>
				</table>
			<table class="form_table">
			<tr>
				<td>&nbsp; </td>
				<td colspan="2"><input type="submit" value="确认提交" class="but_gray" style="width:200px;"/></td>
			</tr>
		</table>
	</form>
	</div>
</div>       
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>