<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>理财服务产品页???_中国资金网</title>
	<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
  </head>
  
  <body>
	<div class="header index_header">
	<jsp:include page="/public/head1.jsp" />
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<div class="clear"> &nbsp; </div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<div class="M_box">
	   	<table border="0" cellspacing="0" cellpadding="0" style="width:100%" class="gold-table" >
	   		<tr class="BankProductHeader">
	   			<th>类型</th>
				<th>主题</th>
				<th>作者</th>
				<th>来源</th>
				<th>发布日期</th>
	   		</tr>
	   		<s:if test="knwTitleList.size()>0">
			   	<s:iterator id ="item" value="knwTitleList">
		    	<tr  class="gold_connect">
					<td>${item.typeName}</td>
					<td>${item.title}</td>
					<td>${item.author}</td>
					<td>${item.source}</td>
					<td><s:date name="#item.issuedDate"></s:date>
					</td>
		    	</tr>
		    	</s:iterator>
	    	</s:if>
	    	<s:else>
	    		<tr  class="gold_connect">
				<td colspan="5">无记录</td>
	    		</tr>
	    	</s:else>
		</table>
	</div>
	<div style="width:960px; margin:0 auto; text-align:right;">
		<div class="pages01">
			<s:if test="knwTitleList.size()>0">
		    <label title="共${pagination.recordCount}条">
		    第
		    <span>${pagination.current}</span>
		    页/共
		    <strong>${pagination.pages}</strong>
		    页
		    </label>
		    
		    <s:if test="knwTitleList.size()>1">
			    &nbsp;
			    <a href="/news/Info!infoGroup.act?pageNo=${pagination.first}">&nbsp;首页&nbsp;</a>
			    <a href="/news/Info!infoGroup.act?pageNo=${pagination.previous}">&nbsp;上一页&nbsp;</a>
			    <a href="/news/Info!infoGroup.act?pageNo=${pagination.next}">&nbsp;下一页&nbsp;</a>
			    <a href="/news/Info!infoGroup.act?pageNo=${pagination.last}">&nbsp;末页&nbsp;</a>
		    </s:if>
		    </s:if>
		</div>
	</div>
  </body>
</html>
