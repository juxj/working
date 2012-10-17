<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>完善信息（服务方）用户中心_中国资金网</title>
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
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script type="text/javascript" src="/script/jquery.form.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/xheditor-1.1.14-zh-cn.min.js" > </script>
<script language="javascript">
$(document).ready(function(){
	changeProvince();
	$("#regCity").val('${usrServiceorg.regcityid}');
	$("#regDistrict").val('${usrServiceorg.regdistrictid}');
	$("#bizCity").val('${usrServiceorg.bizcityid}');
	$("#bizDistrict").val('${usrServiceorg.bizdistrictid}');
	//$(".date_picker").datepicker({changeMonth: true,changeYear: true});
	$('textarea').xheditor({tools:'simple',skin:'nostyle'});
	$( "#regDate" ).datepicker({changeMonth: true,changeYear: true,maxDate: "0d"});
	$("#serForm").validate({
		meta:"validate"
	});
	if('${session._user.auditstatus}' != '2'){
		$("#status").show();
	}
});
function uploadShow(uploadType){
	$("#orgType").attr("value",uploadType);
	$('#up_img').attr("value","");
	$("#pop_userimg").dialog({width:500,modal:true});
}
function uploadImg(){
	if($('#up_img').val()=='' || $('#up_img').val()==null){
    		$('#message').html("请选择上传图片！");
    		return false;
	}
	var uploadfile = $('#up_img').val();
	if (uploadfile != "") {
		var types = [ "png", "jpg", "jpeg","gif" ];
		var ext = uploadfile.substring(uploadfile.length - 3).toLowerCase();
		var sing = false;
		for ( var i = 0; i < types.length; i++) {
			if (ext == types[i]) {
				sing = true;
			}
		}
		if (!sing) {
			$('#message').html("图片格式错误");
			return false;
		}
	}
	$('#imgform').ajaxSubmit({
		datatype : "html",
		success : function(data) {
			if($("#orgType").val() == '280'){
				$("#pop_userimg").dialog('close');
				$('#licensecodeMsg').html(data);
			}else if($("#orgType").val() == '279'){
				$("#pop_userimg").dialog('close');
				$('#organizationMsg').html(data);	
			}else if($("#orgType").val() == '281'){
				$("#pop_userimg").dialog('close');
				$('#faxcodeMsg').html(data);	
			}else{
				$('#message').html(data);
			}
		}
	});
}
</script>
<style>
	#demo-frame > div.demo { padding: 10px !important; };
	#pop_register .input-text { float:left; width:192px; height:20px; line-height:20px; font-size:16px; background:url(/images/input_bg.png) 0 0 no-repeat; border:1px solid #d3d3d3; padding-left:5px;  font-family:"微软雅黑", "宋体", Helvetica Neue, Helvetica, Arial, sans-serif;  font-size:12px;}
	#pop_register .input-focus { background:#FFFFCC; border:1px solid #97181d; }
	#pop_register .txt-info { color:#aaa; padding-left:15px; font-size:12px; }
	#pop_register select {float: left; margin:5px 5px 0 0; height: 22px; line-height: 14px }
	#pop_register input { margin:5px; line-height: 14px}
	#pop_register label{margin-top:12px;}
	#pop_register .txt-err { color:#97181d;padding-left:15px;}
	#t_border{width:100%; border-top: 1px solid #ddd; border-right: 1px solid #ddd;}
	#t_border td{border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; padding:8px;}
</style>
</head>
<body>
<!--头部-->
<div class="header user_header">
	<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="M_menu">
&nbsp;&nbsp;账户管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;<a href="/user/Profile.act">详细信息</a>&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;编辑信息
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
	<div id="status" class="P_connect" style="display: none;">
		&nbsp;&nbsp;&nbsp;&nbsp;尊敬的 ${session._user.realname} <s:if test="#session._user.gender==1">先生：</s:if><s:else>女士：</s:else>&nbsp;感谢您注册中国资金网，您需要完善详细信息后才能使用中国资金网用户中心的各项功能。<br />
		&nbsp;&nbsp;&nbsp;&nbsp;您也可以暂时跳过稍后在进行信息完善。<span style="margin-right:15px;" class="view_detail">
		<a href="/user/UserAction!next.act" style="float:none;">以后再说</a></span>
		<br />
		&nbsp;
	
