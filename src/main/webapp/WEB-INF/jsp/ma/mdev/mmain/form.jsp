<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

<div class="content_box">
	<form:form commandName="mmainVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="bgImg" id="bgImg"/>
		<form:hidden path="mBgImg" id="mBgImg"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<div class="tbl_wrap">
			<table class="tbl_row_type02">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:20%;">
					<col style="width:30%;">
					<col style="width:20%;">
					<col >
				</colgroup>       
				<tbody>
					<tr>
						<th scope="row"><strong class="th_tit">메인제목</strong></th>
						<td colspan="3">
							<form:input path="mainTitle" id="mainTitle" title="메인제목"  cssClass="text w100p"  maxlength="100" required="true"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">메인서브제목</strong></th>
						<td colspan="3">
							<form:input path="mainSubtitle" id="mainSubtitle" title="메인서브제목"  cssClass="text w100p"  maxlength="100" required="true"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">메인주소</strong></th>
						<td colspan="3">
							<form:input path="mainAddr" id="mainAddr" title="메인주소"  cssClass="text w100p"  maxlength="150" required="true"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">메인 전화번호</strong></th>
						<td>
							<form:input path="mainHp" id="mainHp" title="메인 전호번호"  cssClass="text w100p numOnly"  maxlength="11" required="true" placeholder="-빼고 입력해 주세요" value="${util:strToHp(mmainVO.mainHp) }"/>
						</td>
						<th scope="row"><strong class="th_tit">메인fax</strong></th>
						<td>
							<form:input path="mainFax" id="mainFax" title="메인fax"  cssClass="text w100p numOnly"  maxlength="11" required="true" placeholder="-빼고 입력해 주세요" value="${util:strToHp(mmainVO.mainFax) }"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">대표자</strong></th>
						<td colspan="3">
							<form:input path="rprsntr" id="rprsntr" title="대표자" cssClass="text w100p" maxlength="5" required="true"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">메인 배경 이미지<br>(가로1920px,세로937px)</strong></th>
						<td>
							<iframe name="bgImgFrame" id="bgImgFrame" src="/atch/fileUpload.do?atchFileId=${mmainVO.bgImg }&fileCnt=1&atchFileIdNm=bgImg&updateType=imageUpload" style="width: 100%; height:50;" frameborder="0" title="파일 업로드 폼"></iframe>
							<span id="bgImgMsg"></span>
						</td>
						<th scope="row"><strong class="th_tit">모바일 배경 이미지<br>(가로720px,세로1330px)</strong></th>
						<td>
							<iframe name="mBgImgFrame" id="mBgImgFrame" src="/atch/fileUpload.do?atchFileId=${mmainVO.mBgImg }&fileCnt=1&atchFileIdNm=mBgImg&updateType=imageUpload" style="width: 100%; height:50;" frameborder="0" title="파일 업로드 폼"></iframe>
							<span id="mBgImgMsg"></span>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">메인 홍보 게시판1</strong></th>
						<td colspan="3">
							<form:select path="mAdBoard1Seq" id="mAdBoard1Seq" required="required" onchange="chkboardCL(value,'1')">
								<form:option value="" label="선택"/>
									<c:forEach var="result" items="${mnList }" varStatus="status">
										<form:option value="${result.menuSeq }" label="${result.menuNm }"/>
									</c:forEach>
							</form:select>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>메인 홍보 게시판2</strong></th>
						<td colspan="3">
							<form:select path="mAdBoard2Seq" id="mAdBoard2Seq" onchange="chkboardCL(value,'2')">
								<form:option value="" label="선택"/>
									<c:forEach var="result" items="${mnList }" varStatus="status">
										<form:option value="${result.menuSeq }" label="${result.menuNm }"/>
									</c:forEach>
							</form:select>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>메인 홍보 게시판3</strong></th>
						<td colspan="3">
							<form:select path="mAdBoard3Seq" id="mAdBoard3Seq" onchange="chkboardCL(value,'3')">
								<form:option value="" label="선택"/>
									<c:forEach var="result" items="${mnList }" varStatus="status">
										<form:option value="${result.menuSeq }" label="${result.menuNm }"/>
									</c:forEach>
							</form:select>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>메인 홍보 게시판4</strong></th>
						<td colspan="3">
							<form:select path="mAdBoard4Seq" id="mAdBoard4Seq" onchange="chkboardCL(value,'4')">
								<form:option value="" label="선택"/>
									<c:forEach var="result" items="${mnList }" varStatus="status">
										<form:option value="${result.menuSeq }" label="${result.menuNm }"/>
									</c:forEach>
							</form:select>
						</td>
					</tr>
				</tbody>
			</table>      
		</div>
		
		<div class="tbl_top">
			<div class="tbl_left">
				<h4 class="md_tit">배너관리</h4>
				<a href="javascript:void(0)"  class="btn btn_sml02 btn_add r"  onclick="fncBnrInsertAdd()" >추가</a>
			</div>
			<div class="tbl_right"></div>
		</div>
		
		<div class="tbl_wrap">
			<table class="tbl_row_type02" id="bnrTable">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:20%;">
					<col style="width:26%;">
					<col style="width:20%;">
					<col style="width:26%;">
					<col style="width:8%;">
				</colgroup>
				<c:if test="${empty mmainVO.mmainbannerList}">       
					<tbody id="bnrTbody_1">
						<tr id="bnrTr_1">
							<th scope="row"><strong class="th_tit">배너제목</strong></th>
							<td colspan="1">
								<input type="hidden" name="mmainbannerList[0].mmainSeq" id="mmainSeq_0" value="${mmainbannerList[0].mmainSeq }"/>
								<input type="text" name="mmainbannerList[0].bannerTitle" id="bannerTitle_0" title="배너제목"  class="text w100p"  maxlength="100" required="required"
								 value="${mmainbannerList[0].bannerTitle }"/>
							</td>
							<th scope="row"><strong class="th_tit">배너URL</strong></th>
							<td>
								<input type="text" name="mmainbannerList[0].url" id="url_0" title="배너Url"  class="text w100p"  maxlength="1000" required="required"
								 value="${mmainbannerList[0].url }"/>
							</td>
							<td rowspan="4" class="inbtn_area">
								<a href="#" id="btn_del_0" class="btn btn_mdl03 btn_del" onclick="fncBnrDel('0');">삭제</a>
							</td>	
						</tr>
						
						<tr>
							<th scope="row"><strong class="th_tit">배너 기간</strong></th>
							<td>
								<span class="pick_input">
									<input name="mmainbannerList[0].staDate" id="staDate_0" class="text w100" readonly="readonly"  required="required"  maxlength="10" 
									 value="${mmainbannerList[0].staDate }"/>
								</span>
								<span class="pick_wave">~</span>
								<span class="pick_input">
									<input name="mmainbannerList[0].endDate" id="endDate_0" class="text w100" readonly="readonly"  required="required"  maxlength="10" 
									 value="${mmainbannerList[0].endDate }"/>
								</span>
							</td>
							<th scope="row"><strong class="th_tit">새창여부</strong></th>
							<td>
								<label for="newtabY_0"><input type="radio" name="mmainbannerList[0].newtab" id="newtabY_0" class="radio" value="Y" />사용</label>
								<label for="newtabN_0"><input type="radio" name="mmainbannerList[0].newtab" id="newtabN_0" class="radio" value="N" />미사용</label>
							</td>
						</tr>
						<tr>
							<th scope="row"><strong class="th_tit">전시여부</strong></th>
							<td>
								<label for="notiYnY_0"><input type="radio" name="mmainbannerList[0].notiYn" id="notiYnY_0" class="radio" value="Y" 
									<c:if test="${empty mmainbannerList[0].notiYn or mmainbannerList[0].notiYn eq 'Y' }">checked="checked"</c:if>/> 사용</label>
								<label for="notiYnN_0"><input type="radio" name="mmainbannerList[0].notiYn" id="notiYnN_0" class="radio" value="N" required="required"/> 미사용</label>
							</td>
							<th scope="row"><strong class="th_tit">순서</strong></th>
							<td>
								<select class="selec bnrNo" name="mmainbannerList[0].iorder" id="order_0">
									<option value="1">1</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><strong class="th_tit">사진 이미지<br>(가로475px,세로415px)</strong></th>
							<td colspan="3">
								<iframe name="atchFileId_0Frame" id="atchFileId_0Frame" src="/atch/fileUpload.do?atchFileId=${mmainbannerList[0].atchFileId }&fileCnt=1&atchFileIdNm=atchFileId_0&updateType=imageUpload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
								<span id="imageFileIdBnr_1Msg"></span>
								<input type="hidden" name="mmainbannerList[0].atchFileId" id="atchFileId_0" value=" "/>
							</td>
						</tr>
					</tbody>	
				</c:if>		
				<c:forEach var="result" items="${mmainVO.mmainbannerList}" varStatus="status">
					<tbody id="bnrTbody_1">
						<tr id="bnrTr_1">
							<th scope="row"><strong class="th_tit">배너제목</strong></th>
							<td colspan="1">
								<input type="hidden" name="mmainbannerList[${status.index}].mmainSeq" id="mmainSeq_0" value="${result.mmainSeq }"/>
								<input type="text" name="mmainbannerList[0].bannerTitle" id="bannerTitle_${status.index}" title="배너제목"  class="text w100p"  maxlength="100" required="required"
								 value="${result.bannerTitle }"/>
							</td>
							<th scope="row"><strong class="th_tit">배너URL</strong></th>
							<td>
								<input type="text" name="mmainbannerList[${status.index}].url" id="url_${status.index}" title="배너Url"  class="text w100p"  maxlength="1000" required="required"
								 value="${result.url }"/>
							</td>
							<td rowspan="4" class="inbtn_area">
								<a href="#" id="btn_del_${status.index}" class="btn btn_mdl03 btn_del" onclick="fncBnrDel('${status.index}');">삭제</a>
							</td>	
						</tr>
						
						<tr>
							<th scope="row"><strong class="th_tit">배너 기간</strong></th>
							<td>
								<span class="pick_input">
									<input name="mmainbannerList[${status.index}].staDate" id="staDate_${status.index}" class="text w100" readonly="readonly"  required="required"  maxlength="10" 
									 value="${result.staDate }"/>
								</span>
								<span class="pick_wave">~</span>
								<span class="pick_input">
									<input name="mmainbannerList[${status.index}].endDate" id="endDate_${status.index}" class="text w100" readonly="readonly"  required="required"  maxlength="10" 
									 value="${result.endDate }"/>
								</span>
							</td>
							<th scope="row"><strong class="th_tit">새창여부</strong></th>
							<td>
								<label for="newtabY_${status.index}"><input type="radio" name="mmainbannerList[${status.index}].newtab" id="newtabY_${status.index}" class="radio" value="Y" 
									<c:if test="${empty result.newtab or result.newtab eq 'Y' }">checked="checked"</c:if>/>사용</label>
								<label for="newtabN_${status.index}"><input type="radio" name="mmainbannerList[${status.index}].newtab" id="newtabN_${status.index}" class="radio" value="N" 
								 <c:if test="${result.newtab eq 'N' }">checked="checked"</c:if>"/>미사용</label>
							</td>
						</tr>
						<tr>
							<th scope="row"><strong class="th_tit">전시여부</strong></th>
							<td>
								<label for="notiYnY_${status.index}"><input type="radio" name="mmainbannerList[${status.index}].notiYn" id="notiYnY_${status.index}" class="radio" value="Y" 
									<c:if test="${empty result.notiYn or result.notiYn eq 'Y' }">checked="checked"</c:if>/> 사용</label>
								<label for="notiYnN_${status.index}"><input type="radio" name="mmainbannerList[${status.index}].notiYn" id="notiYnN_${status.index}" class="radio" value="N" required="required"
								 <c:if test="${result.notiYn eq 'N' }">checked="checked"</c:if>/> 미사용</label>
							</td>
							<th scope="row"><strong class="th_tit">순서</strong></th>
							<td>
								<select class="selec bnrNo" name="mmainbannerList[${status.index}].iorder" id="order_${status.index}">
									<option value="1">1</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><strong class="th_tit">사진 이미지<br>(가로475px,세로415px)</strong></th>
							<td colspan="3">
								<iframe name="atchFileId_${status.index}Frame" id="atchFileId_${status.index}Frame" src="/atch/fileUpload.do?atchFileId=${result.atchFileId }&fileCnt=1&atchFileIdNm=atchFileId_${status.index}&updateType=imageUpload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
								<span id="imageFileIdBnr_1Msg"></span>
								<input type="hidden" name="mmainbannerList[${status.index}].atchFileId" id="atchFileId_${status.index}" value="${result.atchFileId}"/>
							</td>
						</tr>
					</tbody>
				</c:forEach>				
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

<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript">
var mmainbannerListIndex = 1;
$(document).ready(function(){	
	fncDate('staDate_0','endDate_0');
	$("#btn_submit").on("click", function(){
			
		fncPageBoard('write','${searchVO.procType}Proc.do');
		return false;
	});
	
	$("#btn_returnView").click(function(){
		$("#boardSeq").val($("#boardGrpSeq").val());
		fncPageBoard('view','view.do');
	});
});

<%--게시판선택 중복 제거  --%>
function chkboardCL(val,num){
	var bltnCkList = []
	for(i = 1; i < 5; i++){
		if(i != num && $('#mAdBoard'+i+'Seq').val()){
			bltnCkList.push($('#mAdBoard'+i+'Seq').val())
		}
	}
	for(i=0; i < bltnCkList.length; i++){
		if(val == bltnCkList[i]){
			alert('동일한 게시판이 있습니다.')
			$('#mAdBoard'+num+'Seq').val('');
			return false;
		}
	}
}
</script>