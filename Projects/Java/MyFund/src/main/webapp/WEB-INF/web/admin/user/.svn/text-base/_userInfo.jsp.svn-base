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
		<td >${usrUser.username }</td>
	</tr>
	<tr class="odd">
		<td >真实姓名：</td>
		<td >${usrUser.realname } <s:if test="usrUser.gender==0">女士</s:if><s:else>先生</s:else> </td>
	</tr>
	<tr>
		<td >邮箱：</td>
		<td >${usrUser.email }<s:if test="usrUser.activetype==1 || usrUser.activetype==3"> <font color="red">√</font></s:if></td>
	</tr>
	<tr class="odd">
		<td >电话</td>
		<td >${usrUser.mobile }<s:if test="usrUser.activetype==2 || usrUser.activetype==3"> <font color="red">√</font></s:if></td>
	</tr>
	<tr>
		<td >注册时间：</td>
		<td ><s:date name="usrUser.createdt" format="yyyy-MM-dd HH:mm:ss" /></td>
	</tr>
	<tr class="odd">
		<td >最后一次更新时间：</td>
		<td ><s:date name="usrUser.updatedt" format="yyyy-MM-dd HH:mm:ss" /></td>
	</tr>
	<tr>
		<td >验证类别：</td>
		<td ><s:if test="usrUser.activetype==0">未验证</s:if><s:elseif test="usrUser.activetype==1">邮箱已验证</s:elseif><s:elseif test="usrUser.activetype==2">手机已验证</s:elseif><s:elseif test="usrUser.activetype==3">邮箱已验证，电话已验证</s:elseif></td>
	</tr>
	<tr class="odd">
		<td >用户状态：</td>
		<td ><s:if test="usrUser.status==0">正常</s:if><s:if test="usrUser.status==1"><font color="red">阻止</font></s:if></td>
	</tr>
	<tr>
		<td >审核状态：</td>
		<td ><s:if test="usrUser.auditstatus==0">未审核</s:if><s:elseif test="usrUser.auditstatus==1">待审核</s:elseif><s:elseif test="usrUser.auditstatus==2">已审核</s:elseif></td>
	</tr>
	<s:if test="updateStatus !=null && updateStatus == 1">
	</s:if>
	<s:else>
		<tr>
			<td colspan="2"><input type="button" value="阻止" onclick="userstatus(${usrUser.id},'1');" <s:if test="usrUser.status==1">disabled="disabled"</s:if>/>
			<input type="button" value="解除" onclick="userstatus(${usrUser.id},'0');" <s:if test="usrUser.status==0">disabled="disabled"</s:if>/></td>
		</tr>
	</s:else>
</tbody>
</table>