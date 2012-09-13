<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>完善信息（个人）用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
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
	<s:if test="usrUser == null || #session._user.id == usrUser.id">
		<img src="/images/icon01.jpg" alt="" class="P_connect_img"/>当前账户状态:
		<s:if test="#session._user.auditstatus==0"><span class="no_ok">未审核</span></s:if>
		<s:elseif test="#session._user.auditstatus==1"><span class="no_ok">待审核</span></s:elseif>
		<s:elseif test="#session._user.auditstatus==2"><span class="no_ok">已审核</span></s:elseif>
	</s:if>
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--tab-->
<div class="box_4 center" style="width:950px;">
	<div class="news_menu" style="height: 50px;">
        <dl style="margin-left: 30px;">
          <dd><h6>个人基本信息</h6></dd>
          <dd>
          	<s:if test="usrPerson.completerate==null || usrPerson.completerate<60">
				<div class="graph_red"><span style="width:${usrPerson.completerate+0}%"></span></div>
			</s:if><s:elseif test="60<=usrPerson.completerate && usrPerson.completerate<100">
				<div class="graph_orange"><span  style="width:${usrPerson.completerate}%"></span></div>
			</s:elseif><s:else>
				<div class="graph_green"><span  style="width:${usrPerson.completerate}%"></span></div>
			</s:else>
          </dd>
        </dl>
      </div>
      <form class="box_form">
       <table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
         <s:if test="msg!=null">
          <tr>
           <td colspan="4"><div class="notification success png_bg"><div>${msg }</div></div></td>
         </tr>
	     </s:if>
         <tr>
           <td class="a_right">姓名</td>
           <td colspan="3"> ${session._user.realname} <s:if test="#session._user.gender==1">先生</s:if><s:else>女士</s:else></td>
         </tr>
         <tr>
           <td class="a_right">出生年月</td>
           <td colspan="3"><s:date name="usrPerson.birthday" /></td>
         </tr>
         <tr>
           <td class="a_right">教育程度</td>
           <td colspan="3">${profileMap['eduAtion'] }</td>
         </tr>
         <tr>
           <td class="a_right">身份证号码</td>
           <td colspan="3">${usrPerson.cid}</td>
         </tr>
         <tr>
           <td class="a_right">所在地</td>
           <td colspan="3" style="vertical-align: middle;">
            ${profileMap['address'] }
           </td>
         </tr>
         <tr>
           <td class="a_right">详细地址</td>
           <td colspan="3">${usrPerson.address }</td>
         </tr>              
         <tr>
           <td class="a_right" style="vertical-align:top;">邮政编码</td>
           <td colspan="3">${usrPerson.postcode }</td>
         </tr>            
         <tr>
           <td class="a_right">职业</td>
           <td colspan="3">
            ${profileMap['psersoncareer'] }               	
           </td>
         </tr>
         <tr>
           <td class="a_right">固定电话</td>
           <td colspan="3">${usrPerson.telephone }</td>
         </tr>
         <tr>
           <td class="a_right">联系方式</td>
           <td colspan="3">${profileMap['imtype1'] }&nbsp;&nbsp; ${usrPerson.im1 }</td>
         </tr>
         <tr>
           <td class="a_right">&nbsp;</td>
           <td colspan="3">${profileMap['imtype2'] }&nbsp;&nbsp;${usrPerson.im2 }</td>
         </tr>
         <tr>
           <td class="a_right">&nbsp;</td>
           <td colspan="3">${profileMap['imtype3'] }&nbsp;&nbsp;${usrPerson.im3 }</td>
         </tr>
         <tr>
           <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;"><input type="button" class="but_gray" onclick="javascript:window.location.href='/user/Profile!edit.act';" style="width:200px;" value="编辑信息" /></td>
         </tr>
       </table>        	
   </form>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>