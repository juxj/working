<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script type="text/javascript" src="/script/proofRule.js" > </script>
<script type="text/javascript" src="/script/xheditor-1.1.14-zh-cn.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script language="javascript">
//文本框触发焦点效果s
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
    $('textarea').xheditor({tools:'simple',skin:'nostyle'});
    $("#regDate").datepicker();
    $("#regCity").val('${usrCompany.regcityid}');
	$("#regDistrict").val('${usrCompany.regdistrictid}');
	
	$("#lpliveCity").val('${usrCompany.lplivecityid}');
	$("#lpliveDistrict").val('${usrCompany.lplivedistrictid}');
		
	$("#lphkCity").val('${usrCompany.lphkcityid}');
	$("#lphkDistrict").val('${usrCompany.lphkdistrictid}');
	$("#loanForm").validate();
	$('#errores').html('');
});
function servicedetail(){
		if($("#zjservice").attr("checked")){
			$("#loanSubmit").attr("disabled",false);
		}else{
			$("#loanSubmit").attr("disabled",true);
		}
}

</script>

  </head>
  
  <body>
<!--头部2-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="apply_title" >
	<p>融资申请-企业经营贷款</p>
	<div class="apply_menu">
		<div class="finance_apply_menu app_menu01">1.完善企业信息</div>
        <div class="finance_apply_menu app_menu02" >2.填写申请信息</div>
        <div class="finance_apply_menu app_menu02">3.预审中</div>
        <div class="finance_apply_menu app_menu02">4.提交资料</div>
        <div class="finance_apply_menu app_menu02">5.资金网审核</div>
        <div class="finance_apply_menu app_menu03">6.金融机构审核</div>	
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
<div class="box_4">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="Search_t_title_bank">
        	<s:if test="product.logo == null">
		        <img src="/images/banklogo/b/zj198.jpg" style="white-space: nowrap;"/>
	        </s:if>
	        <s:else>
	        	<img src="/images/banklogo/b/${product.logo }"/>
	        </s:else>
        </td>
        <td><span class="Search_t_title red">${product.financeName }</span>&nbsp;&nbsp;<a href="/loan/financeProduct!cusViewFinance.act?product.id=${product.id}" target="_blank">查看详情</a>
        </td>
      </tr>
    </table>
