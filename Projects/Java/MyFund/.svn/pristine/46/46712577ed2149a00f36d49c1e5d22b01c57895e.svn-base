<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>企业经营贷款快速申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
	<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
	<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script language="javascript">
//文本框触发焦点效果s
    $(function() {
        finance_type_chenge('${product.financeType}');
    });

function finance_type_chenge(financeType){
	if(financeType == '151'){
		$('.finance_type_152').hide();
		$('.finance_type_153').hide();
		$('.finance_type_154').hide();
		$('.finance_type_151').show();
	}else if(financeType == '152'){
		$('.finance_type_151').hide();
		$('.finance_type_153').hide();
		$('.finance_type_154').hide();
		$('.finance_type_152').show();
	}else if(financeType == '153'){
		$('.finance_type_151').hide();
		$('.finance_type_152').hide();
		$('.finance_type_154').hide();
		$('.finance_type_153').show();
	}else if(financeType == '154'){
		$('.finance_type_151').hide();
		$('.finance_type_152').hide();
		$('.finance_type_153').hide();
		$('.finance_type_154').show();
	}
}

function updatestatus(value){
	if (window.confirm('确定提交吗！')) {
		$('#product_prostatus').val(value);
		$("#loanForm").submit();
	}
}

</script>
  </head>
  
  <body>
<!--头部2-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
  <div class="M_menu">
  	<div style="float: left;"><a href="#">首页</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">融资管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="/user/loan/financeProduct.act">融资产品管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">融资产品查看</a></div>
  </div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="apply_title" style="height:60px;">
	<p>产品查看</p>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
