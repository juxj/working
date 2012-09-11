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
	$.post("/admin/loan/loanRequest!recommendProduct.act",{requestId:id,appId:appId,orgId:$("#organization").val()},function(data){
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
						<input type="button" value="推荐产品"  class="but_gray" onclick="Recommend(${loan.id },${loan.applyType });" ></input>
					</s:if>
					</td>
				</tr>
			</table>
		</div>
</div>	
	<div class="hr_10"> &nbsp; </div>		
	<div class="apply_form">
		<div class="apply_form_title">需求方信息</div>
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
					<td width="25%" style="padding:15px;"><s:number name="loan.loanAmount" />万元</td>
					<td width="25%" align="right">期限：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.loanMonth" />个月 </td>
				</tr>
				<tr>
					<td width="25%" align="right">用途：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.loanPurpose"/> </td>
					<td width="25%" align="right">是否有抵押物：</td>
					<td width="25%" style="padding:15px;">
						<common:print valueId="loan.haveMortgage" valueSetMap="ZJ102" /> </td>
				</tr>
				<tr>
					<td width="25%" align="right">接受金融机构：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.loanOrganization" valueSetMap="ZJ110"/> </td>
					<td width="25%" align="right">接受利率：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.rateLowerLimit" />~<s:property value="loan.rateUpperLimit" />% </td>
				</tr>
				<tr>
					<td width="25%" align="right">发布时间：</td>
					<td colspan="3" width="25%" style="padding:15px;"><s:date name="loan.createdt" format="yyyy-MM-dd"/> </td>
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
					<td width="25%" align="right">企业经营类型：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.busiRunningType" valueSetMap="ZJ111"/></td>
					<td width="25%" align="right">上年度销售额：</td>
					<td width="25%" style="padding:15px;">${loan.lastyearVolume}万元</td>
				</tr>
				<tr>
					<td width="25%" align="right">上年度资产负债率：</td>
					<td width="25%" style="padding:15px;">${loan.lastyearDebt} %</td>
					<td width="25%" align="right">上年度销售成本：</td>
					<td width="25%" style="padding:15px;">${loan.lastyearCost}万元</td>
				</tr>
				<tr>
					<td width="25%" align="right">上年度净利润：</td>
					<td width="25%" style="padding:15px;" colspan="3">${loan.lastyearProfit }万元</td>
				</tr>
			</table>
		</div>
</div>
			
		<div class="hr_10"> &nbsp; </div>
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
