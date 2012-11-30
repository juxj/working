<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>个人经营性贷款申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui-1.8.21.custom.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/jquery-ui-1.8.21.custom.min.js" > </script>
<script type="text/javascript" src="/script/public.js" > </script>
<script language="javascript">
//文本框触发焦点效果s
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
});
$(function(){
	$("#applyForm").validate();
});
function otherPurpose(){
	var j = $('#other').val();
	if(j==68){
		$('#otherPurpose').html("<input type='text' name='apply.loanPurposeOther' class='required'/>");
	}else{
		$('#otherPurpose').html('');
	}
}

	function industryList(id){
		if(id!=''){
			$.post("/user/loan/financeApply!industry.act",{industryId:id},function(data){
				$("#runningTradeChild").html(data);
			});
		}
	}
	
	function industryListAndSel(id,childId){
		if(id!=''){
			$.post("/user/loan/financeApply!industry.act",{industryId:id},function(data){
				$("#runningTradeChild").html(data);
				$("#runningTradeChild").val(childId);
			});
		}
	}
jQuery.validator.addMethod("loanAmount", function(value, element, param) {
return this.optional(element) || (value >= param[0] && value <= param[1]);
}, $.validator.format("必须大于{0}小于{1}"));
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
	<form action="/user/loan/userApplyManag!updateApply.act" id="applyForm" method="post" class="box_form" style="margin:0px;" >
	<!-- 个人经营性贷款快速申请类型 -->
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
		<div class="C_title">个人及经营信息</div>
		<div class="C_form">
			<dl>
				<dd>
					<h6>行业：</h6>
					<select id="runningTrade"  name="apply.runningTrade" onchange="industryList(this.options[this.options.selectedIndex].value)"  class="required">
						<option value="">--请选择--</option>
	                	<s:iterator value="industryList">
							<option value="${id}" <s:if test='apply.runningTrade == id'>selected</s:if>>${name}</option>
						</s:iterator>
					</select>
					<script language="javascript">
						industryListAndSel('${apply.runningTrade}','${apply.runningTradeChild}');
						
					</script>
					<select id="runningTradeChild" name="apply.runningTradeChild">
						<option>--请选择--</option>
					</select>
				</dd>
				<dd>
					<h6>行业经验：</h6>
					<s:textfield name="apply.experience" cssClass="input-text required" maxlength="3" id="apply.experience"></s:textfield>&nbsp;&nbsp;年
					<label for="apply.experience" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6>年营业额：</h6>
					<common:select name="apply.allyearVolume" valueSetId="24" cssClass="S_width"></common:select>
					<label for="apply.allyearVolume" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6>经营场所：</h6>
					<s:radio name="apply.runningArea" list="%{#{1:'有',0:'无'}}" cssClass="required"></s:radio>
					<label for="apply.runningArea" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6>银行借款经历：</h6>
					<s:radio name="apply.hostoryLoan" list="%{#{1:'有',0:'无'}}" cssClass="required"></s:radio>
					<label for="apply.hostoryLoan" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6>使用信用卡经历：</h6>
					<s:radio name="apply.useCreditcard" list="%{#{1:'有',0:'无'}}" cssClass="required"></s:radio>
					<label for="apply.useCreditcard" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6>银行流水：</h6>
					<s:radio name="apply.bankSalaryList" list="%{#{1:'能提供',0:'无法提供'}}" cssClass="required"></s:radio>
					<label for="apply.bankSalaryList" class="error" generated="true" style="display:none;"></label>
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
				<s:submit value="确定"  cssClass="but_gray" style="width:200px;" id="loanSubmit"></s:submit>
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
