<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:iterator id="item" value="industryList.{?#this.parentid==0}" status="st" >
	<s:if test="#st.index % 5 ==0 && #st.index != 0"> <br/> </s:if>
	<s:set name="isChecked" value="0" />
	<s:iterator id="checkedItem" value="checkedIndustry">
		<s:if test="#checkedItem.trim()==#item.name">
			<s:set name="isChecked" value="1" />
		</s:if>
	</s:iterator>
	<s:if test="#isChecked==0">
		<input type="checkbox" name="clbSupplyInfo.workTrade" class="required" value="${item.name }"/> ${item.name }	
	</s:if> <s:else>
		<input type="checkbox" name="clbSupplyInfo.workTrade" class="required" value="${item.name }" checked/> ${item.name }	
	</s:else>
</s:iterator>