<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

<%-- content --%>
<div class="content_box">
	<%-- 좌상단의 탭 메뉴  --%>
	<ul class="tab js-tab tab_menu">
	    <li class="${empty searchVO.bStatus or searchVO.bStatus eq 'N' ? 'N' : ''}"><a href="javascript:void(0)" onclick="searchLog('N'); return false;">미승인</a></li>
	    <li class="${searchVO.schEtc01 eq 'nonWorktimeConnect' ? 'current' : ''}"><a href="javascript:void(0)" onclick="searchLog('nonWorktimeCon'); return false;">승인</a></li>
	    <li><a href="javascript:void(0)" onclick="searchLog('multipleConAttp'); return false;">강등글</a></li>
	    <li><a href="javascript:void(0)" onclick="searchLog('bannedIpConAttp'); return false;">영구 미승인</a></li>
	</ul>
	<%-- search  --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="hidden" id="seq" name="seq"/>
			<input type="hidden" id="bStatus" name="bStatus" value="${searchVO.bStatus}"/>
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

<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
	/* fncDate('searchStartDate','searchEndDate'); */	
	searchLog('${searchVO.bStatus}')
});
var searchLog=function(cat){
	switch(cat){
	case 'N':
		$("#bStatus").val('N');
		fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
		break;
	case 'nonWorktimeCon':
		$("#schEtc01").val('nonWorktimeCon');
		fncPageBoard('list','nonWorktimeConlist.do',pageIndexForCommonJs,'pageIndex');
		break;
	case 'multipleConAttp':
		$("#schEtc01").val('multipleConAttp');
		fncPageBoard('list','multipleConAttplist.do',pageIndexForCommonJs,'pageIndex');
		break;
	case 'bannedIpConAttp':
		$("#schEtc01").val('bannedIpConAttp');
		fncPageBoard('list','bannedIpConAttplist.do',pageIndexForCommonJs,'pageIndex');
		break;
	case 'loginFailed':
		$("#schEtc01").val('loginFailed');
		fncPageBoard('list','loginFailedlist.do',pageIndexForCommonJs,'pageIndex');
		break;
	default:
		$("#bStatus").val('N');
		fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
		break;
	}
	return false;
}
</script>