<form action="/user/loan/financeProduct!updateStatus.act" id="loanForm"  class="box_form" style="margin:0px;" method="post">
<s:hidden name="product.id"></s:hidden>
<s:hidden name="product.proStatus" id="product_prostatus"></s:hidden>
	<div class="C_title">产品参数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span></div>
	<div class="C_form">
            <dl>
              <dd>
                <h6>贷款产品名称：</h6>
                ${product.financeName}
              </dd>
              <dd>
                <h6>贷款类型：</h6>
                <common:print valueId="product.financeType" />
              </dd>
              <dd>
                <h6>贷款期限：</h6>
                ${product.financeLittledt } ~ ${product.financeMostdt }
				</dd>
				<dd>
                <h6>贷款金额：</h6>
                <s:number name="product.financeLittleamount" /> ~ <s:number name="product.financeBigamount" />&nbsp;&nbsp;万
				</dd>
			  <dd class="finance_type_154" style="display:none;" >
                <h6>房屋性质：</h6>
                <common:print valueId="product.houseProperty" />
              </dd>
              <dd class="finance_type_154" style="display:none;" >
                <h6>房屋使用年限：</h6>
                ${product.useTime}
              </dd>
				<dd>
                	<h6>贷款利率：</h6>
				  	<common:print valueId="product.interestType" />
				</dd>
				<s:if test="product.interests.size > 0">
				<dd>
					<h6>&nbsp;</h6>
					<div>
						<table width="300">
							<tr>
								<th align='left'>贷款期限</th>
								<th align='left'>基准利率</th>
								<th align='left'>浮动范围</th>
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
									+${item.rateUp }%
								</td>
							</tr>
							</s:iterator>
						</table>
					</div>
				</dd>
				</s:if>
				<s:if test="product.serviceCost != null && product.serviceCost > 0">
				  <dd>
	                <h6>服务费：</h6>
	                ${product.serviceCost }%
	              </dd>
				</s:if>
				<dd class="finance_type_151 finance_type_152 finance_type_153">
                <h6>支持还款方式：</h6>
				  <common:print valueId="product.repaymentType" />
				</dd>
				<dd class="finance_type_151 finance_type_152 finance_type_153">
                <h6>抵押类型：</h6>
				  <common:print valueId="product.mortgageType" />
				</dd>
				<dd>
                <h6>支持用途：</h6>
				  <common:print valueId="product.purposeType" />
				</dd>
				
				<dd class="finance_type_154" style="display:none;" >
                <h6>支持公积金：</h6>
                <common:print valueId="product.surplus" valueSetMap="ZJ102"/>
              </dd>
              
				<dd>
                <h6>审批时间：</h6>
                ${product.checkTime }个工作日
              </dd>
              <dd>
                <h6>面向区域：</h6>
                <div style="width:200px">
                	<s:if test="productAreaList.size()==0">
                	全国
                	</s:if>
                	<s:else>
	                		<s:iterator value="productAreaList" id="item">
	                			${item.name }&nbsp;&nbsp;
	                		</s:iterator>
                	</s:else>
                </div>
              </dd>
			 </dl>
	</div>
	<div class="clear"></div>
	<div class="C_title">产品介绍</div>
	<div class="C_form">
		<dl>
           <dd>
             	<h6>贷款产品特色：</h6>
			  <common:print valueId="product.proSpecial" />
		   </dd>
			<dd>
                <h6>贷款产品介绍：</h6>
                <div style="padding-left:140px;">${product.proIntroduce }</div>
              </dd>
		</dl>
	</div>
	<div class="clear"></div>
	<div class="C_title">申贷资料</div>
	<div class="C_form">
		<dl>
			<dd>
                <h6>申贷需要资料清单</h6>
              </dd>
              <dd>
              	<h6>&nbsp;</h6>
              	<s:if test="product.dataFiles != null && product.dataFiles.size() > 0">
                	<table width="400">
						<tr>
							<th>资料名称</th>
							<th>份数</th>
							<th>说明</th>
						</tr>
						<s:iterator value="product.dataFiles" id="item">
						<tr>
							<td>
								${item.dataName }
							</td>
							<td>
								${item.needNum }
							</td>
							<td>
								${item.dataSupply }
							</td>
						</tr>
						<s:if test="haveMemo == 1">
							<tr>
								<td colspan="3">
									<div style="padding-left:40px;">${otherMemo }</div>
								</td>
							</tr>
						</s:if>
						</s:iterator>
					</table>
                </s:if>
              </dd>
              <dd>
              	<h6>资料递交方式：</h6>
				  <common:print valueId="product.uploadWay" />
			  </dd>
		</dl>
	</div>
	<div class="clear"></div>
	<div class="C_title">申请条件</div>
	<div class="C_form">
		<dl>
			  <dd class="finance_type_151 finance_type_152">
                <h6>申请企业所属行业：</h6>
                	<s:if test="productIndustryList.size()==0">
                		不限
                	</s:if>
                	<s:else>
	                		<s:iterator value="productIndustryList" id="item">
	                			${item.name }&nbsp;&nbsp;
	                		</s:iterator>
                	</s:else>
              </dd>
              <dd class="finance_type_151 finance_type_152">
                <h6>企业的总资产：</h6>
                 <common:print valueId="product.companyAllAsset" valueSetMap="ZJ112"/>
              </dd>
              <dd class="finance_type_151">
                <h6>企业的年营业收入：</h6>
                <common:print valueId="product.operatIncome" valueSetMap="ZJ104"/>
              </dd>
              <dd class="finance_type_151">
                <h6>企业成立年数：</h6>
                <common:print valueId="product.settingYear" valueSetMap="ZJ105"/>
              </dd>
              <dd class="finance_type_152" style="display:none;" >
                <h6>保证金：</h6>
                <common:print valueId="product.needEnsure" valueSetMap="ZJ101"/>
              </dd>
              <dd class="finance_type_152" style="display:none;" >
                <h6>申请人行业经验：</h6>
                <common:print valueId="product.experience" valueSetMap="ZJ106"/>
              </dd>
              <dd class="finance_type_152" style="display:none;" >
                <h6>经营场所：</h6>
                <common:print valueId="product.runningArea" valueSetMap="ZJ103"/>
              </dd>
              
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>申请人月工资收入：</h6>
                <common:print valueId="product.salaryIncome" valueSetMap="ZJ107"/>
              </dd>
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>工资发放形式：</h6>
                <common:print valueId="product.salaryPutWay" valueSetMap="ZJ108"/>
              </dd>
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>现单位工作时长：</h6>
                <common:print valueId="product.workTime" valueSetMap="ZJ109"/>
              </dd>
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>所在地自有房产：</h6>
                <common:print valueId="product.house" valueSetMap="ZJ103"/>
              </dd>
              <dd class="finance_type_152 finance_type_153 finance_type_154" style="display:none;" >
                <h6>信用记录：</h6>
                <common:print valueId="product.creditAcount" valueSetMap="ZJ103"/>
              </dd>
              <dd class="finance_type_152 finance_type_153 finance_type_154" style="display:none;" >
                <h6>银行流水：</h6>
                <common:print valueId="product.bankSalaryList" valueSetMap="ZJ103"/>
              </dd>
              
              <dd>
                <h6>其他申请条件：</h6>
                <div style="padding-left:140px;">${product.otherRequire }</div>
              </dd>
		</dl>
	</div>
		<div class="clear"></div>
	<div class="C_title">自定义申请单</div>
	<div class="C_form">
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
	</div>	
		<div class="hr_10"> &nbsp; </div>
			<div class="center" style="width:500px;">
			<s:if test="product.proStatus == 196">
				<input type="button" value="提交审核"  class="but_gray" onclick="updatestatus(197);" ></input>
				<input type="button" value="撤销"  class="but_gray" onclick="updatestatus(199);" ></input>
			</s:if>
			<s:elseif test="product.proStatus == 197">
				<input type="button" value="撤销"  class="but_gray" onclick="updatestatus(199);" ></input>
			</s:elseif>
			<s:elseif test="product.proStatus == 198">
				<input type="button" value="撤销"  class="but_gray" onclick="updatestatus(199);" ></input>
			</s:elseif>
			</div>
			<div class="hr_10"> &nbsp; </div>
</form>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
