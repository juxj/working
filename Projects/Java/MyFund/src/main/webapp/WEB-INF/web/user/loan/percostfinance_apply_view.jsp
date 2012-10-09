<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/public.js" > </script>
<script language="javascript">
  
function updatestatus(value){
	$('#apply_status').val(value);
	$("#loanForm").submit();
}
</script>

  </head>
  
  <body>
<!--头部2-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->

<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
<form action="/user/loan/financeApply!checkApply.act" id="loanForm" method="post" class="box_form" style="margin:0px;" >
<!-- 企业经营贷款快速申请类型=136 -->
<s:hidden name="apply.id"></s:hidden>
<s:hidden name="apply.applyStatus" id="apply_status"></s:hidden>
<s:hidden name="userType" value="1"></s:hidden>
	<div class="apply_form_title">个人综合消费贷款</div>
	<div class="C_title">产品信息</div>
	<div class="C_form">
            <dl>
              <dd>
              	<h6>申请单号：</h6>
              	${apply.applyNum }
              </dd>
              <dd>
                <h6>贷款类型：</h6>
                <common:print valueId="product.financeType" />
                </dd><dd>
                <h6>贷款金额：</h6>
                ${product.financeLittleamount }-${product.financeBigamount }万
              </dd>
              <dd>
                <h6>年利率：</h6>
                	<s:if test="product.interestType == 156">
                		<common:print valueId="product.interestType" />
                	</s:if>
                	<s:else>
                		<s:iterator value="product.interests" id="item">
                			<s:if test="apply.loanMonth >= item.financeStartdt && apply.loanMonth < item.financeEnddt">
                				${item.interestLittle }-${item.interestBig }
                			</s:if>
                		</s:iterator>
                	</s:else>
                	</dd><dd>
                <h6>贷款期限：</h6>
				  ${product.financeLittledt }-${product.financeMostdt }&nbsp;个月
			  </dd>
			  <dd>
                <h6>还款方式：</h6>
                <common:print valueId="product.repaymentType" />
                </dd><dd>
                <h6>担保方式：</h6>
				  <common:print valueId="product.mortgageType" />
			  </dd>
			  <dd>
                <h6>放款时间：</h6>
                ${product.checkTime }
                </dd><dd>
                <h6>面向区域：</h6>
				  <s:if test="productAreaList.size()==0">
                	全国
                	</s:if>
                	<s:else>
	                		<s:iterator value="productAreaList" id="item">
	                			${item.name }&nbsp;&nbsp;
	                		</s:iterator>
                	</s:else>
			  </dd>
			 </dl>
	</div>
	<div class="clear"></div>
	<div class="C_title">申请信息</div>
	<div class="C_form">
            <dl>
              <dd>
                <h6><span class="txt-impt">*</span>贷款用途：</h6>
                ${apply.loanPurpose }
                </dd><dd>
                <h6>贷款金额：</h6>
                ${apply.loanAmount}&nbsp;&nbsp;万元
              </dd>
              <dd>
                <h6>贷款期限：</h6>
                ${apply.loanMonth}&nbsp;&nbsp;月
                </dd><dd>
                <h6>是否有抵押物：</h6>
                <common:print valueId="apply.haveMortgage" valueSetMap="ZJ102"/>
				</dd>
			 </dl>
	</div>
	<div class="clear"></div>
	<div class="C_form">
		<div class="hr_10"> &nbsp; </div>
		<div class="center" style="width:500px;">
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
					<input type="button" value="审核通过"  class="but_gray" onclick="updatestatus(185);" ></input>
					<input type="button" value="退回申请"  class="but_gray" onclick="updatestatus(187);" ></input>
				</s:elseif>
				<s:elseif test="apply.applyStatus == 184">
					<input type="button" value="审核通过"  class="but_gray" onclick="updatestatus(185);" ></input>
					<input type="button" value="退回申请"  class="but_gray" onclick="updatestatus(187);" ></input>
				</s:elseif>
				<s:elseif test="apply.applyStatus == 185"><!-- 待放款 -->
					<input type="button" value="放款"  class="but_gray" onclick="" ></input>
				</s:elseif>
			</s:if>
			</div>
		<div class="hr_10"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div>
	</div>
</form>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
