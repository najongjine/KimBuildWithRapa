<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
$(document).ready(function(){	
	fncDate('staDate','endDate');
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
		if($("#notiYn_Y").is(":checked") && (!$("#staDate").val() || !$("#endDate").val()) ){
			alert("전시여부를 체크 하셨으면 기간을 정확히 입력해주세요");
			return false
		}
		if(!$("#popLeft").val() || !$("#popTop").val() || !$("#popWidth").val()){
			alert("팝업의 좌우 넓이를 정확히 입력해주세요");
			return false
		}
		fncPageBoard('write','${searchVO.procType}Proc.do');
		return false;
	});
	
	$("#btn_returnView").click(function(){
		$("#boardSeq").val($("#boardGrpSeq").val());
		fncPageBoard('view','view.do');
	});
});
</script>
<div class="content_box">
	<form:form commandName="popupVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="atchFileId" id="atchFileId"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
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
							<input type="text" name="title" id="title" class="text w100p"  required="required"  maxlength="50" value="${util:unEscape(popupVO.title) }" />
							<form:errors path="title" cssClass="error" cssStyle="color:#ff0000" /> 
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">전시여부</strong></th>
						<td colspan="3">
							<input type="radio" name="notiYn" id="notiYn_Y" value="Y"
							 <c:if test="${empty popupVO.notiYn or popupVO.notiYn eq 'Y'}">checked="checked"</c:if> />
							<label for="notiYn_Y">전시</label>
							<input type="radio" name="notiYn" id="notiYn_N" value="N"
							 <c:if test="${popupVO.notiYn eq 'N'}">checked="checked"</c:if> />
							<label for="notiYn_N">비전시</label>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">공지기간</strong></th>
						<td colspan="3" class="calendar_input">
							<form:input path="staDate" id="staDate" cssClass="text w100" readonly="true"/>
							~
							<form:input path="endDate" id="endDate" cssClass="text w100" readonly="true"/>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">팝업위치</strong></th>
						<td>
							<span class="popup_adm_input"><span class="adm_input_subj">Left : </span><input id="popLeft" name="popLeft" class="text w100p numOnly" required="true" type="text" value="${popupVO.popLeft}" maxlength="4"/><span class="adm_input_px">px</span></span>
							<span class="popup_adm_input"><span class="adm_input_subj">Top : </span><input id="popTop" name="popTop" class="text w100p numOnly" required="true" type="text" value="${popupVO.popTop}" maxlength="4"/><span class="adm_input_px">px</span></span>
						</td>
						<th scope="row"><strong class="th_tit">팝업크기</strong></th>
						<td>
							<span class="popup_adm_input"><span class="adm_input_subj">Width :</span><input id="popWidth" name="popWidth" class="text w100p numOnly" required="true" type="text" value="${popupVO.popWidth}" maxlength="4"/><span class="adm_input_px">px</span></span>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="cont" id="cont" class="txt_area w_100p" >${util:unEscape(popupVO.cont)}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부 이미지</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${popupVO.atchFileId }&fileCnt=1&atchFileIdNm=atchFileId&updateType=imageUpload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
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