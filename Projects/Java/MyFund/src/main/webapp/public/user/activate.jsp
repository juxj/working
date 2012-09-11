<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>验证并完成注册-中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/ca.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/reg.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script type="text/javascript">
function check_email() {
	var email_error = $("#email_error");
	if(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($("#email").val())){
		email_error.html("");
	}else{
		email_error.addClass("txt-err");
		email_error.html("邮箱用于激活用户、找回密码等。");
		checkformresult=1;
	}
}
function check_remail() {
	var remail_error = $("#remail_error");
	if($("#email").val()==$("#remail").val()){
		remail_error.html("");
	}else{
		remail_error.addClass("txt-err");
		remail_error.html("输入的邮箱地址不一致");
		checkformresult=1;
	}
}
//文本框触发焦点效果
$(function() {
    $(".input-text").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
    $("#email").focus(function() {
        $(this).attr("value","");
    });
      
});
function vershow(){
	$("#email").attr("value","");
	$("#remail").attr("value","");
	$("#verifycode").attr("value","");
	$("#pop_email").dialog({width:500,modal:true});
}
function verCode(){
	if($("#Verification_code").val()!=""){
		$("#nullmsg").hide();
		$("#actForm").submit();
	}else{
		$("#nullmsg").html("请填写激活码").show();
	}
}
function recoveryInfo(){
	var checkformresult=0;
	if($("#verifycode").val()==""){
		$('#message').html("请填写验证码");
		checkformresult=1;
		return false;
	}
	if($('#email').val()!="" && $("#verifycode").val()!=""){
		check_email();check_remail();
		if(checkformresult==0){
			$.post("/Account!reSendActiveCode.act",{email:$("#email").val(),verifycode:$("#verifycode").val()},function(a){
				if(a=='success'){
					$("#pop_email").dialog('close');
					$("#accMsg").html("激活邮件已重新发送，请注意查收。");
				}else{
					$('#message').html(a);
				}
			});
		}
		check_email();check_remail();
	}//else{
	//	$.post("/Account!reSendActiveCode.act",function(a){
	//		if(a=='success'){
	//			$("#accMsg").html("激活码已重新发送，请注意查收。");
	//		}else{
	//			$('#message').html(a);
	//		}
	//	});
	//}
}
</script>
</head>
<body>
<div class="header user_header reg_header">
<jsp:include page="/public/head3.jsp" />
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_960">
  <div class="box_948" style="height: 500px;"> <span class="yourposition">激活帐户</span>
    <div class="hr_20"> &nbsp; </div>
    <h6 class="red margin_lr_40">尊敬的 ${session._user.realname} <s:if test="#session._user.gender==1">先生</s:if><s:else>女士</s:else>，感谢您注册中国资金网，请完成帐户激活！</h6>
    <h6 class="margin_lr_40"> &nbsp;&nbsp; <span id="accMsg" style="color: red"><s:if test="msg!=null">${msg}</s:if></span></h6>
    <div class="hr_10"> &nbsp; </div>
    <div class="fl" style="padding-top:20px;padding-left:60px;padding-right:20px;padding-bottom:60px;"><img src="/images/activate_ico.jpg"/></div>
    <div class="box_5 margin_lr_40" style="background:#f9f9f7;">
			<h6>中国资金网已向您的注册邮箱${email}发送了一封验证激活邮件，为了您的帐号安全，请对帐户进行激活验证！</h6>
			<h6>您可以通过以下两种方式完成激活验证：</h6>			
			<h6>1：直接点击邮件中的链接，完成帐号激活。</h6>
			<h6>2：在下方输入邮件中的验证码，完成帐号激活。</h6>			
			<br/>
		      <h6>
		      <form id="actForm" action="/Account!activate.act" method="post">
		<h6 style="width:600px;">输入激活码：<input id="Verification_code" name="activeCode" type=text value="" class="input-text" style="width:90px;"/>
		            <input type="button" onfocus="this.blur()" onclick="verCode();" class="but_gray" style="width:98px; margin-left:30px" value="确认提交" />&nbsp; &nbsp; <font id="nullmsg"  style="display: none; color: red;font-size: 12px;">请输入验证码</font></h6>
		            </form>
		      </dd>
		    </div>
		    <div class="hr_10"> &nbsp; </div>
		    <p class="notice margin_lr_40" style="font-size:14px;"><strong>收不到邮件？</strong><br />
		    可能您的激活邮件还在发送过程中，如果您在5分钟后还没有收到邮件，您可以通过以下几步来重新获取激活邮件：<br />
		1. 检查邮箱的垃圾邮件目录，并将中国资金网 noreply@zj198.com 加入白名单。<br />
		2. 点击 <!-- <a class="red"; href="javascript:recoveryInfo();"><strong>重新发送 </strong></a>激活邮件 您也可以点此 --> <a class="red" href="javascript:vershow();"><strong>更改邮箱 </strong></a>，中国资金网将会将激活邮件发送到该邮箱中。<br />
		3. 如您还有问题无法解决请拨打客服热线400-8890-198，我们的工作人员会帮您解决相关问题。</p>
  </div>
</div>
  <!--弹出框内容修改密码页面-->
<div id="pop_email" style="display:none;" title="更改注册邮箱">
    <div class="user_login01">
      <div class="clear"> &nbsp; </div>
      <div class="user_login01_content">
        <div class="on">
         <table>
         	<tr><td><h6> &nbsp;&nbsp; <span id="message" style="color: red"></span></h6></td></tr>
              <tr><td><h6>请填写您要更改的邮箱地址</h6> </td></tr>
              <tr><td><h6>邮箱地址：</h6><input type="text" onblur="check_email()" id="email" size="30" value=""/>
              <span id="email_error" class="txt-info">邮箱用于激活用户、找回密码等。</span>
              </td></tr>
              <tr><td><h6>确认地址：</h6><input id="remail" onblur="check_remail()" type="text" class="input-text" size="30"/>
              	<span id="remail_error" class="txt-info">请再次输入邮箱地址。</span>
              </td></tr>
              <tr><td><h6>验证码：</h6><input id="verifycode" value="" type="text" class="input-text" style="width:90px;" /><img src="/Captcha.act" title="点击更换" onclick="this.src='/Captcha.act?d='+Math.random();" /></td></tr>
              <tr><td><h6>&nbsp;</h6><input type="button" onclick="recoveryInfo();" class="but_gray" style="width:120px;" value="确认更改并发送" /></td></tr>
            </table>
        </div>
	  </div>
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<jsp:include page="/public/bottom.jsp" />
</body>
</html>