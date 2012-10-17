<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<div class="index_subnav" style="position:relative;">
	<div class="xxkbox">
		<font class="fl" style="line-height:36px; font-weight:bold;">网站公告：</font>
		<ul class="fl" id="IssueList" style="height:24px;line-height:24px;overflow:hidden; margin-top:6px;width:800px;">
			<s:iterator id="item" value="siteNews">
				<li><s:if test="#item.url.length()>8">
						<s:if test="#item.title.length()>25">
							<a href="${item.url}" target="_blank"> <s:property value="#item.title.substring(0,25)"></s:property>...</a>
						</s:if>
						<s:else>
							<a href="${item.url}" target="_blank">${item.title}</a>
						</s:else>
					</s:if> <s:else>
						<s:if test="#item.title.length()>25">
							<a href="/news/Info.act?id=${item.id}" target="_blank"> <s:property value="#item.title.substring(0,25)"></s:property>...</a>
						</s:if>
						<s:else>
							<a href="/news/Info.act?id=${item.id}" target="_blank">${item.title}</a>
						</s:else>
					</s:else></li>
			</s:iterator>
		</ul>
	</div>
</div>