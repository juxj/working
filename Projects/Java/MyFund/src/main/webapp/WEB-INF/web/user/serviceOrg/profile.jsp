<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>完善信息（服务方）用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script type="text/javascript">
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

		<img src="/images/icon01.jpg" alt="" class="P_connect_img"/>当前账户状态:
		<s:if test="#session._user.auditstatus==0"><span class="no_ok">未审核</span></s:if>
		<s:elseif test="#session._user.auditstatus==1"><span class="no_ok">待审核</span></s:elseif>
		<s:elseif test="#session._user.auditstatus==2"><span class="no_ok">已审核</span></s:elseif>
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--tab-->
<div class="box_4 center" style="width:950px;">
	<div class="news_menu" style="height: 50px;">
        <dl style="margin-left: 30px;">
          <dd><h6>企业详细信息</h6></dd>
          <dd>
          <s:if test="usrServiceorg.completerate==null || usrServiceorg.completerate<60">
				<div class="graph_red"><span style="width:${usrServiceorg.completerate+0}%;"></span></div>
			</s:if><s:elseif test="60<=usrServiceorg.completerate && usrServiceorg.completerate<100">
				<div class="graph_orange"><span  style="width:${usrServiceorg.completerate}%;"></span></div>
			</s:elseif><s:else>
				<div class="graph_green"><span  style="width:${usrServiceorg.completerate}%;"></span></div>
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
          <td class="a_right">企业名称：</td>
          <td class="a_left" colspan="3">${ usrServiceorg.orgname}</td>
        </tr>
        <tr>
          <td class="a_right">营业执照号码：</td>
          <td class="a_left">${ usrServiceorg.licensecode}</td>
          <td colspan="2"><s:if test="profileMap['business'] != ''">${profileMap['business']}&nbsp;&nbsp;&nbsp;<a href="/user/orgAttach.act?attachId=${profileMap['businessId'] }">下载</a></s:if>&nbsp;</td>
        </tr>
        <tr>
          <td class="a_right">组织机构代码证号码：</td>
          <td>${ usrServiceorg.organizationcode}</td>
          <td colspan="2"><s:if test="profileMap['orgAnization'] != ''">${profileMap['orgAnization'] }&nbsp;&nbsp;&nbsp;<a href="/user/orgAttach.act?attachId=${profileMap['orgAnizationId'] }">下载</a></s:if>&nbsp;</td>
        </tr>
        <tr>
          <td class="a_right">税务登记证号码：</td>
          <td>${ usrServiceorg.faxcode}</td>
          <td colspan="2"><s:if test="profileMap['taxregistration'] != ''">${profileMap['taxregistration']}&nbsp;&nbsp;&nbsp;<a href="/user/orgAttach.act?attachId=${profileMap['taxregistrationId'] }">下载</a></s:if>&nbsp;</td>
        </tr>
        <tr>
          <td class="a_right">法定代表人：</td>
          <td colspan="3">${ usrServiceorg.legalperson}</td>
          </tr>
        <tr>
          <td class="a_right">注册地址：</td>
          <td colspan="3">${profileMap['regaddress']}</td>
        </tr>
        <tr>
          <td class="a_right">注册详细地址：</td>
          <td colspan="3"> ${ usrServiceorg.regaddress}</td>
        </tr>
        <tr>
          <td class="a_right">邮编：</td>
          <td colspan="3">${ usrServiceorg.regpostcode}</td>
        </tr>
        <tr>
          <td class="a_right">注册日期：</td>
          <td><s:date name="usrServiceorg.registerdate"/></td>
          <td class="a_right">注册资本：</td>
          <td><s:if test="usrServiceorg.registeredcapital!=null">
          	<s:text name="format.float"><s:param value=" usrServiceorg.registeredcapital"></s:param></s:text>万元 
          </s:if></td>
        </tr>
        <tr>
          <td class="a_right">机构类型：</td>
          <td colspan="3">${profileMap['companyType'] }</td>
        </tr>
        <tr>
          <td class="a_right">企业联系地址：</td>
          <td colspan="3">${profileMap['bizaddress']}</td>
        </tr>
        <tr>
          <td class="a_right">详细地址：</td>
          <td colspan="3">${ usrServiceorg.bizaddress}</td>
        </tr>
        <tr>
          <td class="a_right">邮编：</td>
          <td colspan="3">${ usrServiceorg.bizpostcode}</td>
        </tr>
        <tr>
          <td class="a_right">联系人姓名：</td>
          <td colspan="3">${ usrServiceorg.linkname} 
          <s:if test="usrServiceorg.linkgender==1">先生</s:if><s:elseif test="usrServiceorg.linkgender==0">女士</s:elseif></td>
        </tr>
        <tr>
          <td class="a_right">联系人邮箱：</td>
          <td>${ usrServiceorg.linkemail}</td>
          <td class="a_right">联系人电话：</td>
          <td>${ usrServiceorg.linktelephone}</td>
        </tr>
        <tr>
          <td class="a_right">所属部门：</td>
          <td>${ usrServiceorg.department}</td>
          <td class="a_right">职位：</td>
          <td>${ usrServiceorg.position}</td>
        </tr>
        <tr>
          <td class="a_right">服务产品：</td>
          <td colspan="3">${profileMap['serviceproduct']} </td>
        </tr>
        <tr>
          <td class="a_right">服务介绍：</td>
          <td colspan="3">${ usrServiceorg.remarks}</td>
        </tr>
        <s:if test="#session._user.auditstatus != 2">
         <tr>
           <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;">
           <input type="button" class="but_gray" onclick="javascript:window.location.href='/user/Profile!edit.act';" style="width:200px;" value="编辑信息" /></td>
        </tr>
        </s:if>
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