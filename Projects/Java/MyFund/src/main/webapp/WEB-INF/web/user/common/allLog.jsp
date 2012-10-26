<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<style>
.sq_t{border-top:1px solid #d6d6d6; border-right:1px solid #d6d6d6; width:380px; margin: 0 auto;}
.sq_t td{border-bottom:1px solid #d6d6d6; border-left:1px solid #d6d6d6;}
.ui-widget-header {border: 1px solid #225376; background: #225376 url(images/ui-bg_gloss-wave_0_97181d_500x100.png) 50% 50% repeat-x; color: #ffffff; font-weight: bold; }
</style>
<!-- <table class="sq_table" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<th width="100px">操作时间</th>
		<th>具体信息</th>
	</tr>
	<s:iterator value="applyCheckList">
		<tr>
			<td><s:date name="createdt" format="yyyy-MM-dd hh:mm:ss" /></td>
			<td>${checkView }</td>
		</tr>
	</s:iterator>
</table> -->
 <table border="0" cellspacing="0" cellpadding="0" class="sq_t">
  <tr class="sq_title">
    <td>操作时间</td>
    <td>操作人</td>
    <td width="80%">处理信息</td>
  </tr>
  <s:iterator value="applyCheckList">
  <tr class="sq_connect">
    <td><s:date name="createdt" format="yyyy-MM-dd hh:mm:ss" /></td>
    <td>${createUserName }</td>
    <td>${checkView }</td>
  </tr>
  </s:iterator>
</table>