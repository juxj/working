<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
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
<div class="apply_form">
<div class="apply_form_title">申请状态</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
	<table class="apply_form_tb" style="float:left; width:550px;">
	  <tr>
	    <td class="r_td">申请状态</td>
	    <td class="p_td"><common:print valueId="apply.applyStatus"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    </td>
	  </tr>
	  <tr>
	    <td class="r_td" style="vertical-align: top;">申请记录</td>
	    <td class="p_td">
	    	<table>
	    		<tr>
	    			<td width="100px">操作时间</td>
	    			<td>具体信息</td>
	    		</tr>
	    		<s:iterator value="applyCheckList">
	    			<tr>
	    				<td><s:date name="createdt" format="yyyy-MM-dd"/></td>
	    				<td>${checkView }</td>
	    			</tr>
	    		</s:iterator>
	    	</table>
	    </td>
	  </tr>
	</table>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>	 	
</div>
<div class="hr_10"> &nbsp; </div>	
<div class="apply_form">
	<div class="apply_form_title">产品信息</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
	<table class="apply_form_tb">
	  <tr>
		<td>
			<s:if test="logo == null">
		        <img src="/images/banklogo/b/zj198.jpg" style="float: right;"/>
	        </s:if>
	        <s:else>
	        	<img src="/images/banklogo/b/${product.logo }" style="float: right;"/>
	        </s:else>
		</td>
		<td class="p_td" style="font-size: 16px;"><common:print valueId="product.financeType" /></td>
		<td></td>
		<td></td>						
	  </tr>
              <tr>
                <td class="r_td">贷款类型：</td>
                <td class="p_td"><common:print valueId="product.financeType" /></td>
                <td class="r_td">贷款金额：</td>
                <td class="p_td"><s:number name="product.financeLittleamount" />-<s:number name="product.financeBigamount" />万元</td>
              </tr>
              <tr>
              	<td class="r_td">基准利率：</td>
              	<td class="p_td">
              		<common:print valueId="apply.loanMonth" type="rate"/>%
		        	<s:if test="product.serviceCost != null && product.serviceCost > 0">
		        		<br/>另收${product.serviceCost }%服务费
		        	</s:if>
              	</td>
				<td class="r_td">浮动范围：</td>
              	<td class="p_td">
              		<s:if test="product.interestType == 155">
		        		<s:iterator value="product.interests">
		        			<s:if test="apply.loanMonth > financeStartdt && apply.loanMonth <= financeEnddt">
		        				+${rateUp }%
		        			</s:if>
		        		</s:iterator>
		        	</s:if>
              	</td>
              </tr>
              <tr>
              	<td class="r_td">还款方式：</td>
                <td class="p_td"><common:print valueId="product.repaymentType" /></td>
                <td class="r_td">担保方式：</td>
				<td class="p_td"><common:print valueId="product.mortgageType" /></td>
              </tr>
              <tr>
                <td class="r_td">放款时间：</td>
                <td class="p_td" colspan="3">${product.checkTime }个工作日</td>              	
              </tr>
              <tr>
                <td class="r_td">面向区域：</td>
				<td class="p_td" colspan="3"><s:if test="productAreaList.size()==0">
                	全国
                	</s:if>
                	<s:else>
	                		<s:iterator value="productAreaList" id="item">
	                			${item.name }&nbsp;&nbsp;
	                		</s:iterator>
                	</s:else>
                </td>
			  </tr>
		</table>
	</div>
	<div class="hr_10"> &nbsp; </div>
	<!--3-->
	<div class="apply_form">
	<div class="apply_form_title">申请信息</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
	<table class="apply_form_tb">
              <tr>
                <td class="r_td">贷款用途：</td>
                <td class="p_td"><common:print valueId="apply.loanPurpose" /></td>
                <td class="r_td">贷款金额：</td>
                <td class="p_td"><s:number name="apply.loanAmount" />万元</td>
              </tr>
              <tr>
                <td class="r_td">贷款期限：</td>
                <td class="p_td">${apply.loanMonth}个月</td>
                <td class="r_td">是否有抵押物：</td>
                <td class="p_td"><common:print valueId="apply.haveMortgage" valueSetMap="ZJ102"/></td>
			</tr>
			<tr>
                <td class="r_td">申请人姓名：</td>
                <td class="p_td">${user.realname}</td>
                <td class="r_td">申请人账号：</td>
                <td class="p_td">${user.username }</td>
			</tr>
	</table>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
	</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="apply_form">
	<div class="apply_form_title">个人信息</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
	<table class="apply_form_tb">
              <tr>
                <td class="r_td">行业：</td>
                <td class="p_td">${pindName }
                	<s:if test="cindName!=null">&nbsp; 子行业：${cindName }</s:if>
                </td>
                <td class="r_td">行业经验：</td>
                <td class="p_td"><s:number name="apply.experience" />年</td>
              </tr>
              <tr>
                <td class="r_td">年营业额：</td>
                <td class="p_td">${apply.allyearVolume}万元</td>
                <td class="r_td">经营场所：</td>
                <td class="p_td"><s:if test="apply.runningArea==1">有</s:if><s:else>无</s:else></td>
			</tr>
			<tr>
                <td class="r_td">银行借款经历：</td>
                <td class="p_td"><s:if test="apply.hostoryLoan==1">有</s:if><s:else>无</s:else></td>
                <td class="r_td">使用信用卡经历：</td>
                <td class="p_td"> <s:if test="apply.useCreditcard==1">有</s:if><s:else>无</s:else></td>
			</tr>
			<tr>
                <td class="r_td">银行流水：</td>
                <td colspan="3" class="p_td"><s:if test="apply.bankSalaryList==1">有</s:if><s:else>无</s:else></td>
			</tr>
	</table>
	
		<div class="hr_10"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div>
	</div>
	
	<div class="apply_form">
	<div class="apply_form_title">其它信息</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
	<table class="apply_form_tb">
		<s:iterator value="extendsValueList">
			<tr>
	    		<td class="r_td">${fieldName }：</td>
				<td class="p_td">${entityValue }</td>
			</tr>
		</s:iterator>
	</table>
		<div class="hr_10"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div>
	</div>	
	
	
	<div class="hr_10"> &nbsp; </div>
	<div class="apply_form">
	<div class="apply_form_title">审核</div>
	<div class="hr_10"> &nbsp; </div>
		<table class="apply_form_tb">
			<tr>
				<td class="r_td" style="vertical-align: top;">审核意见：</td>
				<td class="p_td"><textarea rows="5" cols="60" class="required" name="checkViewInput" id="advice"></textarea><br/>
				</td>
			</tr>
			<tr><td colspan="2" class="r_td" style="vertical-align: top;">
			<s:if test="apply.applyStatus == 177"><!-- 待审核 -->
				<input type="button" value="申请确认"  class="but_gray" onclick="updatestatus(178);" ></input>
				<input type="button" value="驳回"  class="but_gray" onclick="updatestatus(188);" ></input>
			</s:if>
			<s:elseif test="apply.applyStatus == 178">
				<input type="button" value="审核通过"  class="but_gray" onclick="updatestatus(180);" ></input>
				<input type="button" value="驳回"  class="but_gray" onclick="updatestatus(188);" ></input>
			</s:elseif>
			<s:elseif test="apply.applyStatus == 179">
				<input type="button" value="审核通过"  class="but_gray" onclick="updatestatus(180);" ></input>
				<input type="button" value="驳回"  class="but_gray" onclick="updatestatus(188);" ></input>
			</s:elseif>
			<s:elseif test="apply.applyStatus == 180">
				<input type="button" value="提交给金融机构"  class="but_gray" onclick="updatestatus(181);" ></input>
			</s:elseif>
			</td></tr>
		</table>
	<div class="hr_10"> &nbsp; </div>
	</div>
	
	
<div id="agree_num_input" style="display:none;" title="输入协议编号">
	<dl>
		<dd>
			<h6>协议编号:</h6>
			<input type="text" name="agreeNumInput" id="agreeNumInput"/>
			<input type="button" value="确定" cssClass="but_gray" onclick="if($('#agreeNumInput').val().length > 0){agreeNumInput($('#agreeNumInput').val());$('#agree_num_input').dialog('close');}else{alert('请输协议编号');}"/>
		</dd>
	</dl>
</div>	
<div id="apply_check" style="display:none;" title="驳回">
	<dl>
		<dd>
			<h6>处理意见:</h6>
			<textarea rows="5" cols="60" name="checkViewInput" id="checkViewInput"></textarea><br/>
			<input type="button" value="确定" class="but_gray" onclick="if($('#checkViewInput').val().length > 0){inputCheckView($('#checkViewInput').val());$('#apply_check').dialog('close');}else{alert('请输入处理意见！');}"/>
		</dd>
	</dl>
</div>	
</form>
</div>
</div>
  </body>
</html>