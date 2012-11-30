<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资申请详情</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/xheditor-1.1.14-zh-cn.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script language="javascript">
$(function(){
	$("#loanForm").validate();
	$('#checkForm2').validate();
	$('#checkForm3').validate();
	$('#checkForm4').validate();
	$('#checkForm5').validate();
	$('#checkForm6').validate();
	$('#checkForm7').validate();
	$('#checkForm8').validate();
})
function updatestatus(value){
	if (window.confirm('确定提交吗！')) {
		$('#apply_status').val(value);
		if(value == 180){
			$("#agree_num_input").dialog({width:440,modal:true});
		}else{
			$("#loanForm").submit();
		}
	}
}
function inputCheckView(cview){
	$('#check_view').val(cview);
	$('#loanForm').submit();
}
function agreeNumInput(an){
	if (window.confirm('确定提交吗！')) {
		$('#apply_agreeNum').val(an);
		$("#loanForm").submit();
	}
}

$(function() {
	var j = new Date();
	var y = j.getFullYear() - 1;
	$('.year').html(y);
	var jm = j.getFullYear() + "年" + j.getMonth() + "月";
	$('.yearmoth').html(jm);
})
function applyCancel(){
	//$("#loanForm").("action","/user/loan/financeAttach!selectCancel.act");
	var arrChk=$("input[name='ckbox']:checked");
	if(arrChk.length > 0){
		$("#selForm").submit();
	}else{
		alert("请您选择操作数据！");
		return false;
	}
}
$(function() {
	$("#selectall").bind("click",function() {
		if($(this).attr("checked")){
			$("input[name='ckbox']").each(function() {
				$(this).attr('checked', true);
			});
		}else{
			$("input[name='ckbox']").each(function() {
				$(this).attr('checked', false);
			});
		}
		
	});
})
function all() {
		$.post('/admin/loan/financeApply!applyCheckList.act', {
			applyId : $('#applyid').val()
		}, function(data) {
			$("#all_log").html(data);
		});
		$("#all_log").dialog({
			width : 500,
			height : 300,
			modal : true
		});
	}
