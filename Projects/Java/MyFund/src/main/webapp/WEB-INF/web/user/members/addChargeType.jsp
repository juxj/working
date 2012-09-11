<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>增加收费类型</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </head>
  
  <body>
<a href="">增加收费类型页</a><br/>
    <hr/>
    增加类型<br/>
    <form action="/member/type!saveType.act" method="post">
    <table border="1">
       <tr>
          <td>类型名称：</td>
          <td><input type="text" name="mchType.name" /></td>
       </tr>
       <tr>
       <tr>
          <td>服务周期：</td>
          <td><input type="text" name="mchType.term" /></td>
       <tr>
          <td>费用额度：</td>
          <td><input type="text" name="mchType.charge" /></td>
       </tr>
       <tr>
          <td>是否停用：</td>
          <td><select name="mchType.isCancelled">
          	<option value="1">不停用</option>
          	<option value="0">停用</option>
          </select></td>
       </tr>
       <tr>
          <td colspan="2"><input type="submit" value="提交" /></td>
       </tr>
    </table>
    </form>
  </body>
</html>
