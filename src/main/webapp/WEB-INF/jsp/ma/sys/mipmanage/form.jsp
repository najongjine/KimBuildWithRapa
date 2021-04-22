<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
$(document).ready(function(){	
	var ip='${ipVO.ip}' 
	ip=ip.split(".");
	$("#ip1").val(ip[0] ? ip[0] : '0')
	$("#ip2").val(ip[1] ? ip[1] : '0')
	$("#ip3").val(ip[2] ? ip[2] : '0')
	$("#ip4").val(ip[3] ? ip[3] : '0')
	<%-- 에디터 --%>
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "cont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
	$("#btn_submit").on("click", function(){
		
			oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
			
		if($("#cont").val()=='<p>&nbsp;</p>') {
			alert("내용을 입력해주세요");
			oEditors.getById["cont"].exec("FOCUS"); /* 에디터 */
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
	<form:form commandName="ipVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:input path="seq" id="seq"/>
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
						<th scope="row"><strong class="th_tit">접근 IP</strong></th>
						<td colspan="3">
							<input type="text" name="ip" id="ip1" title="접근 IP"  class="text w10p numOnly"  maxlength="3" />.
							<input type="text" name="ip" id="ip2" title="접근 IP"  class="text w10p numOnly"  maxlength="3" />.
							<input type="text" name="ip" id="ip3" title="접근 IP"  class="text w10p numOnly"  maxlength="3" />.
							<input type="text" name="ip" id="ip4" title="접근 IP"  class="text w10p numOnly"  maxlength="3" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>허용여부</strong></th>
						<td colspan="3">
							<label for="allow_Y"><input id="allow_Y" name="allow" class="radio" type="radio" value="Y"
							 <c:if test="${ipVO.allow eq 'Y'}">checked="checked"</c:if> />Y</label>
							<label for="allow_N"><input id="allow_N" name="allow" class="radio" type="radio" value="N" 
							 <c:if test="${empty ipVO.allow or ipVO.allow eq 'N'}">checked="checked"</c:if> />N</label>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">차단사유</strong></th>
						<td colspan="3">
							<textarea name="cont" id="cont" class="txt_area w_100p" >${util:unEscape(ipVO.cont)}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${ipVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
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