function exportPdf(){
	window.location.href = "/admin/loan/downloadAttach!downPdf.act?apply.id=${apply.id}";
}
function allPass(){
	var arrChk=$("input[name='ckbox']:checked");
	if(arrChk.length > 0){
		if(confirm("确定所选资料审核通过吗？")){
			$("#loanForm").attr("action","/admin/loan/financeAttach!allMaterialsPass.act");
			$("#loanForm").submit();
		}
	}else{
		alert("请您选择至少一条资料操作！");
		return false;
	}
}
function allUnPass(){
	var arrChk=$("input[name='ckbox']:checked");
	if(arrChk.length > 0){
		if(confirm("确定所选资料审核不通过吗？")){
			$("#loanForm").attr("action","/admin/loan/financeAttach!allMaterialsUnPass.act");
			$("#loanForm").submit();
		}
	}else{
		alert("请您选择至少一条资料操作！");
		return false;
	}
}
$(function() {
	$("#selectall").bind("click",function() {
		if($(this).attr("checked")){
			$("input[name='ckbox']").each(function() {
				$(this).attr('checked', true);
			});
		}else{
			$("input[name='ckbox']").each(function() {
				$(this).attr('checked', false);
			});
		}
		
	});
})
function print(appId){
	window.open('/user/loan/userApplyManag!print.act?print=1&apply.id='+appId)
}
function chushen1(){
	$("#chushen1").dialog({
		width : 600,
		height : 200,
		modal : true
	});
}
function chushen2(){
	$("#chushen2").dialog({
		width : 600,
		height : 200,
		modal : true
	});
}
function chuShenRes(a,b){
	$('#check_view1').val($('#area1').val());
	$('#checkForm').attr('action','/admin/loan/financeApply!chuShen.act?left='+a+'&right='+b);
	$('#checkForm').submit();
}
function chuShenRes2(a,b){
	$('#check_view2').val($('#area2').val());
	$('#checkForm2').attr('action','/admin/loan/financeApply!chuShen.act?left='+a+'&right='+b);
	$('#checkForm2').submit();
}
function fushen1(){
	$("#fushen1").dialog({
		width : 600,
		height : 200,
		modal : true
	});
}
function fushen2(){
	$("#fushen2").dialog({
		width : 600,
		height : 220,
		modal : true
	});
}
function fushen3(){
	$("#fushen3").dialog({
		width : 600,
		height : 200,
		modal : true
	});
}
function fushen4(){
	$("#fushen4").dialog({
		width : 600,
		height : 200,
		modal : true
	});
}
function fushen5(){
	$("#fushen5").dialog({
		width : 600,
		height : 200,
		modal : true
	});
}
function fushen6(){
	$("#fushen6").dialog({
		width : 600,
		height : 200,
		modal : true
	});
}
function fuShenRes1(){
	$('#check_view3').val($('#area3').val());
	$('#checkForm3').submit();
}
function fuShenRes3(){
	$('#check_view4').val($('#area4').val());
	$('#checkForm4').submit();
}
function fuShenRes2(){
	var v1=$("input[name='let']:checked");
	var v2=$("input[name='rit']:checked");
	if(v1.length>0){
		$('#left_hidden').val(2);
	}else{
		$('#left_hidden').val(1);
	}
	if(v2.length>0){
		$('#right_hidden').val(2);
	}else{
		$('#right_hidden').val(1);
	}
	if(v1.length==0 && v2.length==0){
		alert("请选择要退回的信息");
	}else{
		$('#check_view5').val($('#area5').val());
		$('#checkForm5').submit();
	}
}
function fuShenRes4(){
	$('#check_view6').val($('#area6').val());
	$('#checkForm6').submit();
}
function fuShenRes5(){
	$('#check_view7').val($('#area7').val());
	$('#checkForm7').submit();
}
function fuShenRes6(){
	$('#check_view8').val($('#area8').val());
	$('#checkForm8').submit();
}
function downloadAttach(attachid){
	var url = "financeAttach!viewAttach.act";
	var param = {'attachId':attachid};
	$.post(url,param, function(data){
		var da = $('#downloadform');
		if(da.length == 0){
			da = $("<div id='downloadform'></div>");
		}else{
			da.remove();
			da = $("<div id='downloadform'></div>");
		}
		da.append(data);
		$('#download_attach').append(da);
		$('#download_attach').dialog({width:400,modal:true});
	}, 'html');
}

$(function(){
	$('.hid tr').each(function () {
		if($(this).attr("class")=="top_color01"){
			$(this).hide();
		}
	})
	$("#myhide").toggle(function(){
		$('.hid tr').show();
	},function(){
		$('.hid tr').each(function () {
			if($(this).attr("class")=="top_color01"){
				$(this).hide();
			}
		})
	})
})
function viewAgreeAttach(){
    	$('#agreeAttach').dialog({width : 500,modal : true});
    }
</script>
<style>
.ico_name{margin-right:20px; display:block;}
</style>
</head>
  
 <body><input type="hidden" id="applyid" name="applyId" value="${apply.id }">
