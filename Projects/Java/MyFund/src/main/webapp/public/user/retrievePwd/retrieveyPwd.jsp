<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>找回密码_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript">
$(function() {
	if('${msg}'!=''){
		$("#msg").show();
	}
});
function checkform(){
	if($("#pass").val() && $("#rpass").val() && $("#verifycode").val()){
		$.post("/Recovery!resetPwd.act",{password:$('#pass').val(),verifycode:$('#verifycode').val(),v:$('#vid').val()},function(a){
			if(a=='success'){
				alert("密码修改成功");
				window.location.href="/Account.act";
			}else{
				alert(a);
			}
		});
		//$("#loginform").submit();
	}else{
		$("#msg").html("<div>请填写用户名、和验证码。</div>");
		$("#msg").show();
	}
}
function check_pass() {
	var pass_error = $("#pass_error");
	if(/^\w{6,16}$/.test($("#pass").val())){
		pass_error.html("");
	}else{
		pass_error.addClass("txt-err");
		pass_error.html("请正确输入6~16个字符，区分大小写。");
		checkformresult=1;
	}
}
function check_rpass() {
	var rpass_error = $("#rpass_error");
	if($("#pass").val()==$("#rpass").val()){
		rpass_error.html("");
		
	}else{
		rpass_error.addClass("txt-err");
		rpass_error.html("输入的密码不一致。");
		checkformresult=1;
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
<div class="hr_10"> &nbsp; </div>
<div class="container_960">
<div class="box_948"> <span class="yourposition">修改密码</span>
   <div id="msg" class="notification attention png_bg" style="display:none">
        <div>${msg }</div>
      </div>
      <div class="user_login_content">
        <div class="on" id="login-cont0">
          <form id="loginform" class="box_form" action="/Recovery!resetPwd.act" method="post">
            <dl>
              <dd>
		          <h6><span class="txt-impt">*</span>新密码：</h6>
		          <input type="hidden" name="v" id="vid" value="${v }"/>
		          <input id="pass" name="password" onblur="check_pass()" type=password value="" class="input-text" />
		          <span id="pass_error" class="txt-info">6~16个字符，区分大小写</span></dd>
		        <dd>
		          <h6><span class="txt-impt">*</span>重复新密码：</h6>
		          <input id="rpass" onblur="check_rpass()" type=password value="" class="input-text" />
		          <span id="rpass_error" class="txt-info">请再次输入新密码</span>
		        </dd>
              <dd><h6>验证码：</h6><input id="verifycode" name="verifycode" type=text value="" class="input-text" style="width:90px;" /><img src="/Captcha.act" title="点击更换" onclick="this.src='/Captcha.act?d='+Math.random();" /></dd>
              <dd><h6>&nbsp;</h6><input type="button" onclick="checkform()" class="btnsub bred" style="width:90px;" value="确认修改" /></dd>
            </dl>
          </form>
        </div>
      </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
</div>
<jsp:include page="/public/bottom.jsp" />
</body>
</html>