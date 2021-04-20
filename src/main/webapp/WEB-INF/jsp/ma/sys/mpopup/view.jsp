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
						<th scope="row"><strong class="th_tit">제목</strong></th>
						<td colspan="3">
							<c:out value="${util:unEscape(popupVO.title) }"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">전시여부</strong></th>
						<td colspan="3">
							<c:choose>
								<c:when test="${popupVO.notiYn eq 'Y'}">전시</c:when>
								<c:otherwise>비전시</c:otherwise>
							</c:choose>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">공지기간</strong></th>
						<td colspan="3" class="calendar_input">
							${popupVO.staDate}
							~
							${popupVO.endDate}
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">팝업위치</strong></th>
						<td>
							<span class="popup_adm_input"><span class="adm_input_subj">Left : </span>${popupVO.popLeft}px</span></span>
							<span class="popup_adm_input"><span class="adm_input_subj">Top : </span>${popupVO.popTop}px</span></span>
						</td>
						<th scope="row"><strong class="th_tit">팝업크기</strong></th>
						<td>
							<span class="popup_adm_input"><span class="adm_input_subj">Width :</span>${popupVO.popWidth}px</span></span>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${popupVO.name }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${popupVO.rgstDt }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<pre><c:out value="${util:unEscape(popupVO.cont)}" escapeXml="false"/></pre>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${popupVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<a href="#" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="#" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<a href="#" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
	</form:form>
</div>