<div id="hld">
<div class="wrapper">
<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
		
	<form action="/admin/loan/financeApply!checkApply.act" id="loanForm"  class="box_form" style="margin:0px;" method="post">
	<!-- 企业经营贷款快速申请类型=136 -->
	<s:hidden name="apply.id"></s:hidden>
	<s:hidden name="apply.applyStatus" id="apply_status"></s:hidden>
	<s:hidden name="apply.agreeNum" id="apply_agreeNum"></s:hidden>
	<s:hidden name="userType" value="0"></s:hidden>
	<s:hidden name="appCheck.checkView" id="check_view"></s:hidden>
	
	<!-- start -->
	<div class="container_950 box_4">
		<div class="P_title">融资申请详情页</div>
		<div class="line" style="background:#f9f9f7;">
			<div class="f_text01">
				<span>申请单号：${apply.applyNum}</span>
				<span>协议编号：<font color="d5652c"><s:if test="apply.agreeNum =='' || apply.agreeNum ==null">暂无</s:if><s:else>${apply.agreeNum}</s:else> </font></span>
				<span>申请状态：<font color="d5652c"><common:print valueId="apply.applyStatus" /></font></span>
		<!-- <span style="padding-right:0px; float:right; margin-left: 15px; margin-right: 20px;"><input class="btnsub blue1" type="button" onclick="print(${apply.id})" value="打印"></span> -->		
				<span style="padding-right:0px; float:right; margin-left: 5px; margin-right: 20px;"><input class="btnsub blue1" type="button" onclick="exportPdf()" value="导出申请单"></input></span>
			</div>
			<div class="hr_20"> &nbsp; </div>
			<div class="center">
				<div class="left_gray">&nbsp;</div>
				<s:if test="apply.applyStatus ==301 || apply.applyStatus ==303">
				<div class="m_gray1">个人信息</div>
				<div class="m_gray1">填写申请信息</div>
				<div class="m_red">预审中</div>
				<div class="m_gray">提交资料</div>
				<div class="m_gray">资金网审核</div>
				<div class="m_gray">金融机构审核</div>
			</s:if>
			<s:elseif test="apply.applyStatus ==302 || apply.applyStatus ==308">
				<div class="m_gray1">个人信息</div>
				<div class="m_gray1">填写申请信息</div>
				<div class="m_gray1">预审中</div>
				<div class="m_red">提交资料</div>
				<div class="m_gray">资金网审核</div>
				<div class="m_gray">金融机构审核</div>
			</s:elseif>
			<s:elseif test="apply.applyStatus >303 && apply.applyStatus <=305">
				<div class="m_gray1">个人信息</div>
				<div class="m_gray1">填写申请信息</div>
				<div class="m_gray1">预审中</div>
				<div class="m_gray1">提交资料</div>
				<div class="m_red">资金网审核</div>
				<div class="m_gray">金融机构审核</div>
			</s:elseif>
			<s:elseif test="apply.applyStatus>305 && apply.applyStatus<310 && apply.applyStatus!=308">
				<div class="m_gray1">个人信息</div>
				<div class="m_gray1">填写申请信息</div>
				<div class="m_gray1">预审中</div>
				<div class="m_gray1">提交资料</div>
				<div class="m_gray1">资金网审核</div>
				<div class="m_red">金融机构审核</div>
			</s:elseif>
			<s:else>
				<div class="m_gray">个人信息</div>
				<div class="m_gray">填写申请信息</div>
				<div class="m_gray">预审中</div>
				<div class="m_gray">提交资料</div>
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
			<div class="hr_10"> &nbsp;</div>
			<div class="y_connect">
				<span class="y_title_02">申请产品：<font color="d5652c">${product.financeName }</font></span>
				<span class="y_title_02" style="width:710px;">发行机构：<font color="d5652c">${loanOrgName }</font></span>
			</div>
			<div class="clear">&nbsp;</div>			
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
					      <span>详细地址：${profileMap['address'] }${usrPerson.address }</span>
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
			      <span>${fieldName }：<font>&nbsp;&nbsp;${entityValue }</font></span><br/>
			      </s:iterator>
			    </div>
			</div>
			<div class="fl">
			    <div class="menu_out">
				<span class="f_gz">申请融资产品</span>
					<table border="0" cellspacing="0" cellpadding="0" class="sq_table">
					  <tr>
					    <td colspan="8">
					    	<s:if test="logo == null">
								<img src="/images/banklogo/b/zj198.jpg" class="js_bank"/><font class="sudait" >&nbsp;&nbsp;&nbsp;&nbsp;${loanOrgName }</font>
							</s:if> 
							<s:else>
								<img src="/images/banklogo/b/${product.logo }"  class="js_bank"/><font class="sudait" >&nbsp;&nbsp;&nbsp;&nbsp;${loanOrgName }</font>
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
	</form> 
	</div>
</div>
	<div class="clear"> &nbsp;</div>

	<!-- end -->
	<s:if test="apply.applyStatus>303">
	<div class="hr_10"> &nbsp;</div>
