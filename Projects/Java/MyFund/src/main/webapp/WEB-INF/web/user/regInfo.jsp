<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>账户管理——注册信息管理</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public2.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="/script/jquery.ui.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script type="text/javascript" src="/script/register.js" > </script>
<script language="javascript">
//通用选项卡
$(document).ready(function() {
    $('.xxkbox:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu ul li');
    sb.hover(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkbox').eq(nb).show().siblings().hide();
    });
});
function rpshow(){
	if('${session._user}'!=''){
		$("#oldPwd").attr("value","");
		$("#pass").attr("value","");
		$("#rpass").attr("value","");
		$("#pwdmsg").html("");
		$("#pop_login").dialog({width:540,modal: true});
	}else{
		window.location.href="/Account.act";
	}
}
function old_pass(){
	var oldpass_error = $("#oldpass_error");
	if($("#oldPwd").val()!=null && $("#oldPwd").val()!=""){
		oldpass_error.html("");
	}else{
		oldpass_error.addClass("txt-err");
		oldpass_error.html("请输入原密码。");
		checkformresult=1;
	}
}
function recoveryPwd(){
	checkformresult=0;
	check_pass();
	check_rpass();
	old_pass();
	if(checkformresult==0){
		$.post("/user/Profile!editPwd.act",{oldPwd:$('#oldPwd').val(),password:$('#pass').val()},function(a){
			if(a=='success'){
				$("#pop_login").dialog('close');
				$("#ps").html("密码修改成功");
			}else{
				$("#pwdmsg").html(a);
			}
		});
	}else{
		check_pass();check_rpass();old_pass();
	}
}
function regshow(){
	$("#pop_register").dialog({width:500,
		modal:true,
   		close: function(event, ui) { 
				window.location.href="/user/regInfo.act";
	   		}
		});
}
function recoveryReg(){
	check_fullname();
	check_mobile();
	check_email();
	if(checkformresult == 1){
		$("#regmsg").html("请正确填写注册信息。");
		checkformresult=0;
	}else{
		$("#regmsg").html("");
		var gendervalue = $("input[name='gender']:checked").val();
		var param = {
			email:$('#email').val(),
			mobile:$('#mobile').val(),
			realname:$('#fullname').val(),
			gender:gendervalue
		};
		if(confirm("如果您修改了注册邮箱或注册手机号码，需要重新验证。")){
			$.post("/EditReg.act",param,function(a){
				if(a=='success'){
					alert("注册信息成功");
					window.location.href="/user/regInfo.act";
					//$("#regmsg").html("注册信息修改成功");
				}else{
					$("#regmsg").html(a);
				}
			});
		}
	}
}
function vershow(){
	$("#pop_verCode").dialog({width:500,
	modal:true,
  		close: function(event, ui) { 
			window.location.href="/user/regInfo.act";
   		}
	});
}
var settime=60;
  var i;
  var showthis;
function update(num) {
   if(num==settime) {
	  $("#sendmobile").attr('disabled',false);
	  $("#sendmobile").attr("value","点击发送验证码（1分钟内只能发送一次）");
	 }else {
	  showthis=settime-num;
	  $("#sendmobile").attr("value","重新发送("+showthis+")");
	 }
}
function sendMobileMsg(){
  $("#sendmobile").attr('disabled',true);
  for(i=1;i<=settime;i++)   {
     setTimeout("update("+i+")",i*1000);
  }
	$.post("/Account!sendMoblie.act",function(a){
		if(a!='success'){
			$("#mobileMsg").html(a);
		}else{
			alert("手机验证码已发送");
			//$("#mobileMsg").html(a);
		}
	});
}
function verMobile(){
	$.post("/user/Profile!validMoblie.act",{verifycode:$('#verifycode').val()},function(a){
		if(a=='success'){
			$("#mobileMsg").html("手机验证成功");
			alert("手机验证成功");
			window.location.href="/user/regInfo.act";
		}else{
			$("#mobileMsg").html(a);
		}
	});
}
function upChange(){
	$("#pop_userimg").dialog({width:500,modal:true});
}
function uploadImg(){
	if($('#up_img').val()=='' || $('#up_img').val()==null){
    		$('#message').html("请选择上传图片！");
    		return false;
	}
	var uploadfile = $('#up_img').val();
	if (uploadfile != "") {
		var types = [ "png", "jpg", "jpeg","gif" ];
		var ext = uploadfile.substring(uploadfile.length - 3).toLowerCase();
		var sing = false;
		for ( var i = 0; i < types.length; i++) {
			if (ext == types[i]) {
				sing = true;
			}
		}
		if (!sing) {
			$('#message').html("您选择的图片不符合格式要求!");
			return false;
		}
	}
	$('#message').html("正在上传图片,请稍侯...");
	$('#imgform').submit();
}
</script>
<style>
	#demo-frame > div.demo { padding: 10px !important; };
	#pop_register .input-text { float:left; width:192px; height:20px; line-height:20px; font-size:16px; background:url(/images/input_bg.png) 0 0 no-repeat; border:1px solid #d3d3d3; padding-left:5px;  font-family:"微软雅黑", "宋体", Helvetica Neue, Helvetica, Arial, sans-serif;  font-size:12px;}
	#pop_register .input-focus { background:#FFFFCC; border:1px solid #97181d; }
	#pop_register .txt-info { color:#aaa; padding-left:15px; font-size:12px; }
	#pop_register select {float: left; margin:5px 5px 0 0; height: 22px; line-height: 14px }
	#pop_register input { margin:5px; line-height: 14px}
	#pop_register label{margin-top:12px;}
	#pop_register .txt-err { color:#97181d;padding-left:15px;}
	#t_border{width:100%; border-top: 1px solid #ddd; border-right: 1px solid #ddd;}
	#t_border td{border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; padding:8px;}
