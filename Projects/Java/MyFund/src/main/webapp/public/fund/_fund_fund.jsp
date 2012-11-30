<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
	      <tr>
	      	<th>基金代码</th><td>${fund.code }</td>
	      </tr>
	      <tr>
	      	<th>基金简称</th><td><common:ifNull value="fund.shortName"/></td>
	      </tr>
	      <tr>
	      	<th>基金全称</th><td><common:ifNull value="fund.fullName"/></td>
	      </tr>
	      <tr>
	      	<th>成立日期</th><td><common:ifNull value="fund.issuedDate"/></td>
	      </tr>
	      <tr>
	      	<th>基金类型</th><td><common:ifNull value="fund.catelogName"/></td>
	      </tr>
	      <tr>
	      	<th>基金经理</th><td><common:ifNull value="fund.manager"/></td>
	      </tr>
	      <tr>
	      	<th>基金管理人</th><td><common:ifNull value="fund.administrator"/></td>
	      </tr>
	      <tr>
	      	<th>基金托管人</th><td><common:ifNull value="fund.custodian"/></td>
	      </tr>
	      <tr>
	      	<th>投资目标</th><td><common:ifNull value="fund.investmentGoal"/></td>
	      </tr>
	      <tr>
	      	<th>投资范围</th><td><common:ifNull value="fund.investmentScale"/></td>
	      </tr>
	      <tr>
	      	<th>投资策略</th><td><common:ifNull value="fund.investmentStrategy"/></td>
	      </tr>
	      <tr>
	      	<th>风险收益特征</th><td><common:ifNull value="fund.characteristics"/></td>
	      </tr>
</table>
