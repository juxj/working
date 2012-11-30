<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>企业经营贷款快速申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/xheditor-1.1.14-zh-cn.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script language="javascript">
$(function() {
	$(":button").button();
    finance_type_chenge("${product.financeType}");
});
function finance_type_chenge(financeType){
	if(financeType == "151"){
		$(".finance_type_152").hide();
		$(".finance_type_153").hide();
		$(".finance_type_154").hide();
		$(".finance_type_151").show();
	}else if(financeType == "152"){
		$(".finance_type_151").hide();
		$(".finance_type_153").hide();
		$(".finance_type_154").hide();
		$(".finance_type_152").show();
	}else if(financeType == "153"){
		$(".finance_type_151").hide();
		$(".finance_type_152").hide();
		$(".finance_type_154").hide();
		$(".finance_type_153").show();
	}else if(financeType == "154"){
		$(".finance_type_151").hide();
		$(".finance_type_152").hide();
		$(".finance_type_153").hide();
		$(".finance_type_154").show();
	}
}
function updatestatus(value){
	if (window.confirm('确定提交吗！')) {
		$("#product_prostatus").val(value);
		$("#loanForm").submit();
	}
}

</script>
</head>
  
<body>
<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
		<div class="block">
			<s:if test="msg!=null"><div class="message success">
			<p>${msg}</p>
			</div></s:if>
			<div class="block_head">
				<div class="bheadl"></div>
				<div class="bheadr"></div>
				<h2><a href="/admin/loan/financePro!financeAdmin.act">融资产品管理 </a>» 产品详情</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
			<form action="/admin/loan/financePro!updateStatus.act" id="loanForm" method="post">
			<s:hidden name="product.id"></s:hidden>
			<s:hidden name="product.proStatus" id="product_prostatus"></s:hidden>
				<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
					<tbody>
						<tr class="even" style="color:#97181d;font-weight: bold;"><td colspan="2">产品参数</td></tr>
						<tr><td>机构名称</td><td>${companyName}</td></tr>
						<tr><td>发布人</td><td>${userName}</td></tr>
						<tr><td>贷款产品名称</td><td>${product.financeName}</td></tr>
						<tr><td>贷款类型</td><td><common:print valueId="product.financeType" /></td></tr>
						<tr><td>贷款期限</td><td>${product.financeLittledt } ~ ${product.financeMostdt }</td></tr>
						<tr><td>贷款金额</td><td>${product.financeLittleamount}~${product.financeBigamount}&nbsp;万</td></tr>
						<tr class="finance_type_154" style="display:none;"><td>房屋性质</td><td><common:print valueId="product.houseProperty" /></td></tr>
						<tr class="finance_type_154" style="display:none;"><td>房屋使用年限</td><td>${product.useTime}</td></tr>
						<tr><td>贷款利率</td><td><common:print valueId="product.interestType" /></td></tr>
						<s:if test="product.interests.size > 0">
						<tr><td></td><td>
							<table width="400">
							<tr>
								<th align='left'>贷款期限</th>
								<th align='left'>基准利率</th>
								<th align='left'>利率范围</th>
							</tr>
							<s:iterator value="product.interests" id="item">
							<tr>
								<td>
									${item.interestMemo }
								</td>
								<td>
									<common:print valueId="#item.financeEnddt" type="rate"/>%
								</td>
								<td>
									${rateDown } - ${rateUp }%
								</td>
							</tr>
							</s:iterator>
						</table>
						</td></tr>
						</s:if>
						<s:if test="product.serviceCost != null && product.serviceCost > 0">
							<tr><td>服务费</td><td>${product.serviceCost }%</td></tr>
						</s:if>
						<tr><td>支持还款方式</td><td><common:print valueId="product.repaymentType" /></td></tr>
						<tr><td>抵押类型</td><td><common:print valueId="product.mortgageType" /></td></tr>
						<tr><td>支持用途</td><td><common:print valueId="product.purposeType" /></td></tr>
						<tr class="finance_type_154" style="display:none;"><td>支持公积金</td><td><common:print valueId="product.surplus" valueSetMap="ZJ102"/></td></tr>
						<tr><td>审批时间</td><td>${product.checkTime }</td></tr>
						<tr><td>面向区域</td><td>
                	<s:if test="productAreaList.size()==0">全国</s:if><s:else><s:iterator value="productAreaList" id="item">${item.name }&nbsp;</s:iterator></s:else></td></tr>
						<tr class="even" style="color:#97181d;font-weight: bold;"><td colspan="2">产品介绍</td></tr>
						<tr><td>贷款产品特色</td><td><common:print valueId="product.proSpecial" /></td></tr>
						<tr><td>贷款产品介绍</td><td>${product.proIntroduce }</td></tr>
						<tr class="even"><td colspan="2">申贷资料</td></tr>
						<tr><td colspan="2">申贷需要资料清单</td></tr>
						<s:if test="product.dataFiles.size() > 0"><tr><td></td><td>
	                		<table width="400">
								<tr>
									<th>资料名称</th>
									<th>份数</th>
									<th>说明</th>
								</tr>
								<s:iterator value="product.dataFiles" id="item">
								<tr>
									<td>${item.dataName }</td>
									<td>${item.needNum }</td>
									<td>${item.dataSupply }</td>
								</tr>
								</s:iterator>
							</table>
                		</td></tr></s:if>
						<tr><td>资料递交方式</td><td><common:print valueId="product.uploadWay" /></td></tr>
						<tr class="even" style="color:#97181d;font-weight: bold;"><td colspan="2">申请条件</td></tr>
						<tr><td>所属行业</td><td><s:if test="productIndustryList.size()==0">不限</s:if><s:else><s:iterator value="productIndustryList" id="item">${item.name }&nbsp;</s:iterator></s:else></td></tr>
						<tr class="finance_type_151"><td>企业的总资产</td><td>${product.companyAllAsset}&nbsp;万元</td></tr>
						<tr><td>年营业收入</td><td><common:print valueId="product.operatIncome" valueSetMap="ZJ104"/></td></tr>
						<tr class="finance_type_151"><td>企业成立年数</td><td><common:print valueId="product.settingYear" valueSetMap="ZJ105"/></td></tr>
						<tr class="finance_type_152"><td>保证金</td><td><common:print valueId="product.needEnsure" valueSetMap="ZJ101"/></td></tr>
						<tr class="finance_type_152"><td>申请人行业经验</td><td><common:print valueId="product.experience" valueSetMap="ZJ106"/></td></tr>
						<tr class="finance_type_152"><td>经营场所</td><td><common:print valueId="product.runningArea" valueSetMap="ZJ103"/></td></tr>
              			<tr class="finance_type_153 finance_type_154" style="display:none;"><td>申请人月工资收入</td><td><common:print valueId="product.salaryIncome" valueSetMap="ZJ107"/></td></tr>
              			<tr class="finance_type_153 finance_type_154" style="display:none;"><td>工资发放形式</td><td><common:print valueId="product.salaryPutWay" valueSetMap="ZJ108"/></td><td></td></tr>
						<tr class="finance_type_153 finance_type_154" style="display:none;"><td>现单位工作时长</td><td><common:print valueId="product.workTime" valueSetMap="ZJ109"/></td></tr>
						<tr class="finance_type_153 finance_type_154" style="display:none;" ><td>所在地自有房产</td><td><common:print valueId="product.house" valueSetMap="ZJ103"/></td></tr>
						<tr class="finance_type_152 finance_type_153 finance_type_154" style="display:none;" ><td>信用记录</td><td><common:print valueId="product.creditAcount" valueSetMap="ZJ103"/></td></tr>
						<tr class="finance_type_152 finance_type_153 finance_type_154" style="display:none;" ><td>银行流水</td><td><common:print valueId="product.bankSalaryList" valueSetMap="ZJ103"/></td></tr>
						<tr><td>其他申请条件</td><td>${product.otherRequire }</td></tr>
						
						<tr class="even" style="color:#97181d;font-weight: bold;"><td colspan="2">自定义申请单</td></tr>
						<tr>
							<td colspan="2">
								<table class="container_950 center box_4 ctl" style="width:800px">
									<%int m = 1; %>
										<tr class="top_color">
											<td style="padding-left:25px;">项目名</td>
											<td>类型</td>
											<td>选项</td>
										</tr>
										<s:iterator value="financeProductSpModel.extendsPropertyList">
											<tr class="top_color01">
												<td style="padding-left:25px;">${fieldName }</td>
												<td><common:print valueId="fieldType" valueSetMap="ZJ114"/></td>
												<td>
													${fieldValue }
												</td>
											</tr>
										</s:iterator>
								</table>
							</td>
						</tr>
						
						<tr><td colspan="2">
						<!-- 
						<input type="button" value="返 回" onclick="document.location.href='/admin/loan/financePro!financeAdmin.act';"/> 
						-->
						<s:if test="product.proStatus == 197">
							<input type="button" value="发 布" onclick="updatestatus(198);"/>
							<input type="button" value="撤 销" onclick="updatestatus(199);"/>
						</s:if>
						<s:elseif test="product.proStatus == 198">
							<input type="button" value="撤 销" onclick="updatestatus(199);"/>
						</s:elseif>
						<s:elseif test="product.proStatus == 199">
							<input type="button" value="删 除" onclick="updatestatus(200);"/>
						</s:elseif>
						</td></tr>
					</tbody>
				</table>
			</form>
			</div>
			<!-- .block_content ends -->
			<div class="bendl"></div>
			<div class="bendr"></div>
		</div>

	</div>
</div>
</body>
</html>