</div>
<div class="hr_10"> &nbsp; </div>
</div>
<!--tab-->
<div class="box_4 center" style="width:950px;">
	<div class="news_menu" style="height: 50px;">
        <dl style="margin-left: 30px;">
          <dd><h6>企业详细信息</h6></dd>
          <dd>
          	<s:if test="usrServiceorg==null">
				<div class="graph_red"><span style="width:0%;"></span></div>
			</s:if>
          <s:elseif test="usrServiceorg.completerate<60">
				<div class="graph_red"><span style="width:${usrServiceorg.completerate}%;"></span></div>
			</s:elseif><s:elseif test="60<=usrServiceorg.completerate && usrServiceorg.completerate<100">
				<div class="graph_orange"><span  style="width:${usrServiceorg.completerate}%;"></span></div>
			</s:elseif><s:else>
				<div class="graph_green"><span  style="width:${usrServiceorg.completerate}%;"></span></div>
			</s:else>
          </dd>
        </dl>
      </div>
    <form id="serForm" class="box_form" action="/user/Profile!update.act" method="post">
      <table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
       <s:if test="msg!=null">
          <tr>
           <td colspan="4"><div class="notification attention png_bg"><div>${msg }</div></div></td>
         </tr>
	    </s:if>
        <tr>
          <td class="a_right">企业名称：</td>
          <td colspan="3">
         	 <input id="orgname" type=text value="${ usrServiceorg.orgname}" class="input-text chne {validate:{maxlength:32}}" name="usrServiceorg.orgname" />
         	 <label for="orgname" class="error" generated="true" style="display:none;float:left;"></label>
          </td>
        </tr>
        <tr>
          <td class="a_right">营业执照号码：</td>
          <td>
          	<input type=text value="${ usrServiceorg.licensecode}" class="input-text alnum {validate:{maxlength:15}}" name="usrServiceorg.licensecode"/>
          </td>
          <td><label id="licensecodeMsg"><s:if test="profileMap['business'] != ''">${profileMap['business']}</s:if>&nbsp;</label></td>
          <td><input type="button" onclick="uploadShow(280);" class="but_gray" style="width:200px;" value="上传扫描件" /></td>
        </tr>
        <tr>
          <td class="a_right">组织机构代码证号码：</td>
          <td>
          	<input id="organization" type=text value="${ usrServiceorg.organizationcode}" class="input-text Organization {validate:{maxlength:10}}" name="usrServiceorg.organizationcode"/>
          	<label for="organization" class="error" generated="true" style="display:none;float:left;"></label>
          </td>
          <td><label id="organizationMsg"><s:if test="profileMap['orgAnization'] != ''">${profileMap['orgAnization'] }</s:if>&nbsp;</label></td>
          <td><input type="button" onclick="uploadShow(279);" class="but_gray" style="width:200px;" value="上传扫描件" /></td>
        </tr>
        <tr>
          <td class="a_right">税务登记证号码：</td>
          <td>
          	<input type=text value="${ usrServiceorg.faxcode}" class="input-text alnum {validate:{maxlength:15}}" name="usrServiceorg.faxcode"/>
          </td>
          <td><label id="faxcodeMsg"><s:if test="profileMap['taxregistration'] != ''">${profileMap['taxregistration']}</s:if>&nbsp;</label></td>
          <td><input type="button" onclick="uploadShow(281);" class="but_gray" style="width:200px;" value="上传扫描件" /></td>
        </tr>
        <tr>
          <td class="a_right">法定代表人：</td>
          <td colspan="3"><input type=text value="${ usrServiceorg.legalperson}" class="input-text chne {validate:{maxlength:6}}" name="usrServiceorg.legalperson"/></td>
        </tr>
        <tr>
          <td class="a_right">注册地址：</td>
          <td colspan="3">
          <s:select id="regProvince" name="usrServiceorg.regprovinceid" cssClass="tb_sele" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('regProvince','regCity','regDistrict');"/>
          <select id="regCity" name="usrServiceorg.regcityid" onchange="changeCity('regCity','regDistrict');" class="tb_sele">
          	 <option value="0">--请选择--</option>
          	 <s:iterator value="cityMap['regCity']">
				<option value="${id}">${name}</option>
			 </s:iterator>
          </select>
          <select id="regDistrict" name="usrServiceorg.regdistrictid" class="tb_sele">
          	<option value="0">--请选择--</option>
          	<s:iterator value="districtMap['regDistrict']">
				<option value="${id}">${name}</option>
			</s:iterator>
          </select>
          </td>
        </tr>
        <tr>
          <td class="a_right">注册详细地址：</td>
          <td colspan="3">
          	<input type="text" value="${usrServiceorg.regaddress}" class="input-text chne {validate:{maxlength:32}}" style="width:534px;" name="usrServiceorg.regaddress"/>
          </td>
        </tr>
        <tr>
          <td class="a_right">邮编：</td>
          <td colspan="3">
          	<input type=text value="${ usrServiceorg.regpostcode}" class="input-text zipCode" style="width:534px;" name="usrServiceorg.regpostcode"/>
          </td>
        </tr>
        <tr>
          <td class="a_right">注册日期：</td>
          <td>
          	<input id="regDate" type=text value="<s:date name="usrServiceorg.registerdate" />" class="input-text dateISO" name="usrServiceorg.registerdate"/>
          </td>
          <td class="a_right">注册资本：</td>
          <td><input type=text value="<s:if test="usrServiceorg.registeredcapital!=null"><s:text name="format.float"><s:param value="usrServiceorg.registeredcapital"></s:param></s:text></s:if>" class="input-text number {validate:{maxlength:12}}" name="usrServiceorg.registeredcapital"/>
          &nbsp;万元 </td></tr>
        <tr>
          <td class="a_right">机构类型：</td>
          <td colspan="3"><s:select name="usrServiceorg.orgtypeid" list="dataMap['companyType']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
        </tr>
        <tr>
          <td class="a_right">企业联系地址：</td>
          <td colspan="3"><s:select id="bizProvince" name="usrServiceorg.bizprovinceid" cssClass="tb_sele" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('bizProvince','bizCity','bizDistrict');"/>
          <select id="bizCity" name="usrServiceorg.bizcityid" onchange="changeCity('bizCity','bizDistrict');" class="tb_sele">
          	<option value="0">--请选择--</option>
          	<s:iterator value="cityMap['bizCity']">
				<option value="${id}">${name}</option>
			</s:iterator>
          </select>
          <select id="bizDistrict" name="usrServiceorg.bizdistrictid" class="tb_sele">
          	<option value="0">--请选择--</option>
          	<s:iterator value="districtMap['bizDistrict']">
				<option value="${id}">${name}</option>
			</s:iterator>
		  </select></td>
        </tr>
        <tr>
          <td class="a_right">详细地址：</td>
          <td colspan="3"><input type=text value="${ usrServiceorg.bizaddress}" class="input-text chne {validate:{maxlength:32}}" style="width:534px;" name="usrServiceorg.bizaddress"/></td>
        </tr>
        <tr>
          <td class="a_right">邮编：</td>
          <td colspan="3"><input type=text value="${ usrServiceorg.bizpostcode}" class="input-text zipCode" name="usrServiceorg.bizpostcode"/></td>
        </tr>
        <tr>
          <td class="a_right">联系人姓名：</td>
          <td colspan="3"><input type=text value="${ usrServiceorg.linkname}" class="input-text {validate:{maxlength:6}} chne" name="usrServiceorg.linkname"/>
          </td>
        </tr>
        <tr>
          <td class="a_right">联系人性别：</td>
          <td colspan="3">&nbsp;
          <s:if test="usrServiceorg == null || usrServiceorg.linkgender == null">
          <s:radio id="gender1" name="usrServiceorg.linkgender" list="#{1:'先生',0:'女士'}" value="1" listKey="key" listValue="value"/>
          </s:if><s:else>
          <s:radio id="gender2" name="usrServiceorg.linkgender" list="#{1:'先生',0:'女士'}" value="usrServiceorg.linkgender" listKey="key" listValue="value"/>
          </s:else>
          </td>
        </tr>
        <tr>
          <td class="a_right">联系人邮箱：</td> 
          <td><input id="linkemail" type=text value="${ usrServiceorg.linkemail}" class="input-text iemail {validate:{maxlength:32}}" name="usrServiceorg.linkemail"/>
          <label for="linkemail" class="error" generated="true" style="display:none;float:left;"></label></td>
          <td class="a_right">联系人电话：</td>
          <td><input type=text value="${ usrServiceorg.linktelephone}" class="input-text mobilephone {validate:{maxlength:13}}" name="usrServiceorg.linktelephone"/></td>
        </tr>
        <tr>
          <td class="a_right">所属部门：</td>
          <td><input id="department" type=text value="${ usrServiceorg.department}" class="input-text {validate:{maxlength:15}} chne" name="usrServiceorg.department"/>
          <label for="department" class="error" generated="true" style="display:none;float:left;"></label></td>
          <td class="a_right">职位：</td>
          <td><input type=text value="${ usrServiceorg.position}" class="input-text {validate:{maxlength:15}} chne" name="usrServiceorg.position"/></td>
        </tr>
        <tr>
          <td class="a_right">服务产品：</td>
          <td colspan="3"><s:iterator value="dataMap['serviceproduct']" id="sproduct">
          		<input type="checkbox" value="${sproduct.id}" name="usrServiceorg.serviceproduct" 
          		<s:iterator value="usrServiceorg.serviceproductList" id="selected">
          			<s:if test="#sproduct.id==#selected">checked="checked"</s:if>
          		</s:iterator>/>${sproduct.name}
          </s:iterator></td>
        </tr>
        <tr>
          <td class="a_right">服务介绍：</td>
          <td colspan="3"><textarea name="usrServiceorg.remarks" style="width: 550px;height: 150px;">${ usrServiceorg.remarks}</textarea></td>
        </tr>
      <tr>
           <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;">
           <input type="submit" class="but_gray" style="width:200px;" value="保存" />&nbsp;&nbsp;
           <input type="button" class="but_gray" onclick="javascript:window.location.href='/user/Profile.act'" style="width:200px;" value="取消" />
           </td>
         </tr>                           
       </table> 
    </form>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
</div>
<!--弹出框内容上传扫描件--> 
<div id="pop_userimg" style="display:none;" title="上传扫描件">
  <form id="imgform" action="/user/uploadOrg.act" method="post" enctype="multipart/form-data">
   <table id="t_border">
   	<tr><td><h6>选择图片 &nbsp;&nbsp; <span id="message" style="color: red"></span></h6></td></tr>
   	<tr><td><s:hidden id="orgType" name="orgType" value="0" /><s:file id="up_img" name="upload" /><input type="button" onclick="uploadImg();" value="确认提交"/></td></tr>
   	<tr><td></td></tr>
   	<tr><td>说明：支持png、jpg、jpeg、gif格式 单个文件大小小于3M</td></tr>
   </table>
  </form>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>