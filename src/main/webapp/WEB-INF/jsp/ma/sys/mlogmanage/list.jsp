<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
	/* fncDate('searchStartDate','searchEndDate'); */	
	fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
});
var searchLog=function(cat){
	switch(cat){
	case 0:
		fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
		break;
	case 1:
		fncPageBoard('addList','addList.do?schEtc01=nonWorktimeConnect','${searchVO.pageIndex}');
		break;
	case 2:
		fncPageBoard('addList','addList.do?schEtc01=multipleConAttemp','${searchVO.pageIndex}');
		break;
	case 3:
		fncPageBoard('addList','addList.do?schEtc01=bannedIpConAttemp','${searchVO.pageIndex}');
		break;
	case 4:
		fncPageBoard('addList','addList.do?schEtc01=loginFailed','${searchVO.pageIndex}');
		break;
	}
	
}
</script>
<%-- content --%>
<div class="content_box">
	<%-- 좌상단의 탭 메뉴  --%>
	<ul class="tab js-tab tab_menu">
	    <li class="current"><a href="javascript:void(0)" onclick="searchLog(0)">전체</a></li>
	    <li><a href="javascript:void(0)" onclick="searchLog(1)">업무시간 외 접속</a></li>
	    <li><a href="javascript:void(0)" onclick="searchLog(2)">과다 접속자관리</a></li>
	    <li><a href="javascript:void(0)" onclick="searchLog(3)">접속 지점이상</a></li>
	    <li><a href="javascript:void(0)" onclick="searchLog(4)">로그인 이상관리</a></li>
	</ul>
	
	<%-- search  --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="hidden" id="seq" name="seq"/>
			<input type="hidden" id="pageIndex" name="pageIndex"/>
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit">검색구분</strong>
					<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="w100"  >  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="제목"/>
						<form:option value="2" label="내용"/>
					</form:select>
					<form:input path="searchKeyword" id="searchKeyword" class="text w50p" />
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

