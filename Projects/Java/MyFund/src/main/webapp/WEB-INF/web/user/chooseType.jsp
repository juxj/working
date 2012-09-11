<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>请选择您的用户类型_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/reg.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript">
$(document).ready(function() {
	$("dd").hover(function() {
		$(this).addClass("inputFocus");
	}, function() {
		$(this).removeClass("inputFocus");
	});
	$(".dl-all dl dd").click(function(){
		var end = $(this).addClass("selected").siblings().removeClass("selected").end();
		end.find(":radio").attr("checked", true);
		end.siblings().find(":radio").attr("checked", false);
		$(".dl-all dl dd").removeClass("selected");
		$(this).addClass("selected");
	});
});
</script>
<style type="text/css">
.input-text { height:28px; line-height:28px; padding:0 3px; font-size:14px; background:url(/images/input_bg.png) 0 0 no-repeat; border:1px solid #d3d3d3; vertical-align:top }
.inputFocus { background:#eee; }
.selected { background:#ddd; }
</style>
</head>
<body>
<!--头部2--> 
<div class="header user_header reg_header">
<jsp:include page="/public/head3.jsp"></jsp:include>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_960">
  <div class="box_4" style="width:948px; margin:0 5px;"> <span class="yourposition">请选择您的用户类型</span>
    <div class="select_user_type">
      <h6 class="red">尊敬的 ${session._user.realname}，感谢您注册中国资金网！</h6>
      <p style="font-size:14px;">为了更好地使用中国资金网为您提供的各种功能服务，请您选择您的用户类型。</p>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <form action="/user/UserType.act" method="post">
        <div class="box_4">
          <div class="dl-all">
            <div class="hr_10"> &nbsp; </div>
            <dl>
              <dt class="user-qy">企业</dt>
              <s:iterator value="#request.userTypeMap[1]" id="ut">
				<dd><input type="radio" name="userType" value="${ut.id}" />${ut.name }</dd>
              </s:iterator>
            </dl>
            <dl>
              <dt class="user-jr">金融机构</dt>
              <s:iterator value="#request.userTypeMap[2]" id="ut">
				<dd><input type="radio" name="userType" value="${ut.id}" />${ut.name }</dd>
              </s:iterator>
              <s:iterator value="#request.userTypeMap[3]" id="ut">
				<dd><input type="radio" name="userType" value="${ut.id}" />${ut.name }</dd>
              </s:iterator>
            </dl>
            <dl>
              <dt class="user-fw">服务机构</dt>
              <s:iterator value="#request.userTypeMap[4]" id="ut">
				<dd><input type="radio" name="userType" value="${ut.id}" />${ut.name }</dd>
              </s:iterator>
            </dl>
            <dl>
              <dt class="user-gr">个人用户</dt>
              <s:iterator value="#request.userTypeMap[5]" id="ut">
				<dd><input type="radio" name="userType" value="${ut.id}" />${ut.name }</dd>
              </s:iterator>
            </dl>
            <div class="hr_10"> &nbsp; </div>
          </div>
          <div class="hr_10"> &nbsp; </div>
        </div>
        <div class="hr_10"> &nbsp; </div>
        <div class="hr_10"> &nbsp; </div>
        <div class="next-btn">
          <input id=u4 type="button" onfocus=this.blur() onclick="this.form.submit()" class="but_gray" style="width:200px;" value="下一步" />
        </div>
      </form>
    </div>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>