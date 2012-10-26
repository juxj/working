<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户中心-融资管理-融资申请详情页</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js">
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript">
//通用选项卡
$(document).ready(function() {
    $('.xxkbox:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu ul li');
    sb.hover(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkbox').eq(nb).show().siblings().hide();
    });
    //} 
});
	$(function() {
		var j = new Date();
		var y = j.getFullYear() - 1;
		$('.year').html(y);
		var jm = j.getFullYear() + "年" + j.getMonth() + "月";
		$('.yearmoth').html(jm);
	})
	function all() {
		$.post('/user/loan/userApplyManag!applyCheckList.act', {
			applyId : $('#applyid').val()
		}, function(data) {
			$("#all_log").html(data);
		})
		$("#all_log").dialog({
			width : 500,
			height : 300,
			modal : true
		});
	}
	function print(appId){
		window.open('/user/loan/userApplyManag!print.act?print=1&apply.id='+appId)
	}
</script>
</head>


<body>
	<!--头部-->
	<div class="header user_header">
		<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
		<div class="clear">&nbsp;</div>
	</div>
	<div class="hr_10">&nbsp;</div>
	<!--主体部分开始-->
	<div class="M_menu">
		融资管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a
			href="/user/loan/userApplyManag.act">融资申请管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;融资申请查看
	</div>
	<div class="hr_10">&nbsp;</div>
	
<!-- start -->
<div class="container_950 box_4">
	<div class="P_title">融资申请详情页</div>
	<div class="line" style="background:#f9f9f7;">
		<div class="f_text01">
			<form id="upstatus" action="/user/loan/userApplyManag!updateApplyStatus.act" method="post">
			<input type="hidden" id="applyid" name="applyId" value="${apply.id }">
			<input type="hidden"  name="apply.id" value="${apply.id }">
			<input type="hidden"  name="left" value="${left }">
			<input type="hidden"  name="right" value="${right }">
			<span>申请单号：${apply.applyNum}</span>
			<span>协议编号：<font color="d5652c"> ${apply.agreeNum}</font></span>
			<span>申请状态：<font color="d5652c"><common:print valueId="apply.applyStatus" /></font></span>
			<span style="padding-right:0px; float:right; margin-left: 5px; margin-right: 20px;"><input class="btn_s blue2" onclick="javascript:" type="button" onclick="print(${apply.id})"  value="打印"></span>
			<s:if test="apply.applyStatus==303">
			<span style="padding-right:0px; float:right; margin-left: 5px; margin-right: 10px;"><input class="btn_s blue2" onclick="javascript:$('#upstatus').submit();" type="button" value="提交修改"></span>
				<s:if test="left==2">
			<span style="padding-right:0px; float:right; margin-left: 5px; margin-right: 10px;"><input class="btn_s blue2" onclick="javascript:window.open('/user/loan/userApplyManag!editOrdCom.act?applyId=${apply.id}')" type="button" value="更改企业信息" /></span>
				</s:if>
				<s:if test="right==2">
			<span style="padding-right:0px; float:right; margin-left: 5px; margin-right: 10px;"><input class="btn_s blue2" onclick="javascript:window.open('/user/loan/userApplyManag!editOrdCom.act?applyId=${apply.id}')" type="button" value="更改申请信息" /></span>
				</s:if>
			</s:if>
			</form>
		</div><!-- 
		<div>尊敬的用户：您的融资申请已通过资金网预审，我们将会尽快将您的融资申请递交给资金方。</div> -->
		<div class="hr_20"> &nbsp; </div>
		<div class="center">
			<div class="left_gray">&nbsp;</div>
			<div class="m_gray1">企业信息</div>
			<div class="m_gray1">填写申请信息</div>
			<div class="m_red">预审中</div>
			<div class="m_gray">提交材料</div>
			<div class="m_gray">资金网审核</div>
			<div class="m_gray">金融机构审核</div>
			<div class="right_gray">&nbsp;</div>	
		</div>
		<div class="clear">&nbsp;</div>
		<div class="hr_10"> &nbsp; </div>
		<div>
			<div class="f_gz" style="margin-bottom:5px;"><span class="fl">申请单跟踪</span><a href="javascript:all();" style="float:right; margin-right: 40px; color: red;">更多..</a></div>
			<div class="hr_10"></div>
			<div class="clear">&nbsp;</div>
			<div class="y_title">
				<span class="y_title_01">操作时间</span>
				<span class="y_title_01">操作人</span>
				<span class="y_title_01">处理信息</span>
			</div>
			<s:iterator value="applyCheckList">
			<div class="y_connect">
				<span class="y_title_01"><s:date name="createdt" format="yyyy-MM-dd hh:mm:ss"/></span>
				<span class="y_title_01">${createUserName } &nbsp;</span>
				<span class="y_title_01">${checkView }</span>
			</div>
			</s:iterator>
			<div class="hr_10"> &nbsp; </div>									
		</div>		
	</div>
