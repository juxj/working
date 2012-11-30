<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table width="100%" border="1" cellspacing="0" cellpadding="0"> 
		<s:if test="fundManagerList.size<=0">
		  <tr class="capital_table" >
	        <td class="capital_table_0">抱歉！未查询到相符的结果</td>
	      </tr>
		</s:if><s:else>
		<s:iterator value="fundManagerList">
			<tr>
				<td><img src='<s:if test="pic == null ">/images/add_head_img.png</s:if><s:else>http://${pic }</s:else>'/></td>
				<td width="2%">&nbsp;</td>
				<td style="vertical-align:top;">基金经理：${manager } ${gender } <br/> ${resume }</td>
			</tr>
	      </s:iterator>
		</s:else>
</table>
