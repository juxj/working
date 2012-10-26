<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>个人经营性贷款申请详情</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script language="javascript">
  
function updatestatus(value){
	if (window.confirm('确定提交吗！')) {
		$('#apply_status').val(value);
		$("#loanForm").submit();
	}
}
</script>

  </head>
  
  <body>
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
  <div class="M_menu">
  	融资管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="/user/loan/userApplyManag.act">融资申请管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;融资申请查看
  </div>
<div class="hr_10"> &nbsp; </div>
<div class="container_950">
<div class="hr_10"> &nbsp; </div>
	<div class="apply_menu">
		<div class="finance_apply_menu app_menu001" >1、确认个人信息</div>
        <div class="finance_apply_menu app_menu02" >2、填写申请信息</div>
        <div <s:if test="apply.applyStatus==177">class="finance_apply_menu app_menu002"</s:if><s:else>class="finance_apply_menu app_menu02"</s:else>>3、预审中</div><!-- 177 -->
        <div <s:if test="apply.applyStatus==178">class="finance_apply_menu app_menu002"</s:if><s:else>class="finance_apply_menu app_menu02"</s:else>>4、提交资料</div><!-- 178 -->
        <div <s:if test="apply.applyStatus==179">class="finance_apply_menu app_menu002"</s:if><s:else>class="finance_apply_menu app_menu02"</s:else>>5、资金网审核</div><!-- 179 -->
        <div <s:if test="apply.applyStatus>=180 && apply.applyStatus<=188">class="finance_apply_menu app_menu003"</s:if><s:else>class="finance_apply_menu app_menu03"</s:else>>
       	<s:if test="apply.applyStatus==188">5、审核失败</s:if><s:else>6、金融机构审核</s:else>
        </div><!-- 180 -->
	</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="P_title">融资申请详情页</div>
	<div class="line" style="padding-top:10px; padding-bottom:10px; padding-left:30px; width:920px;">申请单号：${apply.applyNum }</div>
</div>
<div class="hr_10"> &nbsp; </div>
<form action="/user/loan/userApplyManag!checkApply.act" id="loanForm"  cssClass="box_form" style="margin:0px;" method="post">
<!-- 企业经营贷款快速申请类型=136 -->
<s:hidden name="apply.id"></s:hidden>
<s:hidden name="apply.applyStatus" id="apply_status"></s:hidden>
<s:hidden name="userType" value="1"></s:hidden>
<div class="apply_form">
<div class="apply_form_title">申请状态</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
	<table class="apply_form_tb" style="float:left; width:550px;">
	  <tr>
	    <td class="r_td">申请状态</td>
	    <td class="p_td"><common:print valueId="apply.applyStatus"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	<s:if test="userCheckStatus == 1">
				<s:if test="apply.applyStatus == 181"><!-- 待审核 -->
					<input type="button" value="接受申请"  class="but_gray" onclick="updatestatus(182);" ></input>
					<input type="button" value="退回申请"  class="but_gray" onclick="updatestatus(187);" ></input>
				</s:if>
				<s:elseif test="apply.applyStatus == 182">
					<input type="button" value="审核通过"  class="but_gray" onclick="updatestatus(185);" ></input>
					<input type="button" value="退回申请"  class="but_gray" onclick="updatestatus(187);" ></input>
				</s:elseif>
				<s:elseif test="apply.applyStatus == 183">
					<input type="button" value="资料审核通过"  class="but_gray" onclick="updatestatus(182);" ></input>
					<input type="button" value="退回申请"  class="but_gray" onclick="updatestatus(187);" ></input>
				</s:elseif>
				<s:elseif test="apply.applyStatus == 184">
					<input type="button" value="审核通过"  class="but_gray" onclick="updatestatus(185);" ></input>
					<input type="button" value="退回申请"  class="but_gray" onclick="updatestatus(187);" ></input>
				</s:elseif>
				<s:elseif test="apply.applyStatus == 185"><!-- 待放款 -->
					<input type="button" value="放款"  class="but_gray" onclick="window.open('/user/loan/loanAfter!loanAfterAddUI.act?appId=${apply.id}')" ></input>
				</s:elseif>
			</s:if>
			<s:else>
				<s:if test="apply.applyStatus >= 178 && apply.applyStatus<=186">
					<input type="button" value="上传资料"  class="but_gray" onclick="window.location='/user/loan/financeAttach!attachMana.act?viewAttachType=1&applyId=${apply.id }';" ></input>
				</s:if>
			</s:else>
	    </td>
	  </tr>
	  <s:if test="#session._user.userTypeGroup == 1 || #session._user.userTypeGroup == 5">
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
	  </s:if>
	</table>
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
		<td class="p_td" style="font-size: 16px;" colspan="3">${product.financeName }&nbsp;(${product.financeNum})</td>						
	  </tr>
              <tr>
                <td class="r_td">贷款类型：</td>
                <td class="p_td" width="180px"><common:print valueId="product.financeType" /></td>
                <td class="r_td">贷款金额：</td>
                <td class="p_td" width="180px"><s:number name="product.financeLittleamount" />-<s:number name="product.financeBigamount" />万元</td>
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
			<s:if test="#session._user.userTypeGroup == 2 || #session._user.userTypeGroup == 3">
			  <tr>
                <td class="r_td">申请人详细信息：</td>
                <td class="p_td">
                	<input type="button" value="查看" class="but_gray" onclick="window.open('/user/Profile!viewUserInfo.act?usrUser.id=${apply.userId}');"/>
                </td>
              </tr>
            </s:if>
              <tr>
                <td class="r_td" width="180px">贷款用途：</td>
                <td class="p_td"><common:print valueId="apply.loanPurpose" />&nbsp;${apply.loanPurposeOther }</td>
                <td class="r_td">贷款金额：</td>
                <td class="p_td" width="180px"><s:number name="apply.loanAmount" />万元</td>
              </tr>
              <tr>
                <td class="r_td">贷款期限：</td>
                <td class="p_td">${apply.loanMonth}个月</td>
                <td class="r_td">是否有抵押物：</td>
                <td class="p_td"><common:print valueId="apply.haveMortgage" valueSetMap="ZJ102"/></td>
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
                <td class="p_td" width="180px">${pindName }
                	<s:if test="cindName!=null">&nbsp; 子行业：${cindName }</s:if>
                </td>
                <td class="r_td">行业经验：</td>
                <td class="p_td" width="180px"><s:number name="apply.experience" />年</td>
              </tr>
              <tr>
                <td class="r_td">年营业额：</td>
                <td class="p_td"><common:print valueId="apply.allyearVolume"/></td>
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
	</div>
	<div class="hr_10"> &nbsp; </div>
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


</form>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