</div>
<!-- end -->
<div class="hr_10"> &nbsp;</div>
<!-- start -->
	<div class="container_950 box_6">
      <div class="menu_blue white"><h6>申请单详情</h6></div>
      <div class="f_box">
      	<div class="f_sqxx">
      		<span class="f_gz">申请信息</span>
			<div class="y_connect">
				<span class="y_title_02">融资用途：<font color="d5652c"> <common:print valueId="apply.loanPurpose" /> &nbsp;${apply.loanPurposeOther }</font></span>
				<span class="y_title_02">金额：<font color="d5652c"><s:number name="apply.loanAmount" />万元</font></span>
				<span class="y_title_02">期限：<font color="d5652c">${apply.loanMonth}个月</font></span>
				<span>是否有抵押物：<font color="d5652c"><common:print valueId="apply.haveMortgage" valueSetMap="ZJ102" /></font></span>
			</div>
			<div class="hr_20"> &nbsp;</div>
      	</div>
      	<div class="f_sqxx">
      		<span class="f_gz" style="margin-top:15px;">联系人信息</span>
			<div class="y_connect">
				<span class="y_title_02">联系人姓名：${ordCompany.linkname}</span>
				<span class="y_title_02">邮箱：${ordCompany.linkemail }</span>
				<span class="y_title_02">电话：${ordCompany.linktelephone }</span>
				<span class="y_title_02">所属部门：${ordCompany.department }</span>
				<span>职务：${ordCompany.position }</span>
			</div>
			<div class="hr_20"> &nbsp;</div>
      	</div> 
      	<div class="f_sqxx">
      		<span class="f_gz" style="margin-top:15px;">申请方信息</span>
				<div class="fl f_qyxx">
				    <div class="menu_out">
				      <div class="menu_nobg">企业信息</div>
				      <span>企业名称：${ordCompany.companyname }</span>
				      <span>营业执照号码：${ordCompany.licensecode }</span>
				      <span>组织机构代码证号码：${ordCompany.organizationcode }</span>
				      <span>税务登记证号码：${ordCompany.faxcode }</span>
				      <span>开户许可证号码：${ordCompany.bankpermitcode }</span>
				      <span>贷款卡号：${ordCompany.loancard }</span>
				      <span>注册地址：${ordCompany.regaddress }</span>
				      <span>邮编：${ordCompany.regpostcode }</span>
				      <span>所属园区：无</span>
				      <span>企业类型：<common:print valueId="ordCompany.enterprisetypeid" /></span>
				      <span>员工人数：<common:print valueId="ordCompany.employeesid" /></span>
				      <span>经营范围：${ordCompany.bizscope }</span>
				      <span>企业经营地址：${ordCompany.bizaddress }</span>
				      <span>邮编：${ordCompany.bizpostcode }</span>			      
				    </div>					
				</div>
				<div class="fr f_qyxx">
				    <div class="menu_out">
				      <div class="menu_nobg">法人信息</div>
				      <span>法定代表人：${ordCompany.legalperson }</span>
				      <span>学历：<common:print valueId="ordCompany.lpeducation" /></span>
				      <span>婚姻状况：<common:print valueId="ordCompany.lpmarry" /></span>
				      <span>从事所属行业年限：<common:print valueId="ordCompany.lpindustryyears" /></span>
				      <span>身份证号码：${ordCompany.lpcid }</span>
				      <span>手机：${ordCompany.lpmobile}</span>
				      <span>家庭电话：${ordCompany.lphometel }</span>
				      <span>常住地址：${ordCompany.lpliveaddress }</span>
				      <span>邮编：${ordCompany.lplivepostcode }</span>
				      <span>户籍所在地：${profileMap['address'] }</span>
				      <span>邮编：${ordCompany.lplivepostcode }</span>
				    </div>
				</div>
				<div class="clear">&nbsp;</div>
				<div class="hr_20"> &nbsp;</div>
		 </div>				
			
		    <div class="f_sqxx">
			     <div class="y_connect">
			      <span class="f_gz" style="margin-top:15px;">企业经营信息</span>
			      <span>企业<font class="year"></font>年销售额约为：<font><s:number name="apply.lastyearSaleVolume" />&nbsp;&nbsp;万元</font></span><br/>
			      <span>企业<font class="year"></font>年经营成本约为：<font><s:number name="apply.lastyearCost" />&nbsp;&nbsp;万元</font></span><br/>
			      <span>企业<font class="year"></font>年净利润率约为：<font>${apply.lastyearProfit }&nbsp;&nbsp;%</font></span><br/>
			      <span>截止到<font class="yearmoth"></font>，企业应收账款约为：<font><s:number name="apply.receivable" />&nbsp;&nbsp;万元</font></span><br/>
			      <span>截止到<font class="yearmoth"></font>，企业总库存约为：<font><s:number name="apply.stockSum" />&nbsp;&nbsp;万元</font></span><br/>
			      <span>截止到<font class="yearmoth"></font>，企业总资产约为：<font><s:number name="apply.assetSum" />&nbsp;&nbsp;万元</font></span><br/>
			      <span>截止到<font class="yearmoth"></font>，企业总负债约为：<font><s:number name="apply.debtSum" />&nbsp;&nbsp;万元</font></span><br/>			      
			     </div>
			     <div class="hr_20"> &nbsp;</div>
		    </div>	
		 <div class="f_sqxx">
		      <span class="f_gz" style="margin-top:15px;">其它信息</span>
		      <s:iterator value="extendsValueList">
		      <span>${fieldName }<font>&nbsp;&nbsp;${entityValue }</font></span>
		      </s:iterator>	
		      <div class="hr_20"> &nbsp;</div>				
		</div>
		<div class="fl">
			<span class="f_gz" style="margin-top:15px;">申请融资产品</span>
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
				  <tr class="sq_title">
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
		<div class="clear"> &nbsp;</div>		     	     	
      </div>
     </div>
<!-- end -->
<div class="hr_20"> &nbsp;</div>
<!--尾部-->
<div class="hr_20"> &nbsp;</div>
<!--尾部-->
	<jsp:include page="/public/bottom.jsp" />
<!--弹出框内日志页面-->
	<div id="all_log" style="display:none;" title="查看全部日志信息："></div>
</body>
</html>
