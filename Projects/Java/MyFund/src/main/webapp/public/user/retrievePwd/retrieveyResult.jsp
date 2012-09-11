<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>找回密码_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/public.js" > </script>
</head>
<body>
<!--头部-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp" />
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="container_960">
  <div class="box_948"> <span class="yourposition">找回密码</span>
          <div class="fl" style="margin-top:20px;margin-left:60px;margin-right:20px;margin-bottom:100px;"><img src="/images/right_ico.png"/></div>
          <div class="txt_content">
			<h6 class="red-bold">您已成功执行密码找回操作!</h6>
			<br/>
			<h6>我们已经将密码重置邮件已发送到您的注册邮箱：${email }</h6>
			<h6>请点击邮件中的密码重置链接，即可进行密码重置。</h6>
			（注意查看邮箱的垃圾邮件目录，请同时将 noreply@zj198.com设置为信任发件人。）<br/>
			<br/>
			<h6>如果10分钟后仍收不到邮件，可拨打客服热线400-8890-198，我们将核实您的身份后为您手工重置密码。</h6></div>          	
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
</body>
<jsp:include page="/public/bottom.jsp" />
</html>