<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<div class="content_box">
	<form:form commandName="mmainVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
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
							<form:input path="mainTitle" id="mainTitle" title="메인제목"  cssClass="text w100p"  maxlength="50" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="">메인서브제목</strong></th>
						<td colspan="3">
							<form:input path="mainSubtitle" id="mainSubtitle" title="메인서브제목"  cssClass="text w100p"  maxlength="50" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="">메인주소</strong></th>
						<td colspan="3">
							<form:input path="mainAddr" id="mainAddr" title="메인주소"  cssClass="text w100p"  maxlength="150" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">메인 전화번호</strong></th>
						<td>
							<form:input path="mainHp" id="mainHp" title="메인 전호번호"  cssClass="text w100p numOnly"  maxlength="11"  placeholder="-빼고 입력해 주세요" value="${mmainVO.mainHp}"/>
						</td>
						<th scope="row"><strong class="">메인fax</strong></th>
						<td>
							<form:input path="mainFax" id="mainFax" title="메인fax"  cssClass="text w100p numOnly"  maxlength="11"  placeholder="-빼고 입력해 주세요" value="${mmainVO.mainFax}"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">대표자</strong></th>
						<td colspan="3">
							<form:input path="rprsntr" id="rprsntr" title="대표자" cssClass="text w100p" maxlength="5" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">메인 배경 이미지<br>(가로1920px,세로937px)</strong></th>
						<td>
							<iframe name="bgImgFrame" id="bgImgFrame" src="/atch/fileUpload.do?atchFileId=${mmainVO.bgImg }&fileCnt=1&atchFileIdNm=bgImg&updateType=imageUpload" style="width: 100%; height:50;" frameborder="0" title="파일 업로드 폼"></iframe>
							<input type="hidden" id="bgImg" name="bgImg"/>
							<span id="bgImgMsg"></span>
						</td>
						<th scope="row"><strong class="th_tit">모바일 배경 이미지<br>(가로720px,세로1330px)</strong></th>
						<td>
							<iframe name="mBgImgFrame" id="mBgImgFrame" src="/atch/fileUpload.do?atchFileId=${mmainVO.mBgImg }&fileCnt=1&atchFileIdNm=mBgImg&updateType=imageUpload" style="width: 100%; height:50;" frameborder="0" title="파일 업로드 폼"></iframe>
							<input type="hidden" name="mBgImg" id="mBgImg"/>
							<span id="mBgImgMsg"></span>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">메인 홍보 게시판1</strong></th>
						<td colspan="3">
							<form:select path="mAdBoard1Seq" id="mAdBoard1Seq"  onchange="chkboardCL(value,'1')">
								<form:option value="" label="선택"/>
									<c:forEach var="result" items="${mnList }" varStatus="status">
										<form:option value="${result.menuSeq }" label="${result.menuNm }"/>
									</c:forEach>
							</form:select>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">메인 홍보 게시판2</strong></th>
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
						<th scope="row"><strong class="th_tit">메인 홍보 게시판3</strong></th>
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
						<th scope="row"><strong class="th_tit">메인 홍보 게시판4</strong></th>
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
				<c:choose>
					<c:when test="${fn:length(mmainVO.mmainbannerList) lt 1}">       
						<tbody id="bnrTbody_0">
							<tr id="bnrTr_0">
								<th scope="row"><strong class="th_tit">배너제목</strong></th>
								<td colspan="1">
									<input type="text" name="mmainbannerList[0].bannerTitle" id="bannerTitle_0" title="배너제목"  class="text w100p"  maxlength="100" />
								</td>
								<th scope="row"><strong class="th_tit">배너URL</strong></th>
								<td>
									<input type="text" name="mmainbannerList[0].url" id="url_0" title="배너Url"  class="text w100p" placeholder="http://" maxlength="255" />
								</td>
								<td rowspan="4" class="inbtn_area">
									<a href="javascript:void(0)" id="btn_del_0" class="btn btn_mdl03 btn_del" onclick="fncBnrDel('0');">삭제</a>
								</td>	
							</tr>
							
							<tr>
								<th scope="row"><strong class="th_tit">배너 기간</strong></th>
								<td>
									<span class="pick_input">
										<input name="mmainbannerList[0].staDate" id="staDate_0" class="text w100" readonly="readonly"    maxlength="10" />
									</span>
									<span class="pick_wave">~</span>
									<span class="pick_input">
										<input name="mmainbannerList[0].endDate" id="endDate_0" class="text w100" readonly="readonly"    maxlength="10" />
									</span>
								</td>
								<th scope="row"><strong class="">새창여부</strong></th>
								<td>
									<label for="newtabY_0"><input type="radio" name="mmainbannerList[0].newtab" id="newtabY_0" class="radio" value="Y" 
									  checked="checked"/>사용</label>
									<label for="newtabN_0"><input type="radio" name="mmainbannerList[0].newtab" id="newtabN_0" class="radio" value="N" 
									  />미사용</label>
								</td>
							</tr>
							<tr>
								<th scope="row"><strong class="">전시여부</strong></th>
								<td>
									<label for="notiYnY_0"><input type="radio" name="mmainbannerList[0].notiYn" id="notiYnY_0" class="radio" value="Y" 
										checked="checked"/> 사용</label>
									<label for="notiYnN_0"><input type="radio" name="mmainbannerList[0].notiYn" id="notiYnN_0" class="radio" value="N" 
									   /> 미사용</label>
								</td>
								<th scope="row"><strong class="">순서</strong></th>
								<td>
									<select class="selec bnrNo w100" name="mmainbannerList[0].iorder" id="order_0" >
										<option value="" label="선택" />
										<option value="1" label="1"/>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><strong class="th_tit">사진 이미지<br>(가로475px,세로415px)</strong></th>
								<td colspan="3">
									<iframe name="atchFileId_0Frame" id="atchFileId_0Frame" src="/atch/fileUpload.do?atchFileId=${mmainbannerList[0].atchFileId }&fileCnt=1&atchFileIdNm=atchFileId_0&updateType=imageUpload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼" onload="fileIframeLoad(atchFileId_0)"></iframe>
									<span id="imageFileIdBnr_1Msg"></span>
									<input type="hidden" name="mmainbannerList[0].atchFileId" id="atchFileId_0" value=" "/>
								</td>
							</tr>
						</tbody>	
					</c:when>	
					<c:otherwise>	
						<c:forEach var="result" items="${mmainVO.mmainbannerList}" varStatus="status">
							<tbody id="bnrTbody_${status.index}">
								<tr id="bnrTr_${status.index}">
									<th scope="row"><strong class="th_tit">배너제목</strong></th>
									<td colspan="1">
										<input type="hidden" name="mmainbannerList[${status.index}].seq" id="bannerseq_${status.index}" value="${result.seq }"/>
										<input type="text" name="mmainbannerList[${status.index}].bannerTitle" id="bannerTitle_${status.index}" title="배너제목"  class="text w100p"  maxlength="100" 
										 value="${result.bannerTitle }"/>
									</td>
									<th scope="row"><strong class="th_tit">배너URL</strong></th>
									<td>
										<input type="text" name="mmainbannerList[${status.index}].url" id="url_${status.index}" title="배너Url"  class="text w100p"  maxlength="1000" 
										 value="${result.url }"/>
									</td>
									<td rowspan="4" class="inbtn_area">
										<a href="javascript:void(0)" id="btn_del_${status.index}" class="btn btn_mdl03 btn_del" onclick="fncBnrDel('${status.index}');">삭제</a>
									</td>	
								</tr>
								
								<tr>
									<th scope="row"><strong class="th_tit">배너 기간</strong></th>
									<td>
										<span class="pick_input">
											<input name="mmainbannerList[${status.index}].staDate" id="staDate_${status.index}" class="text w100" readonly="readonly"    maxlength="10" 
											 value="${result.staDate }"/>
										</span>
										<span class="pick_wave">~</span>
										<span class="pick_input">
											<input name="mmainbannerList[${status.index}].endDate" id="endDate_${status.index}" class="text w100" readonly="readonly"    maxlength="10" 
											 value="${result.endDate }"/>
										</span>
									</td>
									<th scope="row"><strong class="">새창여부</strong></th>
									<td>
										<label for="newtabY_${status.index}"><input type="radio" name="mmainbannerList[${status.index}].newtab" id="newtabY_${status.index}" class="radio" value="Y" 
											<c:if test="${empty result.newtab or result.newtab eq 'Y' }">checked="checked"</c:if>/>사용</label>
										<label for="newtabN_${status.index}"><input type="radio" name="mmainbannerList[${status.index}].newtab" id="newtabN_${status.index}" class="radio" value="N" 
										 <c:if test="${result.newtab eq 'N' }">checked="checked"</c:if>"/>미사용</label>
									</td>
								</tr>
								<tr>
									<th scope="row"><strong class="">전시여부</strong></th>
									<td>
										<label for="notiYnY_${status.index}"><input type="radio" name="mmainbannerList[${status.index}].notiYn" id="notiYnY_${status.index}" class="radio" value="Y" 
											<c:if test="${empty result.notiYn or result.notiYn eq 'Y' }">checked="checked"</c:if>/> 사용</label>
										<label for="notiYnN_${status.index}"><input type="radio" name="mmainbannerList[${status.index}].notiYn" id="notiYnN_${status.index}" class="radio" value="N" 
										 <c:if test="${result.notiYn eq 'N' }">checked="checked"</c:if>/> 미사용</label>
									</td>
									<th scope="row"><strong class="th_tit">순서</strong></th>
									<td>
										<form:select  class="selec bnrNo w100" path="mmainbannerList[${status.index}].iorder" id="order_${status.index}">
											<option value="" label="선택" />
											<c:forEach var="i" begin="0" end="${exBannerListSize-1}" varStatus="status1">
												<option value="${status1.count }" label="${status1.count }" ${result.iorder eq status1.count ? 'selected':''}/>
											</c:forEach>
										</form:select>
									</td>
								</tr>
								<tr>
									<th scope="row"><strong class="th_tit">사진 이미지<br>(가로475px,세로415px)</strong></th>
									<td colspan="3">
										<iframe name="atchFileId_${status.index}Frame" id="atchFileId_${status.index}Frame" src="/atch/fileUpload.do?atchFileId=${result.atchFileId }&fileCnt=1&atchFileIdNm=atchFileId_${status.index}&updateType=imageUpload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼" onload="fileIframeLoad('atchFileId_${status.index}')"></iframe>
										<input type="hidden" name="mmainbannerList[${status.index}].atchFileId" id="atchFileId_${status.index}" value="${result.atchFileId}"/>
									</td>
								</tr>
							</tbody>
						</c:forEach>	
					</c:otherwise>	
				</c:choose>		
			</table>     
		</div>	
		
		<div class="btn_area">
			<a href="#" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<c:if test="${searchVO.procType eq  'update'}">
				<a href="#" class="btn btn_mdl btn_cancel" id="btn_returnView">취소</a>
			</c:if>
			<c:if test="${searchVO.procType ne  'update'}">
				<a href="#" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
			</c:if>
		</div>
	</form:form>
