<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>��Ʒ����Ʒҳ_�й��ʽ���</title>
	<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
	<script type="text/javascript" src="/script/load-finance.js" > </script>
  </head>
  
  <body>
	<div class="header index_header">
	<jsp:include page="/public/head1.jsp" />
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<div class="M_menu">
  	<a href="/">��ҳ</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">��Ʋ�Ʒ</a>&nbsp;&nbsp;<b>>&nbsp;&nbsp;<a href="#">����</a>
  	</div>
	<br/>
	<div class="clear"> &nbsp; </div>
	
	<div id="box2">
		<s:if test="typeId==0">
			<a href="/finance/fund!searchByType.act?typeId=0" class="seled">ȫ��</a>&nbsp;&nbsp;
		</s:if><s:else>
			<a href="/finance/fund!searchByType.act?typeId=0">ȫ��</a>&nbsp;&nbsp;
		</s:else>
		<s:iterator id ="item" value="fundTypeList">
			<s:if test="#item.id==typeId">
				<a href="/finance/fund!searchByType.act?typeId=${item.id}" class="seled">${item.name}</a>&nbsp;&nbsp;
			</s:if><s:else>
				<a  href="/finance/fund!searchByType.act?typeId=${item.id}">${item.name}</a>&nbsp;&nbsp;
			</s:else>
		</s:iterator>
	 </div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<div class="M_box">
	   	<table border="0" cellspacing="0" cellpadding="0" style="width:100%" >
	   		<tr class="BankProductHeader">
	   			<th>�������</th>
	   			<th>��������</th>
	   			<th>��ֵ</th>
	   			<th>ǰ�վ�ֵ</th>
	   			<th>������ֵ</th>
	   			<th>��������</th>
	   			<th>�ۻ�ֵ</th>
	   			<th>����</th>
	   		</tr>
		   	<s:iterator id ="fundValue" value="fundHistoryList">
					<tr  class="gold_connect">
						<td><a href="/finance/fund!showHistory.act?fundCode=${fundValue.fundcode}"> ${fundValue.fundcode} </a> </td>
						<td>${fundValue.fundName}</td>
			   			<td>
			   				<s:text name="format.float.3"><s:param value="#fundValue.unitvalue"/></s:text>
			   			</td>
			   			<td>
			   				<s:text name="format.float.3"><s:param value="#fundValue.unitvalue-#fundValue.dayincrease"/></s:text>
			   			</td>
			   			<td>${fundValue.dayincrease}</td>
			   			<td>
			   				<s:text name="format.float.3"><s:param value="#fundValue.dayincrease/(#fundValue.unitvalue-#fundValue.dayincrease)*100"/></s:text>%
			   			</td>
			   			<td>${fundValue.accumulatvalue}</td>
			   			<td><s:date name="#fundValue.day"/></td>
					</tr>
			</s:iterator>
		</table>
	  </div>
	  
	  <div style="width:960px; margin:0 auto; text-align:right;">
        <div class="pages01">
            <label title="��0��">
            ��
            <span>${pagination.current}</span>
            ҳ/��
            <strong>${pagination.pages}</strong>
            ҳ
            </label>
            &nbsp;
            <a href="/finance/fund!searchByType.act?typeId=${typeId}&pageNo=${pagination.first}">&nbsp;��ҳ&nbsp;</a>
            <a href="/finance/fund!searchByType.act?typeId=${typeId}&pageNo=${pagination.previous}">&nbsp;��һҳ&nbsp;</a>
            <a href="/finance/fund!searchByType.act?typeId=${typeId}&pageNo=${pagination.next}">&nbsp;��һҳ&nbsp;</a>
            <a href="/finance/fund!searchByType.act?typeId=${typeId}&pageNo=${pagination.last}">&nbsp;ĩҳ&nbsp;</a>
        </div>
     </div>
  </body>
</html>
