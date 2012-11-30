<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(function(){
	$(":button,:submit").button();
	$(".date_picker").datepicker();
});
function toPage(pageNum, pageSize){
	//var url = '/admin/loan/financePro!financeAdmin.act?pager.currentPage=' + pageNum + "&pager.pageCount=" + pageSize;
	$('#current_page').val(pageNum);
	$('#page_count').val(pageSize);
	//$('#financeadmin').attr('action',url);
	$('#financeadmin').submit();
}
function recommendOld(pid,rstatus,rname,rno){
	if(rstatus.length == 0){
		rstatus = 1;
	}
	$('#product_id').val(pid);
	$('#product_rname').val(rname);
	$('#product_rno').val(rno);
	$("input[@name=product.recommendStatus][value=" + rstatus +"]").attr("checked",true);
	$('#recommend_set').dialog({width:700,modal: true});
}
function recommendPrd(pid){
	var url = "/admin/loan/recommendprd!getRecommend.act";
   	var param = {'prdRecommendation.prodId':pid};
   	$.post(url,param, function(data){
   		var da = $('#recommend_set');
   		da.html(data);
   		$('#recommend_set').dialog({width:700,modal:true,close: function(event, ui) { 
				$('#financeadmin').submit();
    		}});
   	}, 'html');
}
</script>
</head>
<body>

<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
	 	<div class="block">
			<form action="/admin/loan/financePro!financeAdmin.act" method="post" id="financeadmin">
			<input type="hidden" name="pager.currentPage" id="current_page"/>
			<input type="hidden" name="pager.pageCount" id="page_count"/>
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>融资产品管理</h2>
				</div>
				<div class="block_content">
					<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
						<tr>
							<td>
								<label>产品编号</label><s:textfield name="spModel.productNum" cssClass="text" style="width:200px;"></s:textfield>
							</td>
							<td>
								<label>产品名称</label><s:textfield name="spModel.productName" cssClass="text" style="width:200px;"></s:textfield>
							</td>
							<td>
								<label>类别</label><common:select name="spModel.financeType" valueSetId="32" headerKey="-1" headerValue="不限" style="height:30px;width:120px;"/>
							</td>
							<td>
								<label>状态</label><common:select name="spModel.status" valueSetMap="ZJ115" headerKey="-1" headerValue="不限" style="height:30px;width:120px;"/>
							</td>
							<td>
								<label>推荐</label><common:select name="spModel.recommendStatus" valueSetMap="ZJ102" headerKey="-1" headerValue="不限" style="height:30px;width:120px;"/>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<label>发布时间</label><s:textfield name="spModel.startDt" cssClass="text date_picker"></s:textfield>
								<label>~</label><s:textfield name="spModel.endDt" cssClass="text date_picker"></s:textfield>
							</td>
							<td colspan="3">
								<input type="submit" value="查 询"/>
							</td>
						</tr>
					</table>
				<!-- .block_head ends -->
					<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
						<thead>
				     		<tr>
					            <th>产品编号</th>
					            <th>产品名称</th>
					            <th>发行机构</th>
					            <th>贷款类别</th>
					            <th>贷款利率</th>
					            <th>发布时间</th>
					            <th>额度范围</th>
					            <th>贷款期限</th>
					            <th>状态</th>
					            <th>是否推荐</th>
					            <th>序号</th>
					            <th>操作</th>
				          	</tr>
			          	</thead>
			          	<tbody>
						 <s:iterator id ="item" value="pager.data" status="st">
							<tr id="item_${item.id}" class="<s:if test="#st.even">odd</s:if><s:else>even</s:else>">
								<td>${financeNum }</td>
								<td style="width:120px;word-wrap:break-word;word-break:break-all;">${item.financeName}</td>
								<td><common:print valueId="userId" type="user"/><br/></td>
								<td><common:print valueId="#item.financeType"/></td>
								<td><common:print valueId="#item.interestType"/></td>
					   			<td><s:date name="#item.createdt" format="yyyy-MM-dd"/></td>
					   			<td><s:number name="financeLittleamount" />-<s:number name="financeBigamount" />万元</td>
					   			<td>${item.financeLittledt}-${item.financeMostdt}月</td>
					   			<td><common:print valueId="#item.proStatus"/></td>
					   			<td><s:if test="recommendStatus == 1">是</s:if>
					   			<s:else>否</s:else>
					   			</td>
					   			<td><s:if test="recommendStatus == 1">${recommendNo }</s:if>&nbsp;</td>
					   			<td class="view_detail">
					   			<a href="/admin/loan/financePro!viewFinance.act?productId=${item.id }">查看</a>
					   			<a href="/admin/loan/financePro!updateFinancePage.act?product.id=${item.id }">修改</a>
					   			<s:if test="proStatus == 198">
						   			<a href="javascript:recommendPrd('${id }');">推荐</a>
					   			</s:if>
					   			</td>
							</tr>
						</s:iterator>
						</tbody>
				        </table>
						<div class="tableactions">
						</div>
						<!-- .tableactions ends -->
						<div class="pagination right">
							<s:include value="/public/pagination.jsp"/>
						</div>
						<!-- .pagination ends -->
					</div>
				</form>
		</div>
				
   	</div>
 </div>

<div id="recommend_set" style="display:none;" title="融资产品推荐">
</div>

</body>
</html>
