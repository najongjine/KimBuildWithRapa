<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<%-- content --%>
<div class="top_title clear">
	<h3 class="tit_page">주소록</h3>
</div>
<div class="content_box">
	<%-- search  --%>
	<ul class="tab js-tab tab_menu">
	    <li class="tabLiUser current"><a href="javascript:void(0)" onclick="tabMenu('user')">회원</a></li>
	    <li class="tabLiAdmin"><a href="javascript:void(0)" onclick="tabMenu('admin')">관리자</a></li>
	</ul>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<form:hidden path="pageIndex" id="pageIndex" />
			<input type="hidden" id="seq" name="seq">
			
			<%-- 유저인지, 관리자인지 SQL 단에서 구분할수 있게 해주는 변수. user, admin을 담는다 --%>
			<input type="hidden" id="schEtc05" name="schEtc05" value="${searchVO.schEtc05 }">
			<%-- 체크박스에서 선택한 데이터들을 strJson으로 담아놓을때 쓰이는 inputbox --%>
			<input type="hidden" name="col1" id="col1" value="${searchVO.col1}"/>
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit">검색구분</strong>
					<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="w100"  >  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="이름"/>
						<form:option value="2" label="이메일"/>
					</form:select>
					<form:input path="searchKeyword" id="searchUsrInputBox" class="text w40p" />
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btnSrchUsers">검색</button>
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
<%-- window.opener.col1Json == 부모창과 자식창(팝업) 사이에서 공유될 변수. 선택한 체크박스의 정보를 담는용도로 쓰인다. --%>
var col1Json=window.opener.col1Json;
<%-- 부모로부터 넘어온 strJson 데이터들을 inputbox에 셋팅하는 코드 --%>
$("#col1").val(window.opener.col1JsonStr);

fncPageBoard('addList','popList.do',$("#pageIndex").val());

$("#btnSrchUsers").click(function(){
	fncPageBoard('addList','popList.do','1');
});
$("#searchUsrInputBox").keydown(function(e){
	 if (e.keyCode == 13) { 
		fncPageBoard('addList','popList.do','1');
	 }
});
	
var tabMenu=function(usrKind){
	$("#schEtc05").val(usrKind);
	if(usrKind == 'user'){
		$(".tabLiUser").addClass("current");
		$(".tabLiAdmin").removeClass("current");
	}else{
		$(".tabLiAdmin").addClass("current");
		$(".tabLiUser").removeClass("current");
	}
	fncPageBoard('addList','popList.do','1');	
	return false;
}

</script>