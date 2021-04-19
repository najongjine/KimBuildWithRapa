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
	<div class="search_area clear">
		<p class="tbl_left">총 <strong id="totalCount"></strong> 건</p>
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="hidden" id="seq" name="seq"/>
			<input type="hidden" id="pageIndex" name="pageIndex"/>
			<fieldset class="search_form">
				<legend>목록 검색</legend>
					<form:select path="searchCondition" id="searchCondition" title="구분 선택" >  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="제목"/>
						<form:option value="2" label="내용"/>
					</form:select>
					<form:input path="searchKeyword" id="searchKeyword" class="text" />
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search"><i class="fa fa-search"></i></button>
					</span>
			</fieldset>
		</form:form>
	</div>
	<%--// search  --%>
	<div class="tbl">
	</div>
</div>