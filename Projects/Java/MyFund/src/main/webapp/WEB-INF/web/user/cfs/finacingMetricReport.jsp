<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  	<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
  	<script language="javascript">
  		function getYearValue(year, json) {
  			var val = 0;
  			for (var i = 0; i < json.length; i++) {
  				if (json[i].year == year){
  					val = json[i].value;
  				}
  			}
  			return val;
  		}
  	</script>
    <title>报表</title>
  </head>
  
  <body>
    	财务比率分析表　(${fiscalYear} 年)
    	
    	<table border="1">
			<tr>
				<th>指标名称</th>
				<th>上年数%</th>
				<th>本年数%</th>
				<th>增减%</th>
				<th>结论</th>
			</tr>    	
    	<s:iterator id="item" value="cfsUsrMetricList">
    		<tr>
    			<s:if test="#item.cfsMetricCode.length()<3">
    				<td>${item.cfsMetricName }</td>
    			</s:if> <s:else>
    				<td>&nbsp;&nbsp;&nbsp;&nbsp;${item.cfsMetricName }</td>
    			</s:else>
				<td><div id="p_${fiscalYear-1}_${item.cfsMetricCode}"></div> </td>
				<td><div id="p_${fiscalYear}_${item.cfsMetricCode}"></div></td>
				<td><div id="p_diff_${item.cfsMetricCode}"></div></td>
				<td><div id="p_result_${item.cfsMetricCode}"></div></td>
				<s:if test="#item.cfsMetricCode.length()>2">
					<script language="javascript">
						function set_value_${item.cfsMetricCode}() {
							var fiscalYear = ${fiscalYear} * 1.00;
							var metric_value = "${item.metricValues}";
							var json = jQuery.parseJSON(metric_value);
							var previousYear = fiscalYear-1;
							var a = getYearValue(previousYear, json);
							var b = getYearValue(fiscalYear, json);
							var c = (b-a)/a;
							$("#p_${fiscalYear-1}_${item.cfsMetricCode}").html(Math.round(a*10000)/100);
							$("#p_${fiscalYear}_${item.cfsMetricCode}").html(Math.round(b*10000)/100);
							$("#p_diff_${item.cfsMetricCode}").html(Math.round(c*10000)/100);
							var d = get_conclusion_${item.cfsMetricCode}(b, c);
							$("#p_result_${item.cfsMetricCode}").html(d);
						}
						
						function get_conclusion_${item.cfsMetricCode}(b, c){
							var value = 0;
							
							${item.measurementInterval}
							
							if (value==0){
								return "正常";
							}
							
							if (value==1) {
								return "关注";
							}
							
							if (value==2) {
								return "异常";
							}
						}
						
						set_value_${item.cfsMetricCode}();
					</script>
				</s:if>
			</tr>    
    	</s:iterator>
    	</table>
  </body>
</html>
