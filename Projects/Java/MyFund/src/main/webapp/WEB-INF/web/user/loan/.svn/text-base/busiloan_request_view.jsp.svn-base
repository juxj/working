<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="common" uri="/Common"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资意向单查看 </title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script type="text/javascript">
//推荐产品
function Recommend(id,appId){
	$("#pro_recommend").dialog({
		width:980,
		height:418,
		modal: true
	});
	$.post("/user/loan/financeProduct!recommendProduct.act",{requestId:id,appId:appId},function(data){
			$("#pro_recommend").html(data);
	});
	return false;
} 
//选择推荐产品后提交
function SelectRecom(){
	var arrChk=$("input[name='checkId']:checked");
	if(arrChk.length>3){
		alert("最多只能推荐3款产品！");
		return false;
	}
	var checkIds = new Array(arrChk.length);
    for(var j=0;j<arrChk.length;j++){
    	checkIds[j] = arrChk[j].value
    }
	$.post("/user/loan/recommendPro!selectRecProdcut.act",{checkId:checkIds.toString(),requestId:$("input[name='requestId']").val()});
	$("#pro_recommend").dialog("close");
}

//个人用户查看金融机构推荐的贷款产品
function LookRecPro(id){
	location.href = "/user/loan/recommendPro!lookRecPro.act?requestId="+id;
}
</script>
</head>

<body>
	<!--头部-->
	<div class="header user_header">
	<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
	  <div class="clear"> &nbsp; </div>
	</div>
	<div class="hr_10"> &nbsp; </div>
	<!--头部结束-->
	<div class="M_menu">
  	融资管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="LoanRequest!loanManage.act">融资意向单管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;融资意向单查看
  </div>
	<!--主体部分开始-->
	<div class="hr_10"> &nbsp; </div>
	<div class="container_950 box_4">
		<div class="P_title">融资意向单详情</div>
		<div class="line" style="background:#f9f9f7; height:25px;" >
			<div class="f_text01 fl">
				<span>需求编号：<s:property value="loan.applyNum"/></span>
				<span>状态：<font color="d5652c"><common:print valueId="loan.applyStatus" /></font></span>
			</div>
			<div class="view_detail fr" style="margin-right: 20px;">
		  				<s:if test="groupType==2 || groupType==3">
		  				<a href="#"  onclick="return Recommend(${loan.id },${loan.applyType });">推荐产品</a>
		  				</s:if>
		  				<s:else>
		  				<a href="#" onclick="return LookRecPro(${loan.id });" >查看推荐产品</a>
		  				</s:else>
			</div>
		</div>
	</div>
	<div class="hr_10"> &nbsp; </div>
<div class="container_950 box_6">
    <div class="menu_blue white"><h6>意向单详情</h6></div>
      	<div class="f_box">
			<div class="f_sqxx">
	      		<span class="f_gz">需求信息</span>
				<div>
					<table style="width:660px; font-size:14px;line-height: 28px;">
						<tr>
							<td width="25%" align="right">需求编号：</td>
							<td width="25%" ><s:property value="loan.applyNum"/> </td>
							<td width="25%" align="right">融资产品类型：</td>
							<td width="25%" ><common:print valueId="loan.applyType" /> </td>
						</tr>
						<tr>
							<td width="25%" align="right">需求金额：</td>
							<td width="25%" ><s:number name="loan.loanAmount" />万元</td>
							<td width="25%" align="right">期限：</td>
							<td width="25%" ><s:property value="loan.loanMonth" />个月 </td>
						</tr>
						<tr>
							<td width="25%" align="right">用途：</td>
							<td width="25%" ><common:print valueId="loan.loanPurpose"/> </td>
							<td width="25%" align="right">是否有抵押物：</td>
							<td width="25%" >
								<common:print valueId="loan.haveMortgage" valueSetMap="ZJ102" /> </td>
						</tr>
						<tr>
							<td width="25%" align="right">接受金融机构：</td>
							<td width="25%" ><common:print valueId="loan.loanOrganization" valueSetMap="ZJ110"/> </td>
							<td width="25%" align="right">接受利率：</td>
							<td width="25%" ><s:property value="loan.rateLowerLimit" />~<s:property value="loan.rateUpperLimit" />% </td>
						</tr>
						<tr>
							<td width="25%" align="right">发布时间：</td>
							<td colspan="3" width="25%" ><s:date name="loan.createdt" format="yyyy-MM-dd"/> </td>
						</tr>
					</table>
				</div>
				<div class="hr_20"> &nbsp;</div>		      		
	      	</div>
	      	<div class="hr_20"> &nbsp;</div>	      	
			<div>
	      		<span class="f_gz">需求方信息</span>
				<div >
					<table style="width:660px; font-size:14px;line-height: 28px;">
						<tr>
							<td width="25%" align="right">企业经营类型：</td>
							<td width="25%" ><common:print valueId="loan.busiRunningType" valueSetMap="ZJ111"/></td>
							<td width="25%" align="right">上年度销售额：</td>
							<td width="25%" >${loan.lastyearVolume}万元</td>
						</tr>
						<tr>
							<td width="25%" align="right">上年度资产负债率：</td>
							<td width="25%" >${loan.lastyearDebt} %</td>
							<td width="25%" align="right">上年度销售成本：</td>
							<td width="25%" >${loan.lastyearCost}万元</td>
						</tr>
						<tr>
							<td width="25%" align="right">上年度净利润：</td>
							<td width="25%" colspan="3">${loan.lastyearProfit }万元</td>
						</tr>
					</table>
				</div>      		
	      		<div class="hr_20"> &nbsp;</div>		
	      	</div>	      	
	    </div>
</div>	      	
<!--弹出框内容推荐产品页面-->
<div id="pro_recommend" style="display:none;" title="请选择推荐融资产品：">
    
</div>
<!--弹出框内容推荐产品页面-->
	<!--主体部分结束-->
	<div class="hr_20">&nbsp;</div>
	<!--尾部-->
	<jsp:include page="/public/bottom.jsp" />
</body>
</html>
