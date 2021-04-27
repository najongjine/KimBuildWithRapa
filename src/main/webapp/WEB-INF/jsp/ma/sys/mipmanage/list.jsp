<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
	fncDate('searchStartDate','searchEndDate');	
	fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
});
var resetTime=function(){
	$("#schEtc02").val('----');
	$("#schEtc03").val('----');
	return false;
}
</script>
<%-- content --%>
<div class="content_box">
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
						<form:option value="1" label="IP"/>
					</form:select>
					<form:select path="schCategoryCd" id="schCategoryCd" title="이용자 선택" cssClass="w100">  
						<form:option value="0" label="전체"/>
						<form:option value="Y" label="허용"/>
						<form:option value="N" label="비허용"/>
					</form:select>
					<form:input path="searchKeyword" id="searchKeyword" class="text w50p" />
					
					<strong class="tit hideBtn2">기간</strong>
					<span class="calendar_input w150 hideBtn2" >
						<input id="searchStartDate" name="searchStartDate" class="text w80p" readonly="readonly" type="text"/>
					</span>
					<span class="input_wave hideBtn2">~</span>
					<span class="calendar_input w150 hideBtn2" >
						<input id="searchEndDate" name="searchEndDate" class="text w80p" readonly="readonly" type="text"/>
					</span>
					
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

