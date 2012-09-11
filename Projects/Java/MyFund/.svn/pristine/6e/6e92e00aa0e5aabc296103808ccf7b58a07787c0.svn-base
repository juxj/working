<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="common" uri="/Common"%>
<div class="user_login01">
	<div class="clear">&nbsp;</div>
	<div>
	<input type="hidden" id="requestId" name="requestId" value="<s:property value="requestId"/>">	
		<table class="M_box">
			<tr class="top_color" style="border-bottom:1px solid #d7d7d7; font-weight:bolder;">
				<th></th>
				<th>产品编号</th>
				<th>产品名称</th>
				<th>类别</th>
				<th>年利率</th>
				<th>发布时间</th>
				<th>额度范围</th>
				<th>期限</th>
			</tr>
			<s:iterator value="recommendProducts">
				<tr class="top_color01">
					<td style="text-align: center;"><input type="checkbox" name="checkId" <s:if test="isRecommend ==1 ">checked="checked"</s:if> value="${id }"/></td>
					<td style="text-align: center;">${id }</td>
					<td style="text-align: center;">${financeName }</td>
					<td style="text-align: center;"><common:print valueId="${financeType }"/></td>
					<td style="text-align: center;">${littleInterest}~${bigInterest }%</td>
					<td style="text-align: center;"><s:date name="createdt" /></td>
					<td style="text-align: center;">${financeLittleamount }~${financeBigamount }万元</td>
					<td style="text-align: center;">${financeLittledt }~${financeMostdt }月</td>
				</tr>
			</s:iterator>
			<tr>
				<td colspan="8" style="padding-bottom:5px; padding-top:3px;" style="border-left:1px solid #d7d7d7; border-bottom:1px solid #d7d7d7;"><input type="button" onclick="SelectRecom()" value="选择" class="but_gray" />&nbsp;<input type="button" name="cancel" value="取消" onclick="$('#pro_recommend').dialog('close');" class="but_gray"/> </td>
			</tr>
		</table>
	</div>
</div>