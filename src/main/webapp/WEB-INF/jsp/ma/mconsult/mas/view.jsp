<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<%
    pageContext.setAttribute("crcn", "\r\n"); 
    pageContext.setAttribute("br", "<br>");
%> 
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
	$("#btn_insert_reply").on("click",function(){
		fncPageBoard('write','insertReplyForm.do');
		return false
	})
	$("#btn_update_reply").on("click",function(){
		fncPageBoard('update','updateReplyForm.do');
		return false
	})
	$("#btn_del_reply").on("click",function(){
		fncPageBoard('del','deleteReplyProc.do');
		return false
	})
});
</script>
<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
		<form:hidden path="breplySeq" id="breplySeq"/>
		<form:hidden path="subSeq" id="subSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="atchFileId" id="atchFileId"/>
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
		                <th scope="row"><strong class="">제목</strong></th>
		                <td colspan="3"><c:out value="${boardVO.title}"/></td>
		            </tr>
					<tr>
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${boardVO.name }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${boardVO.rgstDt }</td>
					</tr> 
					
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<pre><c:out value="${util:unEscape(boardVO.cont)}" escapeXml="false"/></pre>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${boardVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<c:if test="${empty replyVO }">
			<a href="#" id="btn_insert_reply" class="btn btn_mdl btn_rewrite" >답글등록</a>
		</c:if> 
		<a href="#" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="#" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<c:if test="${empty replyVO }">
			<a href="#" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
		</c:if>
	</div>	
	
	<c:if test="${not empty replyVO}">
		<br>
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
							${replyVO.name }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${replyVO.rgstDt }</td>
					</tr> 
					
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<pre><c:out value="${util:unEscape(replyVO.cont)}" escapeXml="false"/></pre>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileId2Frame" id="atchFileId2Frame" src="/atch/fileUpload.do?atchFileId=${replyVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId2&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<a href="#" id="btn_update_reply" class="btn btn_mdl btn_rewrite" >수정</a> 
			<a href="#" id="btn_del_reply" class="btn btn_mdl btn_del" >삭제</a>
			<a href="#" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
		</div>	
	</c:if>
	</form:form>
</div>