<div class="container_950 center box_6 hid">
		<form action="/admin/loan/financeAttach!selectCancel.act" id="loanForm" class="box_form" style="margin:0px;" method="post">
        <input type="hidden" id="applyid" name="applyId" value="${apply.id }">
        <input type="hidden" name="apply.id" value="${apply.id }">
        <table width="100%" border="0" cellspacing="0">
        <tr class="menu_blue white">
        <td colspan="3"><h6>申贷资料</h6></td>
		<td align="right"><a href="javascript:void(0)" id="myhide" class="ico_name"><img src="/images/down_ico.png"/></a></td> 
        </tr>
     	<tr class="top_color">
     		<td width="32%" style="padding-left:25px;"><input type="checkbox" name="ckboxs" class="ckbox" id="selectall"/>全选&nbsp;资料名称</td>
            <td >递交方式</td>
            <td width="10%">状态</td>
            <td width="30%" align="center">操作</td>
        </tr>
        
        <tr class="top_color01">
          <td style="padding-left:42px;">&nbsp;0.&nbsp;中国资金网融资咨询服务协议加盖公章</td>
          <td>网上提交,线下邮寄</td>
          <td>
			<s:if test="apply.agreeStatus == 213 || apply.agreeStatus == 216 || apply.agreeStatus == 218">
				<font color="red"><common:print valueId="apply.agreeStatus"/></font>
			</s:if>
			<s:else><common:print valueId="apply.agreeStatus"/></s:else>
		 </td>
          <td align="right" class="view_detail01" style="padding-right:20px;">
          	<a href="javascript:viewAgreeAttach();" >查看</a>
          	<s:if test="apply.agreeStatus==213 || apply.agreeStatus==218">
          		<a href="javascript:void(0);" onclick="if(confirm('确定所选资料审核通过吗？')){window.location.href='/admin/loan/financeAttach!agreeCheck.act?apply.id=${apply.id}&status=217'}">通过</a>
		    	<a href="javascript:void(0);" onclick="if(confirm('确定所选资料审核不通过吗？')){window.location.href='/admin/loan/financeAttach!agreeCheck.act?apply.id=${apply.id}&status=215'}">退回</a>
		    </s:if>
          </td>          
        </tr>
        <%int num = 1; %>
        <s:iterator id ="item" value="attachList">
        <tr class="top_color01">
          <td style="padding-left:25px;"><s:if test="#item.uploadStatus!=212 && #item.uploadStatus!=215"><input type="checkbox" name="ckbox" class="ckbox" value="${item.id }"/></s:if>&nbsp;<%=num++ %>.&nbsp;${item.dataName }
						${item.supplyName }</td>
          <td><common:print valueId="#item.supplyWay"/></td>
          <td><s:if test="#item.uploadStatus == 213 || #item.uploadStatus == 216 || #item.uploadStatus == 218"><font color="red"> <common:print valueId="#item.uploadStatus"/></font></s:if><s:else> <common:print valueId="#item.uploadStatus"/></s:else></td>
          <td align="right" class="view_detail01" style="padding-right:20px;">
          <s:if test="#item.uploadStatus != 212">
		    <a href="javascript:void(0);" onclick="downloadAttach('${item.id}');">查看 </a>&nbsp;
		  	<s:if test="#item.uploadStatus != 214 && #item.uploadStatus != 215 ">    	
		          <a href="javascript:void(0);" onclick="if(confirm('确定所选资料审核通过吗？')){window.location.href='/admin/loan/financeAttach!eachMaterialsPass.act?apply.id=${apply.id}&ckbox=${item.id }'}">通过</a>
		          <a href="javascript:void(0);" onclick="if(confirm('确定退回所选资料吗？')){window.location.href='/admin/loan/financeAttach!eachMaterialsUnPass.act?apply.id=${apply.id}&ckbox=${item.id }'}">退回</a>
		    </s:if>
	      </s:if>
          </td>          
        </tr>
        </s:iterator>
         <s:if test="apply.applyStatus==303||apply.applyStatus==304">
        <tr class="top_color01">
          <td colspan="4" class="view_detail01" style="padding-left:25px;">
          	<input type="button" class="but_gray" value="通过" onclick="allPass()"/>
          	<input type="button" class="but_gray" value="退回" onclick="allUnPass()"/></td>     
        </tr></s:if>                     
		</table>
		</form>
