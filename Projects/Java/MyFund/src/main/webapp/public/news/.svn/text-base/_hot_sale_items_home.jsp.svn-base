<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

	<table class="qyrz-top_table">
		<tr>
		  <td colspan="2" class="remen">最新理财产品</td>
		</tr>
        <s:iterator id="item" value="hotSaleItemsHomeList">
      	<tr>
	      	<s:if test="#item.url.length()>8">
			<s:if test="#item.title.length()>25">
					<td style="vertical-align: middle;"><img src="/images/icons/zg_icon.jpg" /></td>
					<td class="hot_connect">
						<a href="${item.url} "  target="_blank">
							<s:property value="#item.title.substring(0,25)"></s:property>...</a></td>
				</s:if><s:else>
				<td style="vertical-align: middle;"><img src="/images/icons/zg_icon.jpg" /></td>
					<td class="hot_connect">
						<a href="${item.url} " target="_blank"> ${item.title}</a>
					</td>
				</s:else>
			</s:if> 
			<s:else>
				<s:if test="#item.title.length()>25">
					<td style="vertical-align: middle;"><img src="/images/icons/zg_icon.jpg" /></td>
						<td class="hot_connect">
							<a href="/news/Info.act?id=${item.id}">
								<s:property value="#item.title.substring(0,25)"></s:property>...</a>
							</td>
				</s:if><s:else>
					<td style="vertical-align: middle;"><img src="/images/icons/zg_icon.jpg" /></td>
						<td class="hot_connect">
							<a href="${item.url} "  target="_blank">${item.title}</a>
						</td>
				</s:else>
			</s:else>
	      </tr>
     </s:iterator>
              
    </table>
