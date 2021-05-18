<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<%-- content --%>
<div class="content_box">
	<%-- search  --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post" onsubmit="return false;">
			<input type="hidden" id="seq" name="seq"/>
			<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex }"/>
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit">메일수신동의여부</strong>
					<select id="schEtc01" name="schEtc01" class="w100">
						<option value="">전체</option>
						<option value="Y" ${searchVO.schEtc01 eq 'Y' ? 'selected' : '' }>동의</option>
						<option value="N" ${searchVO.schEtc01 eq 'N' ? 'selected' : '' }>비동의</option>
					</select>
					<strong class="tit">검색구분</strong>
					<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="w100"  >  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="이름"/>
						<form:option value="2" label="회사명"/>
						<form:option value="3" label="아이디"/>
						<form:option value="4" label="휴대폰"/>
						<form:option value="5" label="이메일"/>
					</form:select>
					<form:input path="searchKeyword" id="searchKeyword" class="text w20p" />
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
				</div>
			</fieldset>
		</form:form>
	</div>
	<%--// search  --%>
	<div class="tbl">
	</div>
</div>
<script type="text/javaScript">
$(document).ready(function(){
	fncPageBoard('addList','addList.do',$("#pageIndex").val());
});
$("#schEtc01").change(function(){
	fncPageBoard('addList','addList.do',1);
});
</script>