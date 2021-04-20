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
						<th scope="row"><strong>제목</strong></th>
						<td>
							<c:out value="${forumInputVO.title }"/>
						</td>
					</tr> 
					<tr>
						<th scope="row"><strong>체크한 아이템 목록</strong></th>
						<td>
							<c:forEach var="result" items="${forumInputVO.checkBoxList }" varStatus="status">
								<c:out value="${result.checkboxContent}"/>
								<c:if test="${!status.last}">, </c:if>
							</c:forEach>
						</td>
					</tr> 
					<tr>
						<th scope="row"><strong>이메일</strong></th>
						<td>
							<c:out value="${forumInputVO.mail }"/>
						</td>
						<th scope="row"><strong>datalist</strong></th>
						<td>
							<c:out value="${forumInputVO.datalist }"/>
						</td>
					</tr> 
					<tr>
						<th scope="row"><strong>스케일</strong></th>
						<td>
							<c:out value="${forumInputVO.scale }"/>
						</td>
						<th scope="row"><strong>도시</strong></th>
						<td>
							<c:out value="${forumInputVO.city}"/>
						</td>
					</tr> 
					<tr>
						<th scope="row"><strong>색상</strong></th>
						<td style="background-color:${forumInputVO.color };">
							<c:out value="${forumInputVO.color }"/>
						</td>
						<th scope="row"><strong>날짜</strong></th>
						<td>
							<c:out value="${forumInputVO.date1}"/>
						</td>
					</tr> 
					<tr>
						<th scope="row"><strong>선택한 라이도 버튼의 값</strong></th>
						<td>
							${forumInputVO.radio1 }
						</td>
	                    <th scope="row"><strong>URL</strong></th>
						<td>${forumInputVO.url }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>키워드</strong></th>
						<td>
							${forumInputVO.keyword }
						</td>
					</tr> 
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<pre><c:out value="${util:unEscape(forumInputVO.cont)}" escapeXml="false"/></pre>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${forumInputVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
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
