<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:iterator id="item" value="amountRangeList">
	<s:if test="#item.code<10000">
		<label>
			<s:if test="clbSupplyInfo.workTranche==#item.code">
				<input type="radio" 
					name="clbSupplyInfo.workTranche" 
					value="${item.code }" 
					class="required" checked/> ${item.name }
			</s:if> <s:else>
				<input type="radio" name="clbSupplyInfo.workTranche" value="${item.code }" class="required"/> ${item.name }
			</s:else>
		</label>
	</s:if>
</s:iterator>