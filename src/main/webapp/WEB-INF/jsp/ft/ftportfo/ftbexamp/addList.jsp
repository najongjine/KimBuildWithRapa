<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javaScript">
$(document).ready(function(){
	$("#totalCount").text('${paginationInfo.totalRecordCount}')
});
</script>
<div class="content_box">
	<ul class="thum_list">
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<li <c:if test="${status.count % 3 == 2}">class="middle"</c:if> >
				<a href="#" onclick="fncPageBoard('view','view.do','${result.seq}','seq')">
					<img src="/atch/getImage.do?atchFileId=${result.atchFileId}&fileSn=${result.minFileSn}" alt=""
					  onerror="this.src='/publish/ma/images/no_img.png'" width="200" height="180">
					<h5 class="thum_tit">${result.title}</h5>
					<p>${result.rgstDt}</p>
				</a>
			</li>
		</c:forEach>
	</ul>
</div>
<%-- //tbl end --%>
<%-- paging start --%>
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>
	<div class="btn_right">
		<a href="#" class="btn btn_middle btn_purple" onclick="checkLoggedIn(); return false;">등록</a>
	</div>
</div>
<%-- //paging end--%>