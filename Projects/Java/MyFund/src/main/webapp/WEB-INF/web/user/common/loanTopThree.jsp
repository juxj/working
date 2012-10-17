<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<table class="gold-table" border="0" cellspacing="0" cellpadding="0">
  <caption>
  <span class="fr view_all"><a href="/user/loan/LoanRequest!loanManage.act?mparamid=12">查看全部»</a></span>
  <h6>融资意向</h6>
  <!-- 企业 -->
  <s:if test="#session._user.userTypeGroup == 1">
	  <span class="leftdetail"><a href="/loan/LoanRequest.act?loan.applyType=136" target="_blank">立即提交</a></span>
  </s:if>
  <!-- 个人 -->
  <s:if test="#session._user.userTypeGroup == 5">
	  <span class="leftdetail"><a href="/loan/LoanRequest.act?loan.applyType=138" target="_blank">立即提交</a></span>
  </s:if>
  </caption>
  <s:if test="topThree.size<=0">
  	<tr>
  		<td colspan="7" align="center">暂无申请记录</td>
  	</tr>
  </s:if><s:else>
  <tr>
  	 <th>融资意向编号</th>
     <th>发布时间</th>
     <th>需求金额</th>
     <th>用途</th>
     <th>期限</th>
     <th>状态</th>
     <th>操作</th>
  </tr>
  </s:else>
  <s:iterator value="topThree" id="item">
	  <tr>
	    <td>${applyNum}</td>
		<td><s:date name="createdt" /></td>
		<td><s:number name="loanAmount" />万元</td>
		<td><common:print valueId="loanPurpose"/> </td>
		<td>${loanMonth}月</td>
   		<td><common:print valueId="applyStatus"/></td>
   		<td class="view_detail">
   		<a target="_blank" href="/user/loan/LoanRequest!loanManageDetail.act?industryId=${id }">查看</a>
   		</td>
	  </tr>
  </s:iterator>
</table>