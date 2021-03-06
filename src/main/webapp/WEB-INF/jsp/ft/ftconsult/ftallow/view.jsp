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
		<form:input path="bStatus" id="bStatus"/>
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
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${alwpdrjVO.name }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${alwpdrjVO.rgstDt }</td>
					</tr> 
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
		
	<div class="tbl_btns">
		<c:choose>
			<c:when test="${alwpdrjVO.bStatus eq 'R' and alwpdrjVO.rgstId eq loginFtSeq}">
				<a href="#" id="btn_to_pending" class="btn btn_middle btn_purple" >수정(재승인 요청)</a>
			</c:when>
			<c:otherwise>
				<c:if test="${alwpdrjVO.rgstId eq loginFtSeq }">
					<a href="#" id="btn_update" class="btn btn_middle btn_purple" >수정</a>
				</c:if>
			</c:otherwise>
		</c:choose>
		<a href="#" id="btn_list" class="btn btn_middle btn_gray" >목록</a>
	</div>	
	</form:form>
</div>

<script type="text/javaScript">
$(document).ready(function(){
	$("#btn_allow").on("click",function(){
		$("#bStatus").val('O');		
		fncPageBoard('update','allowProc.do');
		return false;
	})
	
	$("#btn_reject").on("click",function(){
		$("#bStatus").val('R');		
		fncPageBoard('update','rejectProc.do');
		return false;
	})
	
	$("#btn_to_pending").on("click",function(){
		$("#bStatus").val('P');		
		fncPageBoard('update','updateForm.do');
		return false;
	})
	
	$("#btn_pdisallow").on("click",function(){
		$("#bStatus").val('D');		
		fncPageBoard('update','pdisallowProc.do');
		return false;
	})
});
</script>
