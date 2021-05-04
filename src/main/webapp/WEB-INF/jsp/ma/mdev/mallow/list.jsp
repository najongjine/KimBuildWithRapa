<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

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
					<form:select path="bStatus" id="bStatusSelectBox" title="게시글 상태 선택" cssClass="w100"  onchange="searchLog();">  
						<form:option value="" label="전체상태"/>
						<form:option value="D" label="신청"/>
						<form:option value="O" label="승인"/>
						<form:option value="P" label="재승인 요청"/>
						<form:option value="R" label="반려"/>
					</form:select>
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
var searchLog=function(){
	var selectBox = document.getElementById("bStatusSelectBox");
    var cat = selectBox.options[selectBox.selectedIndex].value;
    
	switch(cat){
	case 'N':
		$("#bStatus").val('N');
		fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
		break;
	case 'O':
		$("#bStatus").val('O');
		fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
		break;
	case 'R':
		$("#bStatus").val('R');
		fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
		break;
	case 'P':
		$("#bStatus").val('P');
		fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
		break;
	default:
		$("#bStatus").val('');
		fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
		break;
	}
	return false;
}
</script>