<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>完善信息（企业）用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public2.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/proofRule.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/xheditor-1.1.14-zh-cn.min.js" > </script>
<script language="javascript">
$(document).ready(function(){
	//$(".date_picker").datepicker({changeMonth: true,changeYear: true});
	$("#comForm").validate({
		meta:"validate"
	});
	$( "#regDate" ).datepicker({changeMonth: true,changeYear: true,maxDate: "0d"});
	$("#regCity").val('${usrCompany.regcityid}');
	$("#regDistrict").val('${usrCompany.regdistrictid}');
	$("#lpliveCity").val('${usrCompany.lplivecityid}');
	$("#lpliveDistrict").val('${usrCompany.lplivedistrictid}');
	$("#lphkCity").val('${usrCompany.lphkcityid}');
	$("#lphkDistrict").val('${usrCompany.lphkdistrictid}');
	$("#industry").val('${usrCompany.industryid}');
	if('${usrCompany}'==''){
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
<div class="hr_10"> &nbsp; </div>
<div class="M_menu">
&nbsp;&nbsp;账户管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;编辑信息
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_950 box_4">
	<div class="P_title">详细信息</div>
	<div class="line">
		<img src="/images/icon01.jpg" class="P_connect_img"/>当前账户状态:
		<s:if test="#session._user.auditstatus==0"><span class="no_ok">未审核</span></s:if>
		<s:elseif test="#session._user.auditstatus==1"><span class="no_ok">待审核</span></s:elseif>
		<s:elseif test="#session._user.auditstatus==2"><span class="no_ok">已审核</span></s:elseif>
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--tab-->
<div class="box_4 center" style="width:950px;">
	<div class="news_menu" style="height: 60px;">
        <dl style="padding-left: 30px;padding-top: 10px;">
          <dd><h6>企业详细信息</h6></dd>
          <dd>
          	<s:if test="usrCompany==null">
				<div class="graph_red"><span style="width:0%;"></span></div>
			</s:if>
       		 <s:elseif test="usrCompany.completeratebase<60">
				<div class="graph_red"><span style="width:${usrCompany.completeratebase}%;"></span></div>
			</s:elseif><s:elseif test="60<=usrCompany.completeratebase && usrCompany.completeratebase<100">
				<div class="graph_orange"><span  style="width:${usrCompany.completeratebase}%;"></span></div>
			</s:elseif><s:else>
				<div class="graph_green"><span  style="width:${usrCompany.completeratebase}%;"></span></div>
			</s:else>
          </dd>
        </dl>
      </div>
      <form id="comForm" class="box_form" action="/user/Profile!update.act" method="post" >
        <table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
         <s:if test="msg!=null">
          <tr>
           <td colspan="4"><div class="notification attention png_bg"><div>${msg }</div></div></td>
         </tr>
	     </s:if>
        <tr>
          <td class="a_right">税务登记证号码：</td>
          <td colspan="3"><input type="text" value="${usrCompany.faxcode }" class="input-text alnum {validate:{maxlength:15}}" name="usrCompany.faxcode"/>
          	<input type="hidden" value="2" name="companyMark"/>
          </td>
        </tr>
        <tr>
          <td class="a_right">开户许可证号码：</td>
          <td  class="a_left"><input id="bankpermitcode" type="text" value="${usrCompany.bankpermitcode }" class="input-text alnum {validate:{maxlength:30}}" name="usrCompany.bankpermitcode"/></td>
          <td class="a_right">贷款卡号：</td>
          <td class="a_left"><input type="text" value="${usrCompany.loancard }" class="input-text alnum {validate:{maxlength:30}}" name="usrCompany.loancard"/></td>
        </tr>
        <tr>
          <td class="a_right">法定代表人：</td>
          <td colspan="3"><input type="text" value="${usrCompany.legalperson }" class="input-text chcharacter {validate:{maxlength:8}}" name="usrCompany.legalperson"/></td>
        </tr>
        <tr>
          <td class="a_right">注册地址：</td>
          <td colspan="3">
	          <s:select id="regProvince" name="usrCompany.regprovinceid" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('regProvince','regCity','regDistrict');"/>
	          <select id="regCity" name="usrCompany.regcityid" onchange="changeCity('regCity','regDistrict');">
	          	<option value="0">--请选择--</option>
	          	 <s:iterator value="cityMap['regCity']">
					<option value="${id}">${name}</option>
				 </s:iterator>
	          </select>
	          <select id="regDistrict" name="usrCompany.regdistrictid">
	          <option value="0">--请选择--</option>
	          	<s:iterator value="districtMap['regDistrict']">
					<option value="${id}">${name}</option>
				</s:iterator>
	          </select>
         </td>
        </tr>
        <tr>
          <td class="a_right">详细地址：</td>
          <td colspan="3"><input type="text" value="${usrCompany.regaddress }" class="input-text chne {validate:{maxlength:32}}" style="width:534px;" name="usrCompany.regaddress"/></td>
        </tr>
        <tr>
          <td class="a_right">邮编：</td>
          <td colspan="3"><input type="text" value="${usrCompany.regpostcode }" class="input-text zipCode" name="usrCompany.regpostcode"/></td>
        </tr>
        <tr>
          <td class="a_right">注册日期：</td>
          <td><input id="regDate" type="text" value="<s:date name="usrCompany.registerdate" />" class="input-text dateISO" name="usrCompany.registerdate"/></td>
          <td class="a_right">注册资本：</td>
          <td><input type="text" value="<s:if test="usrCompany.registeredcapital!=null"><s:text name="format.float"><s:param value="usrCompany.registeredcapital"></s:param></s:text></s:if>" class="input-text number {validate:{maxlength:12}}" name="usrCompany.registeredcapital"/>
          &nbsp;万元 </td>
        </tr>
        <tr>
          <td class="a_right">企业类型：</td>
          <td><s:select name="usrCompany.enterprisetypeid" list="dataMap['companyType']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
          <td class="a_right">员工人数：</td>
          <td><s:select name="usrCompany.employeesid" list="dataMap['companyTmployee']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
        </tr>
        <tr>
          <td class="a_right">经营范围：</td>
          <td colspan="3"><textarea class="xheditor {tools:'Bold',skin:'nostyle',forcePtag:false}" name="usrCompany.bizscope" style="width: 550px;height: 150px;">${usrCompany.bizscope }</textarea></td>
        </tr>
        <tr>
          <td class="a_right">所属部门：</td>
          <td><input id="department" type=text value="${usrCompany.department }" class="input-text {validate:{maxlength:8}} chne" name="usrCompany.department"/></td>
          <td class="a_right">职位：</td>
          <td><input type=text value="${usrCompany.position }" class="input-text {validate:{maxlength:8}} chne" name="usrCompany.position"/></td>
        </tr>
        <tr>
           <td colspan="4">企业法人信息</td>
        </tr>
        <tr>
          <td class="a_right">学历：</td>
          <td colspan="3"><s:select name="usrCompany.lpeducation" list="dataMap['eduAtion']" value="usrCompany.lpeducation" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
        </tr>
        <tr>
          <td class="a_right">婚姻状况：</td>
          <td><s:select name="usrCompany.lpmarry" list="dataMap['marry']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
          <td class="a_right">从事所属行业年限：</td>
          <td><s:select name="usrCompany.lpindustryyears" list="dataMap['workYears']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
        </tr>
        <tr>
          <td class="a_right">身份证号码：</td>
          <td colspan="3"><input type="text" value="${usrCompany.lpcid }" class="input-text idcardno {validate:{maxlength:19}}" name="usrCompany.lpcid"/></td>
        </tr>
        <tr>
          <td class="a_right">手机：</td>
          <td><input id="lpmobile" type="text" value="${usrCompany.lpmobile}" class="input-text mobile {validate:{maxlength:13}}" name="usrCompany.lpmobile"/></td>
          <td class="a_right">家庭电话：</td>
          <td><input type="text" value="${usrCompany.lphometel }" class="input-text phone {validate:{maxlength:20}}" name="usrCompany.lphometel"/></td>
        </tr>
        <tr>
          <td class="a_right">常住地址：</td>
          <td colspan="3"><s:select id="lpliveProvince" name="usrCompany.lpliveprovinceid" list="listProvince" headerKey="0" headerValue="--请选择--"  listKey="id" listValue="name" onchange="changeProvince('lpliveProvince','lpliveCity','lpliveDistrict');"/>
          <select id="lpliveCity" name="usrCompany.lplivecityid" onchange="changeCity('lpliveCity','lpliveDistrict');">
          	<option value="0">--请选择--</option>
          	<s:iterator value="cityMap['lpliveCity']">
				<option value="${id}">${name}</option>
			</s:iterator>
          </select>
          <select id="lpliveDistrict" name="usrCompany.lplivedistrictid">
          	<option value="0">--请选择--</option>
          	<s:iterator value="districtMap['lpliveDistrict']">
				<option value="${id}">${name}</option>
			</s:iterator>
		  </select></td>
        </tr>
        <tr>
          <td class="a_right">详细地址：</td>
          <td colspan="3"><input type="text" value="${usrCompany.lpliveaddress }" class="input-text chne {validate:{maxlength:32}}" style="width:534px;" name="usrCompany.lpliveaddress"/></td>
        </tr>
        <tr>
          <td class="a_right">邮编：</td>
          <td colspan="3"><input type="text" value="${usrCompany.lplivepostcode }" class="input-text zipCode" name="usrCompany.lplivepostcode"/></td>
        </tr>
        <tr>
          <td class="a_right">户籍所在地：</td>
          <td colspan="3"><s:select id="lphkProvince" name="usrCompany.lphkprovinceid" list="listProvince" headerKey="0" headerValue="--请选择--"  listKey="id" listValue="name" onchange="changeProvince('lphkProvince','lphkCity','lphkDistrict');"/>
          <select id="lphkCity" name="usrCompany.lphkcityid" onchange="changeCity('lphkCity','lphkDistrict');">
          	<option value="0">--请选择--</option>
          	<s:iterator value="cityMap['lphkCity']">
				<option value="${id}">${name}</option>
			</s:iterator>
          </select>
          <select id="lphkDistrict" name="usrCompany.lphkdistrictid">
          	<option value="0">--请选择--</option>
          	<s:iterator value="districtMap['lphkDistrict']">
				<option value="${id}">${name}</option>
			</s:iterator>
		  </select></td>
        </tr>
        <tr>
          <td class="a_right">详细地址：</td>
          <td colspan="3"><input type="text" value="${usrCompany.lphkaddress }" class="input-text chne {validate:{maxlength:32}}" style="width:534px;" name="usrCompany.lphkaddress"/></td>
        </tr>
        <tr>
          <td class="a_right">邮编：</td>
          <td colspan="3"><input type="text" value="${usrCompany.lphkpostcode }" class="input-text zipCode" name="usrCompany.lphkpostcode"/></td>
        </tr>
        <tr>
           <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;"><input type="submit" class="but_gray" style="width:200px;" value="保存信息" /></td>
         </tr>
         </table>
        </form>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>