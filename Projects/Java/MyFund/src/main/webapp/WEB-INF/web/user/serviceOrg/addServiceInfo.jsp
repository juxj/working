<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>服务机构用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js" > </script>
<script type="text/javascript" src="/script/xheditor-1.1.14-zh-cn.min.js" > </script>
<script type="text/javascript">
$(function(){
	$("#frmSinItem").validate({
		messages:{
			'prdServiceItem.title': '<li>服务标题不能为空!</li>',	
			'prdServiceItem.serviceInfo':'<li>您还没有填写服务介绍!</li>',
			'prdServiceItem.regionId':'<li>服务区域还没有选择!</li>',
			'prdServiceItem.targetId':'<li>服务对象不能不选!</li>',
			'prdServiceItem.chargeRange':'<li>收费范围您还没有填写!</li>',
			'prdServiceItem.issuedDate':'<li>服务起始时间不能为空!</li>'
		}
	});
});

$(function() {
	$(".datepicker").datepicker();
});


function uncheckedOtherValue(){
	if ($("#service_region_0").attr("checked")) {
		$("input[username='ckregion']:checked").each(function(){
			$(this).attr("checked", false);
		});
		$("#divProvince").hide();
		$("#regionName").attr("value", "全国");
	} else {
		$("#divProvince").show();
		$("#regionName").attr("value", "");
	}
}

function setRegionName(){
	var region_name = "";
	var i=0;
	$("input[username='ckregion']:checked").each(function(){
		if (i==0) {
			region_name = region_name + $(this).attr("lblRegionName");
		} else {
			region_name = region_name +","+ $(this).attr("lblRegionName");
		}
		i++;
	});
	$("#regionName").attr("value", region_name);
}


function setTargetName() {
	var target_name = "";
	var i=0;
	$("#pServiceTarget input[type='checkbox']:checked").each(function(){
		if (i==0) {
			target_name = target_name + $(this).attr("lblTargetName");
		} else {
			target_name = target_name +","+ $(this).attr("lblTargetName");
		}
		i++;
	});
	$("#targetName").attr("value", target_name);
}

function getSelectorValue(tagName, inputName) {
	var value = $(tagName).find("option:selected").text();
	$(inputName).attr("value", value);
}


