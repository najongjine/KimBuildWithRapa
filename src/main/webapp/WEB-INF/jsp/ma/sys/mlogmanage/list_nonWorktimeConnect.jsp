<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javaScript">
/*자바스크립트를 별도의 파일로 분리하면 model 에 담겨온 변수 참조가 안되서 해주는 추가작업*/
var pageIndexForCommonJs='${searchVO.pageIndex}' + "";
</script>
<script type="text/javascript" src="/publish/ma/sys/mlogmanage/common.js"></script>
<%-- content --%>
<div class="content_box">
	<%-- 좌상단의 탭 메뉴  --%>
	<ul class="tab js-tab tab_menu">
	    <li><a href="javascript:void(0)" onclick="searchLog(0); return false;">전체</a></li>
	    <li class="current"><a href="javascript:void(0)" onclick="searchLog(1); return false;">업무시간 외 접속</a></li>
	    <li><a href="javascript:void(0)" onclick="searchLog(2); return false;">과다 접속자관리</a></li>
	    <li><a href="javascript:void(0)" onclick="searchLog(3); return false;">접속 지점이상</a></li>
	    <li><a href="javascript:void(0)" onclick="searchLog(4); return false;">로그인 이상관리</a></li>
	</ul>
	
	<%-- search  --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="hidden" id="seq" name="seq"/>
			<input type="hidden" id="pageIndex" name="pageIndex"/>
			<input type="hidden" id="schEtc01" name="schEtc01" value="${searchVO.schEtc01}"/>
			<fieldset>
				<legend>검색</legend>
				<div id="searchDefault" class="search_basic">
					<strong class="tit">검색구분</strong>
					<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="w100" >  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="ID"/>
						<form:option value="2" label="URL"/>
						<form:option value="3" label="IP"/>
					</form:select>
					<form:input path="searchKeyword" id="searchKeyword" class="text w50p" />
					
					<strong class="tit hideBtn2">기간</strong>
					<span class="calendar_input w150 hideBtn2" >
						<input id="searchStartDate" name="searchStartDate" class="text w80p" readonly="readonly" type="text" value="----"/>
					</span>
					<span class="input_wave hideBtn2">~</span>
					<span class="calendar_input w150 hideBtn2" >
						<input id="searchEndDate" name="searchEndDate" class="text w80p" readonly="readonly" type="text" value="----"/>
					</span>
					<div style="float:right;">
						<strong class="tit hideBtn2">시간</strong>
						<span class="tit hideBtn2" >
							<input id="schEtc02" name="schEtc02" class="text w100p" type="time" value="----"/>
						</span>
						<span class="input_wave hideBtn2">~</span>
						<span class="tit hideBtn2" >
							<input id="schEtc03" name="schEtc03" class="text w100p" type="time" value="----"/>
							<span onclick="resetTime(); return false;"><a href="#">x</a></span>
						</span>
						
					</div>
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