</div>
</s:if>
	<!-- button -->
	<div class="hr_10"> &nbsp;</div>
	<div align="center">
	<s:if test="apply.baseCheckStatus == null || apply.baseCheckStatus.contains(\"0\")">
		<s:if test="left==0">
			<input class="btnsub blue1" type="button" value="填写客户信息审核意见" onclick="chushen1();"/>&nbsp;&nbsp;&nbsp;
		</s:if>
		<s:if test="right==0">
			<input class="btnsub blue1" type="button" value="填写申请信息审核意见" onclick="chushen2();"/>&nbsp;&nbsp;&nbsp;
		</s:if>
	</s:if>
	<s:else>
		<s:if test="apply.applyStatus==301">
			<input class="btnsub blue1" type="button" value="初审通过" onclick="fushen1();"/>&nbsp;&nbsp;&nbsp;
			<input class="btnsub blue1" type="button" value="退回修改" onclick="fushen2();"/>&nbsp;&nbsp;&nbsp;
			<input class="btnsub blue1" type="button" value="驳回申请" onclick="fushen3();"/>&nbsp;&nbsp;&nbsp;
		</s:if>
	</s:else>
	<s:if test="apply.applyStatus==304">
			<input class="btnsub blue1" type="button" value="资金网审核通过" onclick="fushen4()"/>
			<input class="btnsub blue1" type="button" value="资料未通过退回修改资料" onclick="fushen6()"/>
	</s:if>
	<s:if test="apply.applyStatus==305">
			<input class="btnsub blue1" type="button" value="提交给资金方" onclick="fushen5()"/>
	</s:if>
	</div>
<!-- button -->	
	<!-- ------------------------------------------------------------------------------------------------------------------------------- -->

