<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript">
<!--
function userstatus(id,statusid){
	if(statusid==1){
		$.post("/admin/user/User!blockUser.act",{uid:id},function(a){
			if(a=='success'){
				$("#pop_info").dialog('close');
				$("#umsg").html("已阻止用户登录。").show();
				$("#status"+id).html("阻止");
			}else{
				$("#umsg").html(a).show();
			}
		});
	}else if(statusid==0){
		$.post("/admin/user/User!unBlockUser.act",{uid:id},function(a){
			if(a=='success'){
				$("#pop_info").dialog('close');
				$("#umsg").html("已解除用户阻止登录。").show();
				$("#status"+id).html("正常");
			}else{
				$("#umsg").html(a).show();
			}
		});
	}else{
		alert("操作有误");
	}
}
//-->
</script>

<table cellpadding="5" cellspacing="5" width="100%">
<tbody>
	<tr>
		<td colspan="2">确认付款信息</td>
	</tr>
	<tr>
		<td>订单编号：</td>
		<td>收款方</td>
	</tr>
	<tr>
		<td>付款方</td>
		<td>付款金额</td>
	</tr>
	<tr>
		<td>发票类型</td>
		<td>发票抬头</td>
	</tr>
	<tr>
		<td colspan="2">发票内容</td>
	</tr>
	<tr>
		<td>寄送方式</td>
	</tr>
	<tr>
		<td>地址</td>
		<td>自取 您前往指定地点领取发票</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>企业经营地址</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>收件地址：上海市浦东新区张杨路707号501室 邮编：200120</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>收件人：张三 联系电话: 13455444506</td>
	</tr>
	<tr>
		<td>新建的收件地址</td>
		<td>收件人</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span style="float:left;">区/县&nbsp;</span></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>详细地址：<input type="text" size="100px;" name="ordMembership.address"/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>邮编：<input type="text" name="ordMembership.postcode"/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>联系电话：<input type="text" name="ordMembership.telphone"/></td>
	</tr>
	<tr>
		<td colspan="2">发票自提点地址</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>中国资金网上海总部</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>上海市浦东新区张杨路707号生命人寿大厦501室</td>
	</tr>
	<tr>
		<td colspan="2">付款方式</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>通过银行转账或现金直接存入资金网指定账号</td>
	</tr>
	<tr>
		<td>在线支付</td>
		<td>通过网上银行或支付平台在线付款</td>
	</tr>
</tbody>
</table>