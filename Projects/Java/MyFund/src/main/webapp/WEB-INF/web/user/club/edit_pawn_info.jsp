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
	$(function(){
		$("#frmPawnInfo").validate({
			messages:{
				'clbSupplyInfo.title'			: {
					required: '<li>项目标题不能留空!</li>',
					maxlength: jQuery.format("项目标题长度不能大于{0}个字符")
				},
				'clbSupplyInfo.workArea'			: '<li>请选择所属区域!</<li>',
				'clbSupplyInfo.workTrade'		: '<li>您还没有选择行业!</li>',
				'clbSupplyInfo.workRange'		: '<li>请选择典当范围</li>',
				'clbSupplyInfo.workTranche'		: '<li>您还没有选择投资额度!</li>',
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
	<div class="P_title" style="border-bottom:5px solid #003961;">发布新资金信息</div>
</div>
<div class="hr_10"> &nbsp;</div>
<!--发布新资金信息-->
<div style="margin:0 auto; width:950px;">
<div class="apply_form">
	<div class="apply_form_title">第二步</div>
	<div class="xxkbox2">
	<form action="/service/supplyInfoAction4User!save.act" id="frmPawnInfo" method="post">
		<s:hidden name="clbSupplyInfo.id"></s:hidden>
		<input name="clbSupplyInfo.investType" type="hidden" value="${clbSupplyInfo.investType }"/>
		<table style="padding-left:30px" class="form_table" >
			<tr>
				<td></td>
				<td>
					<label for="clbSupplyInfo.title" class="error" generated="true" style="display:block;"></label>
					<label for="clbSupplyInfo.workArea" class="error" generated="true" style="display:block;"></label>
					<label for="clbSupplyInfo.workTrade" class="error" generated="true" style="display:block;"></label>
					<label for="clbSupplyInfo.workRange" class="error" generated="true" style="display:block;"></label>
					<label for="clbSupplyInfo.workTranche" class="error" generated="true" style="display:block;"></label>
					<label for="clbSupplyInfo.remark" class="error" generated="true" style="display:block;"></label>
				</td>
			</tr>
			<tr>
				<td class="form_table field_name" width="18%">标题</td>
				<td><s:textfield name="clbSupplyInfo.title"  id="clbSupplyInfo.title" cssClass="required"/>
				</td>
			</tr>
			<tr>
				<td class="form_table field_name">额度范围</td>
				<td>
					<s:radio list="amountRangeList.{?#this.code<10000}" listKey="name" listValue="name" 
						cssClass="required"  name="clbSupplyInfo.workTranche"></s:radio>
				</td>
			</tr>
			<tr>
				<td class="form_table field_name">请选择典当范围</td>
				<td>
				</td>
			</tr>
			<s:iterator id="item" value="pawnItemList">
				<s:if test="#item.parentId==0">
					<tr> 
					<td class="form_table parameter_name">${item.name }</td><td>
						<s:iterator id="child" value="pawnItemList">
							<s:if test="#child.parentId==#item.id">
								<s:set name="isChecked" value="0" />
								<s:iterator id="checkedItem" value="checkedItems">
									<s:if test="#checkedItem.trim()==#child.name.trim()">
										<s:set name="isChecked" value="1" />
									</s:if>
								</s:iterator>
								<s:if test="#isChecked==0">
									<label> <input type="checkbox" value="${child.name }" name="clbSupplyInfo.workRange" class="required"/>${child.name }</label>
								</s:if> <s:else>
									<label> <input type="checkbox" value="${child.name }" name="clbSupplyInfo.workRange" class="required" checked/>${child.name }</label>
								</s:else>
							</s:if>
						</s:iterator>
					</td>
					</tr>
				</s:if>
			</s:iterator>
			<tr>
				<td class="form_table field_name">典当期限</td>
				<td>
					<s:select list="timeIntervalList" listKey="code" listValue="name" cssClass="required" name="clbSupplyInfo.productCycle"></s:select>
				</td>
			</tr>	
			<tr>
				<td class="form_table field_name">受理周期</td>
				<td>
					<s:select list="#{'当天':'当天','三天':'三天','一周':'一周','一周以上':'一周以上'}" name="clbSupplyInfo.workCycle" cssClass="required"></s:select>
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
				<td></td>
				<td><input type="submit" value="确定发布" class="but_gray" style="width:200px;"/></td>
			</tr>
		</table>
		
		
	</form>
	</div>
</div>       
<div class="hr_10"> &nbsp; </div>
</div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>
