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
		<td >用户名：</td>
		<td >${ordMembership.username }</td>
	</tr>
	<tr class="odd">
		<td >付款金额：</td>
		<td >${ordMembership.payAmount }</td>
	</tr>
	<tr>
		<td >付款用户类型：</td>
		<td >${ordMembership.memberType }</td>
	</tr>
	<tr class="odd">
		<td >发票类型：</td>
		<td >${ordMembership.invoiceType }</td>
	</tr>
	<tr>
		<td >发票内容：</td>
		<td >${ordMembership.invoiceType }</td>
	</tr>
	<tr class="odd">
		<td >········</td>
		<td >·······</td>
	</tr>
	<tr>
		<td >寄送方式：</td>
		<td >${ordMembership.invoiceSendway }</td>
	</tr>
	<tr class="odd">
		<td >付款方式：</td>
		<td >${ordMembership.payWay}</td>
	</tr>
	<tr>
		<td >付款状态：</td>
		<td >${ordMembership.payStatus}</td>
	</tr>
	<tr class="odd">
		<td >付款时间：</td>
		<td ><s:date name="ordMembership.updatedt" format="yyyy-MM-dd HH:mm:ss" /></td>
	</tr>
	<tr>
		<td >创建时间：</td>
		<td ><s:date name="ordMembership.updatedt" format="yyyy-MM-dd HH:mm:ss" /></td>
	</tr>
	<tr class="odd">
		<td >订单状态：</td>
		<td ><s:if test="ordMembership.status==0">正常</s:if><s:if test="ordMembership.status==1"><font color="red">阻止</font></s:if></td>
	</tr>
	<s:if test="updateStatus !=null && updateStatus == 1">
	</s:if>
	<s:else>
		<tr>
			<td colspan="2"><input type="button" value="阻止" onclick="userstatus(${ordMembership.id},'1');" <s:if test="ordMembership.status==1">disabled="disabled"</s:if>/>
			<input type="button" value="解除" onclick="userstatus(${ordMembership.id},'0');" <s:if test="ordMembership.status==0">disabled="disabled"</s:if>/></td>
		</tr>
	</s:else>
</tbody>
</table>