<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>后台管理</title>	
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="hld">
		<div class="wrapper">		<!-- wrapper begins -->
			<div class="block small center login">
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>登录</h2>
				</div>		<!-- .block_head ends -->
				<div class="block_content">
					<s:if test="msg!=null">
					<div id="msg" class="message info" style="display: block; "><p>${msg}</p><span class="close" onclick="clearMsg();"></span></div>
					</s:if>
					<form action="/admin/Account!login.act" method="post">
						<p><label>用户名:</label> <input type="text" class="text" name="username" value=""/>
						</p>
						<p><label>密 码:</label> <input type="password" class="text" name="password" value=""/>
						</p>
						<p><label>验证码:</label><br/><input type="text" class="text" value="" style="width:240px; margin-bottom:30px; overflow:hidden;" name="verifycode"/> <img src="/Captcha.act" onclick="this.src='/Captcha.act?d='+Math.random();"/>
						</p>
						<p><input type="submit" class="submit" value="登录" />
						</p>
					</form>
				</div>		<!-- .block_content ends -->
				<div class="bendl"></div>
				<div class="bendr"></div>
			</div>
		</div>						<!-- wrapper ends -->
	</div>		<!-- #hld ends -->
    </body></html>