<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="curYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
<div class="content_box">
	<c:if test="${searchVO.procType eq 'update' }">
		<ul class="tab js-tab tab_menu">
		    <li class="btn_tap current"><a href="javascript:void(0)" onclick="fncPageBoard('write','updateForm.do');">가입정보</a></li>
		    <li class="btn_tap"><a href="javascript:void(0)" onclick="fncPageBoard('list','tchrEduList.do');">강의내역</a></li>
		</ul>
	</c:if>
	<form:form commandName="tchrMngVO" name="defaultFrm" id="defaultFrm" method="post" onsubmit="return false;">
		<form:hidden path="seq" id="seq"/>
		<input type="hidden" id="col1" name="col1" value="${searchVO.col1 }"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<div class="tbl_wrap">
			<div class="tbl_top">
				<div class="tbl_left">
					<h4 class="md_tit">강사${searchVO.procType eq 'insert' ? '등록' : '관리' }</h4>
				</div>
				<div class="tbl_right"></div>
			</div>
			<table class="tbl_row_type01"> 
				<caption>강사${searchVO.procType eq 'insert' ? '등록' : '관리' }</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:35%;">
					<col style="width:15%;">
					<col style="width:35%;">
				</colgroup> 
				<tbody>
					<tr>
						<c:choose>
							<c:when test="${searchVO.procType eq 'update' }">
								<th scope="row"><strong class="th_tit">아이디</strong></th>
		                        <td colspan="">
		                            <input type="hidden" id="id" name="id" maxlength="10" value="${tchrMngVO.id }" />
		                        	<span style="font-weight: bold;">[ ${tchrMngVO.id } ]</span>
		                        </td>
							</c:when>
							<c:otherwise>
								<th scope="row"><strong class="th_tit">아이디</strong></th>
		                        <td colspan="">
		                            <input type="text" id="id" name="id" class="text w50p" maxlength="10" placeholder="3~10자의 영문 대소문자, 숫자"/>
		                            <a href="javascript:void(0)" class="btn btn_detail" onclick="checkId('id')">중복확인</a>
		                        </td>
							</c:otherwise>
						</c:choose>
						<th scope="row"><strong class="th_tit">성명</strong></th>
						<td colspan="">
							<input type="text" id="name" name="name" class="text w50p" maxlength="20" value="${tchrMngVO.name }" placeholder="성명을 입력해주세요"/>
						</td>
                    </tr>
                    <tr>
                        <th scope="row"><strong class="${searchVO.procType eq 'update' ? '' : 'th_tit'} pwnoTh">비밀번호</strong></th>
                        <td colspan="">
                            <input type="password" id="pwd" name="pwd" class="text w50p" maxlength="20" placeholder="4~20자의 영문 대소문자, 숫자, 특수문자"/>
                            <c:if test="${searchVO.procType eq 'update'}">
                          		　<input type="checkbox" id="pwdUpdate" class="mar_t5 cursor"><label for="pwdUpdate" class="cursor"><span class="text">변경하기</span></label>
                            </c:if>
                        </td>
                        <th scope="row"><strong class="${searchVO.procType eq 'update' ? '' : 'th_tit'} pwnoTh">비밀번호 확인</strong></th>
                        <td colspan="">
                        	<input type="password" id="pwdRe" name="pwdRe" class="text w50p" maxlength="20" />
                        </td>
                    </tr>
                    <tr>
						<th scope="row"><strong class="th_tit">휴대전화</strong></th>
                        <td colspan="">
                            <input type="text" id="hp" name="hp" class="text w50p numOnly" maxlength="11" value="${tchrMngVO.hp }" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
                        </td>
						<th scope="row"><strong>전화번호</strong></th>
                        <td colspan="">
                            <input type="text" id="phone" name="phone" class="text w50p numOnly" maxlength="11" value="${tchrMngVO.phone }" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
                        </td>
					</tr>
                    <tr>
						<th scope="row"><strong class="th_tit">이메일</strong></th>
                        <td colspan="">
                            <input type="text" id="email" name="email" class="text w50p" maxlength="50" value="${tchrMngVO.email }" placeholder="이메일을 입력해주세요"/>
                            <a href="javascript:void(0)" class="btn btn_detail" onclick="checkEmail('email')" >중복확인</a>
                        </td>
                        <th scope="row"><strong>이메일 수신 여부</strong></th>
                        <td colspan="3">
							<input type="radio" id="emailYn_Y" name="emailYn" class="cursor" value="Y" ${tchrMngVO.emailYn eq 'Y' ? 'checked' : ''} /><label for="emailYn_Y" class="cursor">예</label>
                        	<input type="radio" id="emailYn_N" name="emailYn" class="cursor" value="N" ${tchrMngVO.emailYn eq 'N' ? 'checked' :	 empty tchrMngVO.emailYn ? 'checked' : ''} /><label for="emailYn_N" class="cursor">아니요</label>
                        </td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">생년월일<input type="hidden" id="birthdt" name="birthdt" value="${tchrMngVO.birthdt }"/></strong></th>
						<td colspan="" id="td_birthdt_1">
							<select name="byear" id="byear">
							    <option value="" ${empty tchrMngVO.byear ? 'selected':'' }>선택</option>
							    <c:forEach var="year" begin="1960" end="${curYear}">
							    	<option value="${year }" ${tchrMngVO.byear eq year ? 'selected':'' }>${year }</option>
							    </c:forEach>
							</select>년
							<select name="bmonth" id="bmonth">
							    <option value="" ${empty tchrMngVO.byear ? 'selected':'' }>선택</option>
							   	<c:forEach var="month" begin="1" end="12">
							    	<option value="${month }" ${tchrMngVO.bmonth eq month ? 'selected':'' }>${month }</option>
							    </c:forEach>
							</select>월
						</td>
						<th scope="row"><strong class="th_tit">성별</strong></th>
						<td colspan="">
							<input type="radio" id="gender_m" name="gender" class="cursor" value="M" ${tchrMngVO.gender eq 'M' ? 'checked' : '' }/><label for="gender_m" class="cursor"> 남자</label>　
							<input type="radio" id="gender_f" name="gender" class="cursor" value="F" ${tchrMngVO.gender eq 'F' ? 'checked' : '' }/><label for="gender_f" class="cursor"> 여자</label>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">주소</strong></th>
                        <td colspan="3">
							<input type="text" id="zonecode" name="zonecode" class="text w100 c pd_l0" maxlength="6" value="${tchrMngVO.zonecode }" readonly="readonly" placeholder="우편번호"/>
							<input type="text" id="addr" name="addr" class="text w30p" maxlength="50" value="${tchrMngVO.addr }" readonly="readonly" placeholder="주소"/>
							<a href="javascript:void(0)" class="btn btn_detail" onclick="daumAddress()">주소검색</a>
							<br />
							<input type="text" id="addrDetail" name="addrDetail" class="text w50p" maxlength="50" value="${tchrMngVO.addrDetail }" placeholder="상세주소" style="margin-top:5px;"/>
                        </td>
					</tr>
					<tr>
						<th scope="row"><strong>직업</strong></th>
						<td colspan="">
							<input type="text" id="job" name="job" class="text w50p" maxlength="20" value="${tchrMngVO.job }" placeholder="직업을 입력해주세요"/>
						</td>
						<td></td><td></td>
					</tr>
					<tr>
						<th scope="row"><strong>직장명(학교명)</strong></th>
						<td colspan="">
							<input type="text" id="jobName" name="jobName" class="text w50p" maxlength="50" value="${tchrMngVO.jobName }" placeholder="직장명(학교명)을 입력해주세요"/>
						</td>
						<th scope="row"><strong>부서명(학부/학과)</strong></th>
						<td colspan="">
							<input type="text" id="dptName" name="dptName" class="text w50p" maxlength="50" value="${tchrMngVO.dptName }" placeholder="부서명(학부/학과)을 입력해주세요"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>직급(학년)</strong></th>
						<td colspan="">
							<input type="text" id="position" name="position" class="text w50p" maxlength="50" value="${tchrMngVO.position }" placeholder="직급(학년)을 입력해주세요"/>
						</td>
						<th scope="row"><strong>홈페이지</strong></th>
						<td colspan="">
							<input type="text" id="homepage" name="homepage" class="text w50p" maxlength="50" value="${tchrMngVO.homepage }" placeholder="http://"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>회사 전화번호</strong></th>
                        <td colspan="">
                            <input type="text" id="workPhone" name="workPhone" class="text w50p numOnly" maxlength="11" value="${tchrMngVO.workPhone }" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
                        </td>
						<th scope="row"><strong>회사 팩스번호</strong></th>
                        <td colspan="">
                            <input type="text" id="workFax" name="workFax" class="text w50p numOnly" maxlength="11" value="${tchrMngVO.workFax }" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
                        </td>
					</tr>
					<tr>
                        <th scope="row"><strong>회원사여부</strong></th>
                        <td colspan="">
							<input type="radio" id="memberYn_Y" name="memberYn" class="cursor" value="Y" ${tchrMngVO.memberYn eq 'Y' ? 'checked' : ''} /><label for="memberYn_Y" class="cursor">회원사</label>
                        	<input type="radio" id="memberYn_N" name="memberYn" class="cursor" value="N" ${empty tchrMngVO.memberYn or tchrMngVO.memberYn eq 'N' ? 'checked' : ''} /><label for="memberYn_N" class="cursor">비회원사</label>
                        </td>
						<th scope="row"><strong>회원사 승인여부</strong></th>
                        <td colspan="">
							<input type="radio" id="memberAlwYn_Y" name="memberAlwYn" class="cursor" value="Y" ${tchrMngVO.memberAlwYn eq 'Y' ? 'checked' : ''} /><label for="memberAlwYn_Y" class="cursor">승인</label>
                        	<input type="radio" id="memberAlwYn_N" name="memberAlwYn" class="cursor" value="N" ${empty tchrMngVO.memberAlwYn or tchrMngVO.memberAlwYn eq 'N' ? 'checked' : ''} /><label for="memberAlwYn_N" class="cursor">미승인</label>
                        </td>
					</tr>
					<c:if test="${searchVO.procType eq 'update' }">
						<tr>
	                        <th scope="row"><strong>일반회원 전환</strong></th>
	                        <td colspan="">
								<input type="checkbox" id="bNrmlMember" name="bNrmlMember" class="cursor" onclick="fncTchr_move();"/><label for="bNrmlMember" class="cursor">체크시 일반회원으로 전환됩니다</label>
	                        </td>
	                        <td colspan="2"></td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		<br/>
		<div id="mgr_print">
			<div class="tbl_top">
				<div class="tbl_left">
					<h4 class="md_tit subTitle">강사정보</h4>
				</div>
				<div class="tbl_right"></div>
			</div>
			<table class="tbl_row_type01" id="table_tchr"> 
				<caption>강사회원 정보 입력</caption>
				<colgroup>
					<col style="width:7.5%;">
					<col style="width:7.5%;">
					<col style="width:8.75%;">
					<col style="width:8.75%;">
					<col style="width:8.75%;">
					<col style="width:8.75%;">
					<col style="width:7.5%;">
					<col style="width:7.5%;">
					<col style="width:8.75%;">
					<col style="width:8.75%;">
					<col style="width:8.75%;">
					<col style="width:8.75%;">
				</colgroup> 
				<tbody>
					<tr>
						<th scope="row" colspan="2"><strong>강사승인상태</strong></th>
						<td colspan="4">
							<select id="bAlTchrStus" name="bAlTchrStus" class="w50p">
								<option value="P" ${tchrMngVO.bAlTchrStus eq 'P' ? 'selected' : '' }>미신청</option>
								<option value="N" ${tchrMngVO.bAlTchrStus eq 'N' ? 'selected' : '' }>신청</option>
								<option value="O" ${tchrMngVO.bAlTchrStus eq 'O' ? 'selected' : '' }>승인</option>
								<option value="R" ${tchrMngVO.bAlTchrStus eq 'R' ? 'selected' : '' }>반려</option>
							</select>
						</td>
						<td colspan="6">
					</tr>
					<tr>
						<th scope="row" colspan="2"><strong class="th_tit">성명(한자)</strong></th>
						<td colspan="4">
							<input type="text" id="cname" name="cname" class="text w50p" value="${tchrMngVO.cname }" maxlength="20" placeholder="성명(한자)을 입력해주세요"/>
						</td>
					</tr>
					<tr>
						<th scope="row" colspan="12" class="c pd_l0"><strong>강의분야</strong></th>
					</tr>
					<tr>
						<th scope="row" colspan="2"><strong>대분류</strong></th>
	                       <td colspan="10">
	                           <input type="text" id="lctrL" name="lctrL" class="text w80p" value="${tchrMngVO.lctrL }" maxlength="100" placeholder="대분류를 입력해주세요"/>
	                       </td>
					</tr>
					<tr>
						<th scope="row" colspan="2"><strong>중분류</strong></th>
	                       <td colspan="10">
	                           <input type="text" id="lctrM" name="lctrM" class="text w80p" value="${tchrMngVO.lctrM }" maxlength="100" placeholder="중분류를 입력해주세요"/>
	                       </td>
					</tr>
					<tr>
						<th scope="row" colspan="2"><strong>소분류</strong></th>
	                       <td colspan="10">
	                           <input type="text" id="lctrS" name="lctrS" class="text w80p" value="${tchrMngVO.lctrS }" maxlength="100" placeholder="소분류를 입력해주세요"/>
	                       </td>
					</tr>
					<tr>
						<th scope="row" colspan="2"><strong>세분류</strong></th>
	                       <td colspan="10">
	                           <input type="text" id="lctrD" name="lctrD" class="text w80p" value="${tchrMngVO.lctrD }" maxlength="100" placeholder="세분류를 입력해주세요"/>
	                       </td>
					</tr>
					<tr>
						<th scope="row" colspan="2"><strong>기타</strong></th>
	                       <td colspan="10">
	                           <input type="text" id="lctrO" name="lctrO" class="text w80p" value="${tchrMngVO.lctrO }" maxlength="100" placeholder="기타를 입력해주세요"/>
	                       </td>
					</tr>
				
					<tr>
						<th scope="row" colspan="2"><strong>증명사진</strong></th>
	                       <td colspan="10">
	                       	<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${tchrMngVO.atchFileId }&fileCnt=1&atchFileIdNm=atchFileId&updateType=imageUpload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
	                           <input type="hidden" id="atchFileId" name="atchFileId"/>
	                       </td>
					</tr>
					<tr>
						<th scope="row" colspan="2"><strong class="th_tit">개인정보 수집·이용에<br/>대한 동의 추가</strong></th>
	                       <td colspan="4">
	                           <input type="radio" id="piYn_Y" name="piYn" class="cursor" value="Y" ${tchrMngVO.piYn eq 'Y' ? 'checked' : '' }/><label for="piYn_Y" class="cursor">동의함</label>　
	                           <input type="radio" id="piYn_N" name="piYn" class="cursor" value="N" ${tchrMngVO.piYn eq 'N' ? 'checked' : '' }/><label for="piYn_N" class="cursor">동의하지 않음</label>
	                       </td>
	                       <th scope="row" colspan="2"><strong class="th_tit">고유식별정보 처리에 대한 동의</strong></th>
	                       <td colspan="4">
	                           <input type="radio" id="uiYn_Y" name="uiYn" class="cursor" value="Y" ${tchrMngVO.uiYn eq 'Y' ? 'checked' : '' }/><label for="uiYn_Y" class="cursor">동의함</label>　
	                           <input type="radio" id="uiYn_N" name="uiYn" class="cursor" value="N" ${tchrMngVO.uiYn eq 'N' ? 'checked' : '' }/><label for="uiYn_N" class="cursor">동의하지 않음</label>
	                       </td>
					</tr>
					<tr>
						<th scope="row" colspan="2"><strong class="th_tit">개인정보의 제 3자 제공에<br/>대한 동의</strong></th>
	                       <td colspan="4">
	                           <input type="radio" id="pioYn_Y" name="pioYn" class="cursor" value="Y" ${tchrMngVO.pioYn eq 'Y' ? 'checked' : '' }/><label for="pioYn_Y" class="cursor">동의함</label>　
	                           <input type="radio" id="pioYn_N" name="pioYn" class="cursor" value="N" ${tchrMngVO.pioYn eq 'N' ? 'checked' : '' }/><label for="pioYn_N" class="cursor">동의하지 않음</label>
	                       </td>
	                       <td colspan="6"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<c:if test="${searchVO.procType eq 'update' }">
				<a href="javascript:void(0);" id="btn_del" class="btn btn_mdl btn_del">삭제</a>
			</c:if>
			<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncPopPrint();">강사카드 출력</a>
			<a href="javascript:void(0);" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_list">목록</a>
		</div>
	</form:form>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
