<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/jquery.validate.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function toPage(pageNo, useless){
		var url= "/admin/requestInfo!showHome.act?pageNo="+pageNo;
		window.location.href=url;
	}
	
	$(function(){
		$(".date_picker").datepicker();
		$("#frmQueryRequestInfo").validate();
	});
	
	function showDetail(clbRequestInfoId) {
		var url="/service/requestInfoAction!detail.act?clbRequestInfoId="+clbRequestInfoId;
		window.location.href = url;
	}
	
	function changeStatus(id, rank) {
		var url= "/admin/requestInfo!changeRequestInfoStatus.act";
		$.post(url, {id:id, rank:rank}, function(data, status, response){
			if (status=='success') {
				switch (rank) {
					case 1: 
						$("#statusLabel_"+id).html("通过")
						break
					case -1: 
						$("#statusLabel_"+id).html("拒绝")
						break
					default:
				}
			}
		});
	}
</script>
</head>
<body>
	<div id="hld">
		<div class="wrapper">
			<s:include value="../head.jsp"></s:include>
			<div class="block">
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>项目信息</h2>
					<ul>
						<li class="nobg"><a href="#">...</a></li>
						<li><a href="#">...</a></li>
					</ul>
				</div>
				
				<div class="block_content">
					<form id="frmQueryRequestInfo" action="/admin/requestInfo!showHome.act" method="post">
						<input type="hidden" id="pageNo" name="pageNo" value="1"/>
						<table width="100%">
							<tr>
								<td style="text-align:right">标题:</td>
								<td colspan="3">
									<s:textfield type="text" id="requestInfo.title" 
										name="requestInfo.title" cssClass="text small" width="100"/> </td>
								
								<td style="text-align:right">所属行业:</td> 
								<td>
									<s:select name="requestInfo.industry" list="industryList" listKey="name" cssClass="cmf-skinned-select"
										listValue="name" headerKey="" headerValue="不限"></s:select>
								</td>
							</tr>
							
							<tr>
								<td style="text-align:right">融资金额:</td>
								<td colspan="3">
									<s:textfield id="requestInfo.totalMoney" 
										name="requestInfo.totalMoney" cssClass="text number"/></td>
								</td>
								<td style="text-align:right">所属地域:</td>
								<td>
									<s:select name="requestInfo.area" list="provinceList" listKey="name" listValue="name"
										headerKey="" headerValue="不限" cssClass="cmf-skinned-select"></s:select>	</td>
								
							</tr>
							
							<tr>
								<td style="text-align:right">融资方式:</td>
								<td>
									<s:select name="requestInfo.financeType" list="financingTypeList" listKey="name" listValue="name"
										headerKey="" headerValue="不限" cssClass="cmf-skinned-select" ></s:select>
								</td>
								<td style="text-align:right">状态:</td>
								<td>
									<select id="requestInfo.rank"  name="requestInfo.rank" class="cmf-skinned-select" >
										<option value="0" selected> 未审核 </option>
										<option value="1"> 已通过 </option>
										<option value="-1"> 未通过  </option>
									</select>
								</td>
								<td style="text-align:right">发布日期:</td>
								<td>
									<s:textfield id="requestInfo.lastPostDate" name="requestInfo.lastPostDate" cssClass="text date_picker"/>
									<s:textfield id="requestInfo.lastPostDate1" name="requestInfo.lastPostDate1" cssClass="text date_picker"/>
									<input type="submit" value="查询" class="submit"/>
								</td>
							</tr>
						</table>
						</p>
					</form>
				</div>
				<!-- .block.small.right ends -->
				<div class="block_content">
					<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
						<thead>
							<tr>
								<th width="10"><input type="checkbox" class="check_all" /></th>
								<th class="header" width="28%">标题</th>
								<th class="header" >所属行业</th>
								<th class="header" >融资金额</th>
								<th class="header" >所属地域</th>
								<th class="header" >融资方式</th>
								<th class="header" >状态</th>
								<th class="header" >发布日期</th>
								<th class="header" >操作</th>
								<td>&nbsp;</td>
							</tr>
						</thead>
						<tbody>
							<s:iterator id="item" value="pager.data" status="st">
							<s:set name="isOdd" value="'even'"/>
							<s:if test="#st.even">
								<s:set name="isOdd" value="'odd'"/>
							</s:if>
								<tr class="<s:property value="#isOdd"/>">
									<td><input type="checkbox" /></td>
									<td title="${item.title }">
										<div title="${item.title }" class="restrict_item_200">
											<a href="javascript:showDetail(${item.id })">${item.title}</a>
										</div>
									</td>
									<td>
										<div title="${item.industry }" class="restrict_item_100">
											<s:if test="#item.industry==null">
												不限
											</s:if> <s:else>
												${item.industry }
											</s:else>
										</div>
									</td>
									<td><s:text name="format.float"><s:param value="#item.totalMoney"></s:param></s:text>（万元）</td>
									<td>${item.area }</td>
									<td>
										<div title="${item.financeType }" class="restrict_item_100">
											<s:if test="#item.financeType==null">
												不限
											</s:if> <s:else>
												${item.financeType }
											</s:else>
										</div>
									</td>
									<td id="statusLabel_${item.id }">
										<s:if test="#item.rank==0">
											未审核
										</s:if>
										<s:if test="#item.rank==1">
											已通过
										</s:if>
										<s:if test="#item.rank==-1">
											已阻止
										</s:if>
									</td>
									<td><s:date name="#item.lastPostDate" /></td>
									<td class="operator">
										<s:if test="#item.rank==0">
											<a href="javascript:changeStatus(${item.id },1)">通过</a>, <a href="javascript:changeStatus(${item.id },-1)">拒绝</a>
										</s:if>
										
										<s:if test="#item.rank==1">
											<a href="javascript:changeStatus(${item.id },-1)">停用</a>
										</s:if>
										
										<s:if test="#item.rank==-1">
											<a href="javascript:changeStatus(${item.id },1)">启用</a>
										</s:if>
									
									</td>
									<td>&nbsp;</td>
								</tr>
							</s:iterator>
							
						</tbody>
					</table>
					<div class="pagination right">
						<jsp:include page="/public/pagination.jsp"></jsp:include>
					</div>
				</div>
			</div>
				<div class="bendl"></div>
				<div class="bendr"></div>
			</div>
			<!-- .block ends -->
			<div id="footer">
				<p class="left">
					<a href="#">YourWebsite.com</a>
				</p>
				<p class="right">
					powered by <a
						href="http://themeforest.net/item/adminus-beautiful-admin-panel-interface/94668?ref=enstyled">Adminus</a>
					v1.4
				</p>
			</div>
		</div>
		<!-- wrapper ends -->
	</div>
</body>
</html>