</div>
<form action="/user/loan/financeApply!busiApplyFirst.act" id="loanForm"  class="box_form" style="margin:0px;" method="post">
<s:hidden name="usrCompany.userid"></s:hidden>
<!-- 企业经营贷款快速申请类型=136 -->
<s:hidden name="product.id"></s:hidden>
			<div class="hr_10"> &nbsp; </div>
			<div class="C_title">基本信息</div>
			<table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
				<tr>
	             <td class="a_right">企业名称:</td>
	             <td width="300px">${usrCompany.companyname }</td>
	             <td class="a_right">营业执照号码:</td>
	             <td width="300px">${usrCompany.licensecode }</td>
	           </tr>
	           <tr>
	             <td class="a_right">所属行业:</td>
	             <td>${profileMap['industry'] }</td>
	             <td class="a_right">组织机构代码证号码:</td>
	             <td>${usrCompany.organizationcode }</td>
	           </tr>
	           <tr>
	             <td class="a_right">企业经营地址:</td>
	             <td >${profileMap['bizaddress'] }</td>
	             <td class="a_right">详细地址:</td>
	             <td >${usrCompany.bizaddress }</td>
	           </tr>              
	           <tr>
	             <td class="a_right" style="vertical-align:top;">邮证编码:</td>
	             <td >${usrCompany.bizpostcode }</td>
	             <td class="a_right">联系人姓名:</td>
	             <td >${usrCompany.linkname} 
		         <s:if test="usrCompany.linkgender==1">先生</s:if><s:elseif test="usrCompany.linkgender==0">女士</s:elseif></td>
	           </tr>
	           <tr>
	             <td class="a_right">联系人邮箱:</td>
	           	 <td style="vertical-align: middle;">${usrCompany.linkemail }</td>
	             <td class="a_right">联系人电话:</td>
	             <td>${usrCompany.linktelephone }</td>                
	          </tr>
			</table>
			<div class="C_title">详细信息:</div>
			<div class="hr_10"> &nbsp; </div>
			<table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
         <s:if test="msg!=null">
          <tr>
           <td colspan="4"><div class="notification attention png_bg"><div>${msg }</div></div></td>
         </tr>
	     </s:if>
        <tr>
          <td class="a_right"><span class="txt-impt">*</span>税务登记证号码：</td>
          <td colspan="3"><input type="text" value="${usrCompany.faxcode }" class="input-text required alnum {maxlength:15}" name="usrCompany.faxcode"/>
          </td>
        </tr>
        <tr>
          <td class="a_right"><span class="txt-impt">*</span>开户许可证号码：</td>
          <td width="300px"><input id="bankpermitcode" type="text" value="${usrCompany.bankpermitcode }" class="input-text required alnum {maxlength:30}" name="usrCompany.bankpermitcode"/></td>
          <td class="a_right"><span class="txt-impt">*</span>贷款卡号：</td>
          <td width="300px"><input type="text" value="${usrCompany.loancard }" class="input-text required alnum {maxlength:30}" name="usrCompany.loancard"/></td>
        </tr>
        <tr>
          <td class="a_right"><span class="txt-impt">*</span>法定代表人：</td>
          <td colspan="3"><input type="text" value="${usrCompany.legalperson }" class="input-text required chcharacter {maxlength:8}" name="usrCompany.legalperson"/></td>
        </tr>
        <tr>
          <td class="a_right"><span class="txt-impt">*</span>注册地址：</td>
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
          <td colspan="3"><input type="text" value="${usrCompany.regaddress }" class="input-text chne {maxlength:32}" style="width:534px;" name="usrCompany.regaddress"/></td>
        </tr>
        <tr>
          <td class="a_right">邮编：</td>
          <td colspan="3"><input type="text" value="${usrCompany.regpostcode }" class="input-text zipCode" name="usrCompany.regpostcode"/></td>
        </tr>
        <tr>
          <td class="a_right"><span class="txt-impt">*</span>注册日期：</td>
          <td><input id="regDate" type="text" value="<s:date name="usrCompany.registerdate" />" class="input-text required dateISO" name="usrCompany.registerdate" /></td>
          <td class="a_right"><span class="txt-impt">*</span>注册资本：</td>
          <td><input type="text" value="<s:if test="usrCompany.registeredcapital!=null"><s:text name="format.float"><s:param value="usrCompany.registeredcapital"></s:param></s:text></s:if>" class="input-text required number {maxlength:12}" name="usrCompany.registeredcapital" id="registeredcapital"/>
          &nbsp;万元 <label for="registeredcapital" class="error" generated="true" style="display:none;"></label>
          </td>
        </tr>
        <tr>
          <td class="a_right">企业类型：</td>
          <td><s:select name="usrCompany.enterprisetypeid" list="dataMap['companyType']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
          <td class="a_right">员工人数：</td>
          <td><s:select name="usrCompany.employeesid" list="dataMap['companyTmployee']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
        </tr>
        <tr style="height:160px;line-height:160px;">
          <td class="a_right">经营范围：</td>
          <td colspan="3"><textarea name="usrCompany.bizscope" style="width: 550px;height: 150px;">${usrCompany.bizscope }</textarea></td>
        </tr>
        <tr>
          <td class="a_right">所属部门：</td>
          <td><input id="department" type=text value="${usrCompany.department }" class="input-text chne {maxlength:8}" name="usrCompany.department"/></td>
          <td class="a_right">职位：</td>
          <td><input type=text value="${usrCompany.position }" class="input-text chne {maxlength:8}" name="usrCompany.position"/></td>
        </tr>
        </table>
        <div class="hr_10"> &nbsp; </div>
        <div class="C_title">法定代表人信息:</div>
			<div class="hr_10"> &nbsp; </div>
        <table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
        <tr>
          <td class="a_right"><span class="txt-impt">*</span>学历：</td>
          <td colspan="3"><s:select headerKey="" headerValue="--请选择--" class="required" name="usrCompany.lpeducation" list="dataMap['eduAtion']" value="usrCompany.lpeducation" listKey="id" listValue="name" ></s:select></td>
        </tr>
        <tr>
          <td class="a_right"><span class="txt-impt">*</span>婚姻状况：</td>
          <td width="300px"><s:select name="usrCompany.lpmarry" list="dataMap['marry']" listKey="id" listValue="name" headerKey="" headerValue="--请选择--" class="required"></s:select></td>
          <td class="a_right"><span class="txt-impt">*</span>从事所属行业年限：</td>
          <td width="300px"><s:select name="usrCompany.lpindustryyears" list="dataMap['workYears']" listKey="id" listValue="name" headerKey="" headerValue="--请选择--" class="required"></s:select></td>
        </tr>
        <tr>
          <td class="a_right"><span class="txt-impt">*</span>身份证号码：</td>
          <td colspan="3"><input type="text" value="${usrCompany.lpcid }" class="input-text required idcardno {maxlength:19}" name="usrCompany.lpcid"/></td>
        </tr>
        <tr>
          <td class="a_right"><span class="txt-impt">*</span>手机：</td>
          <td><input id="lpmobile" type="text" value="${usrCompany.lpmobile}" class="input-text required mobile {maxlength:13}" name="usrCompany.lpmobile"/></td>
          <td class="a_right">家庭电话：</td>
          <td><input type="text" value="${usrCompany.lphometel }" class="input-text phone {maxlength:20}" name="usrCompany.lphometel"/></td>
        </tr>
        <tr>
          <td class="a_right"><span class="txt-impt">*</span>常住地址：</td>
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
          <td colspan="3"><input type="text" value="${usrCompany.lpliveaddress }" class="input-text chne {maxlength:32}" style="width:534px;" name="usrCompany.lpliveaddress"/></td>
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
          <td colspan="3"><input type="text" value="${usrCompany.lphkaddress }" class="input-text chne {maxlength:32}" style="width:534px;" name="usrCompany.lphkaddress"/></td>
        </tr>
        <tr>
          <td class="a_right">邮编：</td>
          <td colspan="3"><input type="text" value="${usrCompany.lphkpostcode }" class="input-text zipCode" name="usrCompany.lphkpostcode"/></td>
        </tr>
        <tr>
           <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;">
           <input type="checkbox" name="copy" value="1"/>
           	将申请企业信息保存到用户注册信息中
           </td>
         </tr>
        <tr>
           <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;"><input type="submit" class="but_gray" style="width:200px;" value="下一步" /></td>
         </tr>
         </table>
	</div>
</form>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
