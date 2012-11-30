<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>快速申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public2.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/load-loan.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/proofRule.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script language="javascript">
$(document).ready(function(){
	$("#birthday").datepicker({changeMonth: true,changeYear: true,maxDate: "-18y"});
	$("#city").val('${usrPerson.cityid}');
	$("#district").val('${usrPerson.districtid}');
	$("#personForm").validate({
		meta:"validate"
	});
	$("#auditForm").validate({
		meta:"validate"
	});
	$("#bizCity").val('${usrCompany.bizcityid}');
	$("#bizDistrict").val('${usrCompany.bizdistrictid}');
	$("#industry").val('${usrCompany.industryid}');
});
</script>
</head>

<body>
<!--头部2-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<!--主体部分开始-->
<div class="hr_10"> &nbsp; </div>
<div class="apply_title" >
	<p>
	<s:if test="loan.applyType == 136">
		企业经营贷款快速申请
	</s:if>
	<s:elseif test="loan.applyType == 137">
		个人综合消费快速申请
	</s:elseif>
	<s:elseif test="loan.applyType == 138">
		个人经营快速申请
	</s:elseif>
	<s:elseif test="loan.applyType == 139">
		个人购房快速申请
	</s:elseif>
	</p>
	<div class="apply_menu">
        <div class="apply_menu_text0001">1、填写申请信息</div>
        <div class="apply_menu_text0002">2、完善需求</div>
        <div class="apply_menu_text0003">3、
        <s:if test="applyNum==null or applyNum==''">申请失败</s:if>
        <s:else>申请成功</s:else>
        </div>	
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
	<div class="S_table_icon">
		<s:if test="applyNum==null or applyNum==''">
			<img src="/images/wrong_ico.png" />
		</s:if>
		<s:else>
			<img src="/images/S_icon.png" />
		</s:else>
	</div>
	<div class="S_table_connect">
		<s:if test="applyNum==null or applyNum==''">
			<span class="Prompt_01">			
				<s:if test="msg == 1">
					对不起！您尚未登录，请登录后再提交申请。
				</s:if>
				<s:elseif test="msg == 2">
					只有个人用户与企业用户可以申请融资！
				</s:elseif>
				<s:elseif test="msg == 3">
					个人用户不允许申请企业融资！
				</s:elseif>
				<s:elseif test="msg == 4">
					企业用户不允许申请个人融资！
				</s:elseif>
			</span>
		</s:if>
		<s:else>		
			<span class="Prompt_01">恭喜您,您的贷款需求成功提交！</span><br/>
			<span class="Prompt_02">您的贷款需求编号为<span style="color:#97181D;"><a href="/user/loan/LoanRequest!loanManageDetail.act?industryId=${loan.id }"><s:property value="applyNum"/></a></span> ，您可以在您的用户中心在贷款需求管理中查看。</span><br/>
			<span class="Prompt_02">我们的工作人员将在1-3个工作日内与您进行联系。</span>
			<div class="hr_10"> &nbsp; </div>
			<div class="hr_10"> &nbsp; </div>
			<s:if test="#session._user.auditstatus != 2">
			   <s:if test="#session._user.userTypeGroup == 5">
				<div class="box_4 center" style="width:792px;">
				<div class="news_menu" style="height: 50px;">
			        <dl>
			          <dd style="margin-left: 30px;"><h6>您的个人信息未通过审核，请完善个人信息</h6></dd>
			        </dl>
			      </div>
				<form id="personForm" action="/loan/LoanRequest!auditProfile.act" method="post" class="box_form">
				<s:hidden name="applyNum"></s:hidden>
				<s:hidden name="loan.applyType"></s:hidden>
			       <table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
			         <s:if test="msg!=null">
			          <tr>
			           <td colspan="4"><div class="notification attention png_bg" style="width:600px;"><div>${msg }</div></div></td>
			         </tr>
				     </s:if>
			         <tr>
			           <td class="a_right">姓名：</td>
			           <td colspan="3" class="v-align">${session._user.realname}</td>
			         </tr>
			         <tr>
			           <td class="a_right">出生年月：</td>
			           <td colspan="3" class="v-align"><input id="birthday" type="text" value="<s:date name="usrPerson.birthday" />" class="input-text dateISO userbirthday" name="usrPerson.birthday"/><span class="ask_text"></span></td>
			         </tr>
			         <tr>
			           <td class="a_right" style="vertical-align:top;">教育程度：</td>
			           <td colspan="3" class="v-align">
			           	<s:select name="usrPerson.education" list="dataMap['eduAtion']" value="usrPerson.education" cssClass="tb_sele" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select>                    
			           </td>
			         </tr>
			         <tr>
			           <td class="a_right" style="vertical-align:top;">身份证号码：</td>
			           <td colspan="3" class="v-align"><input type=text value="${usrPerson.cid}" class="input-text idcardno" name="usrPerson.cid"/></td>
			         </tr>
			         <tr>
			           <td class="a_right">所在地：</td>
			           <td colspan="3" class="v-align">
			            <s:select id="province" name="usrPerson.provinceid" cssClass="tb_sele" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province','city','district');"/><span style="float:left;">省/直辖市&nbsp;</span>
			            <select id="city" name="usrPerson.cityid" onchange="changeCity('city','district');" class="tb_sele">
			          	 <option value="0">--请选择--</option>
			          	 <s:iterator value="cityMap['city']">
							<option value="${id}">${name}</option>
						 </s:iterator>
			          	</select><span style="float:left;">市&nbsp;</span>
			            <select id="district" name="usrPerson.districtid" class="tb_sele">
			          	 <option value="0">--请选择--</option>
			          	 <s:iterator value="districtMap['district']">
							<option value="${id}">${name}</option>
						 </s:iterator>
			          	</select><span style="float:left;">区/县&nbsp;</span>         
			           </td>
			         </tr>
			         <tr>
			           <td class="a_right">详细地址：</td>
			           <td colspan="3" class="v-align"><input type=text value="${usrPerson.address }" class="input-text {validate:{maxlength:32}} chne" style="width:534px;" name="usrPerson.address" /><span class="ask_text"></span></td>
			         </tr>              
			         <tr>
			           <td class="a_right" style="vertical-align:top;">邮政编码：</td>
			           <td colspan="3" class="v-align"><input type="text" value="${usrPerson.postcode }" name="usrPerson.postcode" id="textfield" class="input-text zipCode"/><span class="ask_text"></span></td>
			         </tr>            
			         <tr>
			           <td class="a_right" style="vertical-align:top;">职业：</td>
			           <td colspan="3" class="v-align">
			            <s:select name="usrPerson.careerid" list="dataMap['psersoncareer']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--" cssClass="tb_sele"/>               	
			           </td>
			         </tr>
			         <tr>
			           <td class="a_right">固定电话：</td>
			           <td colspan="3" class="v-align"><input type="text" value="${usrPerson.telephone }" class="input-text phone" name="usrPerson.telephone"/><span class="ask_text"></span></td>
			         </tr>
			         <tr>
			           <td class="a_right">联系方式：</td>
			           <td colspan="3" class="v-align"><s:select name="usrPerson.im1type" list="dataMap['mtool']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--" cssClass="tb_sele"/>
			          <input type=text value="${usrPerson.im1 }" class="input-text {validate:{maxlength:32}} chne" name="usrPerson.im1"/><span class="ask_text"></span></td>
			         </tr>
			         <tr>
			           <td class="a_right">&nbsp;</td>
			           <td colspan="3"><s:select name="usrPerson.im2type" list="dataMap['mtool']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--" cssClass="tb_sele"/>
			          <input type=text value="${usrPerson.im2 }" class="input-text {validate:{maxlength:32}} chne" name="usrPerson.im2"/><span class="ask_text"></span></td>
			         </tr>
			         <tr>
			           <td class="a_right">&nbsp;</td>
			           <td colspan="3" class="v-align"><s:select name="usrPerson.im3type" list="dataMap['mtool']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--" cssClass="tb_sele"/>
			          <input type=text value="${usrPerson.im3 }" class="input-text {validate:{maxlength:32}} chne" name="usrPerson.im3"/><span class="ask_text"></span></td>
			         </tr>
			         <tr>
			           <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;"><input type="submit" class="btnsub bred" style="width:200px;" value="保存" /></td>
			         </tr>
			       </table>        	
			   	  </form>
				</div>
				</s:if>
				<s:elseif test="#session._user.userTypeGroup == 1">
					<div class="box_4 center" style="width:792px;">
				      <div class="gray news_menu tab_menu2">
				         <dl>
			          	<dd style="margin-left: 30px;"><h6>您的企业基本信息未通过审核，请完善企业基本信息</h6></dd>
				        </dl>
				      </div>
				    <form id="auditForm" class="box_form" action="/loan/LoanRequest!auditProfile.act" method="post" >
				    <s:hidden name="applyNum"></s:hidden>
				    <s:hidden name="loan.applyType"></s:hidden>
				    
				       <table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
						     <s:if test="msg!=null">
					          <tr>
					           <td colspan="4"><div class="notification attention png_bg" style="width:600px;"><div>${msg }</div></div></td>
					         </tr>
						     </s:if>
				           <tr>
				             <td class="a_right">企业名称：</td>
				             <td colspan="3" class="v-align"><input type="hidden" name="companyMark" value="1"/><input id="companyname" type="text" value="${usrCompany.companyname }" class="input-text chne {validate:{maxlength:15}}"  name="usrCompany.companyname"/>
				       	    </td>
				           </tr>
				           <tr>
				             <td class="a_right">营业执照号码：</td>
				             <td colspan="3" class="v-align">
				             <input type="text" value="${usrCompany.licensecode }" class="input-text alnum {validate:{maxlength:15}}" name="usrCompany.licensecode"/>
				             </td>
				           </tr>
				           <tr>
				             <td class="a_right">所属行业：</td>
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
				            <td class="a_right">组织机构代码证号码：</td>
				            <td colspan="3" class="v-align"><input id="organizationcode" type="text" value="${usrCompany.organizationcode }" class="input-text Organization {validate:{maxlength:10}}" name="usrCompany.organizationcode" /></td>
				          </tr>
				          <tr>
				             <td class="a_right">企业经营地址：</td>
				             <td colspan="3" class="v-align">
				              <s:select id="bizProvince" name="usrCompany.bizprovinceid" list="listProvince" headerKey="0" headerValue="--请选择--"  listKey="id" listValue="name" onchange="changeProvince('bizProvince','bizCity','bizDistrict');"/>
				              <select id="bizCity" name="usrCompany.bizcityid" onchange="changeCity('bizCity','bizDistrict');">
				                <option value="0">--请选择--</option>
				          	    <s:iterator value="cityMap['bizCity']">
								  <option value="${id}">${name}</option>
							    </s:iterator>
					          </select>
					         <select id="bizDistrict" name="usrCompany.bizdistrictid">
					          <option value="0">--请选择--</option>
					         	<s:iterator value="districtMap['bizDistrict']">
								 <option value="${id}">${name}</option>
							    </s:iterator>
						     </select>         
				           </td>
				        </tr>
				        <tr>
				           <td class="a_right">详细地址：</td>
				           <td colspan="3" class="v-align"><input type="text" value="${usrCompany.bizaddress }" class="input-text chne {validate:{maxlength:32}}" style="width:534px;" name="usrCompany.bizaddress"/></td>
				       </tr>              
				       <tr>
				          <td class="a_right" style="vertical-align:top;">邮政编码：</td>
				          <td colspan="3" class="v-align"><input type="text" value="${usrCompany.bizpostcode }" class="input-text zipCode" name="usrCompany.bizpostcode"/></td>
				       </tr>            
				       <tr>
				         <td class="a_right">联系人姓名：</td>
				         <td colspan="3" class="v-align">
				           <input type=text value="${usrCompany.linkname }" class="input-text {validate:{maxlength:6}} chcharacter" name="usrCompany.linkname"/>
				   			&nbsp;&nbsp;<s:radio id="linkgender" name="usrCompany.linkgender" list="#{1:'先生',0:'女士'}"  value="usrCompany.linkgender"/>                	
				         </td>
				       </tr>
				       <tr>
				         <td class="a_right">联系人邮箱：</td>
				       	 <td class="v-align">
				          <input id="linkemail" type=text value="${usrCompany.linkemail }" class="input-text iemail {validate:{maxlength:30}}" name="usrCompany.linkemail"/>
				         </td>
				         <td class="a_right" style="width:100px;">联系人电话：</td>
				         <td class="v-align">
				         	<input type=text value="${usrCompany.linktelephone }" class="input-text mobile {validate:{maxlength:20}}" name="usrCompany.linktelephone"/>
				         </td>                
				      </tr>
				       <tr>
				         <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;"><input type="submit" class="btnsub bred" style="width:200px;" value="保存信息" /></td>
				       </tr>                           
				     </table>
				 </form>
				</div>
				
				</s:elseif>
			</s:if>
		</s:else>
	</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
	<div class="center" style="width:200px;">
		<s:if test="applyNum==null or applyNum==''">
			<s:if test="msg == 1">
				<s:if test="loan.applyType==136">
				<input type="button" onclick="window.location='/loan/LoanRequest!busiFirst.act?loan.loanAmount=${loan.loanAmount}&loan.loanMonth=${loan.loanMonth }'" class="btnsub bred" style="width:150px;" value="登陆" />
				</s:if>
				<s:if test="loan.applyType==138">
				<input type="button" onclick="window.location='/loan/LoanRequest!perrunFirst.act?loan.loanAmount=${loan.loanAmount}&loan.loanMonth=${loan.loanMonth }'" class="btnsub bred" style="width:150px;" value="登陆" />
				</s:if>
			</s:if>
			<s:else>
				<input type="button" onclick="window.location='/Index.act'" class="btnsub bred" style="width:150px;" value="返回首页" />
			</s:else>
		</s:if>
		<s:else>
		  <s:if test="#session._user.auditstatus==2">
		  	<input type="button" onclick="window.location='/user/UserAction.act'" class="btnsub bred" style="width:150px;" value="确定" />
		  </s:if>
		</s:else>
	</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