</div>

<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
<script type="text/javascript" src="/publish/ma/js/myjs/myValidationFunc.js"></script>
<script type="text/babel">
var mmainbannerListIndex = 1;
var exOrder=[];
$(document).ready(function(){	
	mmainbannerListIndex='${exBannerListSize}' < 1 ? mmainbannerListIndex : '${exBannerListSize}' ;
	for(var i=0;i<mmainbannerListIndex;i++){
		fncDate(`staDate_\${i}`,`endDate_\${i}`);		
	}
	
	<%-- 배너 순서를 정할때 중복되는 순서가 있는기 검사하는 코드 --%>
	var prevVal='';
	var currentOrderId='';
	<%-- 동적으로 추가한 html 코드는 document.on 으로 해줘야한다 --%>
	$(document).on("focus","[ID^=order_]",function(){
		prevVal=$(this).val();
		currentOrderId=$(this).attr('id');
	}).on("change",function(e){
		var bnnrOrderBoxs=$("[ID^=order_]");
		var selectedOrders=[];
		bnnrOrderBoxs.each(function(index){
			var bnnrOrderBoxVal=$(this).val();
			selectedOrders.push(bnnrOrderBoxVal);
		});
		if(checkForDuplicates(selectedOrders)){	
			alert($("#"+currentOrderId).val()+"번은 이미 정해진 순서입니다");
			$("#"+currentOrderId).val(prevVal).prop("selected", true);
		}
		prevVal=''
		return false;
	})

	$("#btn_submit").on("click", function(){
		$("[ID^=msg_]").remove();
		var subChk = true;
	
		if(!$("#mainTitle").val().trim()){
			fncRedMsg('mainTitle','제목을 입력해주세요.');
			subChk=false;
		}
		if(!$("#mainHp").val().trim()){
			fncRedMsg('mainHp','전화번호를 입력해주세요.');
			subChk=false;
		}
		if($("#mainHp").val()){
			var phoneNumValidResult=isValidPhone($("#mainHp").val());
			if(phoneNumValidResult!=true){
				fncRedMsg('mainHp','전화번호가 잘못되었습니다.');
				subChk=false;
			}
		}
		if($("#mainFax").val()){
			var phoneNumValidResult=isValidPhone($("#mainFax").val());
			if(phoneNumValidResult!=true){
				fncRedMsg('mainFax','팩스번호가 잘못되었습니다.');
				subChk=false;
			}
		}
		if(!$("#rprsntr").val().trim()){
			fncRedMsg('rprsntr','대표자를 입력해주세요.');
			subChk=false;
		}
		if(!$("#bgImg").val().trim()){
			fncRedMsg('bgImg','배경 이미지를 첨부해주세요.');
			subChk=false;
		}
		if(!$("#mBgImg").val().trim()){
			fncRedMsg('mBgImg','배경 이미지를 첨부해주세요.');
			subChk=false;
		}
		var mAdBoardBoxs=$("[ID^=mAdBoard]");
		var mAdBoardCnt=0;
		mAdBoardBoxs.each(function(){
			if($(this).val().trim() ){
				mAdBoardCnt++;
			}
		});
		if(mAdBoardCnt < 1){
			fncRedMsg('mAdBoard1Seq','최소 1개 이상의 홍보사이트를 정해주세요.');
			subChk=false;
		}
		
		for(var i = 0; i < mmainbannerListIndex; i++){
			
		

			if( $('#atchFileId_'+i).length )         
			{
				if(!$('#atchFileId_'+i).val().trim()){
					fncRedMsg('atchFileId_'+i,'배너 이미지를 첨부해주세요.');
					subChk=false;
				}
			}
			if( $('#order_'+i).length )         
			{
     			if(!$('#order_'+i).val()){
					fncRedMsg('order_'+i,'순서를 정해주세요.');
					subChk=false;
				}
			}
			if( $('#endDate_'+i).length )         
			{
     			if(!$('#endDate_'+i).val()){
					fncRedMsg('endDate_'+i,'기간을 설정해주세요.');
					subChk=false;
				}
			}
			if( $('#staDate_'+i).length )         
			{
     			if(!$('#staDate_'+i).val().trim()){
					fncRedMsg('staDate_'+i,'기간을 설정해주세요.');
					subChk=false;
				}
			}
			if( $('#url_'+i).length && !$('#url_'+i).val() )         
			{
				if(!$('#url_'+i).val().trim()){
					fncRedMsg('url_'+i,'url을 입력해주세요.');
					subChk=false;
				}
			}
			if( $('#bannerTitle_'+i).length )         
			{
				if(!$('#bannerTitle_'+i).val().trim()){
					fncRedMsg('bannerTitle_'+i,'베너 제목을 입력해주세요.');
					subChk=false;
				}
			}
		}
		if(subChk){
			fncPageBoard('write','${searchVO.procType}Proc.do');
		}
		return false;
	});
	
	$("#btn_returnView").click(function(){
		$("#boardSeq").val($("#boardGrpSeq").val());
		fncPageBoard('list','list.do');
	});
});


