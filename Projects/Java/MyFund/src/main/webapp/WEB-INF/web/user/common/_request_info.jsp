<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<script type="text/javascript"> 
	function edit(){
		var url = "/service/requestInfoAction4User!edit.act";
		var user_status = "${session._user.auditstatus}";
		if (user_status != "2") {
			alert("您的注册资料尚未通过审核，暂不能发布此信息!");
		} else {
			window.location.href = url;
		}
	}
</script>
<table class="gold-table" border="0" cellspacing="0" cellpadding="0">
  <caption>
  <span class="fr view_all"><a href="/service/club!home.act?mparamid=17&checkstate=1">查看全部»</a></span>
  <h6>项目信息</h6>
  <span class="leftdetail"><a href="javascript:edit();">立即发布</a></span>
  </caption>
  <s:if test="requestInfoList == null || requestInfoList.size<=0">
  	<tr>
  		<td colspan="7" align="center">暂无项目信息</td>
  	</tr>
  </s:if><s:else>
  <tr>
  	 <th>项目标题</th>
     <th>发布时间</th>
     <th>项目分类</th>
     <th>所需资金</th>
     <th>融资方式</th>
     <th>状态</th>
     <th style="text-align:right; padding-right:60px;">操作</th>
  </tr>
  </s:else>
  <s:iterator value="requestInfoList" id="item">
	  <tr>
	    <td title="${title}">
	    <s:if test="title != null && title.length()>15">
			<s:property value="title.substring(0,15)"></s:property>...
		</s:if><s:else>
			${title}
		</s:else>
	    </td>
		<td><s:date name="createDate" format="yyyy-MM-dd"/></td>
		<td>
			<s:iterator id="projectTypeItem" value="projectTypeList">
	    		<s:if test="#projectTypeItem.code==#item.projectType">
	    			${projectTypeItem.name }
	    		</s:if>	
	    	</s:iterator>
		</td>
		<td><s:number name="needMoney" />万元</td>
		<td title="${financeType}">
			<s:if test="financeType != null && financeType.length()>20">
				<s:property value="financeType.substring(0,20)"></s:property>...
			</s:if><s:else>
				${financeType}
			</s:else>
			<s:if test="#item.financeType==null or #item.financeType==''">
	    		不限
	    	</s:if>
		</td>
   		<td>
   			<s:if test="#item.rank==0">
				未审核
			</s:if>
			<s:if test="#item.rank==1">
				已通过
			</s:if>
			<s:if test="#item.rank==-1">
				已阻止
			</s:if>
   		</td>
   		<td class="view_detail"  style="text-align:right; padding-right:20px;">
   		<a href="/service/requestInfoAction!detail.act?clbRequestInfoId=${id }" style="width:30px;">查看</a>
   		</td>
	  </tr>
  </s:iterator>
</table>