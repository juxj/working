<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资产品发布</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />	
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery-levelSelect-ajax.js"></script>
<script type="text/javascript" src="/script/jquery-industrySel-ajax.js"></script>
<script type="text/javascript" src="/script/jquery.ui.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.slider.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script type="text/javascript" src="/script/jquery.form.js" > </script>
<script language="javascript">
//文本框触发焦点效果s
$(function() {
	var defaultcity = '${financeProductSpModel.citySel}';
	var defaultind = '${financeProductSpModel.industrySel}';
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
    
	$("#areasel").click(function(){
		$.openLayer({
			maxItems : 500,
			pid : "0",
			returnText : "restxts",
			returnValue : "resvals",
			span_width : {d1:120,d2:150,d3:150},
			index : 1,
			topNum:$("#areasel").offset().top,
			defaultValue:defaultcity
		});
	});
	
	$("#industsel").click(function(){
		$.openLayer_indust({
			maxItems : 500,
			pid : "0",
			returnText : "indust_restxts",
			returnValue : "indust_resvals",
			span_width : {d3:150},
			index : 1,
			topNum:$("#industsel").offset().top,
			defaultValue:defaultind
		});
	});
	$("#dataUpdate").click(function(){
		
		$("#data_file_list").dialog({width:700,modal:true});
	});
	
	$("#loanForm").validate();
	finance_type_chenge();
	update_interest();
	
	$("#addDefineBut").click(function(){  
         var $table=$("#userDefine tr");  
         var len=$table.length;  
         var trstr = "<tr id="+(len+1)+"><td>项目名：<input type='text' name='financeProductSpModel.extendsName' class='middle_input_text'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + 
         			"项目类型：<select name='financeProductSpModel.extendsType' id='extendsType"+(len+1)+"' onchange='updateSelType(\"extendsType" + (len+1) + "\");'>" + 
         			"<option value='1'>单行文本框</option><option value='2'>多行文本框</option><option value='3'>下拉选择框</option><option value='4'>多选框</option></select> " + 
         			"</td><td><a href=\'javascript:deltr("+(len+1)+")\'>删除</a></td></tr>";
         $("#userDefine").append(trstr);           
     });
});

function finance_type_chenge(){
	if($('#product_financeType').val() == '151'){
		$('.finance_type_152').hide();
		$('.finance_type_153').hide();
		$('.finance_type_154').hide();
		$('.finance_type_151').show();
	}else if($('#product_financeType').val() == '152'){
		$('.finance_type_151').hide();
		$('.finance_type_153').hide();
		$('.finance_type_154').hide();
		$('.finance_type_152').show();
	}else if($('#product_financeType').val() == '153'){
		$('.finance_type_151').hide();
		$('.finance_type_152').hide();
		$('.finance_type_154').hide();
		$('.finance_type_153').show();
	}else if($('#product_financeType').val() == '154'){
		$('.finance_type_151').hide();
		$('.finance_type_152').hide();
		$('.finance_type_153').hide();
		$('.finance_type_154').show();
	}
}


function datalistcount(){
	
	var datalist = "";
	var dv = "";
	var bool = 0;
	$("input[name=datafilesel]").each(function(){ 
    	var dv = $(this).val();
		if($(this).attr("checked") == 'checked'){		
    		//datalist = datalist + dv + "/" + $('#dataName' + dv).val() + "/"+ $('#dataNum' + dv).val() + "/"+ $('#dataMemo' + dv).val() + "#";
    		if(!(/^[0-9]$/.test($('#dataNum' + dv).val()))){
    			bool = 1;
    			return ;
    		}
    		var othermemo = "";
			if( $('#otherMemo' + dv).length > 0){
				//othermemo = $('#otherMemo' + dv).val().replace("\r\n","<br>");
				othermemo = $('#otherMemo' + dv).val();
			}	
    		datalist = datalist + dv + "/" + $('#dataName' + dv).val() + "/"+ $('#dataNum' + dv).val() + "/"+ $('#dataMemo' + dv).val() + (othermemo == ''?'':"/"+othermemo) + "#";
	    	var li = $('#datali' + dv);
	    	if(li.length == 0){    		
	    		dv = $("<li id='datali" + dv + "'>" + $('#dataName' + dv).val() + "</li>");
		    	$('#datalistview').append(dv);
	    	}
		}else{
			var li = $('#datali' + dv);
	    	if(li.length > 0){    		
		    	li.remove();
	    	}
		}
	
    });
	if(bool == 1){
		alert('份数必须为数字！');
		return ;
	}
    $('#datalist_str').val(datalist);
	$("#data_file_list").dialog('close');
}

