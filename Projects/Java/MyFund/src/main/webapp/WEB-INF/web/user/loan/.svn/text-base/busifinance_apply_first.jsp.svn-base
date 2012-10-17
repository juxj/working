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
	servicedetail();
});
function servicedetail(){
		if($("#zjservice").attr("checked")){
			$("#loanSubmit").attr("disabled",false);
		}else{
			$("#loanSubmit").attr("disabled",true);
		}
}
function otherPurpose(){
	var j = $('#other').val();
	if(j==68){
		$('#otherPurpose').html("<input type='text' name='apply.loanPurposeOther'/>");
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
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="apply_title" >
	<p>融资申请-企业经营贷款</p>
	<div class="apply_menu">
        <div class="finance_apply_menu app_menu001">1.完善企业信息</div>
        <div class="finance_apply_menu app_menu002" >2.填写申请信息</div>
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
			        <td colspan="2"><span class="Search_t_title red">${product.financeName }</span>&nbsp;&nbsp;<a href="/loan/financeProduct!cusViewFinance.act?product.id=${product.id}" target="_blank">查看详情</a>
			        </td>
			        
			      </tr>
			       <tr>
			      	<td align="center">类型：<common:print valueId="product.financeType" /></td>
			      	<td align="center">金额：${product.financeLittleamount }~${product.financeBigamount }万</td>
			      	<td align="center">期限：${product.financeLittledt }~${product.financeMostdt }月</td>
			      </tr>
			    </table>
		</div>
<form action="/user/loan/financeApply!applySecond.act" id="loanForm"  class="box_form" style="margin:0px;" method="post">
<!-- 企业经营贷款快速申请类型=136 -->
<s:hidden name="product.id"></s:hidden>
<input type="hidden" name="oaucId" value="${oaucId }" />
	<div class="C_title">融资需求信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span>
	</div>
	<div class="C_form">
            <dl>
              <dd>
                <h6>融资用途：</h6>
                <common:select id="other" name="apply.loanPurpose" valueSetId="14" cssClass="S_width" style="width:160px;" onchange="otherPurpose()"></common:select>
              	<div id="otherPurpose"></div>
              </dd>
              <dd> 
                <h6>融资金额：</h6>
                <input type="text" name="apply.loanAmount" class="input-text required digits {loanAmount:[${product.financeLittleamount },${product.financeBigamount }]}"  id="apply_loanAmount" maxlength="6"/>&nbsp;&nbsp;万元
                <label for="apply_loanAmount" class="error" generated="true" style="display:none;"></label>
              </dd>
              <dd>
                <h6>融资期限：</h6>
                <input type="text" name="apply.loanMonth" class="input-text required digits {loanAmount:[${product.financeLittledt },${product.financeMostdt }]}"  id="apply.loanMonth" maxlength="2"/>&nbsp;&nbsp;个月
                <label for="apply.loanMonth" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
                <h6>是否有抵押物：</h6>
				  <input id="radio1" type="radio" name="apply.haveMortgage" value="1" class="required" checked/><label for="radio1">能提供</label>
				  <input id="radio2" type="radio" name="apply.haveMortgage" value="0" /><label for="radio2">无法提供</label>
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
				<input type="text" name="apply.lastyearProfit" class="input-text required number {loanAmount:[-100,500]}"  id="apply.lastyearProfit" maxlength="10"/>&nbsp;&nbsp;%
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
				<input type="text" name="apply.assetSum" class="input-text required number {assetSumcls:['apply_debtSum','apply_loanAmount']}"  id="apply.assetSum" maxlength="10"/>&nbsp;&nbsp;万元
				<label for="apply.assetSum" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6 style="width:260px">截止到<span class="yearmoth"></span>，企业总负债约为：</h6>
				<s:textfield name="apply.debtSum" cssClass="input-text required number"  id="apply_debtSum" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
				<label for="apply_debtSum" class="error" generated="true" style="display:none;"></label>
			</dd>
			<!-- 
			<dd>
				<h6 style="width:260px">最大下游客户与您的合作时长：</h6>
				<s:textfield name="apply.maxCustomTime" cssClass="input-text required number"  id="apply.maxCustomTime" maxlength="10"></s:textfield>&nbsp;&nbsp;年
				<label for="apply.maxCustomTime" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6 style="width:260px">第二大下游客户与您的合作时长：</h6>
				<s:textfield name="apply.nextCustomTime" cssClass="input-text required number"  id="apply.nextCustomTime" maxlength="10"></s:textfield>&nbsp;&nbsp;年
				<label for="apply.nextCustomTime" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6 style="width:260px">以上两家客户占您年销售额比率：</h6>
				<s:textfield name="apply.twoCusSalerate" cssClass="input-text required number {max:100}"  id="apply.twoCusSalerate" maxlength="10"></s:textfield>&nbsp;&nbsp;%
				<label for="apply.twoCusSalerate" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6 style="width:260px">最近六月银行流水量：</h6>
				<s:textfield name="apply.sixmonthBanklist" cssClass="input-text required number"  id="apply.sixmonthBanklist" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
				<label for="apply.sixmonthBanklist" class="error" generated="true" style="display:none;"></label>
			</dd>
			 -->
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
						<input type="text" name="epValue${id }" class="input-text required"/>
					</s:if>
					<s:if test="fieldType == 2">
						<textarea name="epValue${id }" rows="5" cols="50" class="required"></textarea>
					</s:if>
					<s:if test="fieldType == 3">
						<select name="epValue${id }">
							<s:iterator value="propertyDicSet">
								<option value="${dicValue }">${dicName }</option>
							</s:iterator>
						</select>
					</s:if>
					<s:if test="fieldType == 4">
						<s:iterator value="propertyDicSet">
							<input type="checkbox" name="epValue${epid.id }" value="${dicValue }" class="required"/>${dicName }
						</s:iterator>
						<label for="epValue${epid.id }" class="error" generated="true" style="display:none;"></label>
					</s:if>
				</dd>
			</s:iterator>
		</dl>
	
		<div class="hr_10"> &nbsp; </div>
		<div class="center" style="width:260px;">
			<input type="checkbox" name="zjservice" id="zjservice" style="margin-bottom:8px;" onclick="servicedetail()"/>
			<label for="zjservice">我已阅读并同意</label>
			<a href="/news/Info.act?id=197" class="T_Service" target="_blank">中国资金网融资服务条款</a>
		</div>
		<div class="center" style="width:200px;">
			<s:submit value="下一步"  cssClass="but_gray" style="width:200px;" id="loanSubmit"></s:submit>
		</div>
		<div class="hr_10"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div>
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
