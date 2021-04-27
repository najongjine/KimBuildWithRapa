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
		<input type="hidden" name="resultListSeqList" id="resultListSeqList" value="${searchVO.resultListSeqList}"/>
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
						<th scope="row"><strong>ip</strong></th>
						<td colspan="3">
							${searchVO.ip }
						</td>
					</tr> 
				</tbody>
			</table>
		</div>
		<br>
		<div class="tbl_wrap">
			<table class="tbl_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col >
					<col >
				</colgroup>
				<thead>
					<tr>
						<th scope="col">입력한 ID</th>
						<th scope="col">날자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${loginFailedList}" varStatus="status">
						<tr>
							<td>
								<c:out value="${result.id }"/>
							</td>
							<td>
								<c:out value="${result.rgstDt }"/>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<a href="#" class="btn btn_mdl btn_list" onclick="fncPageBoard('list','loginFailedlist.do');">목록</a>
	</div>	
	</form:form>
</div>
