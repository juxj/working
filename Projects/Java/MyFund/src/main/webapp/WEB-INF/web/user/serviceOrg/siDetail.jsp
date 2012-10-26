<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>理财服务详情页_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />	
<script type="text/javascript" src="/script/jquery.ui.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.slider.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script type="text/javascript" src="/script/register.js" > </script>
<script type="text/javascript" src="/script/public.js" > </script>
<script type="text/javascript">

	function registertab(){
		$("#pop_login").dialog('close');
		$("#pop_register").dialog({width:500,modal:true});
	}
	function userLogin(type){
		if(!$('#login_username').val() || !$('#login_password').val() || !$('#Verification_code').val()){
			alert("请输入全部的用户名、密码和验证码。");
			return false;
		}
		$.post("/Account!RapidLogin.act",{username:$('#login_username').val(),password:$('#login_password').val(),verifycode:$('#Verification_code').val(),loginType:type},
			function(a){
				if(a=='success'){
					$("#pop_login").dialog( "close" );
					window.location.reload();
				} else {
					$("#vcode").attr("src", '/Captcha.act?d='+Math.random());
					alert("用户身份验证出错，请检查用户名与密码！");
				}
		});
	}
	
	function reloadPageHeader(){
		url ="/public/head1.jsp";
		$("#divPageHeader").load(url);
	}
	
	function apply() {
		if('${session._user}'==''){
			$("#pop_login").dialog({width:340,modal: true});
		} else {
			var isValid = true;
			
			if('${session._user.activetype}'=='0') {
				alert("您还没有激活帐户！");
				isValid = false;
			} else {
				if('${session._user.type}'=='0') {
					alert("您还没有选择用户类型！");
					isValid = false;
				} 
			}
			
			if (isValid) {
				checkUser();
			}
		}
	}
	
	function logintab(){
		$("#pop_register").dialog('close');
		$("#pop_login").dialog({width:340,modal:true});
	}
	
	function saveApply(){
		var itemId = $('#itemId').val();
		var requirements = $('#requirements').val();
		var url = "/service/serviceOrder!applyService.act";
		$.post(url, {itemId:itemId, requirements:requirements}, function(data, status, response){
			result = jQuery.parseJSON(response.responseText);
			if (result.info != null) { 
				$("#divMessage").html(result.info);
				$("#divMessage").show();
			}
		})
	}
	
	function checkUser(){
		url = "/service/serviceOrder!apply.act";
		$.ajax({
			url: url,
			type: 'post',
			success: function(data, status, response) {
				if (status) {
					msg = response.responseText;
					msg = jQuery.parseJSON(msg);
					if (msg.status=='failure') {
						$( "#dialog:ui-dialog" ).dialog( "destroy" );
						$( "#dialog-failure" ).dialog({
							modal: true,
							buttons: {
								确定: function() {
									$( this ).dialog( "close" );
								}
							}
						});
					} else {
						$("#frmCheckUser").hide();
						$("#divRequirementsForm").show();
					}
				}
			}
		});
	}
	
	