<%--게시판선택 중복 제거  --%>
function chkboardCL(val,num){
	var bltnCkList = []
	for(var i = 1; i < 5; i++){
		if(i != num && $('#mAdBoard'+i+'Seq').val()){
			bltnCkList.push($('#mAdBoard'+i+'Seq').val())
		}
	}
	for(var i=0; i < bltnCkList.length; i++){
		if(val == bltnCkList[i]){
			alert('동일한 게시판이 있습니다.')
			$('#mAdBoard'+num+'Seq').val('');
			return false;
		}
	}
}
var fncBnrInsertAdd=function(){
	var bannerHtml=`
		<tbody id="bnrTbody_\${mmainbannerListIndex}">
						<tr id="bnrTr_\${mmainbannerListIndex}">
							<th scope="row"><strong class="th_tit">배너제목</strong></th>
							<td colspan="1">
								<input type="text" name="mmainbannerList[\${mmainbannerListIndex}].bannerTitle" id="bannerTitle_\${mmainbannerListIndex}" title="배너제목"  class="text w100p"  maxlength="100" 
								 value="${result.bannerTitle }"/>
							</td>
							<th scope="row"><strong class="th_tit">배너URL</strong></th>
							<td>
								<input type="text" name="mmainbannerList[\${mmainbannerListIndex}].url" id="url_\${mmainbannerListIndex}" title="배너Url"  class="text w100p"  maxlength="255" 
								 value="${result.url }"/>
							</td>
							<td rowspan="4" class="inbtn_area">
								<a href="javascript:void(0);" id="btn_del_\${mmainbannerListIndex}" class="btn btn_mdl03 btn_del" onclick="fncBnrDel('\${mmainbannerListIndex}');">삭제</a>
							</td>	
						</tr>
						
						<tr>
							<th scope="row"><strong class="th_tit">배너 기간</strong></th>
							<td>
								<span class="pick_input">
									<input name="mmainbannerList[\${mmainbannerListIndex}].staDate" id="staDate_\${mmainbannerListIndex}" class="text w100" readonly="readonly"    maxlength="10" 
									 value="${result.staDate }"/>
								</span>
								<span class="pick_wave">~</span>
								<span class="pick_input">
									<input name="mmainbannerList[\${mmainbannerListIndex}].endDate" id="endDate_\${mmainbannerListIndex}" class="text w100" readonly="readonly"    maxlength="10" 
									 value="${result.endDate }"/>
								</span>
							</td>
							<th scope="row"><strong class="">새창여부</strong></th>
							<td>
								<label for="newtabY_\${mmainbannerListIndex}"><input type="radio" name="mmainbannerList[\${mmainbannerListIndex}].newtab" id="newtabY_\${mmainbannerListIndex}" class="radio" value="Y" 
									<c:if test="${empty result.newtab or result.newtab eq 'Y' }">checked="checked"</c:if>/>사용</label>
								<label for="newtabN_\${mmainbannerListIndex}"><input type="radio" name="mmainbannerList[\${mmainbannerListIndex}].newtab" id="newtabN_\${mmainbannerListIndex}" class="radio" value="N" 
								 <c:if test="${result.newtab eq 'N' }">checked="checked"</c:if>"/>미사용</label>
							</td>
						</tr>
						<tr>
							<th scope="row"><strong class="">전시여부</strong></th>
							<td>
								<label for="notiYnY_\${mmainbannerListIndex}"><input type="radio" name="mmainbannerList[\${mmainbannerListIndex}].notiYn" id="notiYnY_\${mmainbannerListIndex}" class="radio" value="Y" 
									<c:if test="${empty result.notiYn or result.notiYn eq 'Y' }">checked="checked"</c:if>/> 사용</label>
								<label for="notiYnN_\${mmainbannerListIndex}"><input type="radio" name="mmainbannerList[\${mmainbannerListIndex}].notiYn" id="notiYnN_\${mmainbannerListIndex}" class="radio" value="N" 
								 <c:if test="${result.notiYn eq 'N' }">checked="checked"</c:if>/> 미사용</label>
							</td>
							<th scope="row"><strong class="th_tit">순서</strong></th>
							<td>
								<select class="selec bnrNo w100" name="mmainbannerList[\${mmainbannerListIndex}].iorder" id="order_\${mmainbannerListIndex}">
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><strong class="th_tit">사진 이미지<br>(가로475px,세로415px)</strong></th>
							<td colspan="3">
								<iframe name="atchFileId_\${mmainbannerListIndex}Frame" id="atchFileId_\${mmainbannerListIndex}Frame" src="/atch/fileUpload.do?atchFileId=${result.atchFileId }&fileCnt=1&atchFileIdNm=atchFileId_\${mmainbannerListIndex}&updateType=imageUpload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼" onload="fileIframeLoad('atchFileId_\${mmainbannerListIndex}')"></iframe>
								<input type="hidden" name="mmainbannerList[\${mmainbannerListIndex}].atchFileId" id="atchFileId_\${mmainbannerListIndex}" value="${result.atchFileId}"/>
							</td>
						</tr>
					</tbody>
`
	$("#bnrTable").append(bannerHtml);
	fncDate(`staDate_\${mmainbannerListIndex}`,`endDate_\${mmainbannerListIndex}`);
	mmainbannerListIndex++;
	fncBnrNo();
	$(".errorMsgDiv").hide();
	return false;
}
<%-- 배너관리 삭제 버튼 --%>
var fncBnrDel=function(num){
	$("#bnrTbody_"+num).remove();
	if($("a[id^=btn_del]").length < 1){
		fncBnrInsertAdd();
	}
	<%--exOrder := 순서 select 박스의 상태를 관리하기 위한 객체--%>
	<%--exOrder 에 x라는 id를 가진 select 박스가 없으면 관리를 위해 추가해준다--%>
	var exOrderIndex=exOrder.getIndexOf("order_"+num);
	if (exOrderIndex > -1) {
 	 exOrder.splice(exOrderIndex, 1);
	}
	
	fncBnrNo();
}

