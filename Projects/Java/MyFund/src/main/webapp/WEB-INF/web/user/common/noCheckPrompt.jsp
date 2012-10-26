<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>未审核用户</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript">
	function tiaoz(){
		window.location.href = '/user/Profile!edit.act?companyMark=2'
	}
</script>
</head>

<body>
<!--头部2-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10">&nbsp;</div>
<!--主体部分开始-->
<div class="container_950">	
	<div class="box_4 txt_content ">
          <div class="fl" style="margin:0px 20px 0px 0px;"><img src="/images/wrong_ico.png"/></div>
          <div style="margin:0px 0px 20px 0px;">  		
		  <h5>对不起，你的帐户尚未通过审核，无法执行该操作 ! 请您完善您的详细信息</h5>
		  <input type="button" onclick="tiaoz()" value="完善信息" Class="but_gray"></div>
	</div>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
