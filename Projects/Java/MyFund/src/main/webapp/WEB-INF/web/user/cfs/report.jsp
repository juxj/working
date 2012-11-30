<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>报表</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript">
$(document).ready(function(){
	if('${msg}' == null || '${msg}' == ''){
		var code ='${code}';
		var year= '${dataYear}';
		url = "/cfs/getReportDataByJson.act";
		$.post(url, {code:code,dataYear:year}, function(data, status, response){
			json = jQuery.parseJSON(response.responseText);
			for (var i = 0; i < json.length; i++) {
				name = "name_"+json[i].rpt+"_"+json[i].code+"_"+json[i].year;
				$(":input[name="+name+"]").val(json[i].value);  	
		   }
		});
	}
});

function get_formulars(code, year) {
	$("#frmStyle").find("input[formular!='']").each(
		function(){
			if ($(this).attr("id").split("_")[1]==year) {
			    formular = $(this).attr("formular");
			    if (checkInputIdInFormular(formular, code)){
			    	value = 0;
			    	factors = formular.split(",");
			    	length = factors.length;
			    	m = 0;
			    	for (m; m<length; m++){
			    		inputId = "line_"+year+"_"+factors[m];
			    		value = value*1.00 + $("#"+inputId).val()*1.00*$("#"+inputId).attr("is_reduce_item");
			    	}
			    	$(this).attr("value",value);
			    	code = $(this).attr("id").split("_")[2];
			    	get_formulars(code, year);
			    }
		    }
		}
	);
}

function checkInputIdInFormular(formular, code){
	
	var factors = formular.split(",");
	var result = false;
	var m = 0;
	for (m; m<factors.length; m++) {
		if (factors[m] == code) {
			result = true;
			break;
		}
	}
	return result;
}

function checkBalance(){
	var year = '${dataYear}';
	var result = true;
	<s:if test="cfsRptType.internalValidation != null">
   		var json = jQuery.parseJSON("${cfsRptType.internalValidation}");
   		var m = 0;
   		var msg = "提示信息:\r\n";
   		for (m; m<json.length; m++){
   			var formular = json[m]['formular'];
   			var comment = json[m]['comment'];
  			var factors = formular.split("=");
  			var y1v1 = $("#line_"+year+"_"+factors[0]).val();
  			var y1v2 = $("#line_"+year+"_"+factors[1]).val();
  			if (y1v1==y1v2) {
  				msg = msg + year+":表内试算平衡通过.\r\n";
  			} else {
  				msg = msg + year+":"+comment+"未通过\r\n";
  				result = false;
  			}
  			<s:if test="cfsRptType.inputYears.length()>2">
  			year = year-1;
  			var y2v1 = $("#line_"+year+"_"+factors[0]).val();
  			var y2v2 = $("#line_"+year+"_"+factors[1]).val();
  			if (y2v1==y2v2) {
  				msg = msg + year+":表内试算平衡通过.\r\n";
  			} else {
  				msg = msg + year+":"+comment+"未通过\r\n";
  				result =  false;
  			}
  			</s:if>
   		}
   		alert(msg);
	</s:if>
	return result;
}


