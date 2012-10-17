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
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
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
		$("#msg").html("<div>请填写用户名和验证码。</div>");
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
<s:if test="mobile == 1">
<script type="text/javascript">
function test(){
	$("#pop_verCode").dialog({width:540,modal: true});
}
function mobileSend(){
	if($("#mobile").val()){
		$.post("/Recovery!sendMoblie.act",{username:$('#musername').val(),mobile:$('#mobile').val(),verifycode:$('#verCod').val()},function(a){
			if(a=='success'){
				$("#pop_verCode").dialog('close');
				alert("手机验证成功，请注意查收信息。");
				window.location.href="/Account.act";
			}else{
				$("#mobileMsg").html(a);
				$("#captcha").attr("src","/Captcha.act?d="+Math.random());
			}
		});
	}
}
$(function() {
	test();
});
</script>
</s:if>
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
<!--弹出框内容手机验证-->
<div id="pop_verCode" style="display:none;" title="手机验证">
    <div class="user_login01">
      <div class="clear"> &nbsp; </div>
      <div class="user_login01_content">
        <div class="on">
            <table>
              <tr><td><h6>手机号码：</h6><input id="mobile" type="text" class="input-text" size="40" />
              	<input id="musername" type="hidden" name="username" value="${username }" class="input-text" size="40" /></td></tr>
              <tr><td><h6>验证码：</h6><input id="verCod" type=text value="" class="input-text" style="width:90px;" />
              	<img  id="captcha" src="/Captcha.act" title="点击更换" onclick="this.src='/Captcha.act?d='+Math.random();" /></td></tr>
	    	  <tr><td><span id="mobileMsg" style="color: red">提示：你的邮箱为空，需要填写手机号码获取密码信息。</span></td></tr>
              <tr><td><h6>&nbsp;</h6><input type="button" onclick="mobileSend();" class="but_gray" style="width:90px;" value="确定" /></td></tr>
            </table>
        </div>
	  </div>
	</div>
</div>
</div>
<jsp:include page="/public/bottom.jsp" />
</body>
</html>