function preview(){
	$('#loanForm').attr('action','financeProduct!previewfin.act');
	$('#loanForm').attr('target','_blank');
	$('#loanForm').submit();
	$('#loanForm').attr('action','financeProduct!updatefin.act');
	$('#loanForm').attr('target','');
}

function update_interest(){
	var item = $("input[@name=product.interestType][checked]").val();
	//alert(item);
	if(item == '155'){
		$('#finance_interest_type').show();
		interest();
	}else{
		$('#finance_interest_type').hide();
	}
}
function update_financedt(){
	var item = $("input[@name=product.interestType][checked]").val();
	if(item == '155'){
		interest();
	}
}

function interest(){

	var littledt = $('#product_financeLittledt').val();
	var mostdt = $('#product_financeMostdt').val();
	if(littledt == '' || mostdt == ''){
		return ;
	}
	if(littledt >= mostdt){
		alert('贷款期限中的上限值必须大于下限！');
		return ;
	}
	var limist = 1;
	var limien = 5;
	if(littledt > 60){
		limist = 5;
	}else if(littledt > 36 && littledt <=60){
		limist = 4;
	}else if(littledt > 12 && littledt <=36){
		limist = 3;
	}else if(littledt > 6 && littledt <=12){
		limist = 2;
	}else if(littledt <= 12){
		limist = 1;
	}
	if(mostdt > 60){
		limien = 5;
	}else if(mostdt > 36 && mostdt <=60){
		limien = 4;
	}else if(mostdt > 12 && mostdt <=36){
		limien = 3;
	}else if(mostdt > 6 && mostdt <=12){
		limien = 2;
	}else if(mostdt <= 12){
		limien = 1;
	}
	var rateStId = $('#rateStId').val();
	var rateEnId = $('#rateEnId').val();
	if(rateStId != null && rateEnId != null && rateStId == limist && rateEnId == limien){
		return ;
	}else{
		$('#rateStId').val(limist);
		$('#rateEnId').val(limien);
	}
	for(var j = 1; j < limist; j++){
		var interTrObj = $('#interTr' + j);
		if(interTrObj.length > 0){
			interTrObj.remove();
		}
	}
	for(var j = limien + 1; j <=5; j++){
		var interTrObj = $('#interTr' + j);
		if(interTrObj.length > 0){
			interTrObj.remove();
		}
	}
	var inteArr = new Array(5.85,6.31,6.4,6.65,6.8);
	var inteTextArr = new Array('六月以内（含六月)','六个月至一年（含一年）','一至三年（含三年）','三至五年（含五年）','五年以上');
	for(var i = limist; i<=limien;i++){
		var interTrObj = $('#interTr' + i);
		if(interTrObj.length <=0){
			var intetr = "<tr id='interTr" + i + "'><td>" + inteTextArr[i-1] + "</td><td>" + inteArr[i-1] + "%</td><td> + <input type='text' name='financeProductSpModel.rateUp' class='digits' id='rateUp" + i + "' size='7'/>%</td>";
			intetr = intetr + "<td width='100px'><div id='slider-range" + i + "'></div></td></tr>";
			$('#interest_table').append($(intetr));
			sliderAdd(('slider-range' + i),('rateUp' + i),0);
		}
	}
}
function sliderAdd(sliderId, rateId,sliValue){
sliderId = "#" + sliderId;
rateId = "#" + rateId;
$(sliderId).slider({
			range: "min",
			value: sliValue,
			min: 0,
			max: 100,
			slide: function( event, ui ) {
				$( rateId ).val(ui.value );
			}
		});


		$( rateId ).val( $( sliderId ).slider( "value" ) );
}
function validate_maxlength(field,maxlength,errorClass){
	if(field.value.length>maxlength){
		$('.' + errorClass).show();
		field.value=field.value.substring(0,maxlength);
	}else if(field.value.length<maxlength){
		$('.' + errorClass).hide();
	}
}
function updateSetStatus(noid,boxName){
	if($("#" +noid).attr("checked")){
		$("input[name='" + boxName + "']").each(function(){
			$(this).attr("checked",'true');
		});
	}else{
		$("input[name='" + boxName + "']").each(function(){
			$(this).removeAttr("checked");
		});
	}
}
function updateCheck(noid,boxName){
	$("input[name='" + boxName + "']").each(function(){
		if($(this).attr("checked")==undefined){
			$("#" +noid).removeAttr("checked");
			return;
		}
	});
}
    function deltr(index)  
    {  
        $table=$("#userDefine tr");  
        if($("tr[id=\'"+index+"\']").length > 0){ 
            $("tr[id=\'"+index+"\']").remove();
        } 
        return;  
    } 
    function updateSelType(typeId){
    	$sel = $('#' + typeId);
    	var typeValue = $sel.val();
   		var conid = typeId.substring(typeId.length-1);
   		$content = $('#content' + conid);
   		
    	if(typeValue == 3 || typeValue == 4){
    		if($content.length ==0){
	    		$sel.after($('<div id="content' + conid + '">选项（以#号分隔）：<input type="text" name="financeProductSpModel.extendsValue" class="long_input_text"/></div>'));
    		}
    	}else{
    		if($content.length > 0){
    			$content.remove();
    		}
    	}
    }
    function validateExtendsPro(){
    	var st = 1;
    	$("input[name='financeProductSpModel.extendsName']").each(function(){
			if($(this).val().length == 0){
				$('#extendsError').show();
				st = 0;
			}
		});
		$("input[name='financeProductSpModel.extendsValue']").each(function(){
			if($(this).val().length == 0){
				$('#extendsError').show();
				st = 0;
			}
		});
		if(st == 1){
			$('#extendsError').hide();
		}else{
			return false;
		}
    }
