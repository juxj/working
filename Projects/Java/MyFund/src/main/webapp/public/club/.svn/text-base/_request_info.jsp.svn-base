<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:if test="@com.zj198.util.Constants@REQUEST_INFO_LIST.size>0">
<ul style="float:left; margin-right:50px;width:260px;"  class="xxkbox first new_li">
	<s:iterator id="item" value="@com.zj198.util.Constants@REQUEST_INFO_LIST" status="st">
		<li title="${item.title}">
		<a href="/service/requestInfoAction!detail.act?clbRequestInfoId=${item.id }">
			<s:if test="#item.title != null && #item.title.length()>20">
				<s:property value="#item.title.substring(0,20)"></s:property>...
			</s:if><s:else>
				${item.title}
			</s:else>
		</a></li>
		<s:if test="#st.index == 4">
			</ul><ul class="xxkbox first new_li">
		</s:if>
	</s:iterator>
</ul>
</s:if>
<s:else>
	<li>无记录</li>
</s:else>