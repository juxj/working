<%@ page language="java" contentType="utf-8; charset=UTF-8"%>
<script type="text/javascript">
	function doPagination(pageNo) {
		var levelId = $("#levelId").attr("value");
		var sinItemId = $("#sinItemId").attr("value");
		showAssessments(sinItemId, levelId, pageNo);
	}
</script>

<%@ taglib prefix="s" uri="/struts-tags" %>
<dl>
<s:iterator id="item" value="assessments['list']">
<dd><s:date name="#item.assessDate" />:${item.assessment}</dd>
</s:iterator>
<!--分页-->
<dd>
	<s:if test="assessments['pagination'].pages>1">
		<label title="共0条">第<span>${assessments['pagination'].current}</span>页/共<strong>${assessments['pagination'].pages}</strong>页</label>
		            &nbsp;
			<a href="javascript:doPagination(${assessments['pagination'].first})">&nbsp;首页&nbsp;</a>
			<a href="javascript:doPagination(${assessments['pagination'].previous})">&nbsp;上一页&nbsp;</a>
			<a href="javascript:doPagination(${assessments['pagination'].next})">&nbsp;下一页&nbsp;</a>
			<a href="javascript:doPagination(${assessments['pagination'].last})">&nbsp;末页&nbsp;</a>
	</s:if>		  		                      
</dd>
</dl>