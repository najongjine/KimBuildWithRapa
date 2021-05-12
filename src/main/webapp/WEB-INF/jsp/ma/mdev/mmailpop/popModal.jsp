<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<div class="pop_header">
   <h2>
   		유저 주소록
   </h2>
   <a href="javascript:void(0);" onclick="view_hide(1);return false" class="pop_close"></a>
</div>
<%-- 현재 페이지를 모달 창으로 띄우려면 pop_content,pop_scl div 는 무조건 모든 컨텐츠를 감싸 줘야한다 --%>
<div class="pop_content">
	<%-- search  --%>
	<ul class="tab js-tab tab_menu">
	    <li class="tabLiUser current"><a href="javascript:void(0)" onclick="tabMenu('user')">회원</a></li>
	    <li class="tabLiAdmin"><a href="javascript:void(0)" onclick="tabMenu('admin')">관리자</a></li>
	</ul>
	<div class="search_box">
		<form commandName="modalSearchVO" name="userListFrm" id="userListFrm" method="post"  onsubmit="return false;">
			<input type="hidden" name="pageIndex" id="userPageIndex" value="${modalSearchVO.pageIndex }"/>
			<input type="hidden" name="schEtc05" id="userschEtc05" value="${modalSearchVO.schEtc05 }"/>
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit">검색구분</strong>
					<select name="searchCondition" id="userSrchCondition" title="구분 선택" class="w100"  >  
						<option value="0" label="전체"/>
						<option value="1" label="이름"/>
						<option value="2" label="이메일"/>
					</select>
					<input name="searchKeyword" id="searchUsrInputBox" class="text w40p" />
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btnSrchUsers">검색</button>
					</span>
				</div>
			</fieldset>
		</form>
	</div>
	<%--// search  --%>
	<div class="pop_scl">
		<div class="tbl">
		</div>
	</div>
</div>

<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javaScript">

fncPageBoard('addList','popListModal.do','1');

$("#btnSrchUsers").click(function(){
	//fncPageBoard('addList','popListModal.do','1');
	getUserList('','','1');
});
$("#searchUsrInputBox").keydown(function(e){
	 if (e.keyCode == 13) { 
		fncPageBoard('addList','popListModal.do','1');
	 }
});

var getUserList=function(a,b,pageNo){
	$("#userPageIndex").val(pageNo);
	$.ajax({
		type:"POST",
		url:"popListModal.do",
		data:$("#userListFrm").serialize(),
		dataType:"html",
		success:function(data){
			$(".tbl").html(data);
		}
	})
}
	
var tabMenu=function(usrKind){
	$("#userschEtc05").val(usrKind);
	if(usrKind == 'user'){
		$(".tabLiUser").addClass("current");
		$(".tabLiAdmin").removeClass("current");
	}else{
		$(".tabLiAdmin").addClass("current");
		$(".tabLiUser").removeClass("current");
	}
	getUserList('','','1');
	return false;
}

</script>