<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>投资俱乐部_银行_用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js"></script>
<script type="text/javascript" src="/script/xheditor-1.1.14-zh-cn.min.js" > </script>
<link href="/css/jquery-validate.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(document).ready(function(){
	$("#frmInstitution").validate({
		messages:{
			'clbSupplyInfo.title'			: {
				required: '<li>项目标题不能留空!</li>',
				maxlength: jQuery.format("项目标题长度不能大于{0}个字符")
			},
			'clbSupplyInfo.workArea'			: '<li>请选择所属区域!</<li>',
			'clbSupplyInfo.companytype'		: '<li>银行类型不能不选!</li>',
			'clbSupplyInfo.workTranche'		: '<li>您还没有选择额度范围!</li>',
			'clbSupplyInfo.workRange'		: '<li>理财服务范围不能留空</li>',
			'clbSupplyInfo.remark'			: '<li>请详细描述您所打算的资金投向信息</li>'
		}
	});
})
</script>
</head>
<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>


<div class="hr_10"> &nbsp; </div>
<div class="M_menu">
信息管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;发布新资金信息
</div>
<div class="hr_10"> &nbsp; </div>
<div class="container_950">
	<div class="P_title box_4" style="border-bottom:5px solid #003961;">发布新资金信息</div>
<!--发布新资金信息-->
<div class="box_3">
	<div class="apply_form_title">第二步</div>
	<div class="xxkbox2">
		<form action="/service/supplyInfoAction4User!save.act" id="frmInstitution" method="post">
			<s:hidden name="clbSupplyInfo.id"></s:hidden>
			<input name="clbSupplyInfo.investType" type="hidden" value="${clbSupplyInfo.investType }"/>
			<table class="form_table">
				<tr>
					<td></td>
					<td>
						<label for="clbSupplyInfo.title" class="error" generated="true" style="display:block;"></label>
						<label for="clbSupplyInfo.workArea" class="error" generated="true" style="display:block;"></label>
						<label for="clbSupplyInfo.companytype" class="error" generated="true" style="display:block;"></label>
						<label for="clbSupplyInfo.workRange" class="error" generated="true" style="display:block;"></label>
						<label for="clbSupplyInfo.remark" class="error" generated="true" style="display:block;"></label>
					</td>
				</tr>
				<tr>
					<td width="18%" class="form_table field_name">标题</td>
					<td><s:textfield id="clbSupplyInfo.title" name="clbSupplyInfo.title" cssClass="required"  maxlength="32"/></td>
				</tr>
				<jsp:include page="_work_area.jsp" />
				<tr>
					<td class="form_table field_name">银行类型</td>
					<td>
						<s:radio list="#{'中资银行':'中资银行','外资银行':'外资银行','股份制银行':'股份制银行'}" cssClass="required"  name="clbSupplyInfo.companytype"></s:radio>
					</td>
				</tr>
				
				<tr>
					<td class="form_table field_name">理财服务</td>
					<td>
						<s:set name="list1" value="#{'自主产品':'自主产品','代销产品':'代销产品' }" />
						<s:iterator id="item" value="list1" status="st">
							<s:set name="isChecked" value="0" />
							<s:iterator id="checkedItem" value="checkedItems">
								<s:if test="#checkedItem.trim()==#item.value">
									<s:set name="isChecked" value="1" />
								</s:if>
							</s:iterator>
							<s:if test="#isChecked==0">
								<input type="checkbox" class="required" name="clbSupplyInfo.workRange" value="${item.value}"/>${item.key }&nbsp;&nbsp;&nbsp;&nbsp;
							</s:if> <s:else>
								<input type="checkbox" class="required" name="clbSupplyInfo.workRange"  value="${item.value}" checked/>${item.key } &nbsp;&nbsp;&nbsp;&nbsp;
							</s:else>
						</s:iterator>
					</td>
				</tr>
				<tr>
					<td class="form_table field_name">贷款服务</td>
					<td>
						<s:set name="list2" value="#{'个人贷款':'个人贷款','企业贷款':'企业贷款' }" />
						<s:iterator id="item" value="list2" status="st">
							<s:set name="isChecked" value="0" />
							<s:iterator id="checkedItem" value="checkedItems">
								<s:if test="#checkedItem.trim()==#item.value">
									<s:set name="isChecked" value="1" />
								</s:if>
							</s:iterator>
							<s:if test="#isChecked==0">
								<input type="checkbox" name="clbSupplyInfo.workRange" value="${item.value}"/>${item.key }&nbsp;&nbsp;&nbsp;&nbsp;
							</s:if> <s:else>
								<input type="checkbox" name="clbSupplyInfo.workRange"  value="${item.value}" checked/>${item.key } &nbsp;&nbsp;&nbsp;&nbsp;
							</s:else>
						</s:iterator>
						<label for="clbSupplyInfo.workRange" class="error" generated="true" style="display:none;"></label>
					</td>
				</tr>
				<tr>
					<td class="form_table field_name">信息时效</td>
					<td><s:select list="timeIntervalList" listKey="code" cssClass="required" listValue="name" name="lastDisplayDate" ></s:select></td>
				</tr>
				<tr>
					<td class="form_table field_name">资金描述</td>
					<td>
						<s:textarea rows="8" cols="80" id="clbSupplyInfo.remark" name="clbSupplyInfo.remark" cssClass="required xheditor {tools:'Bold',skin:'nostyle',forcePtag:false}"/>
					</td>
				</tr>
				<tr>
					<td class="form_table field_name"></td>
					<td>
						
					</td>
				</tr>
				<tr>
				<td></td>
				<td><input type="submit" value="确定发布" class="but_gray " style="width:200px;"/></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</div>       
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>