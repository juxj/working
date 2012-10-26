<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>贷后管理</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script language="javascript">
//文本框触发焦点效果
function toPage(pageNum, pageSize){
	var url = "/user/loan/loanAfter!loanAfterList.act?currentPage=" + pageNum + "&pageCount=" + pageSize;
	$('#afterLoan').attr('action',url);
	$('#afterLoan').submit();
}
function supplyAttach(apploanid){
	$("#apploanid").val(apploanid);
	$("#add_attach").dialog({width:440,modal:true});
}
</script>

</head>
  
<body>
<!--头部2-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
</div>
<div class="hr_10"> &nbsp;</div>
  <div class="M_menu">
  	融资管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;贷后管理
  </div>
  <div class="hr_10"> &nbsp; </div>
<div class="container_950 box_4">
	<div class="P_title" style="border-bottom:5px solid #003961;">贷后管理</div>
<!--主体部分开始-->
			<form action="" method="post" id="afterLoan">
				 <table class="container_950">
	     			 <tr class="top_color">
						<td style="padding-left:10px;">合同编号</td>
						<td>融资渠道/项目</td>
						<td>融资起始时间</td>
						<td>融资额度</td>
						<td>期限</td>
						<td>利率</td>
						<td>还款方式</td>
						<td>融资材料</td>
						<td>状态</td>
						<td>操作</td>
					</tr>
					<s:if test="appLoanList.size()>0">
					<s:iterator id="appLoan" value="appLoanList">
						<tr class="top_color01">
							<td style="padding-left:10px;">${appLoan.contractNum}</td>
							<td>
							<common:print valueId="orgId" type="user"/><br/>	
							${appLoan.productName}</td>
							<td><s:date name="#appLoan.loanDate" />~<s:date name="#appLoan.loanEndDate" /></td>
							<td><s:number name="loanAmount" />万元</td>
							<td>${appLoan.loanMonth }个月</td>
							<td>${appLoan.interestRate }%</td>
							<td><common:print valueId="capitalWay" /> </td>
							<td class="option_href"><a	href="/user/loan/appLoanAttach!attachManag.act?viewAttachType=1&appLoanId=${appLoan.id}">材料查看</a></td>
							<td><common:print valueId="loanStatus"/></td>
							<td class="view_detail01">
								<a	href="/user/loan/loanAfter!loanAfterDetail.act?id=${appLoan.id}">查看</a>
							</td>
							
						</tr>
					</s:iterator>
					</s:if>
				</table>
			</form>

	       <div>
				<s:else>
				<div class="l_out">
						<h1 class="l_title">暂无贷后记录</h1>
						<p>
						<s:if test="groupType==5">
						您可以去<a href="/loan/financeProduct.act?financeType=152&financeDate=12">融资服务频道</a>搜索适合您的融资产品<br/>
						您也可以<a href="/loan/LoanRequest.act?loan.applyType=138">点此提交融资意向</a><br/>
						</s:if>
						<s:elseif test="groupType==1">
						您可以去<a href="/loan/financeProduct.act?financeType=151&financeDate=12">融资服务频道</a>搜索适合您的融资产品<br/>
						您也可以<a href="/loan/LoanRequest.act?loan.applyType=136">点此提交融资意向</a><br/>
						</s:elseif>
						<s:elseif test="groupType==2 || groupType==3">
						您可以<a href="/user/loan/financeProduct!newfin.act">点此发布融资产品</a>
						</s:elseif>
						</p>
						</div>
				</s:else>
	       </div>	
</div>		
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
</body>
</html>
