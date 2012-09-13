<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>费用类型</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </head>
  
  <body>
  <a href="/member/type!addType.act">增加收费类型</a><br/>
    <hr/>
      收费类型列表<br/>
    <table border="1">
       <tr>
          <td>类型名称</td>
          <td>服务周期</td>
          <td>费用额度</td>
          <td>是否停用</td>
          <td>生效日期</td>
          <td>失效日期</td>
          <td colspan="2">操作</td>
       </tr>
    	<s:iterator value="typeList" id="tl">
       <tr>
          <td>${tl.name }</td>
          <td>${tl.term }</td>
          <td>${tl.charge }</td>
          <td><s:if test="#tl.isCancelled==1">使用</s:if><s:else>停用</s:else></td>
          <td><s:date name="#tl.effectiveDate"/></td>
          <td><s:date name="#tl.expiredDate"/></td>
          <td><a href="${tl.id }">修改</a></td>
          <td><a href="/member/type!deleteType.act?mchType.id=${tl.id }">删除</a></td>
       </tr>
    </s:iterator>
    </table>
    
  </body>
</html>
