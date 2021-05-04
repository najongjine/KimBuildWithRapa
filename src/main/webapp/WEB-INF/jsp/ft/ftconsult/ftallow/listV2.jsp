<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

<style>

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
</style>
<%-- content --%>
<div class="content_box">
	<%-- 좌상단의 탭 메뉴  --%>
	<div class="tab">
	  <button class="tablinks ${empty searchVO.bStatus ? 'active':'' }" onclick="searchLog(this, ''); return false;">전체</button>
	  <button class="tablinks ${searchVO.bStatus eq 'N' ? 'active':'' }" onclick="searchLog(this, 'N'); return false;">미승인</button>
	  <button class="tablinks ${searchVO.bStatus eq 'O' ? 'active':'' }" onclick="searchLog(this, 'O'); return false;">승인</button>
	  <button class="tablinks ${searchVO.bStatus eq 'R' ? 'active':'' }" onclick="searchLog(this, 'R'); return false;">발료</button>
	</div>
	<br>
	<%-- search  --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="hidden" id="seq" name="seq"/>
			<input type="hidden" id="pageIndex" name="pageIndex"/>
			<input type="hidden" id="bStatus" name="bStatus" value="${searchVO.bStatus }"/>
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
var searchLog=function(evt,cat){
	var i, tabcontent, tablinks;
	tablinks = document.getElementsByClassName("tablinks");
	if(evt){
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" active", "");
		}  
	}
	$(evt).addClass('active');
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
	case 'D':
		$("#bStatus").val('D');
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