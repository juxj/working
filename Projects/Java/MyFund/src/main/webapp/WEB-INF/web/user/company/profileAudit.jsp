<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>企业用户信息中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script language="javascript">
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
	&nbsp;&nbsp;账户管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;基本信息
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_950 box_4">
	<div class="P_title">详细信息</div>
	<div class="line">
	<h6><s:if test="usrUser == null || #session._user.id == usrUser.id">
		<img src="/images/icon01.jpg" alt="" class="P_connect_img"/>当前账户状态:
		<s:if test="#session._user.auditstatus==0"><span class="no_ok">未审核</span></s:if>
		<s:elseif test="#session._user.auditstatus==1"><span class="no_ok">待审核</span></s:elseif>
		<s:elseif test="#session._user.auditstatus==2"><span class="no_ok">已审核</span></s:elseif>
		&nbsp;&nbsp;&nbsp;&nbsp;
		您的账户类型：<s:if test="#session._user.type==2">生产型企业</s:if><s:elseif test="#session._user.type==3">贸易型企业</s:elseif><s:elseif test="#session._user.type==4">工贸一体型企业</s:elseif><s:elseif test="#session._user.type==5">服务型企业</s:elseif>
	</s:if></h6>
	</div>
		<div id="status" class="P_connect" style="display: none; padding-left:64px;">
			<span>尊敬的 ${session._user.realname} <s:if test="#session._user.gender==1">先生：</s:if><s:else>女士：</s:else>&nbsp;感谢注册中国资金网，您需要完善详细信息后才能使用中国资金网用户中心的各项功能。</span>
		<span class="view_detail"><a href="/user/UserAction!next.act" style="float:none;">以后再说</a></span>
</div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--tab-->
<div class="box_4 center" style="width:950px;">
      <div class="gray news_menu tab_menu2">
        <ul>
          <li class="hover">企业基本信息</li>
          <li><a href="/user/Profile.act?companyMark=2">更多信息</a><span style="float: left;">&nbsp;</span></li>
          <li></li>
          <li></li>
        </ul>
      </div>
	<form class="box_form">

	       <s:if test="msg!=null">
	           	  <div class="notification success png_bg">
	           	  	  <div>
	           	  	  	${msg }
	           	  	  	<s:if test="#session._user.auditstatus==2 && #session.APPLY_LOAN_PRODUCT_ID != null && #session.APPLY_LOAN_PRODUCT_ID != ''">
	           	  	  	您有未完成的融资产品申请，您可以
	           	  	  	<a href="/user/loan/financeApply.act?product.id=${session.APPLY_LOAN_PRODUCT_ID}" class="zj_href">继续申请</a>
	           	  	  	<!-- 
	           	  	  		<input type="button" value="继续申请"  class="but_gray" onclick="window.location='/user/loan/financeApply.act?product.id=${session.APPLY_LOAN_PRODUCT_ID}'" ></input>
	           	  	  	 -->
	           	  	  	</s:if>
	           	  	  </div>
	           	  </div>
		    </s:if>
           	<div class="box_4" style="font-size:12px;margin:10px 26px;line-height:24px;padding:10px 20px;background: #EDF0FF;">说明：提交企业基本信息是您使用中国资金网各项服务的最基本要求，请务必填写完整并保证信息的真实性。通过审核后，您即可享受除融资申请外的各项服务，如您有融资的需求，则需进一步完善企业更多信息。</div>
       <table border="0" cellpadding="0" cellspacing="0" class="special_psfs_tb">			
           <tr>
             <td class="a_right">企业名称：</td>
             <td >${usrCompany.companyname }</td>
           </tr>
           <tr>
             <td class="a_right">营业执照号码：</td>
             <td >${usrCompany.licensecode }</td>
           </tr>
           <tr>
             <td class="a_right">所属行业：</td>
             <td >${profileMap['industry'] }</td>
           </tr>
           <tr>
             <td class="a_right">组织机构代码证号码：</td>
             <td >${usrCompany.organizationcode }</td>
           </tr>
           <tr>
             <td class="a_right">企业经营地址：</td>
             <td >${profileMap['bizaddress'] }</td>
           </tr>
           <tr>
             <td class="a_right">详细地址：</td>
             <td >${usrCompany.bizaddress }</td>
           </tr>              
           <tr>
             <td class="a_right" style="vertical-align:top;">邮政编码：</td>
             <td >${usrCompany.bizpostcode }</td>
           </tr>            
           <tr>
             <td class="a_right">联系人姓名：</td>
             <td >${usrCompany.linkname} 
	         <s:if test="usrCompany.linkgender==1">先生</s:if><s:elseif test="usrCompany.linkgender==0">女士</s:elseif></td>
           </tr>
           <tr>
             <td class="a_right">联系人邮箱：</td>
           	 <td >${usrCompany.linkemail }</td>
          </tr>
          <tr>
             <td class="a_right">联系人电话：</td>
             <td >${usrCompany.linktelephone }</td>
           </tr>
           <tr> 
	       	<s:if test="usrUser == null || #session._user.id == usrUser.id">
	         <td colspan="2" style="text-align:center; padding-top:10px; padding-bottom:10px;"><input type="button" onclick="javascript:window.location.href='/user/Profile!edit.act?companyMark=1';" class="but_gray" style="width:200px;" value="编辑信息" /></td>
		    </s:if>
		    </tr>
         </table>
        </form>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>