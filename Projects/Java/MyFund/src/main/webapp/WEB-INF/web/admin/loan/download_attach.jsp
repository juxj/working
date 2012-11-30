<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript">
	function watchIt(id){
		$('#img_app').html("<img src='/user/loan/downloadAttach.act?type=0&falistId="+id+"'/>");
		$('#img_app').dialog({
			width : 700,
    		modal:true
		});
	}
</script>

<s:if test="attach.uploadWay == null || attach.uploadWay == 0">
	<s:iterator value="faList">
		<li>
			${oldFileName }(<s:date name="createdt" format="yyyy-MM-dd HH:mm"/>) &nbsp;&nbsp;<a href="/user/loan/downloadAttach.act?type=0&falistId=${id }">下载</a>
			<s:if test="ext=='.png'||ext=='.jpg'||ext=='.jpeg'||ext=='.bmp'">| <a href="javascript:void(0);" onclick="watchIt('${id}')">预览</a></s:if>
		</li>
	</s:iterator>
</s:if>
<s:elseif test="attach.postid!=null">
		<li>资料提交使用的快递公司名称：${attach.attachMemo }</li>
		<li>快递单号：${attach.postid }</li>
</s:elseif>