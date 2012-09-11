<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>理财服务产品页_中国资金网</title>
	<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
	<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
	<script type="text/javascript" src="/script/load-finance.js" > </script>
	<script language="javascript" >
		function checkFundCode() {
			var tfFundCode = document.getElementById('tfFundCode');
			var value = tfFundCode.value()
			if (value == '' || value=='NaN') {
				return false;
			}
		}
	</script>

  </head>
  
  <body>
  	<div class="header index_header">
	<jsp:include page="/public/head1.jsp" />
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<div class="M_menu">
  	<a href="#">首页</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">理财产品</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">银行理财产品列表</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">基金理财</a>
  	</div>
	<br/>
    <div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<div class="M_box">
		${fundInfo.fundfullname}
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<div style="width:960px; margin:0 auto; text-align:center;">
        <div class="pages01">
            <label title="共0条">
            第
            <span>${pagination.current}</span>
            页/共
            <strong>${pagination.pages}</strong>
            页
            </label>
            &nbsp;
            <a href="/finance/fund!showHistory.act?fundCode=${fundCode}&pageNo=${pagination.first}">&nbsp;首页&nbsp;</a>
            <a href="/finance/fund!showHistory.act?fundCode=${fundCode}&pageNo=${pagination.previous}">&nbsp;上一页&nbsp;</a>
            <a href="/finance/fund!showHistory.act?fundCode=${fundCode}&pageNo=${pagination.next}">&nbsp;下一页&nbsp;</a>
            <a href="/finance/fund!showHistory.act?fundCode=${fundCode}&pageNo=${pagination.last}">&nbsp;末页&nbsp;</a>
        </div>
    </div>
    <div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<div class="M_box">
		  <table border="0" cellspacing="0" cellpadding="0" style="width:100%" >
		  	<tr>
		  		<td>运作方式</td>
		  		<td>${fundInfo.carrytype}</td>
		  		<td>类型</td>
		  		<td>${fundInfo.type}</td>
		  	</tr>
		  	<tr>
		  		<td>基金管理人</td>
		  		<td>${fundInfo.fundcompany}</td>
		  		<td>基金托管理人</td>
		  		<td>${fundInfo.agentcompany}</td>
		  	</tr>
		  	<tr>
		  		<td>基金合同生效日期</td>
		  		<td><s:date name="#fundInfo.begindate"/></td>
		  		<td>基金合同存续期截止日</td>
		  		<td><s:date name="#fundInfo.expiredate"/></td>
		  	</tr>
		  	
		  </table>
		  
		  </div>
		  
		  <div class="clear"> &nbsp; </div>
			<div class="hr_10"> &nbsp; </div> 
			<div class="M_box">
  
	    	<table border="0" cellspacing="0" cellpadding="0" style="width:100%" >
	    		<tr>
	    			<td>基金代码</td>
	    			<td>分级代码</td>
	    			<td>基金名称</td>
	    			<td>单位值</td>
	    			<td>累积值</td>
	    			<td>增长率</td>
	    			<td>现值</td>
	    			<td>日期</td>
	    		</tr>
	    	
	    	<s:iterator id ="fundValue" value="fundHistoryList">
					<tr>
						<td>${fundValue.fundcode}</td>
						<td>${fundValue.levelcode}</td>
		    			<td>${fundValue.fundName}</td>
		    			<td><s:text name="format.float.3"><s:param value="#fundValue.unitvalue"/></s:text></td>
		    			<td><s:text name="format.float.3"><s:param value="#fundValue.accumulatvalue"/></s:text></td>
		    			<td><s:text name="format.float.3"><s:param value="#fundValue.dayincrease*100"/></s:text>%</td>
		    			<td>
		    				<s:if test='#fundValue.totalvalue==null'> --
		    				<s:else>
		    					<s:text name="format.float.3"><s:param value="#fundValue.totalvalue"/></s:text>
		    				</s:else>
		    				</s:if>
		    			</td>
		    			<td><s:date name="#fundValue.day" format="yyyy-MM-dd"/></td>
					</tr>
			</s:iterator>
			</table>
			</div>
			
			<div class="clear"> &nbsp; </div>
			<div class="hr_20"> &nbsp; </div>
			<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
