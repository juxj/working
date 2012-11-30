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
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js">
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
</head>
<body>
	<!--头部-->
<!-- start -->
	<div class="container_950">
      <div align="center" style="line-height: 25px;"><h3>申请单详情</h3></div>
      <div class="f_box">
      	<div class="f_sqxx">
      		<h5>申请信息</h5>
			<div class="y_connect">
				<span class="y_title_02">融资用途：<font color="d5652c"> <common:print valueId="apply.loanPurpose" /> &nbsp;${apply.loanPurposeOther }</font></span>
				<span class="y_title_02">金额：<font color="d5652c"><s:number name="apply.loanAmount" />万元</font></span>
				<span class="y_title_02">期限：<font color="d5652c">${apply.loanMonth}个月</font></span>
				<span>是否有抵押物：<font color="d5652c"><common:print valueId="apply.haveMortgage" valueSetMap="ZJ102" /></font></span>
			</div>
			<div class="hr_10"> &nbsp;</div>
      	</div>
      	<div class="m_20 f_sqxx" >
      		<h5 style="margin-top:15px;">申请方信息</h5>
			<div>
				<div class="fl f_qyxx">
				    <div class="menu_out">
				      <span>姓名：${session._user.realname} <s:if test="#session._user.gender==1">先生</s:if><s:else>女士</s:else></span>
				      <span>出生年月：<s:date name="usrPerson.birthday" /></span>
				      <span>教育程度：${profileMap['eduAtion'] }</span>
				      <span>身份证号码：${usrPerson.cid}</span>
				      <span>所在地：${profileMap['address'] }</span>
				      <span>详细地址：${profileMap['address'] } ${usrPerson.address }</span>
				      <span>邮政编码：${usrPerson.postcode }</span>
				      <span>职业： ${profileMap['psersoncareer'] }</span>
				      <span>固定电话：${usrPerson.telephone }</span>
				      <span>联系方式：${profileMap['imtype1'] }&nbsp;&nbsp; ${usrPerson.im1 }</span>			      
				    </div>					
				</div>
			</div>
			<div class="clear">&nbsp;</div>
      	</div>
		<div  class="f_sqxx">
		    <div>
		      <h5>个人信息</h5>
		      <span>行业：<font>${pindName } <s:if test="cindName!=null">&nbsp; 子行业：${cindName }</s:if></font></span><br/>
		      <span>行业经验：<font><s:number name="apply.experience" />年</font></span><br/>
		      <span>年营业额：<font><common:print valueId="apply.allyearVolume"/></font></span><br/>
		      <span>经营场所：<font><s:if test="apply.runningArea==1">有</s:if><s:else>无</s:else></font></span><br/>
		      <span>银行借款经历：<font><s:if test="apply.hostoryLoan==1">有</s:if><s:else>无</s:else></font></span><br/>
		      <span>使用信用卡经历：<font><s:if test="apply.useCreditcard==1">有</s:if><s:else>无</s:else></font></span><br/>
		      <span>银行流水：<font><s:if test="apply.bankSalaryList==1">有</s:if><s:else>无</s:else></font></span><br/>
		    </div>	
		    <br/>
		</div>	
		<div class="f_sqxx" >
		      <h5 style="margin-top:15px;">其它信息</h5>
		      <span >asdf</span>
		</div>
		<div class="fl">
		    <div class="menu_out">
			<h5 style="margin-top:15px;margin-bottom:15px;">申请融资产品</h5>
				<table border="0" cellspacing="0" cellpadding="0" class="sq_table">
				  <tr>
				    <td colspan="8">
				    	<s:if test="logo == null">
							<img src="/images/banklogo/b/zj198.jpg" class="js_bank"/><font href="" class="sudait" >&nbsp;&nbsp;&nbsp;&nbsp;速贷通</font>
						</s:if> 
						<s:else>
							<img src="/images/banklogo/b/${product.logo }"  class="js_bank"/><font href="" class="sudait" >&nbsp;&nbsp;&nbsp;&nbsp;速贷通</font>
						</s:else>
					</td>
				  </tr>
				  <tr class="sq_connect">
				    <td>类型</td>
				    <td>金额</td>
				    <td>年利率</td>
				    <td>期限</td>
				    <td>还款方式</td>
				    <td>担保方式</td>
				    <td>放款时间</td>
				    <td>面向区域</td>
				  </tr>
				  <tr class="sq_connect">
				    <td><common:print valueId="product.financeType" /></td>
				    <td><s:number name="product.financeLittleamount" />-<s:number name="product.financeBigamount" />万元</td>
				    <td><common:print valueId="apply.loanMonth"
							type="rate" />% <s:if
							test="product.serviceCost != null && product.serviceCost > 0">
							<br />另收${product.serviceCost }%服务费
		        	</s:if></td>
				    <td>${product.financeLittledt }-${product.financeMostdt }月</td>
				    <td><common:print valueId="product.repaymentType" /></td>
				    <td><common:print valueId="product.mortgageType" /></td>
				    <td>${product.checkTime }个工作日</td>
				    <td><s:if
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
		</div> 
		<div class="clear"> &nbsp;</div>		     	     	
      </div>
    </div>  
<!-- end -->
</body>
</html>
