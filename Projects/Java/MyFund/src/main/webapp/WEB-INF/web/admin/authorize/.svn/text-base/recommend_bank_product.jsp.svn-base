<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/script/jquery.validate.min.js"></script>
	<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
	<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
	<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
	<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
	<script language="javascript" >
		function toPage(pageNo, pageCount) {
			document.getElementById("pageNo").value = pageNo;
			form = document.getElementById("frmQueryBankProduct");
			form.submit();
		}
		
		$(function() {
			$("#frmPrdRecommendation").validate();
		});
	</script>
</head>
  
  <body>
	<div id="hld">
		<div class="wrapper">
			<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
			<div class="block">
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>产品管理 » 理财产品</h2>
					<ul>
						<li class="nobg"></li>
						<li></li>
					</ul>
				</div>
				<div style="padding-left:20px; padding-top:20px">
					<form id="frmPrdRecommendation" action="/admin/bankProductAction!savePrdRecommendation.act" method="post">
						<s:hidden name="prdRecommendation.id"></s:hidden>
						<s:hidden name="prdRecommendation.typeId"></s:hidden>
						<s:hidden name="prdRecommendation.prodId"></s:hidden>
						<s:hidden name="prdRecommendation.createdDate"></s:hidden>
						<s:hidden name="prdRecommendation.lastUpdatedDate"></s:hidden>
						<s:hidden name="oldSequence"></s:hidden>
						<s:hidden id="prdRecommendation.logo" name="prdRecommendation.logo"></s:hidden>
						<p>
							<label>产品名称</label>:</label><br /><s:textfield id="prdRecommendation.originalName" name="prdRecommendation.originalName" cssClass="required text small" readonly="true"></s:textfield> 
						</p>
						
						<p>
							<label>银行:</label><br />
							<s:select list="bankList" listKey="id" listValue="name"
								 cssClass="cmf-skinned-select" id="prdRecommendation.bankId" name="prdRecommendation.bankId"></s:select> 
						</p>
						
						<p>
							<label>推荐标题:</label><br /><s:textfield  id="prdRecommendation.title" name="prdRecommendation.title" cssClass="required text small"></s:textfield> 
						</p>
						
						<p>
							<label>序号:</label><br /><s:textfield  id="prdRecommendation.sequence" name="prdRecommendation.sequence" cssClass="required number text small"></s:textfield> 
						</p>
						<p>
							<label>状态:</label><br /><s:radio list="#{'0':'停用','1':'启用'}" name="prdRecommendation.status"></s:radio> 
						</p>
						<hr/>
						<p>
							<input type="submit" class="submit small" value="提交"/>
							<input type="reset" class="submit small" value="重置"/>
						</p>
					</form>
			    </div>
			</div>
		</div>
	</div>
  </body>
</html>
