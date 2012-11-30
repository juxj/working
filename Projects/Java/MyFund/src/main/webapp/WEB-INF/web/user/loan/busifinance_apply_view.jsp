<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css"
	media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css"
	media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css"
	media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css"
	media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css"
	media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js">
	
</script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js">
	
</script>
<script language="javascript">
	function watchIt(id){
		$('#img_app').html("<img src='/user/loan/downloadAttach.act?type=0&falistId="+id+"'/>");
		$('#img_app').dialog({
			width : 700,
			modal:true
		});
	}
	function updatestatus(value) {
		if (window.confirm('确定要提交吗？')) {
			$('#apply_status').val(value);
			if (value == 187) {
				$("#apply_check").dialog({
					width : 440,
					modal : true
				});
				return;
			}
			$("#loanForm").submit();
		}
	}
	function inputCheckView(cview) {
		$('#check_view').val(cview);
		$("#loanForm").submit();
	}
	function all() {
		$.post('/user/loan/userApplyManag!applyCheckList.act', {
			applyId : $('#applyid').val()
		}, function(data) {
			$("#all_log").html(data);
		})
		$("#all_log").dialog({
			width : 340,
			height : 300,
			modal : true
		});
	}

	$(function() {
		var j = new Date();
		var y = j.getFullYear() - 1;
		$('.year').html(y);
		var jm = j.getFullYear() + "年" + j.getMonth() + "月";
		$('.yearmoth').html(jm);
	})
	
	
	 function downloadAttach(attachid){
    	var url = "financeAttach!viewAttach.act";
    	var param = {'attachId':attachid};
    	//window.location= url + "?attachId=" + attachid;
    	$.post(url,param, function(data){
    	//alert(data);
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
	
	function applyCancel(){
		//$("#loanForm").("action","/user/loan/financeAttach!selectCancel.act");
		var arrChk=$("input[name='ckbox']:checked");
		if(arrChk.length > 0){
			$("#loanForm").submit();
		}else{
			alert("请您选择操作数据！");
			return false;
		}
	}
</script>

</head>

<body>
	<!--头部2-->
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
	<div class="container_950">
		<div class="hr_10">&nbsp;</div>
		<div class="apply_menu">
			<div class="finance_apply_menu app_menu001">1、完善企业信息</div>
			<div class="finance_apply_menu app_menu02">2、填写申请信息</div>
			<div
				<s:if test="apply.applyStatus==177">class="finance_apply_menu app_menu002"</s:if>
				<s:else>class="finance_apply_menu app_menu02"</s:else>>3、预审中</div>
			<!-- 177 -->
			<div
				<s:if test="apply.applyStatus==178">class="finance_apply_menu app_menu002"</s:if>
				<s:else>class="finance_apply_menu app_menu02"</s:else>>4、提交资料</div>
			<!-- 178 -->
			<div
				<s:if test="apply.applyStatus==179">class="finance_apply_menu app_menu002"</s:if>
				<s:else>class="finance_apply_menu app_menu02"</s:else>>5、资金网审核</div>
			<!-- 179 -->
			<div
				<s:if test="apply.applyStatus>=180 && apply.applyStatus<=188">class="finance_apply_menu app_menu003"</s:if>
				<s:else>class="finance_apply_menu app_menu03"</s:else>>
				<s:if test="apply.applyStatus==188">5、审核失败</s:if>
				<s:else>6、金融机构审核</s:else>
			</div>
			<!-- 180 -->
		</div>
		<div class="hr_10">&nbsp;</div>
		<div class="P_title">融资申请详情页</div>
		<div class="line"
			style="padding-top:10px; padding-bottom:10px; padding-left:30px; width:920px;">申请单号：${apply.applyNum
			}</div>
	</div>
	<div class="hr_10">&nbsp;</div>
	<form action="/user/loan/financeAttach!selectCancel.act" id="loanForm" class="box_form" style="margin:0px;" method="post">
		<!-- 企业经营贷款快速申请类型=136 -->
		<input type="hidden" id="applyid" name="applyId" value="${apply.id }">
		<!--
		<s:hidden name="apply.applyStatus" id="apply_status"></s:hidden>
		<s:hidden name="appCheck.checkView" id="check_view"></s:hidden>
		<s:hidden name="userType" value="1"></s:hidden>
		-->
		<div class="apply_form">
			<div class="hr_10">&nbsp;</div>
			<div class="hr_10">&nbsp;</div>
			<table class="apply_form_tb" style="float:left; width:550px;">
				<tr>
					<td class="r_td">申请状态</td>
					<td class="p_td" width="300px;"><common:print
							valueId="apply.applyStatus" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<s:if test="userCheckStatus == 1">
							<s:if test="apply.applyStatus == 181">
								<!-- 待审核 -->
								<input type="button" value="接受申请" class="but_gray"
									onclick="updatestatus(182);"></input>
								<input type="button" value="退回申请" class="but_gray"
									onclick="updatestatus(187);"></input>
							</s:if>
							<s:elseif test="apply.applyStatus == 182">
								<input type="button" value="审核通过" class="but_gray"
									onclick="updatestatus(185);"></input>
								<input type="button" value="退回申请" class="but_gray"
									onclick="updatestatus(187);"></input>
							</s:elseif>
							<s:elseif test="apply.applyStatus == 183">
								<input type="button" value="资料审核通过" class="but_gray"
									onclick="updatestatus(182);"></input>
								<input type="button" value="退回申请" class="but_gray"
									onclick="updatestatus(187);"></input>
							</s:elseif>
							<s:elseif test="apply.applyStatus == 184">
								<input type="button" value="审核通过" class="but_gray"
									onclick="updatestatus(185);"></input>
								<input type="button" value="退回申请" class="but_gray"
									onclick="updatestatus(187);"></input>
							</s:elseif>
							<s:elseif test="apply.applyStatus == 185">
								<!-- 待放款 -->
								<input type="button" value="放款" class="but_gray"
									onclick="window.open('/user/loan/loanAfter!loanAfterAddUI.act?appId=${apply.id}')"></input>
							</s:elseif>
						</s:if> <s:else>
							<s:if test="apply.applyStatus >= 178 && apply.applyStatus<=186">
								<input type="button" value="上传资料" class="but_gray"
									onclick="window.location='/user/loan/financeAttach!attachMana.act?viewAttachType=1&applyId=${apply.id }';"></input>
							</s:if>
						</s:else></td>
				</tr>
				<s:if
					test="#session._user.userTypeGroup == 1 || #session._user.userTypeGroup == 5">
					<tr>
						<td class="r_td" style="vertical-align: top;">审核意见</td>
						<td class="p_td"><s:iterator value="applyCheckList">
		    				${checkView }
		    		</s:iterator> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
							href="javascript:all();">查看全部</a></td>
					</tr>
				</s:if>
			</table>
			<div class="hr_10">&nbsp;</div>
			<div class="hr_10">&nbsp;</div>
		</div>
		<div class="hr_10">&nbsp;</div>
		<div class="apply_form">
			<div class="apply_form_title">产品信息</div>
			<div class="hr_10">&nbsp;</div>
			<div class="hr_10">&nbsp;</div>
			<table class="apply_form_tb">
				<tr>
					<td><s:if test="logo == null">
							<img src="/images/banklogo/b/zj198.jpg" style="float: right;" />
						</s:if> <s:else>
							<img src="/images/banklogo/b/${product.logo }"
								style="float: right;" />
						</s:else></td>
					<td style="font-size: 16px;" colspan="3">&nbsp;&nbsp;${product.financeName
						}&nbsp;(${product.financeNum})</td>
				</tr>
				<tr>
					<td class="r_td">贷款类型：</td>
					<td class="p_td" width="180px"><common:print
							valueId="product.financeType" />
					</td>
					<td class="r_td">贷款金额：</td>
					<td class="p_td" width="180px"><s:number
							name="product.financeLittleamount" />-<s:number
							name="product.financeBigamount" />万元</td>
				</tr>
				<tr>
					<td class="r_td">基准利率：</td>
					<td class="p_td"><common:print valueId="apply.loanMonth"
							type="rate" />% <s:if
							test="product.serviceCost != null && product.serviceCost > 0">
							<br />另收${product.serviceCost }%服务费
		        	</s:if></td>
					<td class="r_td">浮动范围：</td>
					<td class="p_td"><s:if test="product.interestType == 155">
							<s:iterator value="product.interests">
								<s:if
									test="apply.loanMonth > financeStartdt && apply.loanMonth <= financeEnddt">
		        				+${rateUp }%
		        			</s:if>
							</s:iterator>
						</s:if></td>
				</tr>
				<tr>
					<td class="r_td">还款方式：</td>
					<td class="p_td"><common:print valueId="product.repaymentType" />
					</td>
					<td class="r_td">担保方式：</td>
					<td class="p_td"><common:print valueId="product.mortgageType" />
					</td>
				</tr>
				<tr>
					<td class="r_td">放款时间：</td>
					<td class="p_td" colspan="3">${product.checkTime }个工作日</td>
				</tr>
				<tr>
					<td class="r_td">面向区域：</td>
					<td class="p_td" colspan="3"><s:if
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
		<div class="hr_10">&nbsp;</div>
		<!-- 3 -->
		<div class="apply_form">
			<div class="apply_form_title">申请方信息</div>
			<div class="hr_10">&nbsp;</div>
			企业信息
			<hr width="80%"/>
			<table class="apply_form_tb">
				<tr>
					<td class="r_td">企业名称:</td>
					<td class="p_td">${ordCompany.companyname }</td>
					<td class="r_td">营业执照号码:</td>
					<td class="p_td">${ordCompany.licensecode }</td>
				</tr>
				<tr>
					<td class="r_td">组织机构代码证号码:</td>
					<td class="p_td">${ordCompany.organizationcode }</td>
					<td class="r_td">税务登记证号码：</td>
					<td class="p_td">${ordCompany.faxcode }</td>
				</tr>
				<tr>
					<td class="r_td">开户许可证号码：</td>
					<td class="p_td">${ordCompany.bankpermitcode }</td>
					<td class="r_td">贷款卡号：</td>
					<td class="p_td">${ordCompany.loancard }</td>
				</tr>
				<tr>
					<td class="r_td">注册地址：</td>
					<td colspan="3">${ordCompany.regaddress }</td>
				</tr>
				<tr>
					<td class="r_td">邮编：</td>
					<td class="p_td">${ordCompany.regpostcode }</td>
					<td class="r_td">所属园区：</td>
					<td class="p_td">无</td>
				</tr>
				<tr>
					<td class="r_td">注册日期：</td>
					<td class="p_td"><s:date name="ordCompany.registerdate" /></td>
					<td class="r_td">注册资本：</td>
					<td class="p_td">${ordCompany.registeredcapital }</td>
				</tr>
				<tr>
					<td class="r_td">企业类型：</td>
					<td class="p_td">${ordCompany.enterprisetypeid } </td>
					<td class="r_td">员工人数：</td>
					<td class="p_td">${ordCompany.employeesid }</td>
				</tr>
				<tr>
					<td class="r_td">经营范围：</td>
					<td colspan="3">${ordCompany.bizscope }</td>
				</tr>
				<tr>
					<td class="r_td">企业经营地址:</td>
					<td colspan="3"> ${ordCompany.bizaddress }</td>
				</tr>
				<tr>
					<td class="r_td" style="vertical-align:top;">邮政编码:</td>
					<td class="p_td">${ordCompany.bizpostcode }</td>
					<td class="r_td">联系人姓名:</td>
					<td class="p_td">${ordCompany.linkname}</td>
				</tr>
				<tr>
					<td class="r_td">联系人邮箱:</td>
					<td style="vertical-align: middle;">${ordCompany.linkemail }</td>
					<td class="r_td">联系人电话:</td>
					<td class="p_td">${ordCompany.linktelephone }</td>
				</tr>
				<tr>
					<td class="r_td">所属部门：</td>
					<td class="p_td">${ordCompany.department }</td>
					<td class="r_td">职位：</td>
					<td class="p_td">${ordCompany.position }</td>
				</tr>
				<tr>
					<td class="r_td">婚姻状况：</td>
					<td class="p_td"><common:print valueId="ordCompany.lpmarry" /></td>
					<td class="r_td">从事所属行业年限：</td>
					<td class="p_td">${ordCompany.lpindustryyears}</td>
				</tr>
				<tr>
					<td class="r_td">身份证号码：</td>
					<td colspan="3">${ordCompany.lpcid }</td>
				</tr>
				<tr>
					<td class="r_td">手机：</td>
					<td class="p_td">${ordCompany.lpmobile}</td>
					<td class="r_td">家庭电话：</td>
					<td class="p_td">${ordCompany.lphometel }</td>
				</tr>
				<tr>
					<td class="r_td">详细地址：</td>
					<td colspan="3">${ordCompany.lpliveaddress }</td>
				</tr>
			</table>
			法定代表人信息
			<hr width="80%"/>
			<div class="hr_10">&nbsp;</div>
			<table class="apply_form_tb">
				<tr>
					<td class="r_td">法定代表人：</td>
					<td class="p_td">${ordCompany.legalperson }</td>
					<td class="r_td">学历：</td>
					<td class="p_td"><common:print valueId="ordCompany.lpeducation" /></td>
				</tr>
				<tr>
					<td class="r_td">婚姻状况：</td>
					<td class="p_td"><common:print valueId="ordCompany.lpmarry" /></td>
					<td class="r_td">从事所属行业年限：</td>
					<td class="p_td"><common:print valueId="ordCompany.lpindustryyears" /> </td>
				</tr>
				<tr>
					<td class="r_td">常住地址：</td>
					<td colspan="3">${ordCompany.lpliveaddress } </td>
				</tr>
				<tr>
					<td class="r_td">邮编：</td>
          			<td colspan="3">${ordCompany.lplivepostcode }</td>
          		</tr>
          		<tr>
          			<td class="r_td">户籍所在地：</td>
          			<td colspan="3">${profileMap['address'] }</td>
				</tr>
				<tr>
					<td class="r_td">邮编：</td>
          			<td colspan="3">${ordCompany.lplivepostcode }</td>
          		</tr>
			</table>
			<div class="hr_10">&nbsp;</div>
		</div>
		<div class="hr_10">&nbsp;</div>
		<!--4-->
		<div class="apply_form">
			<div class="apply_form_title">申请信息</div>
			<div class="hr_10">&nbsp;</div>
			<div class="hr_10">&nbsp;</div>
			<table class="apply_form_tb">
				<s:if
					test="#session._user.userTypeGroup == 2 || #session._user.userTypeGroup == 3">
					<tr>
						<td class="r_td">企业详情：</td>
						<td class="p_td" colspan="3"><input type="button" value="查看"
							class="but_gray"
							onclick="window.open('/user/Profile!viewUserInfo.act?usrUser.id=${apply.userId}');" />
						</td>
					</tr>
				</s:if>
				<tr>
					<td class="r_td">贷款用途：</td>
					<td class="p_td" width="180px"><common:print valueId="apply.loanPurpose" /> &nbsp;${apply.loanPurposeOther }
					</td>
					<td class="r_td">贷款金额：</td>
					<td class="p_td" width="180px"><s:number
							name="apply.loanAmount" />万元</td>
				</tr>
				<tr>
					<td class="r_td">贷款期限：</td>
					<td class="p_td">${apply.loanMonth}个月</td>
					<td class="r_td">是否有抵押物：</td>
					<td class="p_td"><common:print valueId="apply.haveMortgage"
							valueSetMap="ZJ102" />
					</td>
				</tr>
			</table>
		</div>
		<!-- 3 -->
		<div class="hr_10">&nbsp;</div>
		<div class="apply_form">
			<div class="apply_form_title">企业经营信息</div>
			<div class="hr_10">&nbsp;</div>
			<div class="hr_10">&nbsp;</div>
			<table class="apply_form_tb">
				<tr>
					<td class="r_td">企业<span class="year"></span>年销售额约为：</td>
					<td class="p_td"><s:number name="apply.lastyearSaleVolume" />&nbsp;&nbsp;万元</td>
				</tr>
				<tr>
					<td class="r_td">企业<span class="year"></span>年经营成本约为：</td>
					<td class="p_td"><s:number name="apply.lastyearCost" />&nbsp;&nbsp;万元</td>
				</tr>
				<tr>
					<td class="r_td">企业<span class="year"></span>年净利润率约为：</td>
					<td class="p_td">${apply.lastyearProfit }&nbsp;&nbsp;%</td>
				</tr>
				<tr>
					<td class="r_td">截止到<span class="yearmoth"></span>，企业应收账款约为：</td>
					<td class="p_td"><s:number name="apply.receivable" />&nbsp;&nbsp;万元</td>
				</tr>
				<tr>
					<td class="r_td">截止到<span class="yearmoth"></span>，企业总库存约为：</td>
					<td class="p_td"><s:number name="apply.stockSum" />&nbsp;&nbsp;万元</td>
				</tr>
				<tr>
					<td class="r_td">截止到<span class="yearmoth"></span>，企业总资产约为：</td>
					<td class="p_td"><s:number name="apply.assetSum" />&nbsp;&nbsp;万元</td>
				</tr>
				<tr>
					<td class="r_td">截止到<span class="yearmoth"></span>，企业总负债约为：</td>
					<td class="p_td"><s:number name="apply.debtSum" />&nbsp;&nbsp;万元</td>
				</tr>
			</table>
			<div class="hr_10">&nbsp;</div>
		</div>
		<div class="hr_10">&nbsp;</div>
		
		<!-- 6 -->
		<div class="hr_10">&nbsp;</div>
		
		<div class="apply_form">
			<div class="apply_form_title">申贷资料</div>
			<div class="hr_10">&nbsp;</div>
			<table class="apply_form_tb" style="margin: 0 auto;">
     		<tr class="top_color">
     			<td></td>
	            <td style="padding-left:25px;">资料名称</td>
	            <td>说明</td>
	            <td>递交方式</td>
	            <td>状态</td>
	            <td>操作</td>
	
	          </tr>
          <tbody>
           <tr class="top_color01">
           <td> </td>
           	<td class="view_detail" style="padding-left:25px;">
           		中国资金网融资咨询服务协议加盖公章&nbsp;
           		  
           	</td>
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
           	<td>
           		<a href="/user/loan/downloadAttach!downAgreeTemplate.act" target="_blank" style="float:left;">模板下载</a>
           	</td>
           </tr>
           
           <s:iterator id ="item" value="attachList">
	        <tr class="top_color01">
	          <td style="padding-left:25px;"><input type="checkbox" name="ckbox" class="ckbox" value="${item.id }"/>&nbsp;${item.dataName }
							${item.supplyName }</td>
	          <td></td>
	          <td>${item.dataSupply } ${item.supplyMemo }</td>
	          <td><common:print valueId="#item.supplyWay"/><common:print valueId="#item.uploadStatus"/></td>
	          <td align="right" class="view_detail01" style="padding-right:20px;"><a>查看 </a>&nbsp;<a>下载</a>&nbsp;<a>确认</a>&nbsp;<a>退回 </a>&nbsp;<a>导出</a>&nbsp;<a>取消</a></td>          
	        </tr>
	        </s:iterator>
          
		 	<s:iterator id ="item" value="attachList">
			<tr class="top_color01">
				<td><input type="checkbox" name="ckbox" class="ckbox" value="${item.id }"/> </td>
				<td style="padding-left:25px;">
						${item.dataName }
						${item.supplyName }
				</td>
				<td>${item.dataSupply }
				${item.supplyMemo }
				</td>
				<td><common:print valueId="#item.supplyWay"/></td>
	   			<td><common:print valueId="#item.uploadStatus"/></td>
	   			<td align="right" class="view_detail01" style="padding-right:20px;">
	   			<input type="button" class="but_gray" value="查看" onclick="downloadAttach('${item.id}');"/>
	   			</td>
			</tr>
			<s:if test="haveMemo == 1">
					<tr>
						<td colspan="5">
							<div style="padding-left:40px;">${otherMemo }</div>
						</td>
					</tr>
				</s:if>
			</s:iterator>
			</tbody>
			<tr>
				<td colspan="6"><input type="button" class="but_gray" id="selectall" value="全部选中"/>
				<input type="button" class="but_gray" value="确认" onclick=""/>
				<input type="button" class="but_gray" value="撤销" onclick="applyCancel()"/></td>
			</tr>
        </table>
			<div class="hr_10">&nbsp;</div>
		</div>
		
		<div class="hr_10">&nbsp;</div>
		<div class="hr_10">&nbsp;</div>
		<div class="apply_form">
			<div class="apply_form_title">其它信息</div>
			<div class="hr_10">&nbsp;</div>
			<div class="hr_10">&nbsp;</div>
			<table class="apply_form_tb">
				<s:iterator value="extendsValueList">
					<tr>
						<td class="r_td">${fieldName }：</td>
						<td class="p_td">${entityValue }</td>
					</tr>
				</s:iterator>
			</table>
			<div class="hr_10">&nbsp;</div>
			<div class="hr_10">&nbsp;</div>
		</div>
	</form>

	<div id="apply_check" style="display:none;" title="退回申请">
		<dl>
			<dd>
				<h6>处理意见:</h6>
				<textarea rows="5" cols="60" name="checkViewInput"
					id="checkViewInput"></textarea>
				<br /> <input type="button" value="确定" class="but_gray"
					onclick="if($('#checkViewInput').val().length > 0){inputCheckView($('#checkViewInput').val());$('#apply_check').dialog('close');}else{alert('请输入处理意见！');}" />
			</dd>
		</dl>
	</div>

<div id="download_attach" style="display:none;" title="文件下载">

</div>
<div id="img_app" style="display:none;" title="图片预览">

</div>  
	<!--弹出框内日志页面-->
	<div id="all_log" style="display:none;" title="查看全部日志信息："></div>
	<!--主体部分结束-->
	<div class="hr_10">&nbsp;</div>
	<div class="hr_10">&nbsp;</div>
	<!--尾部-->
	<jsp:include page="/public/bottom.jsp" />
</body>
</html>