function previewExtends(){
	$('#loanForm').attr('action','financeProduct!extendsPro.act');
	$('#loanForm').ajaxSubmit({
			datatype : "html",
			success : function(data) {
				$('#previewExtendsProperty').html(data);
				$('#previewExtendsProperty').dialog({width:400,modal:true});
			}
		});
	
	$('#loanForm').attr('action','financeProduct!updatefin.act');
	$('#loanForm').attr('target','');
}
    
</script>
<style>
.box_form select {float:none;}
</style>

  </head>
  <body>
<!--头部2-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
  <div class="M_menu">
  	<div style="float: left;">融资管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="/user/loan/financeProduct.act">融资产品管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;融资产品修改</div>
  </div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="apply_title" style="height:60px;">
	<p>发布贷款产品</p>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
<s:form action="financeProduct!updatefin.act" id="loanForm" namespace="/user/loan" cssClass="box_form" style="margin:0px;">
<s:hidden name="financeProductSpModel.rateStId" id="rateStId"></s:hidden>
<s:hidden name="financeProductSpModel.rateEnId" id="rateEnId"></s:hidden>
<s:hidden name="product.id"></s:hidden>
<s:hidden name="repeatStatus"></s:hidden>
	<div class="C_title">产品参数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span></div>
	<div class="C_form">
            <dl>
              <dd>
                <h6>贷款产品名称：</h6>
                <s:textfield name="product.financeName" cssClass="input-text required"  id="product_financeName" maxlength="100"></s:textfield>
              </dd>
              <dd>
                <h6>贷款类型：</h6>
                <common:select name="product.financeType" style="width:200px;" id="product_financeType" valueSetId="32" onchange="finance_type_chenge();"/>
              </dd>
              <dd>
                <h6>贷款期限：</h6>
                <s:textfield name="product.financeLittledt" cssClass="required digits" id="product_financeLittledt" size="7" onchange="update_financedt();" maxlength="3"></s:textfield>~
                <s:textfield name="product.financeMostdt" cssClass="required digits" id="product_financeMostdt" size="7" onchange="update_financedt();" maxlength="3"></s:textfield> &nbsp;&nbsp;个月
                <label for="product_financeMostdt" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
                <h6>贷款金额：</h6>
                <s:textfield name="product.financeLittleamount" cssClass="required digits" size="7" maxlength="9"></s:textfield>~
                <s:textfield name="product.financeBigamount" cssClass="required digits" size="7" id="product.financeBigamount" maxlength="9"></s:textfield> &nbsp;&nbsp;万
                <label for="product.financeBigamount" class="error" generated="true" style="display:none;"></label>
				</dd>
			  <dd class="finance_type_154" style="display:none;" >
                <h6>房屋性质：</h6>
                <common:checkbox name="financeProductSpModel.housePro" valueSetId="25"></common:checkbox>
              </dd>
              <dd class="finance_type_154" style="display:none;" >
                <h6>房屋使用年限：</h6>
                <s:textfield name="financeProductSpModel.financeExtend.useTime" cssClass="input-text required"  id="product_useTime"></s:textfield>
              </dd>
				<dd>
                <h6>贷款利率：</h6>
				  <common:radio name="product.interestType" valueSetId="33" onclick="update_interest();"/>
				</dd>
				<dd id="finance_interest_type">
					<h6>&nbsp;</h6>
					<div><!--利率浮动范围 -->
						<table width="500" id="interest_table">
							<tr>
								<th align='left'>贷款期限</th>
								<th align='left'>基准利率</th>
								<th align='left'>浮动范围</th>
								<th>&nbsp;</th>
							</tr>
							<s:if test="product.interestType == 155">
							<% int i = 1;%>
								<s:iterator value="product.interests" id="item">
									<s:if test="#item.financeEnddt == 6">
										<% i = 1; %>
									</s:if>
									<s:elseif test="#item.financeEnddt == 12">
										<% i = 2; %>
									</s:elseif>
									<s:elseif test="#item.financeEnddt == 36">
										<% i = 3; %>
									</s:elseif>
									<s:elseif test="#item.financeEnddt == 60">
										<% i = 4; %>
									</s:elseif>
									<s:elseif test="#item.financeEnddt >60">
										<% i = 5; %>
									</s:elseif>
									<tr id="interTr<%=i%>">
										<td>
											${item.interestMemo }
										</td>
										<td>
											<common:print valueId="#item.financeEnddt" type="rate"/>%
										</td>
										<td>
											+<input type='text' name='financeProductSpModel.rateUp' class='digits' id='rateUp<%=i %>' size='7' value="${item.rateUp }"/>%
										</td>
										<td width='100px'>
											<div id='slider-range<%=i %>'></div>
											<script>sliderAdd(('slider-range<%=i%>'),('rateUp<%=i%>'),$('#rateUp<%=i%>').val());</script>
										</td>
									</tr>
								</s:iterator>
							</s:if>
						</table>
					</div>
				</dd>
				<s:if test="#session._user.userTypeGroup == 3">
				  <dd>
	                <h6>服务费：</h6>
	                <s:textfield name="product.serviceCost" cssClass="input-text number"  id="product_serviceCost" maxlength="5" size="5"></s:textfield>&nbsp;%
	                <label for="product_serviceCost" class="error" generated="true" style="display:none;"></label>
	              </dd>
				</s:if>
				<dd class="finance_type_151 finance_type_152 finance_type_153">
                <h6>支持还款方式：</h6>
                	<input type="checkbox" value="0" id="repaymenttype_no" onclick="updateSetStatus('repaymenttype_no','financeProductSpModel.repaymentType');"/>
                	<label for="repaymenttype_no">不限</label>
				  	<common:checkbox name="financeProductSpModel.repaymentType" valueSetId="34" cssClass="required" onclick="updateCheck('repaymenttype_no','financeProductSpModel.repaymentType');"/>
				  	<label for="financeProductSpModel.repaymentType" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd class="finance_type_151 finance_type_152 finance_type_153">
                <h6>抵押类型：</h6>
                	<input type="checkbox" value="0" id="mortgage_no" onclick="updateSetStatus('mortgage_no','financeProductSpModel.mortgage');"/>
                	<label for="mortgage_no">不限</label>
				  <common:checkbox name="financeProductSpModel.mortgage" valueSetId="35" cssClass="required" onclick="updateCheck('mortgage_no','financeProductSpModel.mortgage');"/>
				  <label for="financeProductSpModel.mortgage" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd class="finance_type_151">
                <h6>支持用途：</h6>
                	<input type="checkbox" value="0" id="purpose_no" onclick="updateSetStatus('purpose_no','financeProductSpModel.purposeCompany');"/>
                	<label for="purpose_no">不限</label>
				  <common:checkbox name="financeProductSpModel.purposeCompany" valueSetId="14" cssClass="required" onclick="updateCheck('purpose_no','financeProductSpModel.purposeCompany');"/>
				  <label for="financeProductSpModel.purposeCompany" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd class="finance_type_152" style="display:none;">
                <h6>支持用途：</h6>
                	<input type="checkbox" value="0" id="running_no" onclick="updateSetStatus('running_no','financeProductSpModel.purposePersonRunning');"/>
                	<label for="running_no">不限</label>
				  <common:checkbox name="financeProductSpModel.purposePersonRunning" valueSetId="23" cssClass="required" onclick="updateCheck('running_no','financeProductSpModel.purposePersonRunning');"/>
				  <label for="financeProductSpModel.purposePersonRunning" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd class="finance_type_153" style="display:none;">
                <h6>支持用途：</h6>
				  <common:checkbox name="financeProductSpModel.purposePersonBuy" valueSetId="17"/>
				</dd>
				
				<dd class="finance_type_154" style="display:none;" >
                <h6>支持公积金：</h6>
                <common:radio name="product.surplus" valueSetMap="ZJ102"></common:radio>
              </dd>
				
              
				<dd>
                <h6>审批时间：</h6>
                <s:textfield name="product.checkTime" cssClass="input-text required digits"  id="product_checkTime" maxlength="3"></s:textfield>&nbsp;个工作日
                <label for="product_checkTime" class="error" generated="true" style="display:none;"></label>
              </dd>
              <dd>
                <h6>面向区域：</h6>
                <input type="radio" name="financeProductSpModel.selectArea" id="areaAll" value="0" <s:if test="financeProductSpModel.selectArea == 0">checked</s:if>/><label for="areaAll">全国</label>
                <input type="radio" name="financeProductSpModel.selectArea" id="areasel" value="1" <s:if test="financeProductSpModel.selectArea == 1">checked</s:if>/><label for="areasel">选择城市</label>
                <s:hidden id='resvals' name="financeProductSpModel.citySel"></s:hidden>
                <label for="restxts" class="error" generated="true" style="display:none;"></label>
              </dd>
			  
			  <dd>
			  	<h6>&nbsp;</h6>
                <textarea rows="5" cols="60" id="restxts" disabled="true" class="required" >${financeProductSpModel.citySelName }</textarea>
			  
			  </dd>
			 </dl>
			 
	</div>
	<div class="clear"></div>
	<div class="C_title">产品介绍</div>
	<div class="C_form">
		<dl>
           <dd>
             	<h6>贷款产品特色：</h6>
			  <common:checkbox name="financeProductSpModel.productSpecial"  valueSetId="36"/>
		   </dd>
			<dd>
                <h6>贷款产品介绍：</h6>
                <s:textarea name="product.proIntroduce" cols="60" rows="5" onKeyDown="validate_maxlength(this,500,'prointroduce');" onKeyUp="validate_maxlength(this,500,'prointroduce');"></s:textarea>
                <label class="error prointroduce" generated="true" style="display:none;">最多输入500个字符</label>
              </dd>
		</dl>
	</div>
	<div class="clear"></div>
	<div class="C_title">申贷资料</div>
	<div class="C_form">
		<dl>
			<dd>
                <h6>申贷需要资料清单</h6>
                <input type="button" value="资料维护" id="dataUpdate" class="but_gray"/>
                <s:hidden name="financeProductSpModel.datalistStr" id="datalist_str"></s:hidden>
              </dd>
              <dd >
              	<h6>&nbsp;</h6>
                <div id="datalistview" style="width:600px;padding-left:140px;">
                	<s:iterator value="product.dataFiles">
                		<li id="datali${datafileId }" >${dataName }</li>
                	</s:iterator>
                </div>
              </dd>
              <dd>
              	<h6>资料递交方式：</h6>
				  <common:checkbox name="financeProductSpModel.uploadWay"  valueSetId="37"/>
			  </dd>
		</dl>
	</div>
	<div style="display:none;" id="data_file_list" class="M_box" title="申贷需要资料清单">
		
		<table border="0" cellspacing="0" cellpadding="0" style="width:100%" >
			<tr>
				<th>
					<input type="checkbox" id="selAllData" name="selAllData" onclick="updateSetStatus('selAllData','datafilesel')"/>
					<label for="selAllData">全选</label>
				</th>
				<th>资料名称</th>
				<th>份数</th>
				<th>说明</th>
			</tr>
			<s:iterator value="dataFileList" id="item">
				<tr>
					<td>
						<input type="checkbox" name="datafilesel" value="${id }" <s:if test="selectStatus == 1">checked</s:if> onclick="updateCheck('selAllData','datafilesel')"/>
						
					</td>
					<td>
						${dataName }
						<input type="hidden" name="dataName" id="dataName${id }" value="${dataName }"/>
					</td>
					<td>
						<input type="text" name="dataNum" id="dataNum${id }" value="${dataNum }" maxlength="2" class="digits" />
					</td>
					<td>
						<input type="text" name="dataMemo" id="dataMemo${id }" value="${dataMemo }" maxlength="80"/>
					</td>
				</tr>
				<s:if test="haveMemo == 1">
					<tr>
						<td colspan="4">
							<textarea name="otherMemo" id="otherMemo${id }" cols="90" rows="5" onKeyDown="validate_maxlength(this,200,'otherMemo');" onKeyUp="validate_maxlength(this,200,'otherMemo');">${otherMemo }</textarea>
							<label class="error otherMemo" generated="true" style="display:none;">最多输入200个字符</label>
						</td>
					</tr>
				</s:if>
			</s:iterator>
				<tr>
					<td colspan="4" align='center'>
						<input type="button" value="确定" class="but_gray" onclick="datalistcount();"/>
					</td>
				</tr>
		</table>
	</div>
	<div class="clear"></div>
	<div class="C_title">申请条件</div>
	<div class="C_form">
		<dl>
			  <dd class="finance_type_151 finance_type_152">
                <h6>申请企业所属行业</h6>
                <input type="radio" name="financeProductSpModel.industryStatus" id="industryAll" value="0" <s:if test="financeProductSpModel.industryStatus == 0">checked</s:if>/><label for="industryAll">不限</label>
                <input type="radio" name="financeProductSpModel.industryStatus" id="industsel" value="1" <s:if test="financeProductSpModel.industryStatus == 1">checked</s:if>/><label for="industsel">选择行业</label>
                <s:hidden id='indust_resvals' name="financeProductSpModel.industrySel"></s:hidden>
              </dd>
              <dd class="finance_type_151 finance_type_152">
			  	<h6>&nbsp;</h6>
                <textarea rows="5" cols="60" id="indust_restxts" disabled="true">${financeProductSpModel.industrySelName }</textarea>
			  
			  </dd>
              <dd class="finance_type_151 finance_type_152">
                <h6>企业的总资产：</h6>
                <common:select name="financeProductSpModel.financeExtend.companyAllAsset" valueSetMap="ZJ112"></common:select>
              </dd>
              <dd class="finance_type_151">
                <h6>企业的年营业收入：</h6>
                <common:select name="financeProductSpModel.financeExtend.operatIncome" valueSetMap="ZJ104"></common:select>
              </dd>
              <dd class="finance_type_151">
                <h6>企业成立年数：</h6>
                <common:select name="financeProductSpModel.financeExtend.settingYear" valueSetMap="ZJ105"></common:select>
              </dd>
              <dd class="finance_type_152" style="display:none;" >
                <h6>保证金：</h6>
                <common:radio name="financeProductSpModel.financeExtend.needEnsure" valueSetMap="ZJ101" value="1"></common:radio>
              </dd>
              <dd class="finance_type_152" style="display:none;" >
                <h6>申请人行业经验：</h6>
                <common:select name="financeProductSpModel.financeExtend.experience" valueSetMap="ZJ106"></common:select>
              </dd>
              <dd class="finance_type_152" style="display:none;" >
                <h6>经营场所：</h6>
                <common:radio name="financeProductSpModel.financeExtend.runningArea" valueSetMap="ZJ103"></common:radio>
              </dd>
              
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>申请人月工资收入：</h6>
                <common:select name="financeProductSpModel.financeExtend.salaryIncome" valueSetMap="ZJ107"></common:select>
              </dd>
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>工资发放形式：</h6>
                <common:radio name="financeProductSpModel.financeExtend.salaryPutWay" valueSetMap="ZJ108"></common:radio>
              </dd>
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>现单位工作时长：</h6>
                <common:select name="financeProductSpModel.financeExtend.workTime" valueSetMap="ZJ109"></common:select>
              </dd>
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>所在地自有房产：</h6>
                <common:radio name="financeProductSpModel.financeExtend.house" valueSetMap="ZJ103"></common:radio>
              </dd>
              <dd class="finance_type_152 finance_type_153 finance_type_154" style="display:none;" >
                <h6>信用记录：</h6>
                <common:radio name="financeProductSpModel.financeExtend.creditAcount" valueSetMap="ZJ103"></common:radio>
              </dd>
              <dd class="finance_type_152 finance_type_153 finance_type_154" style="display:none;" >
                <h6>银行流水：</h6>
                <common:radio name="financeProductSpModel.financeExtend.bankSalaryList" valueSetMap="ZJ103"></common:radio>
              </dd>
              
              <dd>
                <h6>其他申请条件：</h6>
                <s:textarea name="product.otherRequire" cols="60" rows="5" onKeyDown="validate_maxlength(this,500,'otherrequire');" onKeyUp="validate_maxlength(this,500,'otherrequire');" id="product_otherRequire" ></s:textarea>
                <label class="error otherrequire" generated="true" style="display:none;">最多输入500个字符</label>
              </dd>
		</dl>
		</div>	
		<div class="clear"></div>
	<div class="C_title">自定义申请单（可选）</div>
	<div class="C_form">
		<div>
			如您需要申请方在提交申请时填写特殊信息，请在此定义您所需要的自定义项目的项目名称以及类型及具体选项内容等信息,你可以点击预览表单来预览实际效果<br/>
			（如：项目1：营业面积    项目类型：输入框 ）<input type="button" value="添加" id="addDefineBut" class="but_gray"/><input type="button" value="表单预览" onclick="previewExtends();" class="but_gray"/><br/>
			<label id="extendsError" class="error">项目名与选项都是必填项！</label>
		</div>
		<div class="hr_10"> &nbsp; </div>
		<div class="box_4" style="width:700px;">
		<table id="userDefine" width="600px" style="margin-left:20px;margin-top:20px; margin-bottom:20px; ">
		<%int m = 1; %>
			<s:iterator value="financeProductSpModel.extendsPropertyList">
				<tr id="<%=m%>">
					<td>
						项目<%=m %>：<input type="text" name="financeProductSpModel.extendsName" value="${fieldName }" class='middle_input_text'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						项目类型：<select name="financeProductSpModel.extendsType" id="extendsType<%=m %>" onchange="updateSelType('extendsType<%=m %>');" >
							<option value="1" <s:if test="fieldType == 1">selected</s:if>>单行文本框</option>
							<option value="2" <s:if test="fieldType == 2">selected</s:if>>多行文本框</option>
							<option value="3" <s:if test="fieldType == 3">selected</s:if>>下拉选择框</option>
							<option value="4" <s:if test="fieldType == 4">selected</s:if>>多选框</option>
						</select>
						<s:if test="fieldValue.length() > 0">						
						   <div id="content<%=m%>">选项（以#号分隔）：<input type="text" name="financeProductSpModel.extendsValue" value="${fieldValue }"/></div>
						</s:if>
					</td>
					<td><a href='javascript:deltr(<%=m%>)'>删除</a></td>
				</tr>
				<%m++; %>
			</s:iterator>
		</table>
		
		</div>
		
		
	</div>	
	
		<div class="hr_10"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div>
			<div class="center" style="width:500px;">
			<input type="button" value="预览" onclick="preview()" class="but_gray"/>
			<s:submit value="保存"  cssClass="but_gray" ></s:submit>
			</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>


</s:form>
</div>
<div id="previewExtendsProperty" title="自定义申请表单预览">
	
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
