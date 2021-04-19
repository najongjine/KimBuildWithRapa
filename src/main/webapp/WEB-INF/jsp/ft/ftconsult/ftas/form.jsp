<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$("#btn_submit").bind("click", function(){
		
		if(!$("#title").val().trim()) {
			alert("제목을 입력해주세요");
			$("#title").focus();
			return false;
		}
			
		if(!$("#cont").val().trim()) {
			alert("내용을 입력해주세요");
			return false;
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
	<form:form commandName="boardVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
		<form:hidden path="subSeq" id="subSeq"/>
		<form:hidden path="breplySeq" id="breplySeq"/>
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
						<c:choose>
							<c:when test="${procType eq 'insert' or procType eq 'update'}">
								<th scope="row"><strong class="th_tit">제목</strong></th>
								<td colspan="3">
									<input type="text" name="title" id="title" class="text w100p"  required="required"  maxlength="50" value="${util:unEscape(boardVO.title) }" />
								</td>
							</c:when>
							<c:otherwise>
								<td colspan="3"><input type="hidden" name="title" id="title" class="text w100p"  required="required"  maxlength="50" value="notitle" /><td>
							</c:otherwise>
						</c:choose>
						
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="cont" id="cont" class="txt_area w_100p" >${util:unEscape(boardVO.cont)}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${boardVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr> 
				</tbody>
			</table>
		</div>
		<div class="tbl_btns c">
			<a href="#" class="btn btn_middle btn_purple" id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<c:choose>
				<c:when test="${searchVO.procType eq 'update' or searchVO.procType eq 'insertReply' or searchVO.procType eq 'updateReply'}">
					<a href="#" class="btn btn_middle btn_gray" id="btn_returnView">취소</a>
				</c:when>
				<c:otherwise>
					<a href="#" class="btn btn_middle btn_gray" id="btn_list">취소</a>
				</c:otherwise>
			</c:choose>
		</div>
	</form:form>
</div>