$(document).ready(function(){
	getSelectorValue('#serviceTypeSelector','#typeName');
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
    <div class="container_960">
	    <div class="box_948"> <span class="yourposition">发布服务信息</span>
	    <div class="clear"> &nbsp; </div>
	    <form id="frmSinItem" action="/service/userServiceItem!saveInfo.act" class="box_form"  method="post">
		    <s:hidden id="typeName" name="prdServiceItem.typeName"></s:hidden>
		    <s:hidden name="prdServiceItem.id"></s:hidden>
		    <s:hidden name="prdServiceItem.contactId"></s:hidden>
		    <s:hidden name="prdServiceItem.contactName"></s:hidden>
		    <s:hidden name="prdServiceItem.companyId"></s:hidden>
		    <s:hidden name="prdServiceItem.companyName"></s:hidden>
		    <input type="hidden" id="regionName" name="prdServiceItem.regionName"  />
		    <input type="hidden" id="targetName" name="prdServiceItem.targetName"/>
		    <dl>
		    	<dd>
		    		<h6><span class="txt-impt"></span>&nbsp;</h6>
		    		<div style="text-align:right">
		    		<label for="prdServiceItem.title" class="error" generated="true" style="display:block;"></label>
		    		<label for="prdServiceItem.serviceInfo" class="error" generated="true" style="display:block;"></label>
		    		<label for="prdServiceItem.regionId" class="error" generated="true" style="display:block;"></label>
		    		<label for="prdServiceItem.targetId" class="error" generated="true" style="display:block;"></label>
		    		<label for="prdServiceItem.chargeRange" class="error" generated="true" style="display:block;"></label>
		    		<label for="prdServiceItem.issuedDate" class="error" generated="true" style="display:block;"></label>
		    		<label for="prdServiceItem.expiredDate" class="error" generated="true" style="display:block;"></label>
		    		</div>
		    	</dd>
		    </dl>
		    <dl>
				<dd>
					<h6><span class="txt-impt">*</span>发布人：</h6>
					${prdServiceItem.contactName} </dd>
				<dd>
					<h6><span class="txt-impt">*</span>服务组织机构：</h6>${prdServiceItem.companyName} </dd>
				
				<dd>
					<h6><span class="txt-impt">*</span>服务类型：</h6>
				 	<s:select id="serviceTypeSelector" 
				  	list="sinTypeList" name="prdServiceItem.typeId" 
				  	listKey="id" listValue="name" onchange="getSelectorValue('#serviceTypeSelector','#typeName');"/> </dd>
				<dd>
				   	<h6><span class="txt-impt">*</span>服务标题：</h6>
				    <s:textfield id="prdServiceItem.title" name="prdServiceItem.title" cssClass="required" maxlength="50" ></s:textfield></dd>
				<dd>
			    	<h6><span class="txt-impt">*</span>服务介绍：</h6>
			    	<textarea class="xheditor {tools:'Bold',skin:'nostyle',forcePtag:false}" 
			    		id="prdServiceItem.serviceInfo"  name="prdServiceItem.serviceInfo"  
			    		style="width: 550px;height: 150px;" class="required"></textarea>
			    </dd>
			     	
				<dd>
			    	<h6><span class="txt-impt">*</span>服务区域：</h6>
			    	
			    	<input id="service_region_0" name="prdServiceItem.regionId" 
			    			class="required" value="0" lblRegionName="全国" type="checkbox" onclick="uncheckedOtherValue();"/>
			    		<label> 全国 </label>
			   </dd>
			   <dd>
			   
			   	   <h6><span class="txt-impt">&nbsp;</span></h6>
			   	   <span id="divProvince">
				   <s:iterator id="item" value="provinceList" status="st">
			    		<input username="ckregion"  type="checkbox" value="${item.id }"
				    	   	 onclick="setRegionName();" name="prdServiceItem.regionId"
				    	   	 	lblRegionName="${item.name }" class="required"/><label>${item.name }</label>
						<s:if test="#st.index % 5 ==0 && #st.index !=0">
							</dd>
							<dd><h6><span class="txt-impt">&nbsp;</span></h6>
						</s:if>			    		
				   </s:iterator>
				   </span>
			   </dd>
			   <dd>
			    	<h6><span class="txt-impt">*</span>服务对象：</h6>
			    	<p id="pServiceTarget">
				    	<s:iterator id="item" value="dataMap['obj']">
				    	   <input type="checkbox" value="${item.id }"
				    	   	 onclick="setTargetName();" name="prdServiceItem.targetId" lblTargetName="${item.name }" class="required"/><label>${item.name }</label>
				    	</s:iterator>
				    </p>
			   </dd>
				<dd>
			    	<h6><span class="txt-impt">*</span>收费范围：</h6>
			     	<s:textfield id="prdServiceItem.chargeRange" name="prdServiceItem.chargeRange" cssClass="required" size="51" ></s:textfield></dd>
				     	
				<dd>
			    	<h6><span class="txt-impt">*</span>服务时间：</h6>
			     	<input id="prdServiceItem.issuedDate" name="prdServiceItem.issuedDate" class="input-text datepicker required" value="<s:date name="prdServiceItem.issuedDate"/>"/>
			     	</dd>
			    <dd>
			    	<h6><span class="txt-impt"></span>至:</h6>
			     		<s:textfield id="prdServiceItem.expiredDate" name="prdServiceItem.expiredDate" cssClass="input-text datepicker"/>			     		
			    	</dd>
				<dd>
				 	<h6><span class="txt-impt">&nbsp;</span></h6>
				    <input type="submit" class="but_gray" value="确认发布" /></dd>
		          
		    </dl>
	    </form>
	    </div>
	</div>
    
    <div class="hr_10"> &nbsp; </div>
	<!--尾部-->
	<jsp:include page="/public/bottom.jsp"></jsp:include>
  </body>
</html>