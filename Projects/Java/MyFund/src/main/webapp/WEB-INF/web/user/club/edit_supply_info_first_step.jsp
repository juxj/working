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
<link href="/css/jquery-validate.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	
	function showSubType(){
		parentId = $("#investStyleParent input:radio[checked]").val();
		$("#investStyleDetails div").hide();
		$("#sub_type_"+parentId).show();
	}

	function enableNextBtn() {
		$("#btnGotoNext").attr("disabled",false);
	}

	function gotoNext(){
		url 	= $("#investStyleDetails input:radio[checked]").attr("url");
		value  = $("#investStyleDetails input:radio[checked]").val();
		if (url != null) {
			$("#frmFirstStep").attr("action", url);
			$("#investType").attr("value", value );
			$("#frmFirstStep").submit();
		}
	}
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
	<div class="apply_form_title">第一步</div>
	<div class="C_title">请选择投资方式(您只能选择一项)</div>
	<div style="padding:20px 20px 20px 25px;">
         <div id="investStyleParent">
         		<s:radio list="investStyleList.{?#this.parentId==0}" listKey="code" listValue="name" name="mainType"  onclick="showSubType();"></s:radio>
         </div>
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="C_title">请选择具体类型 （您只能选择一类）</div>
	<div style="padding:20px 20px 20px 25px;">
		<dl>
			<dd>
                <div id="investStyleDetails">
                		<s:iterator id="item" value="investStyleList.{?#this.parentId==0}">
		         			<div id="sub_type_${item.code }" style="display:none">
		         			<s:iterator id="child" value="investStyleList">
		         				<s:if test="#child.parentId==#item.id">
		         					<input type="radio" name="subType" value="${child.code}" url="${child.remark}" onclick="enableNextBtn();"/> ${child.name }
		         				</s:if>
		         			</s:iterator>
		         			</div>
		         		</s:iterator>
                </div>           
			</dd>		
		</dl>
		<div class="hr_10"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div>
		<div class="center" style="width:150px;">
			<form id="frmFirstStep" action="" method="post">
				<input type="hidden" id="investType" name="investType"/>
			</form>
			<input type="button" id="btnGotoNext" disabled="disabled"  onclick="gotoNext();"  value="确认进入下一步" class="but_gray"/>
		</div>
		<div class="hr_10"> &nbsp; </div>
	</div>
</div>
</div>       
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>