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
			topNum:$("#areasel").offset().top
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
			topNum:$("#industsel").offset().top
		});
	});
	$("#dataUpdate").click(function(){
		
		$("#data_file_list").dialog({width:700,modal:true});
	});
	
	$("#addDefineBut").click(function(){  
         var $table=$("#userDefine tr");  
         var len=$table.length;  
         var trstr = "<tr id="+(len+1)+"><td>项目名：<input type='text' name='financeProductSpModel.extendsName' class='middle_input_text'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + 
         			"项目类型：<select name='financeProductSpModel.extendsType' id='extendsType"+(len+1)+"' onchange='updateSelType(\"extendsType" + (len+1) + "\");'>" + 
         			"<option value='1'>单行文本框</option><option value='2'>多行文本框</option><option value='3'>下拉选择框</option><option value='4'>多选框</option></select> " + 
         			"</td><td><a href=\'javascript:deltr("+(len+1)+")\'>删除</a></td></tr>";
         $("#userDefine").append(trstr);           
     });
	$("#loanForm").validate();

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
			if(!(/^\d+(\.\d+)?$/.test($('#dataNum' + dv).val()))){
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
	$('#loanForm').attr('action','/user/loan/financeProduct!previewfin.act');
	$('#loanForm').attr('target','_blank');
	$('#loanForm').submit();
	$('#loanForm').attr('action','/user/loan/financeProduct!savefin.act');
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
	if(mostdt-littledt <= 0){
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
			intetr = intetr + "<td width='200px'><div id='slider-range" + i + "'></div></td></tr>";
			$('#interest_table').append($(intetr));
			sliderAdd(('slider-range' + i),('rateUp' + i));
		}
	}
}
function sliderAdd(sliderId, rateId){
sliderId = "#" + sliderId;
rateId = "#" + rateId;

$(sliderId).slider({
			range: "min",
			value: 0,
			min: 0,
			max: 500,
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
    function validateExtendsSubmit(){
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
			$('#loanForm').submit();
		}
    }
function previewExtends(){
	$('#loanForm').attr('action','/user/loan/financeProduct!extendsPro.act');
	$('#loanForm').ajaxSubmit({
			datatype : "html",
			success : function(data) {
				$('#previewExtendsProperty').html(data);
				$('#previewExtendsProperty').dialog({width:400,modal:true});
			}
		});
	
	$('#loanForm').attr('action','/user/loan/financeProduct!savefin.act');
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
  	<div style="float: left;">融资管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="/user/loan/financeProduct.act">融资产品管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;融资产品发布</div>
  </div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="apply_title" style="height:60px;">
	<p>发布贷款产品</p>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
<form action="/user/loan/financeProduct!savefin.act" id="loanForm" class="box_form" method="post" style="margin:0px;">
<s:hidden name="financeProductSpModel.rateStId" id="rateStId"></s:hidden>
<s:hidden name="financeProductSpModel.rateEnId" id="rateEnId"></s:hidden>
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
				  <common:radio name="product.interestType" valueSetId="33" onclick="update_interest();" value="156" />
				  
				</dd>
				<dd id="finance_interest_type" style="display:none;">
					<h6>&nbsp;</h6>
					<div><!--利率浮动范围 -->
						<table width="600" id="interest_table">
							<tr>
								<th align='left'>贷款期限</th>
								<th align='left'>基准利率</th>
								<th align='left'>浮动范围</th>
								<th>&nbsp;</th>
							</tr>
							
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
                <common:radio name="product.surplus" valueSetMap="ZJ102" value="1"></common:radio>
              </dd>
				
              
				<dd>
                <h6>审批时间：</h6>
                <s:textfield name="product.checkTime" cssClass="input-text required digits"  id="product_checkTime" maxlength="3"></s:textfield>&nbsp;个工作日
                <label for="product_checkTime" class="error" generated="true" style="display:none;"></label>
              </dd>
              <dd>
                <h6>面向区域：</h6>
                <input type="radio" name="financeProductSpModel.selectArea" id="areaAll" value="0" checked/><label for="areaAll">全国</label>
                <input type="radio" name="financeProductSpModel.selectArea" id="areasel" value="1"/><label for="areasel">选择城市</label>
                <s:hidden id='resvals' name="financeProductSpModel.citySel"></s:hidden>
                <label for="restxts" class="error" generated="true" style="display:none;"></label>
              </dd>
			  
			  <dd>
			  	<h6>&nbsp;</h6>
                <textarea rows="5" cols="60" id="restxts" disabled="true"></textarea>
			  
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
						<input type="checkbox" name="datafilesel" value="${id }" onclick="updateCheck('selAllData','datafilesel')"/>
					</td>
					<td>
						${dataName }
						<input type="hidden" name="dataName" id="dataName${id }" value="${dataName }"/>
					</td>
					<td>
						<input type="text" name="dataNum" id="dataNum${id }" class="digits" maxlength="2"/>
					</td>
					<td>
						<input type="text" name="dataMemo" id="dataMemo${id }" maxlength="80"/>
					</td>
				</tr>
				<s:if test="haveMemo == 1">
					<tr>
						<td colspan="4">
							<textarea name="otherMemo" id="otherMemo${id }" cols="90" rows="5" onKeyDown="validate_maxlength(this,200,'otherMemo');" onKeyUp="validate_maxlength(this,200,'otherMemo');"></textarea>
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
                <input type="radio" name="financeProductSpModel.industryStatus" id="industryAll" value="0" checked/><label for="industryAll">不限</label>
                <input type="radio" name="financeProductSpModel.industryStatus" id="industsel" value="1"/><label for="industsel">选择行业</label>
                <s:hidden id='indust_resvals' name="financeProductSpModel.industrySel"></s:hidden>
              </dd>
              <dd class="finance_type_151 finance_type_152">
			  	<h6>&nbsp;</h6>
                <textarea rows="5" cols="60" id="indust_restxts" disabled="true"></textarea>
			  
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
                <common:radio name="financeProductSpModel.financeExtend.needEnsure" valueSetMap="ZJ101" value="0"></common:radio>
              </dd>
              <dd class="finance_type_152" style="display:none;" >
                <h6>申请人行业经验：</h6>
                <common:select name="financeProductSpModel.financeExtend.experience" valueSetMap="ZJ106"></common:select>
              </dd>
              <dd class="finance_type_152" style="display:none;" >
                <h6>经营场所：</h6>
                <common:radio name="financeProductSpModel.financeExtend.runningArea" valueSetMap="ZJ103" value="0"></common:radio>
              </dd>
              
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>申请人月工资收入：</h6>
                <common:select name="financeProductSpModel.financeExtend.salaryIncome" valueSetMap="ZJ107"></common:select>
              </dd>
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>工资发放形式：</h6>
                <common:radio name="financeProductSpModel.financeExtend.salaryPutWay" valueSetMap="ZJ108" value="0"></common:radio>
              </dd>
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>现单位工作时长：</h6>
                <common:select name="financeProductSpModel.financeExtend.workTime" valueSetMap="ZJ109"></common:select>
              </dd>
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>所在地自有房产：</h6>
                <common:radio name="financeProductSpModel.financeExtend.house" valueSetMap="ZJ103" value="0"></common:radio>
              </dd>
              <dd class="finance_type_152 finance_type_153 finance_type_154" style="display:none;" >
                <h6>信用记录：</h6>
                <common:radio name="financeProductSpModel.financeExtend.creditAcount" valueSetMap="ZJ103" value="0"></common:radio>
              </dd>
              <dd class="finance_type_152 finance_type_153 finance_type_154" style="display:none;" >
                <h6>银行流水：</h6>
                <common:radio name="financeProductSpModel.financeExtend.bankSalaryList" valueSetMap="ZJ103" value="0"></common:radio>
              </dd>
              
              <dd>
                <h6>其他申请条件：</h6>
                <s:textarea name="product.otherRequire" cols="60" rows="5" onKeyDown="validate_maxlength(this,500,'otherrequire');" onKeyUp="validate_maxlength(this,500,'otherrequire');" id="product_otherRequire" ></s:textarea>
                <label class="error otherrequire" generated="true" style="display:none;">最多输入500个字符</label>
                <!-- if(this.value.length>10){alert('11');this.value=this.value.substring(0,10);} -->
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
		</table>
		<!-- 
			<tr id="1">
				<td>
					项目1：<input type="text" name="financeProductSpModel.extendsName" class='middle_input_text'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目类型：<select name="financeProductSpModel.extendsType" id="extendsType1" onchange="updateSelType('extendsType1');">
						<option value="1">单行文本框</option>
						<option value="2">多行文本框</option>
						<option value="3">下拉选择框</option>
						<option value="4">多选框</option>
					</select>
				</td>
				<td><a href='javascript:deltr(1)'>删除</a></td>
			</tr>
			 -->
		</div>
	</div>	

		<div class="hr_10"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div>
			<div class="center" style="width:500px;">
			<input type="button" value="预览" onclick="preview()" class="but_gray"/>
			<input type="button" value="保存"  class="but_gray"  onclick="validateExtendsSubmit();"/>
			</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
</form>
<div id="previewExtendsProperty" title="自定义申请表单预览">
	
</div>

<div style="width:850px;height:200px; overflow-y:scroll; border:1px solid;"> 
中国资金网融资产品发布规则<br/>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;本网站由鼎辉信息技术（上海）有限公司负责运营【以下本网站均指中国资金网及鼎辉信息技术（上海）有限公司】。请您使用本网站之前敬请仔细阅本服务协议。通过访问或使用本网站，您即明确同意遵守本服务协议并接受之约束。如果您不接受本服务条款的全部规定，则请勿使用本网站。您一旦使用本网站的服务，即视为您已了解并完全同意本服务协议各项内容，包括本网站对服务协议随时做出的任何修改。除非另有规定，否则任何变更或修改将在修订内容于本网站发布之时立即生效，您对本网站的使用、继续使用将表明您接受此等变更或修改。如您不同意本服务协议及/或随时对其的修改、及/或法律声明，您可以主动取消本网站提供的服务。 
</p>
<p>1.注册要求及隐私保护 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;1.本网站只接受具备完全民事行为能力的自然人，或者是具有合法经营资格的实体组织成为网站用户。如您不符合资格，请勿注册。否则，本网站保留中止或终止您用户资格的权利。 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;2.用户在申请使用本网站服务时，必须提供真实、有效的个人资料，并不断更新注册资料。如果因注册信息不真实而引起的问题及其后果，本网站不承担任何责任。倘若本网站发现用户的注册资料是虚假、不准确或不完整的，则可自行决定终止该用户的帐号。 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;3.用户注册成功后，本网站将提供用户一个用户帐号及相应的密码，该用户帐号和密码由用户自行负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。 </p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;4.因您保管疏忽或因黑客行为、计算机病毒侵入或发作致使帐号、密码被他人非法使用、盗用、篡改或丢失的，本网站不承担责任。如您发现任何非法使用用户帐号或安全漏洞的情况，请立即与本网站联系。 
</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;5.本网站保证不对外公开或向第三方提供用户注册的个人资料信息，及用户在使用服务时存储的非公开内容信息，但下列情况除外： </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.事先获得用户的明确授权许可； </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.按照相关司法机关或政府主管部门的要求； </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.只有透露用户的个人资料，才能提供用户所要求的相应产品和服务； </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.以维护本网站合法权益之目的； </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.维护社会公众利益； </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.符合其他合法要求； </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.由于与本网站链接的其它网站所造成用户资料泄露及由此而导致的任何法律争议和后果。 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;6.用户连续6个月未登录的帐号，本网站保留关闭的权利。 </p>
<p>2.服务内容及费用 </p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;本网站的具体服务内容由本网站根据实际情况提供，例如融资、理财、增值服务等，本网站保留根据实际情况随时调整本网站平台提供的服务种类、形式。本网站不承担因业务调整给用户造成的损失。本网站对提供的服务拥有最终解释权。您因进行交易、向本网站获取有偿服务而发生的相关服务费用和所有应纳税赋，以及相关硬件、软件、通讯、网络服务及其他方面的费用均由您自行承担。本网站保留变更、中断或终止部分网络服务的权利。 
</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;1.涉及第三方网站 </p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;本网站的网站内容可能涉及由第三方所有、控制或者运营的其他网站的内容或链接（以下称“第三方网站”）。本网站不能保证也没有义务保证第三方网站上的信息的真实性和有效性。对于该等内容或链接，您确认按照第三方网站的服务协议确定相关权利义务，而不是按照本协议。第三方网站的内容、产品、广告和其他任何信息均由您自行判断并承担风险责任，而与本网站无关。 
</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.不保证 </p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;本网站提供的服务中不带有对本网站中的任何用户、任何交易的任何保证，无论是明示、默示或法定的，因此本网站及其股东、创建人、高级职员、董事、代理人、关联公司、母公司、子公司和雇员不保证由其他用户或机构提供的内容的真实性、充分性、及时性、可靠性、完整性和有效性，并且不承担任何由此引起的法律责任。 
</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.免责声明 </p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;在任何情况下，本网站对您使用本网站服务而产生的任何形式的直接或间接损失均不承担法律责任，包括但不限于资金损失、利润损失、交易中断损失等。因为本网站或者涉及的第三方网站的设备、系统问题或者因为计算机病毒造成的损失，本网站均不负责赔偿。如果因为用户违反有关法律或者本协议之规定，使本网站遭受任何损失，受到任何第三方的索赔，或任何行政管理部门的处罚，用户应对本网站作出相应的补偿。 
</p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.服务变更、中断或终止 
</p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.如因系统维护或升级的需要而需暂停网络服务、服务功能的调整，本网站将尽可能在网站上进行通告。由于用户未能及时查看、浏览通告信息而造成的损失，本网站不承担任何责任。 
</p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.用户同意，本网站可自行决定变更提供服务的内容，本网站可自行决定授权第三方向用户提供原本由本网站提供的服务，不需向用户承担任何因变更服务所产生的责任。 
</p>
<p>
3.如发生下列任何一种情形，本网站有权单方面中断或终止向用户提供服务而无需通知用户，无需对用户或第三方承担任何责任： 
</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;1.用户提供的个人资料不真实； </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;2.用户违反本服务条款； </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;3.未经本网站同意，将本网站平台用于商业目的。 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;4.用户可随时根据需要通知本网站终止提供服务，用户服务终止后，用户使用服务的权利同时终止。自用户终止之日起，本网站与用户有关服务协议约定的权利义务不再履行。 </p>
<p>2.服务协议的完善和修改 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;1.本网站有权根据互联网的发展和中华人民共和国有关法律、法规的变化，不时地完善和修改本网站服务协议。 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;2.本网站保留随时修改服务协议的权利，用户在使用本网站平台服务时，有必要对最新的本网站服务协议进行仔细阅读和重新确认，当发生有关争议时，应以最新的服务协议条款为准。 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;3.特别约定 </p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.用户使用本服务的行为若有任何违反国家法律法规或侵犯任何第三方的合法权益的情形时，本网站有权直接删除该等违反规定之信息，并可以暂停或终止向该用户提供服务。 
</p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.若用户利用本服务从事任何违法或侵权行为，由用户自行承担全部责任，因此给本网站或任何第三方造成任何损失，用户应负责全额赔偿。并使本网站免受任何损害赔偿。 
</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.所有发给用户的通告或通知都可以通过重要页面的公告、通告、电子邮件以及常规信件的形式传送。 </p>
<p>4.本服务协议最终解释权归本网站所有。 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;4.适用法律和管辖 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;因本网站提供服务所产生的争议均适用中华人民共和国法律，并由鼎辉信息技术（上海）有限公司住所地人民法院管辖。 </p>
</div>

			
			<div class="hr_10"> &nbsp; </div>


</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
