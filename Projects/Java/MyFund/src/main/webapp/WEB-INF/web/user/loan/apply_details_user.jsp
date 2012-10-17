<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>用户中心-融资管理-融资申请详情页</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js"></script>
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
		$.post('/user/loan/financeApply!applyCheckList.act', {
			applyId : $('#applyid').val()
		}, function(data) {
			$("#all_log").html(data);
		})
		$("#all_log").dialog({
			width : 400,
			height : 300,
			modal : true
		});
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
			href="/user/loan/financeApply!applyManag.act">融资申请管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;融资申请查看
	</div>
	<div class="hr_10">&nbsp;</div>
	
<!-- start -->
<div class="container_950 box_4">
	<div class="P_title">融资申请详情页</div>
	<div class="line" style="background:#f9f9f7;">
		<div class="f_text01">
			<span>申请单号：${apply.applyNum}</span>
			<span>协议编号：<font color="d5652c"> ${apply.agreeNum}</font></span>
			<span>申请状态：<font color="d5652c"><common:print valueId="apply.applyStatus" /></font></span>
			<span style="padding-right:0px; float:right; margin-left: 15px; margin-right: 20px;"><input class="btnsub blue1" type="button" value="打印"></span>
			<span style="padding-right:0px; float:right;"><input class="btnsub blue1" type="button" value="操作"></span>
		</div>
		<div>尊敬的用户：您的融资申请已通过资金网预审，我们将会尽快将您的融资申请递交给资金方。</div>
		<div class="hr_20"> &nbsp; </div>
		<div class="center">
			<div class="left_gray">&nbsp;</div>
			<div class="m_gray">填写申请信息</div>
			<div class="m_red">预审中</div>
			<div class="m_gray">提交材料</div>
			<div class="m_gray">资金网审核</div>
			<div class="m_gray">金融机构审核</div>
			<div class="m_gray">金融机构审核</div>
			<div class="right_gray">&nbsp;</div>	
		</div>
		<div class="clear">&nbsp;</div>
		<div class="hr_10"> &nbsp; </div>
		<div>
			<div class="f_gz"><span class="fl">申请单跟踪</span><a href="javascript:all();" style="float:right; margin-right: 40px; color: red;">更多..</a></div>
			<div class="y_title">
				<span class="y_title_01">操作时间</span>
				<span class="y_title_01">处理信息</span>
				<span>操作人</span>
			</div>
			<s:iterator value="applyCheckList">
			<div class="y_connect">
				<span class="y_title_01"><s:date name="createdt" format="yyyy-MM-dd hh:mm:ss"/></span>
				<span class="y_title_01">${checkView }</span>
				<span>${createUserId }</span>
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
      	<div class="m_20">
      		<span class="f_gz" style="margin-top:15px;">申请方信息</span>
			<div>
				<div class="fl f_qyxx" style="height:auto; padding: 5px 0;">
				    <div class="menu_out">
				      <span>姓名：${session._user.realname} <s:if test="#session._user.gender==1">先生</s:if><s:else>女士</s:else></span>
				      <span>出生年月：<s:date name="usrPerson.birthday" /></span>
				      <span>教育程度：${profileMap['eduAtion'] }</span>
				      <span>身份证号码：${usrPerson.cid}</span>
				      <span>所在地：${profileMap['address'] }</span>
				      <span>详细地址：${usrPerson.address }</span>
				      <span>邮政编码：${usrPerson.postcode }</span>
				      <span>职业： ${profileMap['psersoncareer'] }</span>
				      <span>固定电话：${usrPerson.telephone }</span>
				      <span>联系方式：${profileMap['imtype1'] }&nbsp;&nbsp; ${usrPerson.im1 }</span>
				    </div>					
				</div>
			</div>
			<div class="clear">&nbsp;</div>
      	</div>
		<div class="fl m_20">
		    <div class="menu_out">
		      <span class="f_gz">个人信息</span>
		      <span>行业：<font>${pindName } <s:if test="cindName!=null">&nbsp; 子行业：${cindName }</s:if></font></span>
		      <span>行业经验：<font><s:number name="apply.experience" />年</font></span>
		      <span>年营业额：<font><common:print valueId="apply.allyearVolume"/></font></span>
		      <span>经营场所：<font><s:if test="apply.runningArea==1">有</s:if><s:else>无</s:else></font></span>
		      <span>银行借款经历：<font><s:if test="apply.hostoryLoan==1">有</s:if><s:else>无</s:else></font></span>
		      <span>使用信用卡经历：<font><s:if test="apply.useCreditcard==1">有</s:if><s:else>无</s:else></font></span>
		      <span>银行流水：<font><s:if test="apply.bankSalaryList==1">有</s:if><s:else>无</s:else></font></span>			      
		    </div>
		    <br/>
		    <div class="menu_out">
		      <span class="f_gz">其它信息</span>
		      <s:iterator value="extendsValueList">
		      <span>${fieldName }<font>&nbsp;&nbsp;${entityValue }</font></span>
		      </s:iterator>
		    </div					
		</div>
		<div class="fl">
		    <div class="menu_out">
			<span class="f_gz">申请融资产品</span>
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