var fncBnrNo=function(){
	<%--update 시 기존데이터의 순서 유지시키는 코드--%>
	var bnnrOrderBoxs=$("[ID^=order_]");
	bnnrOrderBoxs.each(function(index){
		var bnnrOrderBoxId=$(this).attr('id');
		var bnnrOrderBoxVal=$(this).val();
		var bnnrOrderBoxJson={
			"id":bnnrOrderBoxId
			,"val":bnnrOrderBoxVal
		};
		<%--exOrder := 순서 select 박스의 상태를 관리하기 위한 객체--%>
		<%--exOrder 에 x라는 id를 가진 select 박스가 없으면 관리를 위해 추가해준다--%>
		var exOrderIndex=exOrder.getIndexOf(bnnrOrderBoxId);
		if(exOrderIndex < 0){
			exOrder.push(bnnrOrderBoxJson);
		}
	});

	<%--순서 selectbox 에 새로운 순서목록을 넣어주는 코드--%>
	var bnrLength = $("#bnrTable tbody").size();
	var bnrAddNo = '<option value="" label="선택"/>';
	if(bnrLength > 0){
		for(var i=1;i<=bnrLength;i++)
		{
			bnrAddNo += '<option value="'+i+'" label="'+i+'"/>';
		}
		$(".bnrNo").html('');
		$(".bnrNo").append(bnrAddNo);
	} 

	<%--update 시 기존데이터의 순서 유지시키는 코드--%>
	exOrder.forEach(function(e){
		$("#"+e.id).val(e.val).prop("selected", true);
	});
	
}

