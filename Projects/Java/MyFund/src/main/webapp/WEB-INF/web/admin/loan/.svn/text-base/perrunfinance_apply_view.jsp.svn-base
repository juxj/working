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
	$("#selectall").toggle(function() {
		$("#selectall").each(function() {
			$("input[name='ckbox']").attr('checked', true);
		});
		$(this).attr("value","取消全选");
	}, function() {
		$("#selectall").each(function() {
			$("input[name='ckbox']").attr('checked', false);
		});
		$(this).attr("value","全部选中");
	});
})
function all() {
	$.post('/admin/loan/financeApply!applyCheckList.act', {
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
	$('#check_view2').val($('#area2').val());
	$('#checkForm').attr('action','/admin/loan/financeApply!chuShen.act?left='+a+'&right='+b);
	$('#checkForm').submit();
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
	}
	if(v2.length>0){
		$('#right_hidden').val(2);
	}
	$('#check_view5').val($('#area5').val());
	$('#checkForm5').submit();
}
</script>
  </head>
  
 <body>
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
				<span>协议编号：<font color="d5652c"> ${apply.agreeNum}</font></span>
				<span>申请状态：<font color="d5652c"><common:print valueId="apply.applyStatus" /></font></span>
				<span style="padding-right:0px; float:right; margin-left: 15px; margin-right: 20px;"><input class="btnsub blue1" type="button" onclick="print(${apply.id})" value="打印"></span>
			</div>
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
	</form> 
	</div>
</div>
	<div class="clear"> &nbsp;</div>

	<!-- end -->
	<div class="hr_10"> &nbsp;</div>
<div class="container_950 center box_6">
			<form action="/user/loan/financeAttach!selectCancel.act" id="loanForm" class="box_form" style="margin:0px;" method="post">
	        <input type="hidden" id="applyid" name="applyId" value="${apply.id }">
	        <table width="100%" border="0" cellspacing="0">
		        <tr class="menu_blue white">
		        	<td colspan="5"><h6>申贷资料</h6></td>
		        </tr>
		     	<tr class="top_color">
		     		<td width="30%" style="padding-left:25px;">资料名称</td>
		            <td width="5%">说明</td>
		            <td width="10%">递交方式</td>
		            <td >状态</td>
		            <td width="15%" align="center">操作</td>
		        </tr>
		        <tr class="top_color01">
		          <td style="padding-left:25px;">中国资金网融资咨询服务协议加盖公章</td>
		          <td></td>
		          <td></td>
		          <td>
					<s:if test="apply.agreeFileUpload == null || apply.agreeFileUpload == ''">
		           			未递交
		           		</s:if>
		           		<s:else>
		           			已上传
		           		</s:else>
				  </td>
		          <td align="right" class="view_detail01" style="padding-right:20px;"><a href="/user/loan/downloadAttach!downAgreeTemplate.act" target="_blank" >模板下载</a></td>          
		        </tr>
		        
		        <s:iterator id ="item" value="attachList">
		        <tr class="top_color01">
		          <td style="padding-left:25px;"><input type="checkbox" name="ckbox" class="ckbox" value="${item.id }"/>&nbsp;${item.dataName }
								${item.supplyName }</td>
		          <td></td>
		          <td>${item.dataSupply } ${item.supplyMemo }</td>
		          <td><common:print valueId="#item.supplyWay"/><common:print valueId="#item.uploadStatus"/></td>
		          <td align="right" class="view_detail01" style="padding-right:20px;"><a>查看 </a>&nbsp;<a>下载</a></td>          
		        </tr>
		        </s:iterator>
		        
		        <tr class="top_color01">
		          <td colspan="5" class="view_detail01" style="padding-left:25px;"><input type="button" class="but_gray" id="selectall" value="全部选中"/>&nbsp;<input type="button" class="but_gray" value="撤销" onclick="applyCancel()"/></td>     
		        </tr>                         
			</table>
			</form>
</div>

	<div class="hr_10"> &nbsp;</div>
	<div align="center">
	<s:if test="apply.baseCheckStatus==null || apply.baseCheckStatus.contains(\"0\")">
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
	</div>
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
		<form action="/admin/loan/financeApply!fuShen.act" id="checkForm3" class="box_form" style="margin:0px;" method="post">
			<s:hidden name="apply.id"></s:hidden>
			<input type="hidden" name="apply.applyStatus" value="302"/>
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
		<form action="/admin/loan/financeApply!fuShen.act" id="checkForm4" class="box_form" style="margin:0px;" method="post">
			<s:hidden name="apply.id"></s:hidden>
			<input type="hidden" name="apply.applyStatus" value="311"/>
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
			<input type="hidden" name="apply.applyStatus" value="303"/>
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
  </body>
</html>