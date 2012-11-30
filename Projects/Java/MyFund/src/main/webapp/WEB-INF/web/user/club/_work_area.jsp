<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	function setOverallSelected() {
		var isChecked = $("#ckOverall").attr("checked");
		
		if (isChecked=="checked") {
			$("input[customerType='ctProvince']:checked").each(function(){
				$(this).attr("checked", null);
			});
			$("#divProvinceArea").hide();
		} else {
			$("#divProvinceArea").show();
		}
	}
	
	function hideProvince() {
		$("#divProvinceArea").hide();
	}
</script>
<tr>
	<td width="18%" class="form_table field_name">所属区域：</td>
	<td>
		<s:if test="clbSupplyInfo.workArea=='全国'">
			<input id="ckOverall" type="checkbox" name="clbSupplyInfo.workArea" 
				class="required" value="全国" checked onclick="setOverallSelected();"/>全国&nbsp;
			<s:set name="showProvincePanel" value="'none'"/>
		</s:if> <s:else>
			<input id="ckOverall" type="checkbox" name="clbSupplyInfo.workArea" 
				class="required" value="全国" onclick="setOverallSelected();"/>全国&nbsp;
		</s:else>
	</td>
</tr>

<tr>
	<td class="form_table field_name">&nbsp;</td>
	<td>
	<div id="divProvinceArea" style="display:${showProvincePanel}">
		<s:iterator id="item" value="provinceList" status="st">
			<s:set name="isChecked" value="0" />
			<s:iterator id="checkedItem" value="checkedProvinces">
				<s:if test="#checkedItem.trim()==#item.name">
					<s:set name="isChecked" value="1" />
				</s:if>
			</s:iterator>
			<s:if test="#isChecked==0">
				<input type="checkbox" customerType="ctProvince" 
					class="required" name="clbSupplyInfo.workArea"  value="${item.name }"/>${item.name }&nbsp;&nbsp;&nbsp;&nbsp;
				
			</s:if> <s:else>
				<input type="checkbox" customerType="ctProvince" 
					class="required" name="clbSupplyInfo.workArea"  value="${item.name }" checked/>${item.name } &nbsp;&nbsp;&nbsp;&nbsp;
			</s:else>
		<s:if test="#st.index != 0 && #st.index % 7 ==0"><br/></s:if>
		</s:iterator>
	</div>
	</td>
</tr>

