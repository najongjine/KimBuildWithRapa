<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

<%-- content --%>
<div class="content_box">
	<%-- 좌상단의 탭 메뉴  --%>
	<ul class="tab js-tab tab_menu">
	    <li><a href="javascript:void(0)" onclick="searchLog('all'); return false;">전체</a></li>
	    <li><a href="javascript:void(0)" onclick="searchLog('nonWorktimeConnect'); return false;">업무시간 외 접속</a></li>
	    <li ><a href="#" onclick="searchLog('multipleConAttemp'); return false;">과다 접속자관리</a></li>
	    <li><a href="javascript:void(0)" onclick="searchLog('bannedIpConAttemp'); return false;">접속 지점이상</a></li>
	    <li class="current"><a href="javascript:void(0)" onclick="searchLog('loginFailed'); return false;">로그인 이상관리</a></li>
	</ul>
	
	<%-- search  --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="hidden" id="seq" name="seq"/>
			<input type="hidden" id="pageIndex" name="pageIndex"/>
			<input type="hidden" id="schEtc01" name="schEtc01" value="${searchVO.schEtc01}"/>
			<input type="hidden" id="resultListSeqList" value="${searchVO.resultListSeqList}"/>
			<fieldset>
				<legend>검색</legend>
				<div id="searchDefault" class="search_basic">
					<table>
						<colgroup>
							<col >
							<col style="width:15%">
							<col style="width:30%">
							<col style="width:5%">
						</colgroup>
						<tbody>
							<tr>
								<td>
									<strong class="tit">검색구분</strong>
									<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="w100" >  
										<form:option value="0" label="전체"/>
										<form:option value="1" label="ID"/>
										<form:option value="3" label="IP"/>
									</form:select>
									<form:input path="searchKeyword" id="searchKeyword" class="text w50p" />
								</td>
								<td>
									<strong class="tit">실패횟수</strong>
									<input type="number" name="schEtc04" id="schEtc04" class="text w50p" />
								</td>
								<td>
									<strong class="tit">기간</strong>
									<span class="calendar_input " >
										<input id="searchStartDate" name="searchStartDate" class="text w100" readonly="readonly" type="text"/>
									</span>
									<span class="">~</span>
									<span class="calendar_input " >
										<input id="searchEndDate" name="searchEndDate" class="text w100" readonly="readonly" type="text"/>
									</span>
									
								</td>
								<td>
									<span class="search_btns">
										<button type="button" class="btn btn_search" id="btn_search">검색</button>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</fieldset>
		</form:form>
	</div>
	<%--// search  --%>
	<div class="tbl">
	</div>
</div>

<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/publish/ma/sys/mlogmanage/shareScript.js"></script>
<script type="text/javaScript">
var pageIndexForCommonJs='${searchVO.pageIndex}' + "";
</script>