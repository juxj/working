<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
function del(id){
	$.ajax({
		url : '/user/loan/financeAttach!delAttach.act',
		dataType : 'json',
		data: {'attachlist.id':id},
		cache : false,
		success : function(r) {
			if (r.success) {
				$('#download_attach').dialog('close');
				alert("删除成功！");
			}
		},
		type : "POST",
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert(XMLHttpRequest.responseText);
		} 
	})
}
</script>
<s:if test="attach.uploadWay == null || attach.uploadWay == 0">
	<s:iterator value="faList">
		<li>
			${oldFileName }(<s:date name="createdt" format="yyyy-MM-dd HH:mm"/>) &nbsp;&nbsp;<a href="/user/loan/downloadAttach.act?type=0&falistId=${id }">下载</a>
			<s:if test="ext=='.png'||ext=='.jpg'||ext=='.jpeg'||ext=='.bmp'">| <a href="javascript:void(0);" onclick="watchIt('${id}')">预览</a></s:if>
			<!--<s:else><a href="javascript:void(0);" onclick="openIt('${id}')">打开</a></s:else>-->
			<a href="javascript:void(0);" onclick="del(${id})">删除</a>
		</li>
	</s:iterator>
</s:if>
<s:elseif test="attach.postid!=null">
		<li>资料提交使用的快递公司名称：${attach.attachMemo }</li>
		<li>快递单号：${attach.postid }</li>
</s:elseif>