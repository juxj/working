<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户登录页面-中国资金网</title>
<link rel="stylesheet" href="/css/public2.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/user_login.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript">
document.onkeydown = function(e){
   if(!e) e = window.event;//火狐中是 window.event
   if((e.keyCode || e.which) == 13){
       checkform();
   }
};
var captchaflag=0;
//用户名、证书登录切换
$(function() {
	if('${msg}'!=''){
		$("#msg").show();
	}
	$(".user_login_menu li").click(function() {
		$(this).addClass("selected").siblings().removeClass("selected");
		var num = $(this).index();
        $(".user_login_content>div").eq(num).attr("class", "on").siblings().attr("class", "off");
    });
    $(".input-text").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
});
function checkform(){
	if($("#username").val() && $("#pass").val() && $("#verifycode").val()){
		$("#loginform").submit();
	}else{
		$("#msg").html("<div>请填写用户名、密码和验证码。</div>");
		$("#msg").show();
	}
}
function discatip(){
	$("#catip").show();
}
function chgCaptcha(){
	if(captchaflag==0 && $("#captcha").attr("src")=="/images/Captcha.gif"){
		$("#captcha").attr("src","/Captcha.act?d="+Math.random());
		captchaflag=1;
	}
}
</script>
</head>
<body>
<!--头部2-->
<div class="header user_header2 reg_header">
<jsp:include page="/public/head3.jsp"></jsp:include>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_960">
  <div class="box_4" style="width:948px; margin:0 5px;">
    <div class="user_login_left fl"> <img src="/images/user-login-pic.jpg" /> </div>
    <div class="box_4 user_login fr">
      <div class="user_login_menu">
        <ul>
          <li id="list0" class="selected">普通用户登录</li>
          <li id="list1">证书用户登录</li>
        </ul>
      </div>
      <div id="msg" class="notification attention png_bg" style="display:none">
        <div>${msg }</div>
      </div>
      <div class="user_login_content">
        <div class="on" id="login-cont0">
          <form id="loginform" class="out_box_form" action="/Account!login.act" method="post">
            <dl>
              <dd><input type="hidden" name="loginType" value="1"/>
              <input type="hidden" name="rtnurl" value="${rtnurl}"/>
              <h6>用户名：</h6><input id="username" name="username" type=text value="${username }" class="input-text" /></dd>
              <dd><h6>密码：</h6><input id="pass" name="password" type="password" class="input-text" /></dd>
              <dd><h6>验证码：</h6><input id="verifycode" value="" name="verifycode" type="text" class="input-text" style="width:90px;" onfocus="chgCaptcha();"/><img width="120" height="40" src="/images/Captcha.gif" id="captcha" title="点击更换" onclick="this.src='/Captcha.act?d='+Math.random();" /></dd>
              <dd><h6>&nbsp;</h6><input type="button" onclick="checkform()" class="btnsub bred" value="登录" /><span class="txt_info red"><a href="/Recovery.act"> 忘记密码？</a></span></dd>
              <dd><h6>&nbsp;</h6>如果您尚未注册，立即<a class="red" href="/Register.act">免费注册</a></dd>
            </dl>
          </form>
        </div>
        <div class="off" id="login-cont1">
        <div class="notification attention png_bg" style="display:none;" id="catip">
        	<div>请插入中国资金网USB证书。</div>
      	</div>
          <form class="out_box_form" action="/Account!login.act" method="post">
            <dl>
              <dd><input type="hidden" name="loginType" value="2"/>
              <h6>用户名：</h6><input id="username2" name="username" type=text value="" class="input-text" /></dd>
              <dd><h6>密码：</h6><input id="pass2" name="password" type=password value="" class="input-text" /></dd>
              <dd><h6>&nbsp;</h6><input id=u4 type="button" onfocus="this.blur()" onclick="discatip();" class="btnsub bred"  value="登录" /><span class="txt_info red"><a href="/Recovery.act">忘记密码？</a></span></dd>
              <dd><h6>&nbsp;</h6>如果您尚未注册，立即<a class="red" href="/Register.act">免费注册</a></dd>
            </dl>
          </form>
        </div>
      </div>
    </div>
    <div class="clear"> &nbsp; </div>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>
