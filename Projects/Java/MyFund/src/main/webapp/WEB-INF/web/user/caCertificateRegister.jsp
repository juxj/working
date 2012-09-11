<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>注册页面-中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/ca.css" type="text/css" media="screen, projection" />
</head>
<body>
<!--注册页头部-->
<div class="header user_header reg_header">
<jsp:include page="/public/head3.jsp" /></jsp:include>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_960">
  <div class="box_948"> <span class="yourposition">请设置您的CA安全证书</span>
    <div class="hr_10"> &nbsp; </div>
    <h6 class="red margin_lr_40">尊敬的xxx，感谢您注册中国资金网！</h6>
    <div class="hr_10"> &nbsp; </div>
    <p class="margin_lr_40">为了您的资金以及企业信息的安全，中国资金网与上海数字证书认证中心（上海CA）合作，支持该机构发行的数字证书<br />
      您可用以上海CA颁发的数字证书登录中国资金网，升级为中国资金网证书会员，享受更多安全、便捷服务。</p>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="ca_ico red box_4 margin_lr_40"><a href="/">下载驱动程序及软件</a><br />
      <a  href="/">数字证书使用说明</a></div>
    <div class="hr_10"> &nbsp; </div>
    <p class="notice margin_lr_40" style="font-size:14px;">请下载并安装相应驱动，然后将证书连接电脑后点击 <a class="red" href="/">立即关联</a></p>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="center" style="width:305px;">
      <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="立即关联" />
      <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:90px;" value="跳过" />
    </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>