<%-- 순번을 자동으로 지정해주는 코드. 경우의 수가 많아서 보류--%>
var fncBnrNoAutoOrdering=function(){
	<%--update 시 기존데이터의 순서 유지시키는 코드--%>
	var bnnrOrderBoxs=$("[ID^=order_]");
	bnnrOrderBoxs.each(function(index){
		var bnnrOrderBoxId=$(this).attr('id');
		var bnnrOrderBoxVal=$(this).val();
		var bnnrOrderBoxJson={
			"id":bnnrOrderBoxId
			,"val":bnnrOrderBoxVal
		};
		<%--exOrder := 순서 select 박스의 상태를 관리하기 위한 객체--%>
		<%--exOrder 에 x라는 id를 가진 select 박스가 없으면 관리를 위해 추가해준다--%>
		var exOrderIndex=exOrder.getIndexOf(bnnrOrderBoxId);
		if(exOrderIndex < 0){
			exOrder.push(bnnrOrderBoxJson);
		}
	});

	<%--순서 selectbox 에 새로운 순서목록을 넣어주는 코드--%>
	var bnrLength = $("#bnrTable tbody").size();
	var bnrAddNo = '<option value="" label="선택"/>';
	var availableNum = [];
	if(bnrLength > 0){
		for(var i=1;i<=bnrLength;i++)
		{
			availableNum.push(i);
			bnrAddNo += '<option value="'+i+'" label="'+i+'"/>';
		}
		$(".bnrNo").html('');
		$(".bnrNo").append(bnrAddNo);
	} 

	<%--update 시 기존데이터의 순서 유지시키는 코드--%>
	exOrder.forEach(function(e){
		$("#"+e.id).val(e.val).prop("selected", true);
		
		var avlNumIndex = availableNum.indexOf(+e.val);
		if (avlNumIndex > -1) {
 		 availableNum.splice(avlNumIndex, 1);
		
		}		
	});
	
	<%--새로 생성된 배너박스에 순서 자동으로 주기--%>
	
	var bnnrOrderBoxs=$("[ID^=order_]");
	bnnrOrderBoxs.each(function(e){
		var bnnrOrderBoxId=$(this).attr('id');
		var orderIndex = exOrder.indexOf(bnnrOrderBoxId);
		var bnnrOrderBoxVal=$(this).val();
		if(orderIndex<0 && !bnnrOrderBoxVal){
			if(availableNum && availableNum[0]){
				$("#"+bnnrOrderBoxId).val(availableNum[0]).prop("selected", true);
				availableNum.splice(0, 1);
			}else{
				//$("#"+e.id).val('').prop("selected", true);
			}
		}
	});
	
}

var fncRedMsg=function(id, msg){
	var msgHtml = '<strong id="msg_'+id+'" ><font color="red">&nbsp;'+msg+'</font></strong>';
	$("#"+id).parent().append(msgHtml);
}

<%-- iframeLoad 용 함수. 파일 iframe은 첨부된 파일을 지우거나 파일을 선택하면 onload 이벤트가 발생한다 --%>
var fileIframeLoad=function(id){
	$("#msg_"+id).remove();
}

<%-- 특정 json 객체에 key값이 있나 확인하는 코드--%>
Array.prototype.getIndexOf = function(el) {

  var arr = this;

  for (var i=0; i<arr.length; i++){
     //console.log(arr[i].id);
     if(arr[i].id==el){
       return i;
     }
     
  }
  
  return -1;

}

<%--primitive type 배열 중복 검사--%>
var checkForDuplicates=function(array) {
  let valuesAlreadySeen = []

  for (let i = 0; i < array.length; i++) {
	if(array[i] == ''){continue}
    let value = array[i]
    if (valuesAlreadySeen.indexOf(value) !== -1) {
      return true
    }
    valuesAlreadySeen.push(value)
  }
  return false
}
</script>