<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>用户中心-融资管理-融资申请详情页</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" />
<link rel="stylesheet" href="/css/module.css" type="text/css" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" />
<style type="text/css">
.print_table{width:100%; border-top: 1px solid #000; border-right: 1px solid #000;}
.print_table td{border-bottom: 1px solid #000; border-left: 1px solid #000;padding:10px}
</style>
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js">
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
</head>
<body><object classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0" id="wb" name="wb" width="0">
</object>
	<input type="button" value="打印" onclick="wb.ExecWB(6,6)"/> 
	<!--头部-->
<!-- start -->
      <div align="center" style="line-height: 25px;"><h4>申请单详情</h4></div>
      <div >
      	<div >
      		<h6>申请信息</h6>
				<span>融资用途：<common:print valueId="apply.loanPurpose" /> &nbsp;${apply.loanPurposeOther }
				&nbsp;&nbsp;&nbsp;&nbsp;金额：<s:number name="apply.loanAmount" />万元
				&nbsp;&nbsp;&nbsp;&nbsp;期限：${apply.loanMonth}个月
				&nbsp;&nbsp;&nbsp;&nbsp;是否有抵押物：<common:print valueId="apply.haveMortgage" valueSetMap="ZJ102" /></span>
		</div>
		<div class="hr_10"> &nbsp;</div>
      	<div >
      		<h6>联系人信息</h6>
				<span>联系人姓名：${ordCompany.linkname}
				&nbsp;&nbsp;&nbsp;&nbsp;邮箱：${ordCompany.linkemail }
				&nbsp;&nbsp;&nbsp;&nbsp;电话：${ordCompany.linktelephone }
				&nbsp;&nbsp;&nbsp;&nbsp;所属部门：${ordCompany.department }
				&nbsp;&nbsp;&nbsp;&nbsp;职务：${ordCompany.position }</span>
			</div>
      	</div> 
      	<div >
      		<h6 style="margin-top:15px;">申请方信息</h6>
			<div>
				<div class="fl" style="width:50%;">
				    <div class="menu_out">
				      <div class="menu_nobg">企业信息</div>
				      <span>企业名称：${ordCompany.companyname }</span>
				      <span>营业执照号码：${ordCompany.licensecode }</span>
				      <span>组织机构代码证号码：${ordCompany.organizationcode }</span>
				      <span>税务登记证号码：${ordCompany.faxcode }</span>
				      <span>开户许可证号码：${ordCompany.bankpermitcode }</span>
				      <span>贷款卡号：${ordCompany.loancard }</span>
				      <span>注册地址：${profileMap['address'] } ${ordCompany.regaddress }</span>
				      <span>邮编：${ordCompany.regpostcode }</span>
				      <span>所属园区：无</span>
				      <span>企业类型：<common:print valueId="ordCompany.enterprisetypeid" /></span>
				      <span>员工人数：<common:print valueId="ordCompany.employeesid" /></span>
				      <span>经营范围：${ordCompany.bizscope }</span>
				      <span>企业经营地址：${profileMap['address'] } ${ordCompany.bizaddress }</span>
				      <span>邮编：${ordCompany.bizpostcode }</span>			      
				    </div>					
				</div>
				<div class="fr" style="width:50%;">
				    <div class="menu_out">
				      <div class="menu_nobg">法人信息</div>
				      <span>法定代表人：${ordCompany.legalperson }</span>
				      <span>学历：<common:print valueId="ordCompany.lpeducation" /></span>
				      <span>婚姻状况：<common:print valueId="ordCompany.lpmarry" /></span>
				      <span>从事所属行业年限：<common:print valueId="ordCompany.lpindustryyears" /></span>
				      <span>身份证号码：${ordCompany.lpcid }</span>
				      <span>手机：${ordCompany.lpmobile}</span>
				      <span>家庭电话：${ordCompany.lphometel }</span>
				      <span>常住地址：${profileMap['address'] } ${ordCompany.lpliveaddress }</span>
				      <span>邮编：${ordCompany.lplivepostcode }</span>
				      <span>户籍所在地：${profileMap['address'] }</span>
				      <span>邮编：${ordCompany.lplivepostcode }</span>
				    </div>
				</div>				
			</div>
			<div class="clear">&nbsp;</div>
      	</div>
		<div style="width:100%;">
		    <div >
		      <h6 style="margin-top:15px;">企业经营信息</h6>
		      <span>企业<font class="year">年销售额约为：<s:number name="apply.lastyearSaleVolume" />&nbsp;&nbsp;万元</span><br/>
		      <span>企业<font class="year">年经营成本约为：<s:number name="apply.lastyearCost" />&nbsp;&nbsp;万元</span><br/>
		      <span>企业<font class="year"></font>年净利润率约为：<font>${apply.lastyearProfit }&nbsp;&nbsp;%</font></span><br/>
		      <span>截止到<font class="yearmoth"></font>，企业应收账款约为：<font><s:number name="apply.receivable" />&nbsp;&nbsp;万元</font></span><br/>
		      <span>截止到<font class="yearmoth"></font>，企业总库存约为：<font><s:number name="apply.stockSum" />&nbsp;&nbsp;万元</font></span><br/>
		      <span>截止到<font class="yearmoth"></font>，企业总资产约为：<font><s:number name="apply.assetSum" />&nbsp;&nbsp;万元</font></span><br/>
		      <span>截止到<font class="yearmoth"></font>，企业总负债约为：<font><s:number name="apply.debtSum" />&nbsp;&nbsp;万元</font></span><br/>			      
		    </div>	
		</div>	
		<div style="width:100%;">
		      <h6 style="margin-top:15px;">其它信息</h6>
		      <span >asdf</span>
		</div>
		<div>
			<h6 style="margin-top:15px;">申请融资产品</h6>
				<table class="print_table" >
				  <tr>
				    <td colspan="8" >
				    	<s:if test="logo == null">
							<img src="/images/banklogo/b/zj198.jpg" class="js_bank"/><font href="" class="sudait" >&nbsp;&nbsp;&nbsp;&nbsp;速贷通</font>
						</s:if> 
						<s:else>
							<img src="/images/banklogo/b/${product.logo }"  class="js_bank"/><font href="" class="sudait" >&nbsp;&nbsp;&nbsp;&nbsp;速贷通</font>
						</s:else>
					</td>
				  </tr>
				  <tr >
				    <td >类型</td>
				    <td >金额</td>
				    <td >年利率</td>
				    <td >期限</td>
				    <td >还款方式</td>
				    <td >担保方式</td>
				    <td >放款时间</td>
				    <td >面向区域</td>
				  </tr>
				  <tr >
				    <td ><common:print valueId="product.financeType" /></td>
				    <td ><s:number name="product.financeLittleamount" />-<s:number name="product.financeBigamount" />万元</td>
				    <td ><common:print valueId="apply.loanMonth"
							type="rate" />% <s:if
							test="product.serviceCost != null && product.serviceCost > 0">
							<br />另收${product.serviceCost }%服务费
		        	</s:if></td>
				    <td >${product.financeLittledt }-${product.financeMostdt }月</td>
				    <td ><common:print valueId="product.repaymentType" /></td>
				    <td ><common:print valueId="product.mortgageType" /></td>
				    <td >${product.checkTime }个工作日</td>
				    <td ><s:if
							test="productAreaList.size()==0">
                	全国
                	</s:if> <s:else>
							<s:iterator value="productAreaList" id="item">
	                			${item.name }&nbsp;&nbsp;
	                		</s:iterator>
						</s:else></td>
				  </tr>
				</table>		      			      
		    </div>					
		<div class="clear"> &nbsp;</div>		     	     	
<!-- end -->
</body>
</html>
