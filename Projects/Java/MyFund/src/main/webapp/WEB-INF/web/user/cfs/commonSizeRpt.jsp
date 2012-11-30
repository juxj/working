<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  	<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
    <title>报表</title>
  </head>
  <body>
    	共同比 ${cfsRptType.fullName}　(${fiscalYear} 年)
    	
    	<table>
    		<tr>
    			<td>
    				<table border="1"　cellpadding="0" cellspacing="0" style="font-size : 12px;">
    					<tr>
			    			<td>项目</td>
			    			<td>上年数</td>
			    			<td>本年数</td>
			    			<td>上年结构</td>
			    			<td>本年结构</td>
			    			<td>增减比例</td>
			    			<td>结构排序</td>
			    			<td>增减排序</td>
			    			<td>结果</td>
		    			</tr>
			    		<s:iterator id="item" value="cfsComparedReportList">
			    			<s:if test="#item.rankCode==1">
			    			<tr>
				    			<td>${item.itemName }</td>
				    			<s:if test="#item.isDataItem==1">
				    				<td>
				    				<s:if test="#item.preYearValue!=0.00 ">
				    				<s:text name="format.float.3">
				    					<s:param value="#item.preYearValue"></s:param>
				    				</s:text>
				    				</s:if>
				    			</td>
				    			<td>
				    			<s:if test="#item.currYearValue!=0.00 ">
				    				<s:text name="format.float.3">
				    					<s:param value="#item.currYearValue"></s:param>
				    				</s:text>
			    				</s:if>
				    			</td>
				    			<td>
				    			<s:if test="#item.preYearPcnt!=0.00 ">
				    				<s:text name="format.float.3">
				    					<s:param value="#item.preYearPcnt"></s:param>
				    				</s:text>
			    				</s:if>
				    			</td>
				    			<td>
				    			<s:if test="#item.currYearPcnt!=0.00 ">
				    				<s:text name="format.float.3">
				    					<s:param value="#item.currYearPcnt"></s:param>
				    				</s:text>
			    				</s:if>
				    			</td>
				    			<td>
				    			<s:if test="#item.diffValue!=0.00 ">
				    				<s:text name="format.float.3">
				    					<s:param value="#item.diffValue"></s:param>
				    				</s:text>
			    				</s:if>
				    			</td>
				    			<td>
				    				${item.rank1 }
				    			</td>
				    			<td>
				    				${item.rank2 }
				    			</td>
				    			<td>
					    			${item.conclusion }
				    			</td>
				    			</s:if> <s:else>
				    				<td colspan="8"></td>
				    			</s:else>
				    		</tr>
			    			</s:if>
	    				</s:iterator>
    				</table>
    				<s:if test="cfsRptType.columns==2">
	    				<td>
	    				<table border="1"　cellpadding="0" cellspacing="0" style="font-size : 12px;">
    					<tr>
			    			<td>项目</td>
			    			<td>上年数</td>
			    			<td>本年数</td>
			    			<td>上年结构</td>
			    			<td>本年结构</td>
			    			<td>比例增减</td>
			    			<td>结构排序</td>
			    			<td>增减排序</td>
			    			<td>结果</td>
		    			</tr>
				    		<s:iterator id="item" value="cfsComparedReportList">
				    			<s:if test="#item.rankCode==2">
				    			<tr>
					    					<td>${item.itemName }</td>
				    			<s:if test="#item.isDataItem==1">
				    				<td>
				    				<s:if test="#item.preYearValue!=0.00 ">
				    				<s:text name="format.float.3">
				    					<s:param value="#item.preYearValue"></s:param>
				    				</s:text>
				    				</s:if>
				    			</td>
				    			<td>
				    			<s:if test="#item.currYearValue!=0.00 ">
				    				<s:text name="format.float.3">
				    					<s:param value="#item.currYearValue"></s:param>
				    				</s:text>
			    				</s:if>
				    			</td>
				    			<td>
				    			<s:if test="#item.preYearPcnt!=0.00 ">
				    				<s:text name="format.float.3">
				    					<s:param value="#item.preYearPcnt"></s:param>
				    				</s:text>
			    				</s:if>
				    			</td>
				    			<td>
				    			<s:if test="#item.currYearPcnt!=0.00 ">
				    				<s:text name="format.float.3">
				    					<s:param value="#item.currYearPcnt"></s:param>
				    				</s:text>
			    				</s:if>
				    			</td>
				    			<td>
				    			<s:if test="#item.diffValue!=0.00 ">
				    				<s:text name="format.float.3">
				    					<s:param value="#item.diffValue"></s:param>
				    				</s:text>
			    				</s:if>
				    			</td>
				    			<td>
				    				${item.rank1 }
				    			</td>
				    			<td>
				    				${item.rank2 }
				    			</td>
				    			<td>
					    			${item.conclusion }
				    			</td>
				    			</s:if> <s:else>
				    				<td colspan="8"></td>
				    			</s:else>
					    		</tr>
				    			</s:if>
		    				</s:iterator>
    					</table>
	    				
	    				</td>	
	    			</s:if>
    			</td>
    		</tr>
    	</table>
    	<script type="text/javascript">
	    	<s:iterator id="data" value="cfsRptDataList">
	    		setValue(${data.amount});
			</s:iterator>
			calculate();
    	</script>
  </body>
</html>
