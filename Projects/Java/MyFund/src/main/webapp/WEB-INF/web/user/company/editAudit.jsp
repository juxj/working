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
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/proofRule.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script language="javascript">
$(document).ready(function(){
	//$(".date_picker").datepicker({changeMonth: true,changeYear: true});
	$("#auditForm").validate({
		meta:"validate"
	});
	$("#bizCity").val('${usrCompany.bizcityid}');
	$("#bizDistrict").val('${usrCompany.bizdistrictid}');
	$("#industry").val('${usrCompany.industryid}');
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
&nbsp;&nbsp;账户管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;编辑企业基本信息
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
	<div id="status" class="P_connect" style="display: none;">
		&nbsp;&nbsp;&nbsp;&nbsp;尊敬的 ${session._user.realname} <s:if test="#session._user.gender==1">先生：</s:if><s:else>女士：</s:else>&nbsp;感谢您注册中国资金网，您需要完善详细信息后才能使用中国资金网用户中心的各项功能。<br />
		&nbsp;&nbsp;&nbsp;&nbsp;您也可以暂时跳过稍后在进行信息完善。<span style="margin-right:15px;" class="view_detail">
		<a href="/user/UserAction!next.act" style="float:none;">以后再说</a></span>
		<br />
		&nbsp;
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--tab-->
<div class="box_4 center" style="width:950px;">
      <div class="gray news_menu tab_menu2">
         <ul>
          <li>企业基本信息</li>
        </ul>
      </div>
    <form id="auditForm" class="box_form" action="/user/Profile!update.act" method="post" >
       <table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
       <s:if test="msg!=null">
          <tr>
           <td colspan="4"><div class="notification attention png_bg"><div>${msg }</div></div></td>
         </tr>
	     </s:if>
           <tr>
             <td class="a_right v-align">企业名称</td>
             <td colspan="3"><input type="hidden" name="companyMark" value="1"/><input id="companyname" type="text" value="${usrCompany.companyname }" class="input-text chne {validate:{maxlength:15}}"  name="usrCompany.companyname"/>
       	    </td>
           </tr>
           <tr>
             <td class="a_right v-align">营业执照号码</td>
             <td colspan="3"><input type="text" value="${usrCompany.licensecode }" class="input-text alnum {validate:{maxlength:15}}" name="usrCompany.licensecode"/></td>
           </tr>
           <tr>
             <td class="a_right v-align">所属行业</td>
             <td colspan="3" class="v-align">
             	<s:select id="industryParent" name="usrCompany.industryparentid" list="industryList" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"  onchange="changeindustry('industryParent','industry');"></s:select>
                <select id="industry" name="usrCompany.industryid">
         	      <option value="0">--请选择--</option>
         	      <s:iterator value="industry">
			        <option value="${id}">${name}</option>
		          </s:iterator>
               </select>
             </td>
          </tr>
          <tr>
            <td class="a_right v-align">组织机构代码证号码</td>
            <td colspan="3"><input id="organizationcode" type="text" value="${usrCompany.organizationcode }" class="input-text Organization {validate:{maxlength:10}}" name="usrCompany.organizationcode" /></td>
          </tr>
          <tr>
             <td class="a_right v-align">企业经营地址</td>
             <td colspan="3" class="v-align">
              <s:select id="bizProvince" name="usrCompany.bizprovinceid" cssClass="tb_sele" list="listProvince" headerKey="0" headerValue="--请选择--"  listKey="id" listValue="name" onchange="changeProvince('bizProvince','bizCity','bizDistrict');"/>
              <select id="bizCity" name="usrCompany.bizcityid" onchange="changeCity('bizCity','bizDistrict');" class="tb_sele">
                <option value="0">--请选择--</option>
          	    <s:iterator value="cityMap['bizCity']">
				  <option value="${id}">${name}</option>
			    </s:iterator>
	          </select>
	         <select id="bizDistrict" name="usrCompany.bizdistrictid" class="tb_sele">
	          <option value="0">--请选择--</option>
	         	<s:iterator value="districtMap['bizDistrict']">
				 <option value="${id}">${name}</option>
			    </s:iterator>
		     </select>         
           </td>
        </tr>
        <tr>
           <td class="a_right v-align">详细地址</td>
           <td colspan="3"><input type="text" value="${usrCompany.bizaddress }" class="input-text chne {validate:{maxlength:32}}" style="width:534px;" name="usrCompany.bizaddress"/></td>
       </tr>              
       <tr>
          <td class="a_right" style="vertical-align:top;">邮证编码</td>
          <td colspan="3"><input type="text" value="${usrCompany.bizpostcode }" class="input-text zipCode" name="usrCompany.bizpostcode"/></td>
       </tr>            
       <tr>
         <td class="a_right v-align">联系人姓名</td>
         <td colspan="3">
           <input type=text value="${usrCompany.linkname }" class="input-text {validate:{maxlength:6}} chcharacter" name="usrCompany.linkname"/>
         </td>
       </tr>
       <tr>
         <td class="a_right v-align">联系人性别</td>
         <td colspan="3">&nbsp;
   		  <s:if test="usrCompany == null || usrCompany.linkgender == null">
          <s:radio id="gender1" name="usrCompany.linkgender" list="#{1:'先生',0:'女士'}" value="1" listKey="key" listValue="value"/>
          </s:if><s:else>
          <s:radio id="gender2" name="usrCompany.linkgender" list="#{1:'先生',0:'女士'}" value="usrCompany.linkgender" listKey="key" listValue="value"/>
          </s:else>
         </td>
       </tr>
       <tr>
         <td class="a_right v-align">联系人邮箱</td>
       	 <td style="vertical-align: middle;" colspan="3">
          <input id="linkemail" type=text value="${usrCompany.linkemail }" class="input-text iemail {validate:{maxlength:30}}" name="usrCompany.linkemail"/>
         </td>
      </tr>
       <tr>
         <td class="a_right v-align">联系人电话</td>
         <td colspan="3">
         	<input type=text value="${usrCompany.linktelephone }" class="input-text mobile {validate:{maxlength:20}}" name="usrCompany.linktelephone"/>
         </td>
      </tr>                
       <tr>
         <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;">
           <input type="submit" class="but_gray" style="width:200px;" value="保存" />&nbsp;&nbsp;
           <input type="button" class="but_gray" onclick="javascript:window.location.href='/user/Profile.act'" style="width:200px;" value="取消" />
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