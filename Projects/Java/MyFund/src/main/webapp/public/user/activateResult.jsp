<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>激活成功-中国资金网</title>
<meta http-equiv="refresh" content="3; URL=/user/UserAction.act" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/phone_test.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
</head>
<body>
<div class="header user_header reg_header">
   <jsp:include page="/public/head3.jsp" />
</div>
<!--主体部分-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<div class="container_960">
  		<div class="box_948"> <span class="yourposition">激活帐户</span>
          <div class="fl" style="padding-top:20px;padding-left:60px;padding-right:20px;padding-bottom:60px;"><img src="/images/right_ico.png"/></div>
          <div class="txt_content">  		
		  <h6 class="red-bold">${msg}</h6>
		  <h6>本页面会自动跳转，您也可以直接 <a class="red" href="/user/UserAction.act">点此</a>继续。</h6>
		  </div>
		</div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
</body>
<jsp:include page="/public/bottom.jsp" />
</html>
