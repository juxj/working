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
		$.post('/user/loan/userApplyManag!applyCheckListByCmy.act', {
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
	<input type="hidden" id="applyid" name="applyId" value="${apply.id }">
	<!--头部-->
	<div class="header user_header">
		<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
		<div class="clear">&nbsp;</div>
	</div>
	<div class="hr_10">&nbsp;</div>
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
			<span>协议编号：<font color="d5652c"><s:if test="apply.agreeNum =='' || apply.agreeNum ==null">暂无</s:if><s:else>${apply.agreeNum}</s:else> </font></span>
			<span>申请状态：<font color="d5652c"><common:print valueId="apply.applyStatus" /></font></span>
			<span style="padding-right:0px; float:right; margin-left: 5px; margin-right: 20px;"><input class="btnsub blue1" type="button" onclick="exportPdf()" value="导出申请单"></input></span>
			<s:if test="apply.applyStatus == 302 || apply.applyStatus == 308">
			<span style="padding-right:0px; float:right; margin-left: 5px; margin-right: 10px;"><input class="btn_s blue2" onclick="javascript:window.open('/user/loan/financeAttach!attachMana.act?viewAttachType=1&applyId=${apply.id }');" type="button" value="提交资料"></span>
			</s:if>
			
			<s:if test="apply.applyStatus==303">
			<span style="padding-right:0px; float:right; margin-left: 5px; margin-right: 10px;"><input class="btn_s blue2" onclick="javascript:$('#upstatus').submit();" type="button" value="修改完成提交审核"></span>
				<s:if test="left==2">
			<span style="padding-right:0px; float:right; margin-left: 5px; margin-right: 10px;"><input class="btn_s blue2" onclick="javascript:window.location='/user/loan/userApplyManag!editOrdCom.act?applyId=${apply.id}'" type="button" value="修改企业信息" /></span>
				</s:if>
				<s:if test="right==2">
			<span style="padding-right:0px; float:right; margin-left: 5px; margin-right: 10px;"><input class="btn_s blue2" onclick="javascript:window.location='/user/loan/userApplyManag!getApplyDetail.act?apply.id=${apply.id}'" type="button" value="修改申请信息" /></span>
				</s:if>
			</s:if>
			</form>
		</div>
		<div class="hr_20"> &nbsp; </div>
		<div class="center">
			<div class="left_gray">&nbsp;</div>
			<s:if test="apply.applyStatus ==301 || apply.applyStatus ==303">
				<div class="m_gray1">个人信息</div>
				<div class="m_gray1">填写申请信息</div>
				<div class="m_red">预审中</div>
				<div class="m_gray">提交材料</div>
				<div class="m_gray">资金网审核</div>
				<div class="m_gray">金融机构审核</div>
			</s:if>
			<s:elseif test="apply.applyStatus ==302 || apply.applyStatus ==308">
				<div class="m_gray1">个人信息</div>
				<div class="m_gray1">填写申请信息</div>
				<div class="m_gray1">预审中</div>
				<div class="m_red">提交材料</div>
				<div class="m_gray">资金网审核</div>
				<div class="m_gray">金融机构审核</div>
			</s:elseif>
			<s:elseif test="apply.applyStatus >303 && apply.applyStatus <=305">
				<div class="m_gray1">个人信息</div>
				<div class="m_gray1">填写申请信息</div>
				<div class="m_gray1">预审中</div>
				<div class="m_gray1">提交材料</div>
				<div class="m_red">资金网审核</div>
				<div class="m_gray">金融机构审核</div>
			</s:elseif>
			<s:elseif test="apply.applyStatus>305 && apply.applyStatus<310 && apply.applyStatus!=308">
				<div class="m_gray1">个人信息</div>
				<div class="m_gray1">填写申请信息</div>
				<div class="m_gray1">预审中</div>
				<div class="m_gray1">提交材料</div>
				<div class="m_gray1">资金网审核</div>
				<div class="m_red">金融机构审核</div>
			</s:elseif>
			<s:else>
				<div class="m_gray">个人信息</div>
				<div class="m_gray">填写申请信息</div>
				<div class="m_gray">预审中</div>
				<div class="m_gray">提交材料</div>
				<div class="m_gray">资金网审核</div>
				<div class="m_gray">金融机构审核</div>
			</s:else>
			<div class="right_gray">&nbsp;</div>	
		</div>
		<div class="clear">&nbsp;</div>
		<div class="hr_10"> &nbsp; </div>
		<div>
			<div class="f_gz" style="margin-bottom:5px;"><span class="fl">申请单跟踪</span><a href="javascript:all();" style="float:right; margin-right: 40px; color: red;">更多..</a></div>
			<div class="hr_10"></div>
			<div class="clear">&nbsp;</div>
			<!--  <div class="y_title">
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
			</s:iterator>-->
			<table border="0" cellspacing="0" cellpadding="0" class="y_table">
			  <tr>
			    <td class="y_table_title01" style="background:#ebe6b9;">操作时间</td>
			    <td class="y_table_title02" style="background:#ebe6b9;">处理信息</td>			    
			    <td class="y_table_title03" style="background:#ebe6b9;">操作人</td>
			  </tr>
			  <s:iterator value="applyCheckList">
			  <tr>
			    <td class="y_table_title01"><s:date name="createdt" format="yyyy-MM-dd hh:mm:ss"/></td>
			    <td class="y_table_title02">${checkView }</td>			    
			    <td class="y_table_title03">${createUserName } &nbsp;</td>
			  </tr>
			  </s:iterator>
			</table>			
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
		<div class="fl f_sqxx">
			<span class="f_gz">申请融资产品</span>		
		    <div class="menu_out">
				<table border="0" cellspacing="0" cellpadding="0" class="sq_table">
				  <tr>
				    <td colspan="8">
				    	<s:if test="logo == null">
							<img src="/images/banklogo/b/zj198.jpg" class="js_bank"/><font href="" class="sudait" >&nbsp;&nbsp;&nbsp;&nbsp;${loanOrgName }</font>
						</s:if> 
						<s:else>
							<img src="/images/banklogo/b/${product.logo }"  class="js_bank"/><font href="" class="sudait" >&nbsp;&nbsp;&nbsp;&nbsp;${loanOrgName }</font>
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
		    <div class="hr_20"> &nbsp;</div>					
		</div> 
		<div class="clear"> &nbsp;</div>      
      	<div class="f_sqxx">
      		<span class="f_gz" style="margin-top:15px;">申请信息</span>
			<div class="y_connect">
				<span class="y_title_02">融资用途：<font color="d5652c"> <common:print valueId="apply.loanPurpose" /> &nbsp;${apply.loanPurposeOther }</font></span>
				<span class="y_title_02">金额：<font color="d5652c"><s:number name="apply.loanAmount" />万元</font></span>
				<span class="y_title_02">期限：<font color="d5652c">${apply.loanMonth}个月</font></span>
				<span>是否有抵押物：<font color="d5652c"><common:print valueId="apply.haveMortgage" valueSetMap="ZJ102" /></font></span>
			</div>
			<div class="hr_10"> &nbsp;</div>
			<div class="y_connect">
				<span class="y_title_02">申请产品：<font color="d5652c">${product.financeName }</font></span>
				<span class="y_title_02" style="width:710px;">发行机构：<font color="d5652c">${loanOrgName }</font></span>
			</div>
			<div class="clear">&nbsp;</div>			
			<div class="hr_20"> &nbsp;</div>
      	</div>
      	<div class="f_sqxx">
      		<span class="f_gz" style="margin-top:15px;">申请方信息</span>
			<div>
				<div class="fl f_qyxx" style="height:auto; padding: 5px 0;">
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
			<div class="hr_20"> &nbsp;</div>
      	</div>
		<div class="f_sqxx">	
		   	<span class="f_gz" style="margin-top:15px;">个人信息</span>
		   	<div class="y_connect">		
		      <span>行业：<font>${pindName }</font><s:if test="cindName!=null">&nbsp; <br/>子行业：<font>${cindName }</font></s:if></span><br/>
		      <span>行业经验：<font><s:number name="apply.experience" />年</font></span><br/>
		      <span>年营业额：<font><common:print valueId="apply.allyearVolume"/></font></span><br/>
		      <span>经营场所：<font><s:if test="apply.runningArea==1">有</s:if><s:else>无</s:else></font></span><br/>
		      <span>银行借款经历：<font><s:if test="apply.hostoryLoan==1">有</s:if><s:else>无</s:else></font></span><br/>
		      <span>使用信用卡经历：<font><s:if test="apply.useCreditcard==1">有</s:if><s:else>无</s:else></font></span><br/>
		      <span>银行流水：<font><s:if test="apply.bankSalaryList==1">有</s:if><s:else>无</s:else></font></span>			      
		 	</div>
		 	<div class="hr_20"> &nbsp;</div>
		</div>			
	    <div class="f_sqxx">
		    <span class="f_gz" style="margin-top:15px;">其它信息</span>		    
		    <div class="menu_out">
		      <s:iterator value="extendsValueList">
		      <span>${fieldName }：<font>&nbsp;&nbsp;${entityValue }</font></span><br/>
		      </s:iterator>
		    </div>
		    <div class="hr_20"> &nbsp;</div>
	    </div>		     	     	
      </div>
    </div>  
<!-- end -->
<div class="hr_20"> &nbsp;</div>
<!--尾部-->
	<jsp:include page="/public/bottom.jsp" />
<!--弹出框内日志页面-->
	<div id="all_log" style="display:none;" title="查看全部日志信息："></div>
</body>
</html>