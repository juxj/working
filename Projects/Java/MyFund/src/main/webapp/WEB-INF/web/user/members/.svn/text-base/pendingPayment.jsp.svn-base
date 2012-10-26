<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>付款_中国资金网</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  ${msg }<br/>
    付款页面
    <hr />
    <s:if test="ordMembership.payWay==1">
    	银行电汇<br/>
    	<hr/>
    	通过银行转账或现金直接存入资金网指定账号（查看汇款单填写范本），[汇款用途]一栏需注明订单号<br/>
    	银行转账流水号 <input type="text"/>
	<a href="/user/memberType!paymentManagement.act?ordId=${ordMembership.id }">付款成功确定</a>
    </s:if><s:elseif test="ordMembership.payWay==2">
    	在线支付   通过网上银行或支付平台在线付款
    	<hr/>
    	中国  银行   招商银行
	<a href="/user/memberType!paymentManagement.act?ordId=${ordMembership.id }">付款成功确定</a>
    </s:elseif><s:else>
    	没有选择付款类型 可以修改<a href="/user/details.act">资信通详情</a>
    </s:else><br />
  </body>
</html>
