<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<table class="gold-table" border="0" cellspacing="0" cellpadding="0">
  <caption>
  <span class="fr view_all"><a href="/user/loan/userApplyManag.act?mparamid=14">查看全部»</a></span>
  <h6>融资申请</h6>
  <!-- 企业 -->
  <s:if test="#session._user.userTypeGroup == 1">
	  <span class="leftdetail"><a href="/loan/financeProduct.act?financeType=151&financeDate=12" target="_blank">立即申请</a></span>
  </s:if>
  <!-- 个人 -->
  <s:if test="#session._user.userTypeGroup == 5">
	  <span class="leftdetail"><a href="/loan/financeProduct.act?financeType=152&financeDate=12" target="_blank">立即申请</a></span>
  </s:if>
  </caption>
  <s:if test="applyList.size<=0">
  	<tr>
  		<td colspan="7" align="center">暂无申请记录</td>
  	</tr>
  </s:if><s:else>
  <tr>
  	 <th>申请编号</th>
     <th>申请时间</th>
     <th>融资渠道/项目</th>
     <th>融资额度</th>
     <th>期限</th>
     <th>状态</th>
     <th style="text-align:right; padding-right:60px;">操作</th>
  </tr>
  </s:else>
  <s:iterator value="applyList" id="item">
	  <tr>
	    <td>${applyNum}</td>
		<td><s:date name="createdt" format="yyyy-MM-dd"/></td>
		<td >
		<common:print valueId="productUserId" type="user"/><br/>${productName }</td>
		<td><s:number name="loanAmount" />万元</td>
		<td>${loanMonth}月</td>
   		<td><common:print valueId="applyStatus"/></td>
   		<td class="view_detail" style="text-align:right; padding-right:20px;">
   		<a href="/user/loan/userApplyManag!viewFinanceApply.act?apply.id=${id }" style="width:30px;">查看</a>
   		</td>
	  </tr>
  </s:iterator>
</table>