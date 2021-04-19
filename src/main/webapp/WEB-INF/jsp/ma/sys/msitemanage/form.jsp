<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
$(document).ready(function(){	
	
	<%-- 에디터 --%>
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "cont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
	$("#btn_submit").bind("click", function(){
		
		if($("#title").val() == "" || $("#title").val() == null) {
			alert("제목을 입력해주세요");
			$("#title").focus();
			return false;
		}
			oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
			
		if($("#cont").val()=='<p>&nbsp;</p>') {
			alert("내용을 입력해주세요");
			oEditors.getById["cont"].exec("FOCUS"); /* 에디터 */
			return false;
		}		
		
		fncPageBoard('submit','${searchVO.procType}Proc.do');
		return false;
	});
	
	$("#btn_returnView").click(function(){
		$("#boardSeq").val($("#boardGrpSeq").val());
		fncPageBoard('view','view.do');
	});
});
</script>
<div class="content_box">
	<form:form commandName="sampleVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="atchFileId" id="atchFileId"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		
		<!-- 테이블 상단에 탭처럼 섹션을 고를수 있게 해주는 메뉴 -->
		<ul class="tab js-tab tab_menu">
		    <li class="btnP"><a href="javascript:void(0)" onclick="tabMenu(1)">사이트 관리(상단 form 종류 고르는 탭)</a></li>
		    <li class="btnC"><a href="javascript:void(0)" onclick="tabMenu(2)">시스템 운영(상단 form 종류 고르는 탭)</a></li>
		</ul>
		
		<div class="tbl_wrap">
			<table class="tbl_row_type01"> 
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:20%;">
					<col style="width:30%;">
					<col style="width:20%;">
					<col style="width:30%;">
				</colgroup> 
				<tbody>
					<tr>
						<th scope="row"><strong class="th_tit">제목</strong></th>
						<td colspan="3">
							<input type="text" name="title" id="title" class="text w100p"  required="required"  maxlength="50" value="${util:unEscape(sampleVO.title) }" />
							<form:errors path="title" cssClass="error" cssStyle="color:#ff0000" /> 
						</td>
					</tr>
					
					<!-- <select> 요소 -->
					<tr>
						<!-- 셀렉트 드롭박스 제목 -->
						<th scope="row"><strong class="">select 요소</strong></th>
						<td>
							<select name="city">
							  <option value="option1">서울</option>
							  <option value="option2">대전</option>
							  <option value="option3">대구</option>
							  <option value="option4">부산</option>
							</select>
						</td>
					</tr>
					
					<!-- 여러 체크박스 . controller 에서는 단일 프로퍼티일 경우 , 표로 묶어서 받고, List을 경우 List로 받음-->
					<tr>
						<th scope="row"><strong class="">소속종류(체크박스)</strong></th>
						<td>
							<input type="checkbox" name="belongkind" value="belong1" id="belong1">
							<label id="belong1">belong1</label>
							<input type="checkbox" name="belongkind" value="belong2" id="belong2">
							<label id="belong2">belong2</label>
							<input type="checkbox" name="belongkind" value="belong3" id="belong3">
							<label id="belong3">belong3</label>
						</td>
					</tr>
					
					<!-- 라디오 버튼 -->
					<tr>
						
						<th scope="row"><strong class="">라디오버튼</strong></th>
						<td>
							<input type="radio" name="q1" value="option1" id="option1" />
							<label for="option1">옵션1</label>
							<input type="radio" name="q1" value="option2" id="option2"/>
							<label for="option2">옵션2</label>
							<input type="radio" name="q1" value="option3" id="option3"/>
							<label for="option3">옵션3</label>
							<input type=”radio”>
						</td>
					</tr>
					
					<!-- range slider -->
					<tr>
						<th scope="row"><strong class="">rage slider</strong></th>
						<td>
							<input id="scale" type="range" name="scale" min=0 max=100 step=10 value=20>
						</td>
					</tr>
					
					<!-- datalist 요소 -->
					<tr>
						<th scope="row"><strong class="">datalist 요소</strong></th>
						<td>
							<input type="text" list="cities" id="city" name="city">
							  <datalist id="cities">
							  <option value="서울"></option>
							  <option value="대전"></option>
							  <option value="대구"></option>
							  <option value="부산"></option>
							</datalist>
						</td>
					</tr>
					
					<!-- 파일 선택 - file. 파일 프로퍼티를 String으로 할 경우 파일 이름만 받음
						재대로 받으려면 private MultipartFile uploadFile; || private List<MultipartFile> file; 로 받아야함 -->
					<tr>
						<th scope="row"><strong class="">파일 선택 - file</strong></th>
						<td>
							<input type="file" name="imageFile" accept="image/*">
						</td>
					</tr>
					
					<!-- 색상 입력(color). 선택된 색상은 #을 제외한 6자리의 16진수 색상값으로 전송된다.
						브라우저 지원 여부에 따라 색상을 선택하기 위한 도구를 보여준다. 
						프로퍼티를 String 으로 할시 ## color : #ff0000-->
					<tr>
						<th scope="row"><strong class="">색상 입력(color)</strong></th>
						<td>
							<input type="color" name="color" value="#FF0000">
						</td>
					</tr>
					
					<!-- 날짜 입력(date) -->
					<tr>
						<th scope="row"><strong class="">날짜 입력(date)</strong></th>
						<td>
							<input type="date" name="day1">
						</td>
					</tr>
					
					<!-- 시간 입력(time) ## time : 16:18 -->
					<tr>
						<th scope="row"><strong class="">날짜 입력(date)</strong></th>
						<td>
							<input type="time" name="time">
						</td>
					</tr>
					
					<!-- 날짜와 시간 입력(datetime-local) ## datetime : 2021-04-19T16:18 -->
					<tr>
						<th scope="row"><strong class="">날짜와 시간 입력(datetime-local)</strong></th>
						<td>
							<input type="datetime-local" name="datetime">
						</td>
					</tr>
					
					<!-- 연도와 월 입력(month) ## month : 2021-04 -->
					<tr>
						<th scope="row"><strong class="">연도와 월 입력(month)</strong></th>
						<td>
							<input type="month" name="month">
						</td>
					</tr>
					
					<!-- 연도와 주 입력(week) ## week : 2021-W16 -->
					<tr>
						<th scope="row"><strong class="">연도와 주 입력(week)</strong></th>
						<td>
							<input type="week" name="week">
						</td>
					</tr>
					
					<!-- 이메일 입력(email) -->
					<tr>
						<th scope="row"><strong class="">이메일 입력(email)</strong></th>
						<td>
							<input type="email" name="email">
						</td>
					</tr>
					
					<!-- URL 주소 입력(url) -->
					<tr>
						<th scope="row"><strong class="">URL 주소 입력(url)</strong></th>
						<td>
							<input type="url" name="url">
						</td>
					</tr>
					
					<!-- 전화번호 입력(tel) -->
					<tr>
						<th scope="row"><strong class="">전화번호 입력(tel)</strong></th>
						<td>
							<input type="tel" name="tel">
						</td>
					</tr>
					
					<!-- 검색어 입력(search) 검색어를 바로 삭제할 수 있는 엑스(X) 표시가 생기는 점이다.-->
					<tr>
						<th scope="row"><strong class="">검색어 입력(search)</strong></th>
						<td>
							<input type="search" name="keyword">
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="cont" id="cont" class="txt_area w_100p" >${util:unEscape(sampleVO.cont)}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${sampleVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr> 
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<a href="#" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<c:if test="${searchVO.procType ==  'update'}">
				<a href="#" class="btn btn_mdl btn_cancel" id="btn_returnView">취소</a>
			</c:if>
			<c:if test="${searchVO.procType ne  'update'}">
				<a href="#" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
			</c:if>
		</div>
	</form:form>
</div>