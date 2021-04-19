<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
	fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
});
</script>
<%-- content --%>
<div class="content_box">
	<%-- search  --%>
	<div class="search_box">
		<p class="tbl_left">총 <strong id="totalCount"></strong> 건</p>
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="hidden" id="seq" name="seq"/>
			<input type="hidden" id="pageIndex" name="pageIndex"/>
		</form:form>
	</div>
	<%--// search  --%>
	<div class="tbl">
	</div>
</div>