function setValue(input) {
	code = input.id.split("_")[2];
	year = input.id.split("_")[1];
	get_formulars(code, year);
}
</script>
<style>
.tableBorder{border-top: 1px solid #ccc; border-right: 1px solid #ccc}
.tableBorder td{border-bottom: 2px solid #ccc; border-left: 2px solid #ccc; padding: 5px;}
</style>
</head>

<body>
  <h6>根据报表样式生成需要的报表</h6>
  <hr />
   <p>&nbsp;</p>
   <p>&nbsp;</p>
   <s:if test="cfsRptType.internalValidation != null">
   	${cfsRptType.internalValidation }
	</s:if>
   <div align="center">
   <s:if test="msg == null || msg == ''">
   <p id="test"></p>
   <form id="frmStyle" action="/cfs/saveReportData.act" method="post">
   <input id="line_0000_0001" type="hidden" name="code" value="${code }"/>
   <input id="line_0000_0002" type="hidden" name="dataYear" value="${dataYear }"/>
  <table class="tableBorder">
  <tr>
	<td <s:if test="columns == 2">colspan="2"</s:if>>
	   <table width="100%;" class="tableBorder">
	   	<tr>
	   		<td align="center"><h6>
	   			<s:if test="code == 01">资产负债表</s:if>
	   			<s:elseif test="code == 02">利润及利润分配表</s:elseif>
	   			<s:elseif test="code == 03">现金流量表</s:elseif>
	   		</h6></td>
		</tr>
		<tr>
	   		<td align="right">
	   			<s:if test="code == 01">会企01表</s:if>
	   			<s:elseif test="code == 02">会企02表</s:elseif>
	   			<s:elseif test="code == 03">会企03表</s:elseif>
	   		</td>
		</tr>
		<tr>
	   		<td align="right">单位：万元</td>
	   	</tr>
	   </table>
	</td>
  </tr>
  	<tr>
  		<td>
	  	<table class="tableBorder">
		  	<s:iterator value="rptStyles" id="style">
			  	<s:if test="#style.columnId == 1">
			  	<tr>
					<td>
						<s:if test="#style.parentId != 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</s:if>${style.name }
					</td>
					<td>
						${style.lineNo }
					</td>
					<s:if test="#style.isDataItem != 0">
						<s:if test="cfsRptType.inputYears.length()>2">
						<td>
							<input id="line_${dataYear-1}_${style.code}" 
								name="name_${style.cfsRptTypeCode}_${style.code}_${dataYear-1}" 
								formular="${style.formular }" 
								is_reduce_item="${style.isReduceItem }" 
								type="text" 
								value="0" 
								size="10"
								onchange="setValue(this)" 
								<s:if test="%{null!=#style.formular && #style.formular.length()>1}">readonly="readonly"</s:if>/>
						</td>
						</s:if>
						<td>
							<input id="line_${dataYear}_${style.code}" 
								name="name_${style.cfsRptTypeCode}_${style.code}_${dataYear}" 
								formular="${style.formular }" 
								is_reduce_item="${style.isReduceItem }" 
								type="text" value="0" 
								size="10"
								onchange="setValue(this)" 
								<s:if test="%{null!=#style.formular && #style.formular.length()>1}">readonly="readonly"</s:if>/>
						</td>
						
					</s:if><s:else>
						<td colspan="2">&nbsp;</td>
					</s:else>
				</tr>
				</s:if>
	   		</s:iterator>
		</table>
   		</td>
   		<s:if test="columns == 2">
   		<td>
  		<table class="tableBorder">
	  	<s:iterator value="rptStyles" id="style">
		  	<s:if test="#style.columnId == 2">
   			<tr>
					<td>
						<s:if test="#style.parentId != 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</s:if>${style.name }
					</td>
					<td>
						${style.lineNo }
					</td>
					<s:if test="#style.isDataItem != 0">
						<s:if test="cfsRptType.inputYears.length()>2">
						<td>
							
							<input id="line_${dataYear-1}_${style.code}" 
								name="name_${style.cfsRptTypeCode}_${style.code}_${dataYear-1}" 
								formular="${style.formular }" 
								is_reduce_item="${style.isReduceItem }" 
								type="text" 
								value="0" 
								size="10"
								onchange="setValue(this)" 
								<s:if test="%{null!=#style.formular && #style.formular.length()>1}">readonly="readonly"</s:if>/>
						</td>
						</s:if>
						<td>
							<input id="line_${dataYear}_${style.code}" 
								name="name_${style.cfsRptTypeCode}_${style.code}_${dataYear}" 
								formular="${style.formular }" 
								is_reduce_item="${style.isReduceItem }" 
								type="text" value="0" 
								size="10"
								onchange="setValue(this)" 
								<s:if test="%{null!=#style.formular && #style.formular.length()>1}">readonly="readonly"</s:if>/>
						</td>
						
					</s:if><s:else>
						<td colspan="2">&nbsp;</td>
					</s:else>
				</tr>
		  	</s:if>
   		</s:iterator>
  		</table>
   		</td>
   		</s:if>
  	</tr>
  	<tr>
		<td align="center" <s:if test="columns == 2">colspan="2"</s:if>>
			<input id="line_3000_999" type="submit" onclick="return checkBalance();" value="提交"/>
		</td>
	</tr>
  </table>
  </form>
  </s:if><s:else>
  	${msg }
  </s:else>
  </div>
</body>
</html>