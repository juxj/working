<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.zj198.model.DicYellowpage"%>
<% List<DicYellowpage> pages = (List<DicYellowpage>)request.getAttribute("pages"); %>
<style>
.ctl {
	table-layout: fixed
}

.ctl td {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>
<table style="width: 660px;" class="ctl">
	<% 
	if(pages!=null){
		int j = pages.size();
		for(int i=0; i<((j/3)+1); i++){
	%>
	<tr>
		<% 
			for(int k=i*3+1; k<j; k++){
				DicYellowpage d = (DicYellowpage)pages.get(k);
		%>
		<td title="<%=d.getName() %>" class="hot_connect" width="30%"><a target="_blank" href="<%=d.getUrl() %>"><%=d.getName() %></a></td>
		<% 
				if(k%3==0){
					break;	
				}
			}
		%>	
	</tr>
	<% 
			
		}
	}
	%>
</table>
