<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>基金申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/load-finance.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/proofRule.js" > </script>
<script language="javascript">
$(function(){
	$("#fundForm").validate();
});
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
<div class="M_menu">
  	<a href="/finance/financeProduct.act">理财服务</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="/finance/fund.act">基金产品</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;基金产品预约
</div>
<!--主体部分开始-->
<div class="hr_10"> &nbsp; </div>
<div class="apply_title red" style="height:50px;">
	<p>在线预约</p>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
<form action="/finance/fund!saveIntention.act" id="fundForm"  class="box_form" style="margin:0px;" method="post">
<!-- 企业经营贷款快速申请类型=136 -->
	<div class="apply_form_title">填写联系方式</div>
	<div class="C_form">
            <dl>
              <dd>
                <h6>姓名：</h6>
                <s:textfield name="fundIntention.userName" cssClass="input-text required"  id="fundIntention.userName"></s:textfield>
                &nbsp;&nbsp;<input id="radio1" type="radio" name="fundIntention.gender" value="0" checked/><label for="radio1">先生</label>
				  <input id="radio2" type="radio" name="fundIntention.gender" value="1" /><label for="radio2">女士</label>
              </dd>
              <dd>
                <h6>手机：</h6>
                <s:textfield name="fundIntention.mobile" cssClass="input-text required mobile"  id="fundIntention.mobile"></s:textfield>
              </dd>
              <dd>
                <h6>邮箱：</h6>
                <s:textfield name="fundIntention.email" cssClass="input-text required email"  id="fundIntention.email"></s:textfield>
              </dd>
              <dd>
                <h6>期望服务时间：</h6>
                <s:select list="#{1:'双休日白天',2:'工作日上午',3:'工作日中午',4:'工作日晚间'}" name="fundIntention.serviceTime"></s:select>
              </dd>
              <dd>
                <h6>预约服务内容：</h6>
                <s:textarea name="fundIntention.serviceContent" cols="70" rows="8" cssClass="required" ></s:textarea>
              </dd>
			 </dl>
	
		<div class="hr_10"> &nbsp; </div>
		<div class="center" style="width:200px;">
		<s:submit value="确定"  cssClass="btnsub bred" style="width:200px;"></s:submit>
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
