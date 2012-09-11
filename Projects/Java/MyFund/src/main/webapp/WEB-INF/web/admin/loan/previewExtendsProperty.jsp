<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table>
	<s:iterator value="financeProductSpModel.extendsPropertyList">
		<tr>
			<td align="right" >${fieldName }:<td>
			<td align="left">
			<s:if test="fieldType == 1">
				<input type="text" name="" class="input-text"/>
			</s:if>
			<s:if test="fieldType == 2">
				<textarea name="" rows="5" cols="50"></textarea>
			</s:if>
			<s:if test="fieldType == 3">
				<select name="" class="input-text">
					<s:iterator value="propertyDicSet">
						<option value="${dicValue }">${dicName }</option>
					</s:iterator>
				</select>
			</s:if>
			<s:if test="fieldType == 4">
				<s:iterator value="propertyDicSet">
					<input type="checkbox" name="" value="${dicValue }"/>${dicName }
				</s:iterator>
			</s:if>
			</td>
		</tr>
	</s:iterator>
</table>