function quickRegist(){
	checkAll();
	if(checkformresult==1){
		alert("请输入全部注册需要的信息。");
		checkformresult=0;
		return;
	}
	var userType = '${loan.busiRunningType}';
	if(userType == ''){
		userType = '1';
	}
	var gendervalue = $("input[name='gender']:checked").val();
	var param = {
		username:$('#username').val(),
		password:$('#pass').val(),
		email:$('#email').val(),
		mobile:$('#mobile').val(),
		realname:$('#fullname').val(),
		gender:gendervalue,
		type:userType
	};
	$.post("/Register!rapidRegister.act",param,function(a){
		if(a=='success'){
			window.location.reload();
		}else{
			alert(a);
		}
	});
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
</style>
</head>
<body>
<!--头部开始-->
<div id="divPageHeader" class="header index_header">
<jsp:include page="/public/head1.jsp" />
<div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--融资服务详情页面-->
  <div class="M_menu">
  	融资服务&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;服务详情
  </div>
  <div class="hr_10"> &nbsp; </div> 
  <div class="M_menu" id="divMessage" style="display:none"></div>
  <div class="M_out">
  	<div class="M_out_L">
		<input type="hidden" id="prdServiceItemId" value="${prdServiceItem.id}"/>
		<!--表格部分开始-->
        <table border="0" cellspacing="0" cellpadding="0" class="Search_table">
		  <tr >
		    <td colspan="4" class="Search_t_title red">${prdServiceItem.title}</td>
		  </tr>        
          <tr>
            <td class="Search_t_connect">服务类型</td>
            <td class="Search_t_connect01">${prdServiceItem.typeName}</td>
            <td class="Search_t_connect">服务方</td>
            <td class="Search_t_connect01">${prdServiceItem.companyName}</td>
          </tr>
          <tr>
            <td class="Search_t_connect">面向区域</td>
            <td class="Search_t_connect01">${prdServiceItem.regionName}</td>
            <td class="Search_t_connect">服务对象</td>
            <td class="Search_t_connect01">${prdServiceItem.targetName}</td>
          </tr>
          <tr>
            <td colspan="4" class="Search_t_title" align="center" >
		       <div align="center" id="divRequirementsForm" style="display:none">
		        	<form id="frmApplyService" action="/service/serviceOrder!applyService.act" method="post">
		        		<input type="hidden" id="itemId" name="itemId" value="${prdServiceItem.id }"/>
		        		<textarea id="requiremnts" rows="8" cols="80" name="requirements"></textarea><br/>&nbsp;
		        		<input id="btnApply" type="button" class="but_gray" onclick="saveApply();" value="保存"/>
		        		<br/>&nbsp;
		        	</form>
	        	</div>
	        	<div id="frmCheckUser" align="center">
		        	<p></p>
		        	<form id="frmApplyService" action="/service/serviceCenter!apply.act" method="post">
		        		<input type="hidden" id="itemId" name="itemId" value="${prdServiceItem.id}"/>
		        		<input id="btnApply" type="button" class="btnsub bred" onclick="apply();" value="立即申请"/><br/>
		        	</form>
	       	 	</div>                      
            </td>
          </tr>
        </table>
        <!--表格部分结束-->
        <!--tab开始-->
        <div class="hr_10"> &nbsp; </div>
        <div class="box_4">
              <div class="menu_red" style="font-weight:bolder; line-height: 30px; border-bottom:1px solid #d7d7d7; background-color:#f9f9f7; color:#000; padding-left: 15px;">服务介绍 </div>
              <div class="txt_content">
                ${prdServiceItem.serviceInfo}
              </div>
            </div>
       <!--tab结束-->		

    </div>
  	<div class="M_out_right_text fr" style="display:none">
        	<p class="m_img"><img src="/images/member_logo_red.jpg" style="float:left;" /><span class="m_name">${prdServiceItem.contactName}</span><br  />
        	<span class="m_zhiw">${prdServiceItem.position }</span></p>
            <p class="m_bank">${prdServiceItem.companyName}</p>
          <div class="contact">
            <input  type="button" value="联系方式" class="but_gray" name="" style="width:100px;" />
          </div>             
    </div>
    	<div class="M_out_right_text fr " >
	    	<!--客服图片-->
			<div><a href="#"><img src="/images/loan_service_tel.jpg" /></a></div>
	    	<!--客服图片-->
	    	<div style="background: #f4f4f4; font-weight: bolder; color: #333; line-height:30px; padding-left:15px; border-top: 1px solid #d8d8d8; border-right:1px solid #d8d8d8;  border-left:1px solid #d8d8d8;">在线客服 &nbsp;  &nbsp;(工作时间：9:00~17:00)</div>
	        <div class="box_5" >
	        	<table>
	        		<tr>
	        			<td><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1433010529&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:1433010529:42" alt="点击这里给我发消息" title="点击这里给我发消息"></a></td>
	        			<td style="line-height:25px; vertical-align: middle;">&nbsp;&nbsp;客户经理  王先生</td>
	        		</tr>
	        		<tr>
	        			<td ><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2458068476&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:2458068476:42" alt="点击这里给我发消息" title="点击这里给我发消息"></a></td>
	        			<td style="height:30px; vertical-align: middle;">&nbsp;&nbsp;客户经理  韩先生</td>
	        		</tr>    			        		
	        		<tr>
	        			<td>
	        			<a target="_blank" href="http://amos1.taobao.com/msg.aw?site=cntaobao&charset=utf-8&v=2&uid=zhongguozijinwang&s=1" ><img border="0" src="http://amos1.taobao.com/online.ww?v=2&uid=zhongguozijinwang&s=1" alt="Taobao.com ID:victorbsds" /></a> 
	        			<td style="height:30px; vertical-align: middle;">&nbsp;&nbsp;客户经理  董小姐</td>
	        		</tr>       			        		
	        	</table>
	        </div>
	        <div class="hr_10"> &nbsp; </div>	        
    <div class="M_out_right_text fr " >
    	<h1>热门服务</h1>
        <div class="box_3">
          <ul class="new_li">
            <s:iterator id="item" value="serviceItemList" status="s">
	        	<li class="new2_li_li">
	        		<a href="/service/serviceItem!showSinItemDetail.act?itemId=${item.id}">${item.typeName} | ${item.title}</a>
	        	</li>
	        </s:iterator>
          </ul>
        </div>
	        <div class="hr_10"> &nbsp; </div>
	        <div class="M_out_right_text fr">
			  	<div class="M_out_right">
			    	<img src="/images/nsbank.png"/>
			    </div>	    	           
       </div> 
    </div>
  </div>
 </div>
  <!--融资服务详情页面结束--> 
  
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<jsp:include page="/public/bottom.jsp" />
<div id="dialog-requirements" style="display: none;" title="服务需求描述">
	<form id="frmApplyPopup">
		<textarea id="taRequirements" rows="7" cols="10"></textarea>
	</form>
</div>

<div id="dialog-failure" style="display: none;" title="提示">
	对不起，您的用户类型不支持此操作！<a href="">了解用户类型权限说明</a>
</div>

<div id="pop_login" style="display:none;" title="用户登录">
    <div class="user_login01">
      <div class="clear"> &nbsp; </div>
      <div class="user_login01_content">
        <div class="on">
            <dl>
              <dd><h6>用户名：</h6><input type="text" name="login_username" id="login_username" class="input-text" size="36" /></dd>
              <dd><h6>密码：</h6><input id="login_password" name="login_password" type="password" class="input-text" size="36"/></dd>
              <dd><h6>验证码：</h6><input id="Verification_code" value="" name="verifycode" type="text" class="input-text" style="float: left;"/>
              <img id="vcode" src="/Captcha.act" title="点击更换" onclick="this.src='/Captcha.act?d='+Math.random();" /></dd>
              <dd><h6>&nbsp;</h6><input type="button" onclick="userLogin(1)" class="but_gray" style="width:90px;" value="登录" /><span class="txt_info red"><a href="/Recovery.act" target="_blank"> 忘记密码？</a></span></dd>
			  <dd><h6>&nbsp;</h6>如果您尚未注册过，<span class="red" style="cursor:pointer;" onclick="registertab();">点此快速注册</span>。</dd>
            </dl>
        </div>
	  </div>
	</div>
</div>


<!--弹出框内容-->
<div id="pop_register" style="display:none;" title="快速注册">
	<dl>
		<dd>
			<h6><font color="#97181d">*</font>用户名</h6>
			<input type="text" name="username" onblur="check_username()" id="username" size="30" /><span id="username_error" class="txt-info">6-18个字符，可使用字母、数字、下划线。</span>
		</dd>
		<dd>
			<h6><font color="#97181d">*</font>密码</h6>
			<input id="pass" onblur="check_pass()" type="password" size="30" /><span id="pass_error" class="txt-info">6~16个字符，区分大小写。</span>
		</dd>
		<dd>
			<h6><font color="#97181d">*</font>确认密码</h6>
			<input id="rpass" onblur="check_rpass()" type="password" size="30" /><span id="rpass_error" class="txt-info">请再次输入密码。</span>
		</dd>
		<dd>
			<h6><font color="#97181d">*</font>姓名</h6>
			<input type="text" onblur="check_fullname()" id="fullname" size="30" /><span id="fullname_error" class="txt-info">请输入真实姓名。</span>
			<input type="radio" name="gender" value="1" checked="checked" /><label for="radio1">先生</label>
			<input type="radio" name="gender" value="0" /><label for="radio2">女士</label>
		</dd>
		<dd>
			<h6><font color="#97181d">*</font>邮箱</h6>
			<input type="text" onblur="check_email()" id="email" size="30"/><span id="email_error" class="txt-info">邮箱用于激活用户、找回密码等。</span>
		</dd>
		<dd>
			<h6><font color="#97181d">*</font>手机号</h6>
			<input type="text" onblur="check_mobile()" id="mobile" size="30"/><span id="mobile_error" class="txt-info">常用的手机号码，用于接受通知和验证等。</span>
		</dd>
	</dl>
	<div class="hr_10"> &nbsp; </div>
	<div class="center">
	  <input type="button" onclick="quickRegist()" class="but_gray" style="width:100px;" value="注册" />
	</div>
	<div class="center">
	  如果您已有帐号，<span class="red" style="cursor:pointer;" onclick="logintab();">点此登录</span>。
	</div>
	<div class="hr_10"> &nbsp; </div>
</div>
</body>
</html>
