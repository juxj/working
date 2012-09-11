<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>快速申请查看</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/xheditor-1.1.14-zh-cn.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script language="javascript">
//文本框触发焦点效果s
    $(function() {
        finance_type_chenge('${product.financeType}');
    });
    
function finance_type_chenge(financeType){
	if(financeType == '151'){
		$('.finance_type_152').hide();
		$('.finance_type_153').hide();
		$('.finance_type_154').hide();
		$('.finance_type_151').show();
	}else if(financeType == '152'){
		$('.finance_type_151').hide();
		$('.finance_type_153').hide();
		$('.finance_type_154').hide();
		$('.finance_type_152').show();
	}else if(financeType == '153'){
		$('.finance_type_151').hide();
		$('.finance_type_152').hide();
		$('.finance_type_154').hide();
		$('.finance_type_153').show();
	}else if(financeType == '154'){
		$('.finance_type_151').hide();
		$('.finance_type_152').hide();
		$('.finance_type_153').hide();
		$('.finance_type_154').show();
	}
}

function updatestatus(value){
	if (window.confirm('确定提交吗！')) {
		$("#applyStatus").attr("value",value);
		$("#loanForm").submit();
	}
}

//推荐产品
function Recommend(id,appId){
	$("#pro_recommend").dialog({
		width:990,
		height:418,
		modal: true
	});
	$.post("/admin/loan/loanRequest!recommendProduct.act",{requestId:id,appId:appId,loanAmount:$("#loanAmount").val(),loanMonth:$("#loanMonth").val(),orgId:$("#organization").val()},function(data){
		$("#pro_recommend").html(data);
	});
	return false;
} 

//选择推荐产品后提交
function SelectRecom(){
	var arrChk=$("input[name='checkId']:checked");
	if(arrChk.length>3){
		alert("最多只能推荐3款产品！");
		return false;
	}
	var checkIds = new Array(arrChk.length);
    for(var j=0;j<arrChk.length;j++){
    	checkIds[j] = arrChk[j].value
    }
    //console.info("dd="+checkIds.toString())
	$.post("/admin/loan/loanRequest!selectRecProdcutAdmin.act",{checkId:checkIds.toString(),requestId:$("input[name='requestId']").val()});
	$("#pro_recommend").dialog("close");
}
</script>
  </head>
  
  <body>
<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
<!--主体部分开始-->
<div class="apply_title" style="height:60px;">
	<p>需求查看</p>
</div>
<div class="hr_10"> &nbsp; </div>
<form action="/admin/loan/loanRequest!updateStatus.act" id="loanForm"  class="box_form" style="margin:0px;" method="post">
<input type="hidden" name="loan.id" value="<s:property value="loan.id"/>"/>
<input type="hidden" name="loan.applyStatus" id="applyStatus" />
<div class="apply_form">
		<div class="apply_form_title">状态详情&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span></div>
		<div class="C_form" style="margin-top:20px;">
			<table style="width:660px; font-size:13px;">
				<tr>
					<td width="25%" align="right">状态：</td>
					<td style="padding:15px;"><common:print valueId="loan.applyStatus" /> </td>
					<td colspan="2" width="50%" style="padding:15px;">
	   				<s:if test="loan.applyStatus == 143">
						<input type="button" value="审核通过"  class="but_gray" onclick="updatestatus(145);" ></input>
						<input type="button" value="审核未通过"  class="but_gray" onclick="updatestatus(144);" ></input>
					</s:if>
					<s:else>
						状态：<common:print valueId="loan.applyStatus" />&nbsp;&nbsp;&nbsp;
					</s:else>
					<s:if test="loan.applyStatus == 145">
						<input type="hidden" id="organization" name="organization" value="${loan.loanOrganization}"/>
						<input type="hidden" id="loanAmount" name="loanAmount" value="${loan.loanAmount}"/>
						<input type="hidden" id="loanMonth" name="loanMonth" value="${loan.loanMonth}"/>
						<input type="button" value="推荐产品"  class="but_gray" onclick="Recommend(${loan.id },${loan.applyType });" ></input>
					</s:if>
					</td>
				</tr>
			</table>
		</div>