<!--弹出框内日志页面-->
	<div id="all_log" style="display:none;" title="查看全部日志信息："></div>
	
	<!--弹出框审核客户信息意见页面-->
	<div id="chushen1" title="填写客户信息审核意见：" style="display: none;">
		<form action="/admin/loan/financeApply!chuShen.act" id="checkForm" class="box_form" style="margin:0px;" method="post">
			<!-- 企业经营贷款快速申请类型=136 -->
			<s:hidden name="apply.id"></s:hidden>
			<s:hidden name="apply.applyStatus" id="apply_status"></s:hidden>
			<s:hidden name="apply.agreeNum" id="apply_agreeNum"></s:hidden>
			<s:hidden name="appCheck.checkView" id="check_view1"></s:hidden>
			<s:hidden name="userType" value="0"></s:hidden>
			<div class="hr_10"> &nbsp;</div>
			<table>
				<tr>
					<td class="r_td" style="vertical-align: top;">审核意见：</td>
					<td class="p_td"><textarea rows="5" cols="60" class="required" name="checkViewInput" id="area1"></textarea><br />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="r_td" style="vertical-align: top;" align="right">
						<input type="button" value="初审通过" class="but_gray" onclick="chuShenRes(1,'${right}');"></input>
						<input type="button" value="初审未通过" class="but_gray" onclick="chuShenRes(2,'${right}');"></input>
					</td>
				</tr>
			 </table>
		</form>
	 </div>
	 <!--弹出框审核申请信息意见页面-->
	<div id="chushen2" title="填写申请信息审核意见：" style="display: none;">
		<form action="/admin/loan/financeApply!chuShen.act" id="checkForm2" class="box_form" style="margin:0px;" method="post">
			<!-- 企业经营贷款快速申请类型=136 -->
			<s:hidden name="apply.id"></s:hidden>
			<s:hidden name="appCheck.checkView" id="check_view2"></s:hidden>
			<s:hidden name="apply.applyStatus" id="apply_status"></s:hidden>
			<s:hidden name="userType" value="0"></s:hidden>
			<div class="hr_10"> &nbsp;</div>
			<table>
				<tr>
					<td class="r_td" style="vertical-align: top;">审核意见：</td>
					<td class="p_td"><textarea rows="5" cols="60" class="required" name="checkViewInput" id="area2"></textarea><br />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="r_td" style="vertical-align: top;" align="right">
						<input type="button" value="初审通过" class="but_gray" onclick="chuShenRes('${left }',1);"></input>
						<input type="button" value="初审未通过" class="but_gray" onclick="chuShenRes(${left },2);"></input>
					</td>
				</tr>
			 </table>
		</form>
	 </div>
	 
	 <!--弹出框复审通过页面-->
	<div id="fushen1" title="填写复审通过意见：" style="display: none;">
		<form action="/admin/loan/financeApply!fuShenSucc.act" id="checkForm3" class="box_form" style="margin:0px;" method="post">
			<s:hidden name="apply.id"></s:hidden>
			<s:hidden name="appCheck.checkView" id="check_view3"></s:hidden>
			<s:hidden name="apply.agreeNum" id="apply_agreeNum"></s:hidden>
			<s:hidden name="userType" value="0"></s:hidden>
			<div class="hr_10"> &nbsp;</div>
			<table>
				<tr>
					<td class="r_td" style="vertical-align: top;">审核意见：</td>
					<td class="p_td"><textarea rows="5" cols="60" class="required" name="checkViewInput" id="area3">您的申请信息已确认，请提交相关申贷资料，谢谢！</textarea><br />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="r_td" style="vertical-align: top;" align="right">
						<input type="button" value="确认通过" class="but_gray" onclick="fuShenRes1();"></input>
					</td>
				</tr>
			 </table>
		</form>
	 </div>
	<!--弹出框复审驳回页面-->
	<div id="fushen3" title="填写复审驳回意见：" style="display: none;">
		<form action="/admin/loan/financeApply!fuShenBohui.act" id="checkForm4" class="box_form" style="margin:0px;" method="post">
			<s:hidden name="apply.id"></s:hidden>
			<s:hidden name="appCheck.checkView" id="check_view4"></s:hidden>
			<s:hidden name="apply.agreeNum" id="apply_agreeNum"></s:hidden>
			<s:hidden name="userType" value="0"></s:hidden>
			<div class="hr_10"> &nbsp;</div>
			<table>
				<tr>
					<td class="r_td" style="vertical-align: top;">驳回意见：</td>
					<td class="p_td"><textarea rows="5" cols="60" class="required" name="checkViewInput" id="area4"></textarea><br />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="r_td" style="vertical-align: top;" align="right">
						<input type="button" value="确认驳回" class="but_gray" onclick="fuShenRes3();"></input>
					</td>
				</tr>
			 </table>
		</form>
	 </div>
	 <!--弹出框退回修改页面-->
	<div id="fushen2" title="填写退回修改意见：" style="display: none;">
		<form action="/admin/loan/financeApply!tuiHui.act" id="checkForm5" class="box_form" style="margin:0px;" method="post">
			<s:hidden name="apply.id"></s:hidden>
			<s:hidden name="appCheck.checkView" id="check_view5"></s:hidden>
			<s:hidden name="left" id="left_hidden"></s:hidden>
			<s:hidden name="right" id="right_hidden"></s:hidden>
			<s:hidden name="apply.agreeNum" id="apply_agreeNum"></s:hidden>
			<s:hidden name="userType" value="0"></s:hidden>
			<div class="hr_10"> &nbsp;</div>
			<table>
				<tr>
					<td>
						选择退回信息：
					</td>
					<td>
						<input id="left" name="let" type="checkbox" />客户信息  <input id="right" name="rit" type="checkbox"/>申请信息
					</td>
				</tr>
				<tr>
					<td class="r_td" style="vertical-align: top;">退回意见：</td>
					<td class="p_td"><textarea rows="5" cols="60" class="required" name="checkViewInput" id="area5"></textarea><br />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="r_td" style="vertical-align: top;" align="right">
						<input type="button" value="确认退回" class="but_gray" onclick="fuShenRes2();"></input>
					</td>
				</tr>
			 </table>
		</form>
	 </div>
	 
	  <!--弹出框资金网审核通过页面-->
	<div id="fushen4" title="填写审核通过意见：" style="display: none;">
		<form action="/admin/loan/financeApply!CheckSucc.act" id="checkForm6" class="box_form" style="margin:0px;" method="post">
			<s:hidden name="apply.id"></s:hidden>
			<s:hidden name="appCheck.checkView" id="check_view6"></s:hidden>
			<div class="hr_10"> &nbsp;</div>
			<table>
				<tr>
					<td class="r_td" style="vertical-align: top;">通过意见：</td>
					<td class="p_td"><textarea rows="5" cols="60" class="required" name="checkViewInput" id="area6">祝贺您！您的融资申请已通过资金网预审，我们将立即提交给资金方，请随时关注进展情况，谢谢！
					</textarea><br />
					</td>
				</tr>
					<tr>
						<td class="r_td" style="vertical-align: top;">协议编号:</td>
						<td class="p_td"><input type="text" class="required" name="apply.agreeNum" id="agreeNumInput"/></td>
					</tr>
				<tr>
					<td colspan="2" class="r_td" style="vertical-align: top;" align="right">
						<input type="button" value="确认通过" class="but_gray" onclick="fuShenRes4();"></input>
					</td>
				</tr>
			 </table>
		</form>
	 </div>
	 
	  <!--弹出框提交给资金方页面-->
	<div id="fushen5" title="填写提交给资金方意见：" style="display: none;">
		<form action="/admin/loan/financeApply!submitZjf.act" id="checkForm7" class="box_form" style="margin:0px;" method="post">
			<s:hidden name="apply.id"></s:hidden>
			<s:hidden name="appCheck.checkView" id="check_view7"></s:hidden>
			<div class="hr_10"> &nbsp;</div>
			<table>
				<tr>
					<td class="r_td" style="vertical-align: top;">资金方名称：</td>
					<td class="p_td">${loanOrgName }</td>
				</tr>
				<tr>
					<td class="r_td" style="vertical-align: top;">资金方帐号：</td>
					<td class="p_td">${loanUsr.username }</td>
				</tr>
				<tr>
					<td class="r_td" style="vertical-align: top;">资金方联系人：</td>
					<td class="p_td">${loanUsr.realname }</td>
				</tr>
				<tr>
					<td class="r_td" style="vertical-align: top;">提交给资金方意见：</td>
					<td class="p_td"><textarea rows="5" cols="60" class="required" name="checkViewInput" id="area7">您的融资申请已提交给资金方，请等待资金方审核，谢谢！
					</textarea><br />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="r_td" style="vertical-align: top;" align="right">
						<input type="button" value="确认提交给资金方" class="but_gray" onclick="fuShenRes5();"></input>
					</td>
				</tr>
			 </table>
		</form>
	 </div>
	 
	 <!--弹出框申贷材料未审核通过页面-->
	<div id="fushen6" title="填写申贷材料未审核通过意见：" style="display: none;">
		<form action="/admin/loan/financeApply!backMertail.act" id="checkForm8" class="box_form" style="margin:0px;" method="post">
			<s:hidden name="apply.id"></s:hidden>
			<s:hidden name="appCheck.checkView" id="check_view8"></s:hidden>
			<div class="hr_10"> &nbsp;</div>
			<table>
				<tr>
					<td class="r_td" style="vertical-align: top;">材料未通过意见：</td>
					<td class="p_td"><textarea rows="5" cols="60" class="required" name="checkViewInput" id="area8">抱歉，您的申贷资料不符合要求，请修改后再重新提交，谢谢！
					</textarea><br />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="r_td" style="vertical-align: top;" align="right">
						<input type="button" value="确认申贷材料未审核通过" class="but_gray" onclick="fuShenRes6();"/>
					</td>
				</tr>
			 </table>
		</form>
	 </div>
	 
<!-- 查看资料 --> 
	<div id="download_attach" style="display:none;" title="文件查看"></div>

<div id="agreeAttach" title="中国资金网融资咨询服务协议" style="display: none;">
<s:if test="apply.agreeUploadWay == null || apply.agreeUploadWay == 0">
	<li>
		中国资金网融资咨询服务协议(<s:date name="apply.agreeUploadTime" format="yyyy-MM-dd HH:mm"/>) &nbsp;&nbsp;<a href="/user/loan/downloadAttach!downAgree.act?applyId=${applyId}">下载</a>
		<s:if test="apply.agreeFileUpload != null && (apply.agreeFileUpload.indexOf('.png')>=0||apply.agreeFileUpload.indexOf('.jpg')>=0||apply.agreeFileUpload.indexOf('.jpeg')>=0||apply.agreeFileUpload.indexOf('.bmp')>=0)">| <a href="javascript:void(0);" onclick="agreeWatchIt('${applyId}')">预览</a></s:if>
	</li>
</s:if>
<s:else>
	<li>资料提交使用的快递公司名称：${apply.agreeMemo }</li>
	<li>快递单号：${apply.agreeFileUpload }</li>
</s:else>
</div>
  </body>
</html>