</style>
</head>

<body>
<!--头部-->
<div class="header user_header">
  <jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="M_menu">
&nbsp;&nbsp;账户管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;注册信息
</div>
<div class="hr_10"> &nbsp; </div> 
<!--改动的部分-->
	<div class="container_950 box_4">
		<div class="P_title" style="border-bottom:5px solid #003961;">注册信息</div>
	</div>
	<div class="hr_10"> &nbsp; </div>
    <div class="box_4 center container_950">
	    <div class="hr_20"> &nbsp; </div>
	 		<div class="fl" style="width:150px; text-align: right; padding-right:10px; height:100px; font-size:14px;">用户头像：</div>
	 			<div class="fl" style="width:150px;"><img title="点击更换" onclick="upChange();" src="<s:if test="#session._user.avatar!=null">${session._user.avatar}</s:if><s:else>/images/add_head_img.png</s:else>" width="80px;" height="80px;"/></div>
			<div class="fl" style="width:60%; height:100px;"><div style="display:none;"></div></div>
	              
	   			<div class="fl" style="width:150px; text-align: right; padding-right:10px; height:30px; vertical-align:middle; font-size:14px;">用户名称：</div>
	              <div class="fl" style="width:150px; height:30px; font-size:14px;">${usrUser.username }</div>
	 	  			<div class="fl" style="width:60%; height:30px">&nbsp;</div>
	
	              <div class="fl" style="width:150px; text-align: right; padding-right:10px; height:30px; vertical-align:middle; font-size:14px;">姓名：</div>
	              <div class="fl" style="width:150px; height:30px; font-size:14px;">${usrUser.realname } <s:if test="usrUser.gender==1">先生</s:if><s:else>女士</s:else></div>
	    	<div class="fl" style="width:60%; height:30px">&nbsp;</div>
	
	              <div class="fl" style="width:150px; text-align: right; padding-right:10px; height:30px; vertical-align:middle; font-size:14px;">手机号码：</div>
	              <div class="fl" style="width:150px; height:30px; font-size:14px;">${usrUser.mobile }</div>
	    	<div class="fl red" style="width:60%; height:30px; font-size:14px;"><s:if test="#session._user.activetype ==0 || #session._user.activetype ==1"><input  name="upload_img" value="验证" type="button" onclick="vershow();" class="bgray"/></s:if><s:else>已验证</s:else>&nbsp;</div>
	
	              <div class="fl" style="width:150px; text-align: right; padding-right:10px; height:30px; vertical-align:middle; font-size:14px;">注册邮箱：</div>
	              <div class="fl" style="width:150px; height:30px; font-size:14px;">${usrUser.email }</div>
	    	<div class="fl red" style="width:60%; height:30px; font-size:14px;"><s:if test="#session._user.activetype==0 || #session._user.activetype==2">&nbsp;</s:if><s:else>已验证</s:else>&nbsp;</div>
	    <div class="hr_10"> &nbsp; </div>
	    <div class="hr_10"> &nbsp; </div>
		<div align="center">
			<input name="upload_img" value="修改注册信息" type="button" onclick="regshow();" class="btnsub blue1"/>&nbsp;&nbsp;
			<input name="upload_img" value="修改登录密码" type="button" onclick="rpshow();"  class="btnsub blue1"/>
		</div>
		<div class="hr_20"> &nbsp; </div>	    
	</div>
	<!--box04-->
    <div class="hr_10"> &nbsp; </div>
