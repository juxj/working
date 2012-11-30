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
	$(".input-text").attr({style:"border:0;background:transparent;",readonly:"readonly"});
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
		<span>尊敬的 ${session._user.realname} <s:if test="#session._user.gender==1">先生：</s:if><s:else>女士：</s:else>&nbsp;感谢注册中国资金网，您需完善详细信息后才能使用中国资金网用户中心的各项功能。</span>
		<span style="margin-right:15px;" class="view_detail"><a href="/user/UserAction!next.act" style="float:none;">以后再说</a></span>
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--tab-->
<div class="box_4 center" style="width:950px;">
      <div class="gray news_menu tab_menu2">
        <ul>
          <li><a href="/user/Profile.act?companyMark=1">企业基本信息</a></li>
          <li  class="hover">更多信息<span style="float: left;">&nbsp;</span><!-- <s:if test="usrCompany==null">
				<div class="graph_red" style="width:90px; float: right;margin-top: 7px; margin-right: 3px; text-align:left;"><span style="width:0%;"></span></div>
			</s:if>
       		 <s:elseif test="usrCompany.completeratebase<60">
				<div class="graph_red" style="width:90px; float: right;margin-top: 7px; margin-right: 3px; text-align:left;"><span style="width:${usrCompany.completeratebase}%;"></span></div>
			</s:elseif><s:elseif test="60<=usrCompany.completeratebase && usrCompany.completeratebase<100">
				<div class="graph_orange" style="width:90px; float: right;margin-top: 7px; margin-right: 3px; text-align:left;"><span  style="width:${usrCompany.completeratebase}%;"></span></div>
			</s:elseif><s:else>
				<div class="graph_green" style="width:90px; float: right;margin-top: 7px; margin-right: 3px; text-align:left;"><span  style="width:${usrCompany.completeratebase}%;"></span></div>
			</s:else> -->
		  </li>
          <li></li>
          <li></li>
        </ul>
      </div>
	<form class="box_form">
         <table border="0" cellpadding="0" cellspacing="0" class="special_psfs_tb">
	      <s:if test="msg!=null">
		    <tr>
	           <td colspan="4"><div class="notification success png_bg"><div>${msg }</div></div></td>
	         </tr>
		  </s:if>
		  <tr>
           <td colspan="4">
           	<div class="box_4" style="font-size:12px;margin:10px 26px;line-height:24px;padding:10px 20px;background: #EDF0FF;">说明：您需要完善更多信息才能正常使用融资申请功能。这些信息是资金网及金融机构对您的融资申请进行审核和判断的重要依据，为了提高您融资成功的概率，请务必填写完整并且保证信息的真实性。</div>
			</td>
         </tr>
	     <tr>
	       <td class="a_right">税务登记证号码：</td>
	       <td colspan="3">${usrCompany.faxcode }</td>
	     </tr>
	     <tr>
	       <td class="a_right">开户许可证号码：</td>
	       <td class="a_left">${usrCompany.bankpermitcode }</td>
	       <td class="a_right">贷款卡号：</td>
	       <td  class="a_left">${usrCompany.loancard }</td>
	     </tr>
	     <tr>
	       <td class="a_right">注册日期：</td>
	       <td><s:date name="usrCompany.registerdate"/></td>
	       <td class="a_right">注册资本：</td>
	       <td><s:if test="usrCompany.registeredcapital!=null">
	        <s:text name="format.float"><s:param value="usrCompany.registeredcapital"></s:param></s:text>&nbsp;万元
	       </s:if></td>
	     </tr>
	     <tr>
	       <td class="a_right">注册地址：</td>
	       <td colspan="3">${profileMap['regaddress'] }</td>
	     </tr>
	     <tr>
	       <td class="a_right">详细地址：</td>
	       <td colspan="3">${usrCompany.regaddress }</td>
	     </tr>
	     <tr>
	       <td class="a_right">邮编：</td>
	       <td colspan="3">${usrCompany.regpostcode }</td>
	     </tr>
	     <tr>
	       <td class="a_right">企业类型：</td>
	       <td>${profileMap['companyType'] }</td>
	       <td class="a_right">员工人数：</td>
	       <td>${profileMap['companyTmployee'] }</td>
	     </tr>
	     <tr>
	       <td class="a_right">经营范围：</td>
	       <td colspan="3">${usrCompany.bizscope }</td>
	     </tr>
	     <!-- 
	     <tr>
	       <td class="a_right">所属部门：</td>
	       <td>${usrCompany.department }</td>
	       <td class="a_right">职位：</td>
	       <td>${usrCompany.position }</td>
	     </tr>
	      -->
	     <tr>
	       <td colspan="4">&nbsp; </td>
		 </tr>
		 <tr>
	       <td class="a_right f_gz">企业法人信息 &nbsp; &nbsp;</td>
	       <td colspan="3"></td>
		 </tr>
		 <tr>
	       <td class="a_right">法人姓名：</td>
	       <td>${usrCompany.legalperson }</td>
	       <td class="a_right">学历：</td>
	       <td>${profileMap['eduAtion'] }</td>
	     </tr>
	     <tr>
	       <td class="a_right">婚姻状况：</td>
	       <td>${profileMap['marry'] }</td>
	       <td class="a_right">从事所属行业年限：</td>
	       <td>${profileMap['workYears'] }</td>
	     </tr>
	     <tr>
	       <td class="a_right">身份证号码：</td>
	       <td colspan="3">${usrCompany.lpcid }</td>
	     </tr>
	     <tr>
	       <td class="a_right">手机：</td>
	       <td>${usrCompany.lpmobile}</td>
	       <td class="a_right">家庭电话：</td>
	       <td>${usrCompany.lphometel }</td>
	     </tr>
	     <tr>
	       <td class="a_right">常住地址：</td>
	       <td colspan="3">${profileMap['lpliveaddress'] }</td>
	     </tr>
	     <tr>
	       <td class="a_right">常住详细地址：</td>
	       <td colspan="3"> ${usrCompany.lpliveaddress }</td>
	     </tr>
	     <tr>
	       <td class="a_right">邮编：</td>
	       <td colspan="3">${usrCompany.lplivepostcode }</td>
	     </tr>
	     <tr>
	       <td class="a_right">户籍所在地：</td>
	       <td colspan="3">${profileMap['lphkaddress'] }</td>
	     </tr>
	     <tr>
	       <td class="a_right">户籍所在地详细地址：</td>
	       <td colspan="3">${usrCompany.lphkaddress }</td>
	     </tr>
	     <tr>
	       <td class="a_right">邮编：</td>
	       <td colspan="3">${usrCompany.lphkpostcode }</td>
	     </tr>
         <tr>
           <td colspan="4"  style="text-align:center; padding-top:10px; padding-bottom:10px;">
		    <s:if test="usrUser == null || #session._user.id == usrUser.id">
	         <input type="button" onclick="javascript:window.location.href='/user/Profile!edit.act?companyMark=2';" class="but_gray" style="width:200px;" value="编辑信息" />
	        </s:if>
	      </td>
	    </tr>
    </table>
   </form>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>