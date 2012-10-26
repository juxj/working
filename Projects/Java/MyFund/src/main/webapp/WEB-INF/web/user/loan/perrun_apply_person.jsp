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
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    })
})

$(function(){
	$("#loanForm").validate();
	$('#errores').html('');
});
function servicedetail(){
		if($("#zjservice").attr("checked")){
			$("#loanSubmit").attr("disabled",false);
		}else{
			$("#loanSubmit").attr("disabled",true);
		}
}

jQuery.validator.addMethod("loanAmount", function(value, element, param) {
return this.optional(element) || (value >= param[0] && value <= param[1]);
}, $.validator.format("必须大于{0}小于{1}"));

jQuery.validator.addMethod("assetSumcls", function(value, element, param) {
var s1 = $('#' + param[0]).val();
var s2 = $('#' + param[1]).val();
return this.optional(element) || (value >= s1 && value >= s2);
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
<div class="container_950">
	<div class="apply_title" >
		<p>融资申请-个人经营性贷款</p>
			<div class="center" style="width:900px;">
				<div class="left_gray">&nbsp;</div>
				<div class="m_red">查看个人信息</div>
				<div class="m_gray">填写申请信息</div>
				<div class="m_gray">预审中</div>
				<div class="m_gray">提交资料</div>
				<div class="m_gray">资金网审核</div>
				<div class="m_gray">金融机构审核</div>
				<div class="right_gray">&nbsp;</div>	
			</div>	
	</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="box_4">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
				      <tr>
				        <td colspan="2" style="padding:20px 0 0 30px;">
			        	<div class="fl">	
				        	<s:if test="product.logo == null">
						        <img src="/images/banklogo/b/zj198.jpg" style="white-space: nowrap;"/>
					        </s:if>
					        <s:else>
					        	<img src="/images/banklogo/b/${product.logo }"/>
					        </s:else></div>
				        <div class="Search_t_title red">&nbsp;&nbsp;${product.financeName }</div>
				        </td>
				      </tr>
				      <tr>
				      	<td style="padding:0 0 20px 30px;"><h6>类型：<common:print valueId="product.financeType" />&nbsp; &nbsp; &nbsp; &nbsp; 
				      	金额：${product.financeLittleamount }~${product.financeBigamount }万&nbsp; &nbsp; &nbsp; &nbsp; 
				      	期限：${product.financeLittledt }~${product.financeMostdt }月</h6></td>
				      	<td style="padding:0 30px 20px 0;"><span class="view_detail fr"><a href="/loan/financeProduct!cusViewFinance.act?product.id=${product.id}" target="_blank">产品详情</a></span></td>
				      </tr>
				    </table>
	</div>
	<div class="box_3">	
	<form action="/user/loan/financeApply!perruntApplyFirst.act" id="loanForm"  cssClass="box_form" style="margin:0px;" method="post">
	<!-- 企业经营贷款快速申请类型=136 -->
	<s:hidden name="product.id"></s:hidden>
		<div class="C_title">个人信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span></div>
			<div class="hr_10"> &nbsp; </div>
			 <table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
			 <tr>
	           <td class="a_right">姓名</td>
	           <td>${session._user.realname}</td>
	         </tr>
	         <tr>
	           <td class="a_right">出生年月</td>
	           <td><s:date name="usrPerson.birthday" /></td>
	         </tr>
	         <tr>
	           <td class="a_right">教育程度</td>
	           <td>${profileMap['eduAtion'] }</td>
	         </tr>
	         <tr>
	           <td class="a_right">身份证号码</td>
	           <td>${usrPerson.cid}</td>
	         </tr>
	         <tr>
	           <td class="a_right">所在地</td>
	           <td style="vertical-align: middle;">
	            ${profileMap['address'] }
	           </td>
	         </tr>
	         <tr>
	           <td class="a_right">详细地址</td>
	           <td>${usrPerson.address }</td>
	         </tr>              
	         <tr>
	           <td class="a_right" style="vertical-align:top;">邮政编码</td>
	           <td>${usrPerson.postcode }</td>
	         </tr> 
			</table>
			
			
			<div class="hr_10"> &nbsp; </div>
			<div class="center" style="width:200px;">
				<s:submit value="下一步"  cssClass="but_gray" style="width:200px;" id="loanSubmit"></s:submit>
			</div>
			<div class="hr_10"> &nbsp; </div>
			<div class="hr_10"> &nbsp; </div>
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