<!--弹出框内容修改密码页面-->
<div id="pop_login" style="display:none;" title="修改密码">
    <div class="user_login01">
      <div class="clear"> &nbsp; </div>
      <div class="user_login01_content">
        <div class="on">
          <table>
          	  <tr><td><h6> &nbsp;&nbsp; <span id="pwdmsg" style="color: red"></span></h6></td></tr>
              <tr><td><h6>旧密码：</h6><input id="oldPwd" type="password" onblur="old_pass();" class="input-text" size="40" />
              	<span id="oldpass_error" class="txt-info">请输入原密码。</span>
              </td></tr>
              <tr><td><h6>新密码：</h6><input id="pass" onblur="check_pass();" type="password" class="input-text" size="40"/>
              	<span id="pass_error" class="txt-info">6~16个字符，区分大小写。</span>
              </td></tr>
              <tr><td><h6>重复密码：</h6><input id="rpass" onblur="check_rpass();" type="password" class="input-text" size="40"/>
              	<span id="rpass_error" class="txt-info">请再次输入密码。</span>
              </td></tr>
			  <tr><td><h6>提示：为了您的帐号安全，中国资金网建议您每隔一段时间就更改一次密码</h6></td></tr>
              <tr><td><h6>&nbsp;</h6><input type="button" onclick="javascript:recoveryPwd();" class="btnsub blue1" style="width:90px;" value="确定" /></td></tr>
              <tr><td>&nbsp; </td></tr>
           </table>
        </div>
	  </div>
	</div>
</div>
<!--弹出框内容修改注册信息-->
<div id="pop_register" style="display:none;" title="修改注册信息">
  <table>
    <tr><td><h6> &nbsp;&nbsp; <span id="regmsg" style="color: red"></span></h6></td></tr>
	<tr><td>
		<h6><font color="#97181d">*</font>用户名</h6>
		<input type="text" value="${usrUser.username }" size="30" disabled="disabled"/> <span class="txt-info">用户名不可修改</span>
	</td></tr>
	<tr><td>
		<h6><font color="#97181d">*</font>姓名</h6>
		<input type="text" onblur="check_fullname()" id="fullname" size="30" value="${usrUser.realname }"/>
		<s:if test="usrUser.gender==1">
			<input type="radio" name="gender" value="1" checked="checked" /><label for="radio1">先生</label>
			<input type="radio" name="gender" value="0" /><label for="radio2">女士</label>
		</s:if><s:else>
			<input type="radio" name="gender" value="1"/><label for="radio1">先生</label>
			<input type="radio" name="gender" value="0" checked="checked" /><label for="radio2">女士</label>
		</s:else><span id="fullname_error" class="txt-info">请输入真实姓名。</span>
	</td></tr>
	<tr><td>
		<h6><font color="#97181d">*</font>手机号</h6>
		<input type="text" onblur="check_mobile()" id="mobile" size="30" value="${usrUser.mobile }"/><span id="mobile_error" class="txt-info">常用的手机号码，用于接受通知和验证等。</span>
	</td></tr>
	<tr><td>
		<h6><font color="#97181d">*</font>邮箱</h6>
		<input type="text" onblur="check_email()" id="email" size="30" value="${usrUser.email }"/><span id="email_error" class="txt-info">邮箱用于激活用户、找回密码等。</span>
	</td></tr>
	</table>
	<div class="hr_10"> &nbsp; </div>
	<div class="center">
	  <input type="button" onclick="recoveryReg();" class="btnsub blue1" style="width:100px;" value="确定" />
	</div>
	<div class="hr_10"> &nbsp; </div>
</div>
<!--弹出框内容手机验证-->
<div id="pop_verCode" style="display:none;" title="手机验证">
    <div class="user_login01">
      <div class="clear"> &nbsp; </div>
      <div class="user_login01_content">
        <div class="on">
            <table>
              <tr><td><h6>验证码：</h6><input id="verifycode" type="text" name="verifycode" class="input-text" size="20" />
            	<input id="sendmobile" type="button" style="width:300px;" class="bgray" onclick="sendMobileMsg();" value="点击发送验证码（1分钟内只能发送一次）"/>
              </td></tr>
	    	  <tr><td><span id="mobileMsg" style="color: red">提示：验证手机可以使您用中国资金网的各项功能</span></td></tr>
              <tr><td><h6>&nbsp;</h6><input type="button" onclick="javascript:verMobile();" class="btnsub blue1" style="width:90px;" value="确定" /></td></tr>
            </table>
        </div>
	  </div>
	</div>
</div>
<!--弹出框内容上传用户头像--> 
<div id="pop_userimg" style="display:none;" title="上传图片">
  <form id="imgform" action="/user/uploadImg.act" method="post" enctype="multipart/form-data">
   <table id="t_border">
   	<tr><td><img id="useravatar" src="<s:if test="#session._user.avatar!=null">${session._user.avatar}</s:if><s:else>/images/add_head_img.png</s:else>" width="80px;" height="80px;"/></td></tr>
   	<tr><td><h6>选择图片 &nbsp;&nbsp; <span id="message" style="color: red"></span></h6></td></tr>
   	<tr><td><input id="up_img" name="upload" type="file"  size="40"/><input type="button" onclick="uploadImg();" value="确认提交"/></td></tr>
   	<tr><td></td></tr>
   	<tr><td>说明：支持png、jpg、jpeg、gif格式 单个文件大小小于200kb</td></tr>
   </table>
  </form>
</div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>