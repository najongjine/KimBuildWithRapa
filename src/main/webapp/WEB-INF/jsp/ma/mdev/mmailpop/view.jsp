<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<%
    pageContext.setAttribute("crcn", "\r\n"); 
    pageContext.setAttribute("br", "<br>");
%> 

<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<!-- tbl -->
		<div class="tbl_wrap">
			<table class="tbl_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width: 15%;">
					<col style="width: 35%;">
					<col style="width: 15%;">
					<col style="width: 35%;">
				</colgroup>
				<tbody>
					<c:forEach var="result" items="${mailVO.mailList }" varStatus="status">
					<tr>
						<c:if test="${status.count eq 1 }">
						<th scope="row" rowspan="${fn:length(mailVO.mailList)}"><strong>받는사람</strong></th>
						</c:if>
						<td colspan="3" >
							<c:out value="${result.name}(${result.rEmail })"/>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<th scope="row"><strong>양식</strong></th>
						<td colspan="3"><c:out value="${mailVO.wform eq '0' ? '없음' : (mailVO.wform eq '1' ? '1번' : (mailVO.wform eq '2' ? '2번' : '3번')) }" /></td>
					</tr>
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td colspan="3"><c:out value="${mailVO.title }" /></td>
					</tr>
					<tr>
						<th scope="row"><strong>등록자</strong></th>
						<td>${mailVO.rgstId }</td>
						<th scope="row"><strong>등록일</strong></th>
						<td>${mailVO.rgstDt }</td>
					</tr>
					<tr>
						<td colspan="4">
							<div class="text_area">
								<c:choose>
									<c:when test="${mailVO.wform eq '0'}">
										<pre class="text_pre"><c:out value="${mailVO.cont }" escapeXml="false"/></pre>
									</c:when>
									<c:otherwise>
										<c:out value="${util:unEscape(mailVO.cont) }" escapeXml="false"/>
									</c:otherwise>
								</c:choose>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<a href="#" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
	</form:form>
</div>

<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript">
iframeHeight();

function iframeHeight(){	
	<%--높이 받아서 집어넣기--%>
	window.addEventListener("message", function(e) {
		document.getElementById("cont").height = e.data.scrollHeight;
	});
}

</script>
