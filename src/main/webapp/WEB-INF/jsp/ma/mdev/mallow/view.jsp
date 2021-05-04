<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<%
    pageContext.setAttribute("crcn", "\r\n"); 
    pageContext.setAttribute("br", "<br>");
%> 
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="atchFileId" id="atchFileId"/>
		<form:hidden path="bStatus" id="bStatus"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<!-- tbl -->
		<div class="tbl_wrap">
			<table class="tbl_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:35%;">
					<col style="width:15%;">
					<col style="width:35%;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td colspan="3">
							<c:out value="${alwpdrjVO.title }"/>
						</td>
					</tr> 
					<tr >
						<th scope="row"><strong>등록일</strong></th>
						<td colspan="3">${alwpdrjVO.rgstDt }</td>
					</tr>
					<tr>
						<th scope="row"><strong>현재상태</strong></th>
						
						<td colspan="3">
							<c:choose>
								<c:when test="${alwpdrjVO.bStatus eq 'N' }">신청</c:when>
								<c:when test="${alwpdrjVO.bStatus eq 'O' }">승인</c:when>
								<c:when test="${alwpdrjVO.bStatus eq 'R' }">반려</c:when>
								<c:when test="${alwpdrjVO.bStatus eq 'P' }">재신청</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>등록자</strong></th>
						<td colspan="3">
							${alwpdrjVO.name }
						</td>
					</tr> 
					<if test="${!alwpdrjVO.bStatus eq 'O' and !alwpdrjVO.bStatus eq 'N' }">
						<tr>
							<th scope="row"><strong>반려 사유</strong></th>
							<td colspan="3">
								<pre><c:out value="${alwpdrjVO.comment }"/></pre>
							</td>
						</tr> 
					</if>
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<pre><c:out value="${util:unEscape(alwpdrjVO.cont)}" escapeXml="false"/></pre>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${alwpdrjVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<c:choose>
			<c:when test="${searchVO.bStatus eq 'R' }">
				<a href="#" id="btn_to_pending" class="btn btn_mdl btn_save" >수정(재승인 요청)</a>
			</c:when>
			<c:otherwise>
				<a href="#" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
			</c:otherwise>
		</c:choose>
		<a href="#" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
	
	<br>
	<br>
	<div class="tbl_wrap">
		<table class="tbl_row_type01">
			<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
			<colgroup>
				<col style="width:15%;">
				<col style="width:35%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><strong>게시글 상태변경</strong></th>
					<td>
						<select id="bStatusChangeSelectBox" class="w100">
						  <option value="O" <c:if test="${alwpdrjVO.bStatus eq 'O'}">selected</c:if> >승인</option>
						  <option value="R" <c:if test="${alwpdrjVO.bStatus eq 'R'}">selected</c:if>>반려</option>
						</select>
					</td>
				</tr>
				<tr>
					<th scope="row"><strong>코멘트</strong></th>
					<td colspan="">
						<textarea name="comment" id="comment" class="txt_area w_100p" >${util:unEscape(alwpdrjVO.comment)}</textarea>
					</td> 
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn_area">
		<a href="#" id="btnChangeBstatus" class="btn btn_mdl btn_save" >상태변경</a>
	</div>	
	</form:form>
</div>
	
<script type="text/javaScript">
$(document).ready(function(){
	$(document).on('click','#btnChangeBstatus',function(){
		var cat=$("#bStatusChangeSelectBox").val();
		switch(cat){
		case 'O':
			if(!confirm("게시물을 승인 시키시겠습니까?")){
				return false;
			}
			$("#bStatus").val('O');
			fncPageBoard('update','allowProc.do');
			break;
		case 'R':
			if(!confirm("게시물을 발료 시키시겠습니까?")){
				return false;
			}
			$("#bStatus").val('R');
			fncPageBoard('update','rejectProc.do');
			break;
		}
        return false;
   });
	
	$("#btn_to_pending").on("click",function(){
		$("#bStatus").val('P');		
		fncPageBoard('update','updateForm.do');
		return false;
	})
	
});
</script>
