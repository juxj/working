<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>完善信息（银行金融机构）用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script type="text/javascript">
$(document).ready(function(){
	if('${session._user.auditstatus}' != '2'){
		$("#status").show();
	}
});
</script>
</head>
<body>
<!--头部-->
<div class="header user_header">
	<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="M_menu">
&nbsp;&nbsp;账户管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;详细信息
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_950 box_4">
	<div class="P_title">详细信息</div>
	<div class="line">
		<h6><img src="/images/icon01.jpg" alt="" class="P_connect_img"/>当前账户状态:
		<s:if test="#session._user.auditstatus==0"><span class="no_ok">未审核</span></s:if>
		<s:elseif test="#session._user.auditstatus==1"><span class="no_ok">待审核</span></s:elseif>
		<s:elseif test="#session._user.auditstatus==2"><span class="no_ok">已审核</span></s:elseif>
		&nbsp;&nbsp;&nbsp;&nbsp;
		您的账户类型：银行</h6>
	</div>
	<div id="status" class="P_connect" style="display: none;">
		&nbsp;&nbsp;&nbsp;&nbsp;尊敬的 ${session._user.realname} <s:if test="#session._user.gender==1">先生：</s:if><s:else>女士：</s:else>&nbsp;感谢您注册中国资金网，您需要完善详细信息后才能使用中国资金网用户中心的各项功能。<br />
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="margin-right:15px;" class="view_detail">
		<a href="/user/UserAction!next.act" style="float:none;">以后再说</a></span>
		<br />
		&nbsp;
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<!-- tab -->
<div class="box_4 center" style="width:950px;">
      <div class="news_menu" style="height: 50px;">
        <dl style="margin-left: 30px;">
          <dd><h6>机构详细信息</h6></dd>
          <dd>
          <s:if test="usrBank==null || usrBank.completerate<60">
				<div class="graph_red"><span style="width:${usrBank.completerate+0 }%;"></span></div>
			</s:if><s:elseif test="60<=usrBank.completerate && usrBank.completerate<100">
				<div class="graph_orange"><span style="width:${usrBank.completerate}%;"></span></div>
			</s:elseif><s:else>
				<div class="graph_green"><span style="width:${usrBank.completerate}%;"></span></div>
			</s:else>
          </dd>
        </dl>
      </div>
    <form class="box_form">
      <table border="0" cellpadding="0" cellspacing="0" class="special_psfs_tb">
      <s:if test="msg!=null">
	    <tr>
           <td colspan="4"><div class="notification success png_bg"><div>${msg }</div></div></td>
         </tr>
	    </s:if>
        <tr>
          <td class="a_right">银行名称：</td>
          <td colspan="3"><s:if test="#session._user.auditstatus!=0">${usrBank.detailname }</s:if><s:else>
          	${profileMap['bankName'] } ${usrBank.detailname }
          </s:else></td>
        </tr>
        <tr>
          <td class="a_right">联系人姓名：</td>
          <td colspan="3">${usrBank.linkname} <s:if test="usrBank.linkgenderr==1">先生</s:if><s:elseif test="usrBank.linkgenderr==0">女士</s:elseif></td>
        </tr>
        <tr>
          <td class="a_right">联系地址：</td>
          <td colspan="3">${profileMap['address'] }</td>
        </tr>
        <tr>
          <td class="a_right">详细地址：</td>
          <td colspan="3">${usrBank.address }</td>
        </tr>
        <tr>
          <td class="a_right">邮政编码：</td>
          <td colspan="3">${usrBank.postcode }</td>
        </tr>
        <tr>
          <td class="a_right">联系人邮箱：</td>
          <td class="a_left">${usrBank.linkemail }</td>
          <td class="a_right">联系人电话：</td>
          <td class="a_left">${usrBank.linktelephone }</td>
        </tr>
        <tr>
          <td class="a_right">所属部门：</td>
          <td>${usrBank.department }</td>
          <td class="a_right">职位：</td>
          <td>${usrBank.position }</td>
        </tr>
        <tr>
          <td class="a_right">服务介绍：</td>
          <td colspan="3" width="440px;">${usrBank.remarks }</td>
        </tr>
        <s:if test="#session._user.auditstatus != 2">
        <tr>
           <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;"><input type="button" onfocus="this.blur()" class="but_gray" style="width:200px;" value="编辑信息" onclick="javascript:window.location.href='/user/Profile!edit.act'"/></td>
         </tr>
         </s:if>
      </table>
    </form>
    <div class="hr_10"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>