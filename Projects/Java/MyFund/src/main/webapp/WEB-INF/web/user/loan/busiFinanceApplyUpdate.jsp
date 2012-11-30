<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui-1.8.21.custom.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/jquery-ui-1.8.21.custom.min.js" > </script>
<script language="javascript">
//文本框触发焦点效果s
$(function() {
	var j = new Date();
	var y = j.getFullYear() - 1;
	$('.year').html(y);
	var jm = j.getFullYear() + "年" + j.getMonth() + "月";
	$('.yearmoth').html(jm);
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    })
})


$(function(){
	$("#loanForm").validate();
});
function otherPurpose(){
	var j = $('#other').val();
	if(j==68){
		$('#otherPurpose').html("<input type='text' name='apply.loanPurposeOther' class='required'/>");
	}else{
		$('#otherPurpose').html('');
	}
}

jQuery.validator.addMethod("loanAmount", function(value, element, param) {
return this.optional(element) || (value >= param[0] && value <= param[1]);
}, $.validator.format("必须大于{0}小于{1}"));

jQuery.validator.addMethod("assetSumcls", function(value, element, param) {
var s1 = $('#' + param[0]).val();
var s2 = $('#' + param[1]).val();
return this.optional(element) || (value - s1 >= 0 && value - s2 >= 0);
}, $.validator.format("总资产必须大于融资金额与总负债"));
</script>

  </head>
  
  <body>
<!--头部2-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="M_menu">
		融资管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;
		<a href="/user/loan/userApplyManag.act">融资申请管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;
		<a href="/user/loan/userApplyManag!viewFinanceApply.act?apply.id=${apply.id }">融资申请查看</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;修改申请信息
	</div>
<div class="container_950">
	
	<div class="box_3">
	<form action="/user/loan/userApplyManag!updateApply.act" id="loanForm"  class="box_form" style="margin:0px;" method="post">
	<!-- 企业经营贷款快速申请类型=136 -->
	<s:hidden name="apply.id"></s:hidden>
		<div class="C_title">融资需求信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span>
		</div>
		<div class="C_form">
	            <dl>
	              <dd>
	                <h6>融资用途：</h6>
	                <common:select id="other" name="apply.loanPurpose" valueSetId="14" cssClass="S_width" style="width:160px;" onchange="otherPurpose()"></common:select>
	              	<div id="otherPurpose">
	              		<s:if test="apply.loanPurpose == 68">
	              			<input type='text' name='apply.loanPurposeOther' class='required' value="${apply.loanPurposeOther }"/>
	              		</s:if>
	              	</div>
	              </dd>
	              <dd> 
	                <h6>融资金额：</h6>
	                <s:textfield name="apply.loanAmount" cssClass="input-text required digits" id="apply_loanAmount" maxlength="6"></s:textfield>&nbsp;&nbsp;万元
	                <label for="apply_loanAmount" class="error" generated="true" style="display:none;"></label>
	              </dd>
	              <dd>
	                <h6>融资期限：</h6>
	                <s:textfield name="apply.loanMonth" cssClass="input-text required digits" id="apply_loanMonth" maxlength="2"></s:textfield>&nbsp;&nbsp;个月
	                <label for="apply_loanMonth" class="error" generated="true" style="display:none;"></label>
					</dd>
					<dd>
	                <h6>是否有抵押物：</h6>
					  <input id="radio1" type="radio" name="apply.haveMortgage" value="1" class="required" <s:if test="apply.haveMortgage == 1">checked</s:if>/><label for="radio1">能提供</label>
					  <input id="radio2" type="radio" name="apply.haveMortgage" value="0" <s:if test="apply.haveMortgage == 0">checked</s:if>/><label for="radio2">无法提供</label>
					</dd>
				 </dl>
		</div>
		<div class="clear"></div>
		<div class="C_title">申请企业信息</div>
		<div class="C_form">
			<dl>
				<dd>
					<h6 style="width:260px">企业<span class="year"></span>年销售额约为：</h6>
					<s:textfield name="apply.lastyearSaleVolume" cssClass="input-text required number"  id="apply.lastyearSaleVolume" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
					<label for="apply.lastyearSaleVolume" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6 style="width:260px">企业<span class="year"></span>年经营成本约为：</h6>
					<s:textfield name="apply.lastyearCost" cssClass="input-text required number"  id="apply.lastyearCost" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
					<label for="apply.lastyearCost" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6 style="width:260px">企业<span class="year"></span>年净利润率约为：</h6>
					<s:textfield name="apply.lastyearProfit" cssClass="input-text required number"  id="apply.lastyearProfit" maxlength="10"></s:textfield>&nbsp;&nbsp;%
					<label for="apply.lastyearProfit" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6 style="width:260px">截止到<span class="yearmoth"></span>，企业应收账款约为：</h6>
					<s:textfield name="apply.receivable" cssClass="input-text required number"  id="apply.receivable" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
					<label for="apply.receivable" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6 style="width:260px">截止到<span class="yearmoth"></span>，企业总库存约为：</h6>
					<s:textfield name="apply.stockSum" cssClass="input-text required number"  id="apply.stockSum" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
					<label for="apply.stockSum" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6 style="width:260px">截止到<span class="yearmoth"></span>，企业总资产约为：</h6>
					<s:textfield name="apply.assetSum" cssClass="input-text required number"  id="apply.assetSum" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
					<!--  {assetSumcls:['apply_debtSum','apply_loanAmount']} -->
					<label for="apply.assetSum" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6 style="width:260px">截止到<span class="yearmoth"></span>，企业总负债约为：</h6>
					<s:textfield name="apply.debtSum" cssClass="input-text required number"  id="apply_debtSum" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
					<label for="apply_debtSum" class="error" generated="true" style="display:none;"></label>
				</dd>
			</dl>
		</div>
		<div class="clear"></div>
		<div class="C_title">其它申请信息</div>
		<div class="C_form">
			<dl>
				<s:iterator value="extendsPropertyList" id="epid">
					<dd>
						<h6 style="width:235px">${fieldName }：</h6>
						<s:if test="fieldType == 1">
							<input type="text" name="epValue${id }" value="${entityValue }" class="input-text required"/>
						</s:if>
						<s:if test="fieldType == 2">
							<textarea name="epValue${id }" rows="5" cols="50" class="required">${entityValue }</textarea>
						</s:if>
						<s:if test="fieldType == 3">
							<select name="epValue${id }">
								<s:iterator value="propertyDicSet">
									<option value="${dicValue }" <s:if test='selected == 1'>selected</s:if>>${dicName }</option>
								</s:iterator>
							</select>
						</s:if>
						<s:if test="fieldType == 4">
							<s:iterator value="propertyDicSet">
								<input type="checkbox" name="epValue${epid.id }" value="${dicValue }" class="required" <s:if test='selected == 1'>checked</s:if>/>${dicName }
							</s:iterator>
							<label for="epValue${epid.id }" class="error" generated="true" style="display:none;"></label>
						</s:if>
					</dd>
				</s:iterator>
			</dl>
		
			<div class="hr_10"> &nbsp; </div>
			<div class="center" style="width:400px;">
				<s:submit value="保存"  cssClass="but_gray" style="width:200px;" id="loanSubmit"></s:submit>
			</div>
			<div class="hr_10"> &nbsp; </div>
			<div class="hr_10"> &nbsp; </div>
		</div>
	</form>
	</div>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