</div>	

<div class="hr_10">&nbsp;</div>	
<div class="apply_form">
		<div class="apply_form_title">需求信息</div>
		<div class="C_form" style="margin-top:20px;">
			<table style="width:660px; font-size:13px;">
				<tr>
					<td width="25%" align="right">需求编号：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.applyNum"/> </td>
					<td width="25%" align="right">融资产品类型：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.applyType" /> </td>
				</tr>
				<tr>
					<td width="25%" align="right">需求金额：</td>
					<td width="25%" style="padding:15px;"><s:number name="loan.loanAmount" />万元 </td>
					<td width="25%" align="right">期限：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.loanMonth" />个月 </td>
				</tr>
				<tr>
					<td width="25%" align="right">用途：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.loanPurpose"/> </td>
					<td width="25%" align="right">需求方名称：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.busiName" /> </td>
				</tr>
				<tr>
					<td width="25%" align="right">是否有抵押物：</td>
					<td width="25%" style="padding:15px;"><s:if test="loan.haveMortgage==1">有</s:if><s:else>无</s:else> </td>
					<td width="25%" align="right">接受还款方式：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.repaymentType" /> </td>
				</tr>
				<tr>
					<td width="25%" align="right">接受金融机构：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.loanOrganization" valueSetMap="ZJ110"/> </td>
					<td width="25%" align="right">接受利率：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.rateLowerLimit" />~<s:property value="loan.rateUpperLimit" />% </td>
				</tr>
				<tr>
					<td width="25%" align="right">发布时间：</td>
					<td width="25%" style="padding:15px;"><s:date name="loan.createdt" format="yyyy-MM-dd"/> </td>
					<td width="25%" align="right">有效截止日期：</td>
					<td width="25%" style="padding:15px;"><s:date name="loan.effectiveDateend" format="yyyy-MM-dd"/> </td>
				</tr>
			</table>
		</div>
</div>
<div class="hr_10">&nbsp;</div>
	<div class="clear">&nbsp;</div>
	<div class="apply_form">
	<div class="apply_form_title">需求方信息</div>
		<div class="C_form" style="margin-top:20px;">
			<table style="width:660px; font-size:13px;">
			<!-- 
				<tr>
					<td width="25%" align="right">姓名：</td>
					<td width="25%" style="padding:15px;"><s:property value="user.username" /> </td>
					<td width="25%" align="right">出生年月：</td>
					<td width="25%" style="padding:15px;"><s:date name="loan.birthday" format="yyyy-MM-dd"/> </td>
				</tr>
				<tr>
					<td width="25%" align="right">教育程度：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.teachLevel"/> </td>
					<td width="25%" align="right">现单位性质：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.companyType" /></td>
				</tr>
				<tr>
					<td width="25%" align="right">现单位工作时长：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.workTime"/> </td>
					<td width="25%" align="right">税后月收入：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.salaryLevel" /> </td>
				</tr>
				<tr>
					<td width="25%" align="right">发薪形式：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.putSalaryType"/> </td>
					<td width="25%" align="right">自有房产：</td>
					<td width="25%" style="padding:15px;"><s:if test="loan.haveHouse==1">有</s:if><s:else>无</s:else> </td> 
				</tr>
			 -->
				<tr>
					<td width="25%" align="right">银行借款经历：</td>
					<td width="25%" style="padding:15px;"><s:if test="loan.hostoryLoan==1">有</s:if><s:else>无</s:else></td>
					<td width="25%" align="right">使用信用卡经历：</td>
					<td width="25%" style="padding:15px;"><s:if test="loan.userCreditCard==1">有</s:if><s:else>无</s:else> </td>
				</tr>
				<tr>
					<td width="25%" align="right">银行流水：</td>
					<td colspan="3"  style="padding:15px;"><s:if test="loan.bankSalaryList==1">有</s:if><s:else>无</s:else> </td>
				</tr>
			</table>
		</div>
	</div>	
</form>
</div>
</div>
<!--弹出框内容推荐产品页面-->
<div id="pro_recommend" style="display:none;" title="请选择推荐融资产品：">
    
</div>
  </body>
</html>
