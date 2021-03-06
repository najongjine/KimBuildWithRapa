<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

<%-- content --%>
<div class="content_box">
	<%-- 좌상단의 탭 메뉴  --%>
	<ul class="tab js-tab tab_menu">
	    <li class="${empty searchVO.schEtc01 ? 'current' : ''}"><a href="javascript:void(0)" onclick="searchLog('all'); return false;">전체</a></li>
	    <li class="${searchVO.schEtc01 eq 'nonWorktimeConnect' ? 'current' : ''}"><a href="javascript:void(0)" onclick="searchLog('nonWorktimeCon'); return false;">업무시간 외 접속</a></li>
	    <li><a href="javascript:void(0)" onclick="searchLog('multipleConAttp'); return false;">과다 접속자관리</a></li>
	    <li><a href="javascript:void(0)" onclick="searchLog('bannedIpConAttp'); return false;">접속 지점이상</a></li>
	    <li><a href="javascript:void(0)" onclick="searchLog('loginFailed'); return false;">로그인 이상관리</a></li>
	</ul>
	
	<%-- search  --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="hidden" id="seq" name="seq"/>
			<input type="hidden" id="pageIndex" name="pageIndex"/>
			<input type="hidden" id="customPageUnit" name="customPageUnit"/>
			<input type="hidden" id="schEtc01" name="schEtc01" value="${searchVO.schEtc01}"/>
			<input type="hidden" name="resultListSeqList" id="resultListSeqList" value="${searchVO.resultListSeqList}"/>
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit">검색구분</strong>
					<form:select path="schCategoryCd" id="schCategoryCd" title="이용자 선택" cssClass="w100">  
						<form:option value="0" label="전체이용자"/>
						<form:option value="1" label="관리자"/>
						<form:option value="2" label="유저"/>
					</form:select>
					<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="w100" >  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="ID"/>
						<form:option value="2" label="URL"/>
						<form:option value="3" label="IP"/>
					</form:select>
					<form:input path="searchKeyword" id="searchKeyword" class="text w50p" />
					
					<strong class="tit hideBtn2">기간</strong>
					<span class="calendar_input w150 hideBtn2" >
						<input id="searchStartDate" name="searchStartDate" class="text w80p" readonly="readonly" type="text" value="${searchVO.searchStartDate}"/>
					</span>
					<span class="input_wave hideBtn2">~</span>
					<span class="calendar_input w150 hideBtn2" >
						<input id="searchEndDate" name="searchEndDate" class="text w80p" readonly="readonly" type="text" value="${searchVO.searchStartDate}"/>
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

<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javaScript">
/*자바스크립트를 별도의 파일로 분리하면 model 에 담겨온 변수 참조가 안되서 해주는 추가작업*/
var pageIndexForCommonJs='${searchVO.pageIndex}' + "";
$(document).ready(function(){
	$(document).on('change','#pageUnitSelect',function(){
        var pageUnitSelectValue=this.value;
        $("#customPageUnit").val(pageUnitSelectValue)
        fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
        return false;
   });
});
</script>
<script type="text/javascript" src="/publish/ma/sys/mlogmanage/shareScript.js"></script>