<%-- 아이디 정규표현식. 영문 대소문자, 숫자 입력가능 --%>
var idChk = RegExp(/^[a-zA-Z0-9]{3,10}$/);
<%-- 비밀번호 정규표현식. 영문 대소문자, 숫자, 특수문자 입력가능 --%>
var pwChk = RegExp(/^[a-zA-Z0-9~`!@#$%^&*()-+\\_\\=\\?]{4,20}$/);
<%-- 일반전화 정규표현식 --%>
var phoneChk = RegExp(/^(02||0[3-6]{1}[1-5]{1})([0-9]{3,4})([0-9]{4})$/);
<%-- 핸드폰번호 정규표현식 --%>
var phnChk = RegExp(/^(01[0|1|6|7|8|9]{1})([0-9]{3,4})([0-9]{4})$/);
<%-- 팩스번호 정규표현식 --%>
var workFaxChk = RegExp(/^(02||0[0-9]{2})([0-9]{3,4})([0-9]{4})$/);
<%-- 이메일 정규표현식 --%>
var emlChk = RegExp(/^[0-9a-zA-Z-\\_\\.]*@[0-9a-zA-Z-\\_]*\.([a-zA-Z]{2,6}||[a-zA-Z]{2,6}.[a-zA-Z]{2,6})$/);
<%-- 주민번호 정규표현식 --%>
var juminChk = RegExp(/^([0-9]{2})(0[1-9]{1}||1[0-2]{1})(0[1-9]{1}||[1-2]{1}[0-9]{1}||3[0-1]{1})([1-4]{1})([0-9]{6})$/);

var daumAddress=function(){
	new daum.Postcode({
        oncomplete: function(data) {
            $("#addr").val(data.address);
            $("#zonecode").val(data.zonecode);
        }
    }).open();
}

<%-- 아이디, 색상, 메시지 입력하면 해당 input 옆에 유효성 메시지 표시 --%>
var errMsgHtml=function(mId, color, msg, dis){
	var display = "inline";
	if(dis != null){
		if(dis == "B"){
			display = "block";
		}
		if(dis == "IB"){
			display = "inline-block";
		}
	}
	
	$("#msg_"+mId).remove();
	if(color!=""&&color!=null&&msg!=""&&msg!=null){
		var msgHtml = '<span class="text" id="msg_'+mId+'" style="color:'+color+';display:'+display+'">'+msg+'</span>';
		$("#"+mId).parent().append(msgHtml);
	}
}

var bIdOk=false;
var checkId=function(idField){
	if(!idChk.test($("#"+idField).val())){
		errMsgHtml(idField,"red", "잘못된 아이디 입니다. 3~10자의 영문 대소문자, 숫자만 이용해주세요",'B');
		bIdOk=false;
		return false;
	}
	$.ajax({
		method : "POST",
		url : "/ma/mdev/mtchrmng/checkId.json",
		data : {"id" : $("#"+idField).val()},
		success : function(data){
			if(!data.success){
				errMsgHtml(idField,"red", data.msg);
				bIdOk=false;
			}else{
				errMsgHtml(idField,"green", data.msg);
				bIdOk=true;
			}
		},error : function(err){
			alert("통신에러");			
		}
	});
	return false;
}
var bEmailOk=false;
var checkEmail=function(idField){
	if(!emlChk.test($("#"+idField).val())){
		errMsgHtml(idField,"red", "잘못된 이메일 입니다");
		bEmailOk=false;
		return false;
	}
	$.ajax({
		method : "POST",
		url : "/ma/mdev/mtchrmng/checkEmail.json",
		data : {"email" : $("#"+idField).val()},
		success : function(data){
			if(!data.success){
				errMsgHtml(idField,"red", data.msg);
				bEmailOk=false;
			}else{
				errMsgHtml(idField,"green", data.msg);
				bEmailOk=true;
			}
		},error : function(err){
			alert("통신에러");			
		}
	});
	return false;
}
<c:if test="${searchVO.procType eq 'insert'}">
$("#id").keypress(function(){
	if (window.event.keyCode == 13) {
		checkId('id');
	}
});
</c:if>

$('#id').on('input',function(e){
	var bIdOk=false;
	console.log("##id changed");
});
$('#email').on('input',function(e){
	var bEmailOk=false;
	console.log("##email changed");
});

var lastDate = new Date($("#byear").val(), $("#bmonth").val(), 0).getDate();
var bdateHtml='<select name="bdate" id="bdate" class="bdate">'
bdateHtml+='<option value="" ${empty tchrMngVO.bdate ? "selected":"" }>선택</option>'
	bdateHtml+='</select><span class="bdate">일</span>'
$('#byear, #bmonth').on('change',function(e){
	if(!$("#byear").val().trim() || !$("#bmonth").val().trim()){
		alert("byear:"+$("#byear").val()+",bmonth:"+$("#bmonth").val())
		return false;
	}
	$(".bdate").remove();
	/*
	<select name="bmonth" id="bmonth">
							    <option value="" ${empty tchrMngVO.byear ? 'selected':'' }>선택</option>
							   	<c:forEach var="month" begin="1" end="12">
							    	<option value="${month }" ${tchrMngVO.bmonth eq month ? 'selected':'' }>${month }</option>
							    </c:forEach>
							</select>월
							*/
	lastDate = new Date($("#byear").val(), $("#bmonth").val(), 0).getDate();
	bdateHtml='<select name="bdate" id="bdate" class="bdate">'
	bdateHtml+='<option value="" ${empty tchrMngVO.bdate ? "selected":"" }>선택</option>'
	for(var i=1 ; i<= +lastDate;i++){
		bdateHtml+='<option value="'+i+'" ${tchrMngVO.bdate eq '+i+' ? "selected":"" }>'+i+'</option>'			
	}
	bdateHtml+='</select><span class="bdate">일</span>'
	$("#td_birthdt_1").append(bdateHtml);
	return false;
});

<%--생년월일 항목에서 Date옵션 추가--%>
$("#td_birthdt_1").append(bdateHtml);

$("#btn_submit").on("click",function(){
	var bValid=false;
	$("[ID^=msg_]").remove();
	if(!bIdOk){
		errMsgHtml('id',"red", "아이디 중복확인을 해주세요");
		bValid=false;
	}
	if(!bEmailOk){
		errMsgHtml('email',"red", "이메일 중복확인을 해주세요");
		bValid=false;
	}
	if(!$("#id").val().trim()){
		errMsgHtml('id',"red", "아이디를 입력해주세요");
		bValid=false;
	}
	if(!$("#name").val().trim()){
		errMsgHtml('name',"red", "이름을 입력해주세요");
		bValid=false;
	}
	if('${searchVO.procType}' == 'insert'){
		if(!$("#pwd").val().trim()){
			errMsgHtml('pwd',"red", "비밀번호를 입력해주세요");
			bValid=false;
		}
		if(!$("#pwdRe").val().trim()){
			errMsgHtml('pwd',"red", "비밀번호 확인란을 입력해주세요");
			bValid=false;
		}
		if(!$("#pwd").val() != !$("#pwdRe").val()){
			errMsgHtml('pwd',"red", "비밀번호와 비밀번호 확인란이 일치하지 않습니다",'B');
			bValid=false;
		}
	}
	if(!$("#hp").val().trim()){
		errMsgHtml('hp',"red", "휴대전화를 입력해주세요");
		bValid=false;
	}
	if(!$("#email").val().trim()){
		errMsgHtml('email',"red", "이메일을 입력해주세요");
		bValid=false;
	}
	if (!$("input[name='gender']:checked").val()) {
		errMsgHtml('gender_f',"red", "성별을 선택해주세요");
		bValid=false;
    }
	if(!$("#zonecode").val().trim() || !$("#addr").val().trim()){
		errMsgHtml('addr',"red", "주소를 입력해주세요",'B');
		bValid=false;
	}
	if(!$("#cname").val().trim()){
		errMsgHtml('cname',"red", "성명(한자)를 입력해주세요",);
		bValid=false;
	}
	if (!$("input[name='piYn']:checked").val()) {
		errMsgHtml('piYn_N',"red", "동의함, 동의하지 않음중 선택해주세요");
		bValid=false;
    }
	if (!$("input[name='uiYn']:checked").val()) {
		errMsgHtml('uiYn_N',"red", "동의함, 동의하지 않음중 선택해주세요");
		bValid=false;
    }
	if (!$("input[name='pioYn']:checked").val()) {
		errMsgHtml('pioYn_N',"red", "동의함, 동의하지 않음중 선택해주세요");
		bValid=false;
    }
	
	fncPageBoard('submit','${searchVO.procType}Proc.do');
	return false;
})
</script>