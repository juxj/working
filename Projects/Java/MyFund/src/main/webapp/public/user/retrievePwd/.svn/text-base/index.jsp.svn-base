<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>找回密码_中国资金网</title>
<link rel="stylesheet" href="/css/public2.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/user_login.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript">
$(function() {
	if('${msg}'!=''){
		$("#msg").show();
	}
});
function checkform(){
	if($("#username").val() && $("#verifycode").val()){
		$("#loginform").submit();
	}else{
		$("#msg").html("<div>请填写新密码、和验证码。</div>");
		$("#msg").show();
	}
}
</script>
</head>
<body>
<!--头部2-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp" />
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="container_960">
  <div class="box_948"> <span class="yourposition">找回密码</span>
   <div id="msg" class="notification attention png_bg" style="display:none">
        <div>${msg }</div>
      </div>
      	<div class="hr_10"> &nbsp; </div>
        <div class="on" id="login-cont0">
          <form id="loginform" class="box_form" action="/Recovery!sendVerify.act" method="post">
            <dl>
              <dd><h6>用户名：</h6><input id="username" name="username" type=text value="" class="input-text" /></dd>
              <dd><h6>验证码：</h6><input id="verifycode" name="verifycode" type=text value="" class="input-text" style="width:90px;" /><img src="/Captcha.act" title="点击更换" onclick="this.src='/Captcha.act?d='+Math.random();" /></dd>
              <dd><h6>&nbsp;</h6><input type="button" onclick="checkform()" class="btnsub bred" style="width:90px;" value="找回密码" /></dd>
            </dl>
          </form>
      </div>
     </div>
<div class="hr_10"> &nbsp; </div>
</div>
<jsp:include page="/public/bottom.jsp" />
</body>
</html>