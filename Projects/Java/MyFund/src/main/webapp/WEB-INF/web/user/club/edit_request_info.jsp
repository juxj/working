<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>找资金_融资俱乐部_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js"></script>
<script type="text/javascript" src="/script/xheditor-1.1.14-zh-cn.min.js" > </script>
<link href="/css/jquery-validate.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(function(){
	$("#frmRequestInfo").validate();
});
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
信息管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;发布项目信息
</div>
<div class="hr_10"> &nbsp; </div>
<div class="container_950">
	<div class="P_title box_4" style="border-bottom:5px solid #003961;">发布项目信息</div>
<!--发布新资金信息-->
	<div class="box_3">
	<form id="frmRequestInfo" action="/service/requestInfoAction4User!save.act" method="post">
		<s:hidden name="clbRequestInfo.id"></s:hidden>
		<table class="form_table">
		
			<tr>
				<td class="field_name" width="18%">标题：</td>
				<td> 
					<s:textfield name="clbRequestInfo.title" maxlength="100" cssClass="required input_text"></s:textfield>
				</td>
			</tr>
			<tr>
				<td class="field_name" >所属行业：</td>
				<td>
				
					<s:select list="industryList.{?#this.parentid==0}"  name="clbRequestInfo.industry" listKey="name" listValue="name"></s:select>
					
				</td>
			</tr>
			<tr>
				<td class="field_name" >所属区域：</td>
				<td><s:select list="provinceList" name="clbRequestInfo.area" 
					listKey="name" listValue="name"></s:select> </td>
			</tr>
			<tr>
				<td class="field_name" >项目分类：</td>
				<td>
					<s:radio list="projectTypeList" name="clbRequestInfo.projectType" listKey="code"
						listValue="name" cssClass="required"></s:radio>
					<label for="clbRequestInfo.projectType" class="error" generated="true" style="display:none;"></label>
				</td>
			</tr>
			<tr>
				<td class="field_name" >投资总额(万元)：</td>
				<td><s:textfield name="clbRequestInfo.totalMoney" maxlength="6"  cssClass="required number input_text"/>(万元)
				<label for="clbRequestInfo.totalMoney" class="error" generated="true" style="display:none;"></label>
				</td>
			</tr>
			<tr>
				<td class="field_name" >尚缺资金(万元)：</td>
				<td><s:textfield name="clbRequestInfo.lackMoney" maxlength="6" cssClass="required number input_text"/> 
				<label for="clbRequestInfo.lackMoney" class="error" generated="true" style="display:none;"></label>
				</td>
			</tr>
			<tr>
				<td class="field_name" >所需资金(万元)：</td>
				<td><s:textfield name="clbRequestInfo.needMoney" maxlength="6" cssClass="required number input_text"/>
				<label for="clbRequestInfo.needMoney" class="error" generated="true" style="display:none;"></label>
				</td>
			</tr>
			<tr>
				<td class="field_name" >融资方式：</td>
				<td>
					
					<s:iterator id="item" value="financingTypeList">
						<s:set name="isChecked" value="0" />
						<s:iterator id="checkedItem" value="checkedFinanceTypeList">
							<s:if test="#checkedItem.trim()==#item.name.trim()">
								<s:set name="isChecked" value="1" />
							</s:if>
						</s:iterator>
						<s:if test="#isChecked==0">
							<input type="checkbox" name="clbRequestInfo.financeType" value="${item.name}"/> ${item.name }
						</s:if> <s:else>
							<input type="checkbox" name="clbRequestInfo.financeType" value="${item.name}" checked/> ${item.name }
						</s:else>
					</s:iterator>
				<label for="clbRequestInfo.financeType" class="error" generated="true" style="display:none;"></label>	
				</td>
			</tr>
			<tr>
				<td class="field_name" >项目概述：</td>
				<td><s:textarea rows="10" cols="60"  cssClass="required xheditor {tools:'Bold',skin:'nostyle',forcePtag:false}" name="clbRequestInfo.introduction"/>
				<label for="clbRequestInfo.introduction" class="error" generated="true" style="display:none;"></label>
				</td>
			</tr>
			<tr>
				<td class="field_name" >前景预测：</td>
				<td><s:textarea rows="10" cols="60"  cssClass="required xheditor {tools:'Bold',skin:'nostyle',forcePtag:false}" name="clbRequestInfo.forecast"/>
				<label for="clbRequestInfo.forecast" class="error" generated="true" style="display:none;"></label>
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
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>