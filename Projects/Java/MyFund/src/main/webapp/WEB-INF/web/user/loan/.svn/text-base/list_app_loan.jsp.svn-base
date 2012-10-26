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
//文本框触发焦点效果s
function toPage(pageNum, pageSize){
	var url = "loanAfter!loanAfterList.act";
	$('#currentPage').val(pageNum);
	$('#pageCount').val(pageSize);
	$('#afterLoan').attr('action',url);
	$('#afterLoan').submit();
}
function updateStatus(appLoanId){
	var url = "loanAfter!updateStatus.act?appLoan.loanStatus=221&appLoan.id=" + appLoanId;
	$('#afterLoan').attr('action',url);
	$('#afterLoan').submit();
}
function supplyAttach(apploanid){
	$("#apploanid").val(apploanid);
	$("#add_attach").dialog({width:440,modal:true});
}

function addMessage(appId){
	$("#message_apply_id").val(appId);
	$("#add_message").dialog({width:440,modal:true});
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
  	<div style="float: left;">融资管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;贷后管理</div>
  	<div style="float: center;color:#97181D;">
  		${msg }
  	</div>
  </div>
 <div class="hr_10"> &nbsp; </div>
<div class="container_950 box_4">
	<div class="P_title" style="border-bottom:5px solid #003961;">贷后管理</div>
<!--主体部分开始-->
			<form action="/user/loan/loanAfter!loanAfterList.act" method="post" id="afterLoan">
				<s:hidden name="currentPage" id="currentPage"></s:hidden>
				<s:hidden name="pageCount" id="pageCount"></s:hidden>
				 <table class="container_950 ">
	      			<tr class="top_color" align="center">
						<td width="8%" style="padding-left:10px;">合同编号</td>
						<td width="10%">融资产品名称</td>
						<td width="12%">类型</td>
						<td width="10%">借款方名称</td>
						<td width="10%">融资开始时间</td>
						<td width="9%">金额</td>
						<td width="10%">融资到期时间</td>
						<td width="10%">融资材料</td>
						<td >状态</td>
						<td width="12%" >操作</td>

					</tr>
					<s:if test="pager.data.size()>0">
					<s:iterator id="appLoan" value="pager.data">
						<tr class="gold_connect">
							<td style="padding-left:10px;">${appLoan.contractNum}</td>
							<td>${appLoan.productName}</td>
							<td><common:print valueId="#appLoan.financeType" /> </td>
							<td>${appLoan.customerName}</td>
							<td><s:date name="#appLoan.loanDate" /></td>
							<td><s:number name="loanAmount" />万元</td>
							<td><s:date name="#appLoan.loanEndDate" /></td>
							<td class="option_href"><a	href="/user/loan/appLoanAttach!attachManag.act?viewAttachType=0&appLoanId=${appLoan.id}">材料查看</a></td>
							<td><common:print valueId="loanStatus"/></td>
							<td align="right" class="view_detail" style="padding-right:20px;margin-top:5px;" >
								<a href="javascript:supplyAttach('${appLoan.id }');" style="margin-bottom:5px;" >补充资料</a><br/>
								<a href="/user/loan/loanAfter!loanAfterDetail.act?id=${appLoan.id}" style="margin-bottom:5px;">放款详情</a><br/>
								<a href="javascript:addMessage('${appLoan.applyId }');" style="margin-bottom:5px;">检查通知</a><br/>
								<s:if test="loanStatus == 222">
									<a	href="javascript:updateStatus('${appLoan.id }');">补充完成</a>
								</s:if>	
							</td>
						</tr>
					</s:iterator>
					<tr>
						<td colspan="10">
							<div class="pagination right">
								<s:include value="/public/pagination.jsp"/>
							</div>
						</td>
					</tr>
					</s:if>
				</table>				
				</form>
			</div>
			<div class="hr_10">&nbsp;</div>
	       <div class="container_950 box_4">
				<s:else>
				<div class="l_out">
						<h1 class="l_title">暂无贷后记录</h1>
						<p>
						您可以<a href="/user/loan/financeProduct!newfin.act">点此发布融资产品</a>
						</p>
						</div>
				</s:else>
	       </div>
			<div class="hr_10"> &nbsp;</div>
<div id="add_attach" style="display:none;" title="补充材料">
	<form id="uploadForm" action="/user/loan/loanAfter!needAttach.act" method="post">
	<s:hidden name="loanData.appLoanId" id="apploanid"></s:hidden>
	<s:hidden name="currentPage"></s:hidden>
	<s:hidden name="pageCount"></s:hidden>
	<dl>
		<dd>
			<h6>资料名称</h6>
			<s:textfield name="loanData.supplyName" cssClass="input-text required"></s:textfield>
		</dd>
		<dd>
			<h6>备注</h6>
			<s:textarea name="loanData.supplyMemo" rows="5" cols="65"></s:textarea>
		</dd>
		<dd>
			<h6>递交方式</h6>
			<common:checkbox name="supplyWay"  valueSetId="37"/>
		</dd>
	</dl>
	<div class="hr_10"> &nbsp; </div>
	<div class="center" style="width:300px;">
			<s:submit value="确定" cssClass="but_gray"></s:submit>	
	</div>
	</form>
</div>   
<div id="add_message" style="display:none;" title="添加消息">
	<form id="messageForm" action="/user/message!sendMessage.act" method="post" >
	<s:hidden name="applyId" id="message_apply_id"></s:hidden>
	<s:hidden name="currentPage"></s:hidden>
	<s:hidden name="pageCount"></s:hidden>
	<dl>
		<dd>
			<h6>名称</h6>
			<s:textfield name="addMessageSpModel.message.title" cssClass="input-text required"></s:textfield>
		</dd>
		<dd>
			<h6>说明</h6>
			<s:textarea name="addMessageSpModel.message.contents" rows="5" cols="65"></s:textarea>
		</dd>
	</dl>
	<div class="hr_10"> &nbsp; </div>
	<div class="center" style="width:200px;">
			<s:submit value="确定" cssClass="but_gray"></s:submit>	
	</div>
	</form>
</div>   

<!--主体部分结束-->
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
