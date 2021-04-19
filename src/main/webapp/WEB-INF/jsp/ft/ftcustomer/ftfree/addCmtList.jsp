<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javaScript">
var bUpdateCmtFromShowed=false
$(document).ready(function(){
});
var showUpdateCmtForm=function(bcmtSeq){
	if(bUpdateCmtFromShowed){
		return false
	}
	bUpdateCmtFromShowed=true
	let exCont=$("#cmtTd_"+bcmtSeq).text()
	
	let updateCmtFormHtml=`
		<td colspan="3">
			<textarea name="updateCmtCont" id="updateCmtCont" class="txt_area w_100p" >\${exCont.substr(9)}</textarea>
		</td>
		<td >
			<a href="#" onclick="submitUpdateCmt('\${bcmtSeq}'); return false;" class="btn btn_middle btn_purple" >수정</a> 
			<a href="#" onclick="getCmtList(); return false;" class="btn btn_middle btn_gray" >취소</a>
		</td>
	`
	$("#cmtTr_"+bcmtSeq).html(updateCmtFormHtml)
	return false
}
var deleteCmt=function(bcmtSeq){
	if(!confirm("댓글을 삭제 하시겠습니까?")){
		return false
	}
	$.ajax({
		url:'deleteCmtProc.do'
		,method:"POST"
		,data:{"bcmtSeq":bcmtSeq}
		,success:function(data){
			getCmtList()
		}
		,error:function(error){
			alert("통신 에러")
		}
	})
	return false
}
var submitUpdateCmt=function(bcmtSeq){
	let updateCmtCont=$("#updateCmtCont").val().trim()
	if(!updateCmtCont){
		alert("수정할 내용을 입력해주세요")
		return false
	}
	$("#bcmtSeq").val(bcmtSeq)
	$.ajax({
		url:'updateCmtProc.do'
		,method:"POST"
		,data:$("#defaultFrm").serialize()
		,success:function(data){
			getCmtList()
		}
		,error:function(error){
			alert("통신 에러")
		}
	})
	return false
}
</script>

<div class="tbl_wrap">
	<table class="tbl_col_type01" >
		<caption>목록</caption>
		<colgroup> 
			<col>
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col" class="subject">제목</th>
				<th scope="col">등록자</th>
				<th scope="col">등록일</th>
				<th scope="col">기능</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr id="cmtTr_${result.bcmtSeq}" class="cursor">
							<td id="cmtTd_${result.bcmtSeq}" class="subject">
								<pre><c:out value="${util:unscript(util:unEscape(result.cont))}" escapeXml="false"/></pre>
							</td>
							<td >${result.name }</td>
							<td >${result.rgstDt }</td>
							<td >
								<c:if test="${result.rgstId eq loginFtSeq}">
									<a href="#" onclick="showUpdateCmtForm('${result.bcmtSeq}'); return false;" class="btn btn_middle btn_purple" >수정</a> 
									<a href="#" onclick="deleteCmt(${result.bcmtSeq}); return false;" class="btn btn_middle btn_red" >삭제</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="4" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<%-- //tbl end --%>