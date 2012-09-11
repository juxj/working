<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>CA证书关联验证-中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/ca.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript">
//文本框触发焦点效果
$(function() {
    $(".input-text").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
});
</script>
</head>
<body>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--CA证书关联验证成功-->
<div class="container_960">
  <div class="box_4 ca_test_right center">
    <h6 class="red">识别成功！</h6>
    <div class="hr_10"> &nbsp; </div>
    <hr width="98%" />
    <div class="hr_10"> &nbsp; </div>
    <form class="box_form" action="/index.html">
      <span class="fl">&nbsp;数字证书名称：</span><font class="red">上海CA证书</font>
      <div class="hr_10"> &nbsp; </div>
      <span class="fl">&nbsp;输入证书密码：</span>
      <input id="Verification_code" type=text value="" class="input-text" style="width:90px;" />&nbsp;
      <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="soft_keyboard"  value="" />
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="margin_lr_40">
        <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:98px;" value="确定" />
      </div>
      <div class="hr_10"> &nbsp; </div>
    </form>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--CA证书关联验证失败-->
<div class="container_960">
  <div class="box_4 ca_test_wrong center">
    <h6 class="red">识别失败！</h6>
    <div class="hr_10"> &nbsp; </div>
    <hr width="98%" />
    <div class="hr_10"> &nbsp; </div>
    <form action="/index.html">
      <span class="left_text">请确定您的数字证书已连接电脑，并且已安装完相应驱动后再重试！</span>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="margin_lr_40">
        <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:98px;" value="确定" />
      </div>
      <div class="hr_10"> &nbsp; </div>
    </form>
  </div>
</div>
</body>
</html>