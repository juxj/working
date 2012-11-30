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
	$('textarea').xheditor({tools:'simple',skin:'nostyle'});
	$( "#regDate" ).datepicker({changeMonth: true,changeYear: true,maxDate: "0d"});
	$("#regCity").val('${ordCompany.regcityid}');
	$("#regDistrict").val('${ordCompany.regdistrictid}');
	$("#lpliveCity").val('${ordCompany.lplivecityid}');
	$("#lpliveDistrict").val('${ordCompany.lplivedistrictid}');
	$("#lphkCity").val('${ordCompany.lphkcityid}');
	$("#lphkDistrict").val('${ordCompany.lphkdistrictid}');
	$("#industry").val('${ordCompany.industryid}');
});
</script>
</head>
<body>
<!--头部-->
	<!--头部-->
	<div class="header user_header">
		<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
		<div class="clear">&nbsp;</div>
	</div>
	<div class="hr_10">&nbsp;</div>
	<!--主体部分开始-->
	<div class="M_menu">
		融资管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a
			href="/user/loan/userApplyManag.act">融资申请管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;融资申请查看
	</div>
	<div class="hr_10">&nbsp;</div>
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
	<div class="news_menu">
        <dl style="padding-left: 30px;">
          <dd><h6>企业详细信息</h6></dd>
        </dl>
      </div>
      <form id="comForm" class="box_form" action="/user/loan/userApplyManag!updateOrdCom.act" method="post" >
        <table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
         <s:if test="msg!=null">
          <tr>
           <td colspan="4"><div class="notification attention png_bg"><div>${msg }</div></div></td>
         </tr>
	     </s:if>
        <tr>
          <td class="a_right v-align">税务登记证号码：</td>
          <td colspan="3"><input type="text" value="${ordCompany.faxcode }" class="input-text alnum {validate:{maxlength:15}}" name="ordCompany.faxcode"/>
          	<input type="hidden" value="${applyId }" name="applyId"/>
          </td>
        </tr>
        <tr>
          <td class="a_right v-align">开户许可证号码：</td>
          <td  class="a_left"><input id="bankpermitcode" type="text" value="${ordCompany.bankpermitcode }" class="input-text alnum {validate:{maxlength:30}}" name="ordCompany.bankpermitcode"/></td>
          <td class="a_right v-align">贷款卡号：</td>
          <td class="a_left"><input type="text" value="${ordCompany.loancard }" class="input-text alnum {validate:{maxlength:30}}" name="ordCompany.loancard"/></td>
        </tr>
        <tr>
          <td class="a_right v-align">法定代表人：</td>
          <td colspan="3"><input type="text" value="${ordCompany.legalperson }" class="input-text chcharacter {validate:{maxlength:8}}" name="ordCompany.legalperson"/></td>
        </tr>
        <tr>
          <td class="a_right v-align">注册地址：</td>
          <td colspan="3">
	          <s:select id="regProvince" name="ordCompany.regprovinceid" cssClass="tb_sele" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('regProvince','regCity','regDistrict');"/>
	          <select id="regCity" name="ordCompany.regcityid" onchange="changeCity('regCity','regDistrict');" class="tb_sele">
	          	<option value="0">--请选择--</option>
	          	 <s:iterator value="cityMap['regCity']">
					<option value="${id}">${name}</option>
				 </s:iterator>
	          </select>
	          <select id="regDistrict" name="ordCompany.regdistrictid" class="tb_sele">
	          <option value="0">--请选择--</option>
	          	<s:iterator value="districtMap['regDistrict']">
					<option value="${id}">${name}</option>
				</s:iterator>
	          </select>
         </td>
        </tr>
        <tr>
          <td class="a_right v-align">详细地址：</td>
          <td colspan="3"><input type="text" value="${ordCompany.regaddress }" class="input-text chne {validate:{maxlength:32}}" style="width:534px;" name="ordCompany.regaddress"/></td>
        </tr>
        <tr>
          <td class="a_right v-align">邮编：</td>
          <td colspan="3"><input type="text" value="${ordCompany.regpostcode }" class="input-text zipCode" name="ordCompany.regpostcode"/></td>
        </tr>
        <tr>
          <td class="a_right v-align">注册日期：</td>
          <td><input id="regDate" type="text" value="<s:date name="ordCompany.registerdate" />" class="input-text dateISO" name="ordCompany.registerdate"/></td>
          <td class="a_right v-align">注册资本：</td>
          <td><input type="text" value="<s:if test="ordCompany.registeredcapital!=null"><s:text name="format.float"><s:param value="ordCompany.registeredcapital"></s:param></s:text></s:if>" class="input-text number {validate:{maxlength:12}}" name="ordCompany.registeredcapital"/>
          &nbsp;万元 </td>
        </tr>
        <tr>
          <td class="a_right v-align">企业类型：</td>
          <td><s:select name="ordCompany.enterprisetypeid" list="dataMap['companyType']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
          <td class="a_right v-align">员工人数：</td>
          <td><s:select name="ordCompany.employeesid" list="dataMap['companyTmployee']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
        </tr>
        <tr>
          <td class="a_right v-align">经营范围：</td>
          <td colspan="3"><textarea name="ordCompany.bizscope" style="width: 550px;height: 150px;">${ordCompany.bizscope }</textarea></td>
        </tr>
        <tr>
          <td class="a_right v-align">所属部门：</td>
          <td><input id="department" type=text value="${ordCompany.department }" class="input-text {validate:{maxlength:8}} chne" name="ordCompany.department"/></td>
          <td class="a_right v-align">职位：</td>
          <td><input type=text value="${ordCompany.position }" class="input-text {validate:{maxlength:8}} chne" name="ordCompany.position"/></td>
        </tr>
        <tr>
           <td colspan="4">企业法人信息</td>
        </tr>
        <tr>
          <td class="a_right v-align">学历：</td>
          <td colspan="3"><s:select name="ordCompany.lpeducation" list="dataMap['eduAtion']" value="ordCompany.lpeducation" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
        </tr>
        <tr>
          <td class="a_right v-align">婚姻状况：</td>
          <td><s:select name="ordCompany.lpmarry" list="dataMap['marry']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
          <td class="a_right v-align">从事所属行业年限：</td>
          <td><s:select name="ordCompany.lpindustryyears" list="dataMap['workYears']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
        </tr>
        <tr>
          <td class="a_right v-align">身份证号码：</td>
          <td colspan="3"><input type="text" value="${ordCompany.lpcid }" class="input-text idcardno {validate:{maxlength:19}}" name="ordCompany.lpcid"/></td>
        </tr>
        <tr>
          <td class="a_right v-align">手机：</td>
          <td><input id="lpmobile" type="text" value="${ordCompany.lpmobile}" class="input-text mobile {validate:{maxlength:13}}" name="ordCompany.lpmobile"/></td>
          <td class="a_right v-align">家庭电话：</td>
          <td><input type="text" value="${ordCompany.lphometel }" class="input-text phone {validate:{maxlength:20}}" name="ordCompany.lphometel"/></td>
        </tr>
        <tr>
          <td class="a_right v-align">常住地址：</td>
          <td colspan="3"><s:select id="lpliveProvince" name="ordCompany.lpliveprovinceid" cssClass="tb_sele" list="listProvince" headerKey="0" headerValue="--请选择--"  listKey="id" listValue="name" onchange="changeProvince('lpliveProvince','lpliveCity','lpliveDistrict');"/>
          <select id="lpliveCity" name="ordCompany.lplivecityid" onchange="changeCity('lpliveCity','lpliveDistrict');" class="tb_sele">
          	<option value="0">--请选择--</option>
          	<s:iterator value="cityMap['lpliveCity']">
				<option value="${id}">${name}</option>
			</s:iterator>
          </select>
          <select id="lpliveDistrict" name="ordCompany.lplivedistrictid" class="tb_sele">
          	<option value="0">--请选择--</option>
          	<s:iterator value="districtMap['lpliveDistrict']">
				<option value="${id}">${name}</option>
			</s:iterator>
		  </select></td>
        </tr>
        <tr>
          <td class="a_right v-align">详细地址：</td>
          <td colspan="3"><input type="text" value="${ordCompany.lpliveaddress }" class="input-text chne {validate:{maxlength:32}}" style="width:534px;" name="ordCompany.lpliveaddress"/></td>
        </tr>
        <tr>
          <td class="a_right v-align">邮编：</td>
          <td colspan="3"><input type="text" value="${ordCompany.lplivepostcode }" class="input-text zipCode" name="ordCompany.lplivepostcode"/></td>
        </tr>
        <tr>
          <td class="a_right v-align">户籍所在地：</td>
          <td colspan="3"><s:select id="lphkProvince" name="ordCompany.lphkprovinceid" cssClass="tb_sele" list="listProvince" headerKey="0" headerValue="--请选择--"  listKey="id" listValue="name" onchange="changeProvince('lphkProvince','lphkCity','lphkDistrict');"/>
          <select id="lphkCity" name="ordCompany.lphkcityid" onchange="changeCity('lphkCity','lphkDistrict');" class="tb_sele">
          	<option value="0">--请选择--</option>
          	<s:iterator value="cityMap['lphkCity']">
				<option value="${id}">${name}</option>
			</s:iterator>
          </select>
          <select id="lphkDistrict" name="ordCompany.lphkdistrictid" class="tb_sele">
          	<option value="0">--请选择--</option>
          	<s:iterator value="districtMap['lphkDistrict']">
				<option value="${id}">${name}</option>
			</s:iterator>
		  </select></td>
        </tr>
        <tr>
          <td class="a_right v-align">详细地址：</td>
          <td colspan="3"><input type="text" value="${ordCompany.lphkaddress }" class="input-text chne {validate:{maxlength:32}}" style="width:534px;" name="ordCompany.lphkaddress"/></td>
        </tr>
        <tr>
          <td class="a_right v-align">邮编：</td>
          <td colspan="3"><input type="text" value="${ordCompany.lphkpostcode }" class="input-text zipCode" name="ordCompany.lphkpostcode"/></td>
        </tr>
        <tr>
           <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;">
           <input type="submit" class="but_gray" style="width:200px;" value="保存" />&nbsp;&nbsp;
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