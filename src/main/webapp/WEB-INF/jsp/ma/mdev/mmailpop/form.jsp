<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

<div class="content_box">
	<form:form commandName="mailVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="atchFileId" id="atchFileId"/>
		
		<%-- 체크박스에서 선택한 데이터들을 strJson으로 담아놓을때 쓰이는 inputbox --%>
		<input type="hidden" name="col1" id="col1" value="${searchVO.col1}"/>
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
						<th scope="row"><strong class="th_tit">받는사람</strong></th>
						<td colspan="3">
							<ul id="receiver" class="mail_select_list">
								
							</ul>
							<a href="javascript:void(0);" class="btn btn_sml btn_ok" onclick="popupUserList();">팝업 주소록</a>
							<a href="javascript:void(0);" class="btn btn_sml btn_ok" onclick="modalEmailList();">모달 주소록</a>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">양식</strong></th>
						<td colspan="3">
							<label><input id="contStyle1" name="contStyle" onchange="fncContStyle(this.value);" type="radio" value="0"
							 <c:if test="${empty mailVO.wform or mailVO.wform eq 0}">checked="checked"</c:if>/>없음</label>
							<label class="mar_l20"><input id="contStyle2" name="contStyle" onchange="fncContStyle(this.value);" type="radio" value="1"
							 <c:if test="${mailVO.wform eq 1}">checked="checked"</c:if>/>1번</label>
							<label class="mar_l20"><input id="contStyle3" name="contStyle" onchange="fncContStyle(this.value);" type="radio" value="2"
							 <c:if test="${mailVO.wform eq 2}">checked="checked"</c:if>/>2번</label>
							<label class="mar_l20"><input id="contStyle4" name="contStyle" onchange="fncContStyle(this.value);" type="radio" value="3"
							 <c:if test="${mailVO.wform eq 3}">checked="checked"</c:if>/>3번</label>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">제목</strong></th>
						<td colspan="3">
							<input type="text" name="title" id="title" class="text w100p"  required="required"  maxlength="50" value="${util:unEscape(mailVO.title) }" />
							<form:errors path="title" cssClass="error" cssStyle="color:#ff0000" /> 
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="cont" id="cont" class="txt_area w_100p" >${util:unEscape(mailVO.cont)}</textarea>
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

<%-- 이메일을 보낼때 내용부분에 삽입되는 양식 --%>
<div id="pdfFormA" style="display: none; "> 
	<div style="width: 100%;height:100%;margin:0;padding:0;font-size:14px;line-height:1.4;font-family:'Noto Sans KR', 'Malgun Gothic', 'Helvetica Neue', 'Helvetica', 'Dotum';color:#000000;  background:url(<spring:eval expression="@setProperties['isp.domain']"/>/publish/ma/images/mail/bg_mail_top2.jpg) 45px 0px no-repeat;">   
		<div style="width:720px;padding:20px 0 30px 0;margin:25px 0 0 45px;border:1px solid #e2e2e2; box-shadow: 0px 0px 10px #e2e2e2; border-top:none;">
			<h1 style="padding-left:45px; margin-top:20px;"><img src="<spring:eval expression="@setProperties['isp.domain']"/>/publish/ma/images/mail/mail_logo_top.jpg" alt="한국전파진흥협회"></h1>
			<div style="margin:60px 0 0 45px;">
            	<span style="border-top:2px solid #009ce8; padding-left:55px;"></span> 
        	  	<h2 style="margin:-10px 0 0 0; font-size:34px; font-weight:500; letter-spacing:-0.8px;"> 서비스 문의에 대한 답변드립니다.</h2>
              	<div style="width:608px; border:1px solid #e6f1f5; padding:30px 25px; margin:30px 0 0 0; background:#f4fcff; color:#333333;">
              		<p style="width:100%; color:#333333;">&nbsp;</p>
              	</div>                
                               
        	</div>
        	<div style="width:221px; height:50px; background:url(http://121.179.119.218:8000/publish/ma/images/mail/mail_from_btn.jpg) no-repeat; color:#fff; font-size:15px; font-weight:500; margin:30px auto; " >
                	<a href="<spring:eval expression="@setProperties['isp.domain']"/>" style="color:#fff; text-decoration:none;"><p style="padding:15px 0 0 40px;">홈페이지 바로가기</p></a>
                </div> 
            <p style="background:url(/publish/ma/images/mail/mail_from_info.png) no-repeat 40px 9px #f9fafa; height:25px; padding:10px 0 0 65px; font-size:11px; color:#888888; ">
            	본 메일은 발신전용 메일이므로 궁금한점은 고객센터로연락주시거나 서비스 문의를 이용해 주시기 바랍니다. 
            </p>
           <div style="margin-top:29px; padding-left:80px; background:url('<spring:eval expression="@setProperties['isp.domain']"/>/publish/ma/images/mail/mail_logo_btom.png') 40px top no-repeat;">
           		<ul style="list-style:none;  line-height:17px; font-size:11px; font-weight:100; color:#555555">
                	<li>서울특별시 양천구 목동중앙로13나길 3  </li>
				    <li>TEL : 02.317.6000     FAX: (02)317.6060</li>
				    <li>Copyright © 2020 by Korea Radio Promotion Association. All Rights Reserved.</li>
                </ul>
           </div>
		</div>
	</div>
</div>

<div id="pdfFormB" style="display: none;">
	<div style="width: 100%;height:100%;margin:0;padding:0;font-size:14px;line-height:1.4;font-family:'Noto Sans KR', 'Malgun Gothic', 'Helvetica Neue', 'Helvetica', 'Dotum';color:#000000; ">    
		<div style="width:720px;padding:20px 0 20px 0;margin:25px 0 0 45px;border:1px solid #e2e2e2; box-shadow: 0px 0px 10px #e2e2e2; ">
			<h1 style="padding-left:30px;"><img src="<spring:eval expression="@setProperties['isp.domain']"/>/publish/ma/images/mail/mail_logo_top.jpg" alt="한국전파진흥협회"></h1>
			<div style="background:#6f8de7; height:110px;  color:#fff; padding:5px 0 0 30px; ">   
				<p style="padding:10px 0 0 3px; color:#dbe1f8">한국전파진흥협회에서 안내드립니다.</p>   
				<h2 style="font-weight:500;  letter-spacing:-1px; font-size:34px; margin-top:1px;"> 서비스 문의에 대한 답변드립니다.</h2>
			</div>
	        <div style="margin:40px 0 0 45px;">
				<div style="width:608px; padding:0 0 20px 0; olor:#333333; line-height:25px;">&nbsp;</div>
				<div style="width:221px; height:50px; background:url(<spring:eval expression="@setProperties['isp.domain']"/>/publish/ma/images/mail/mail_from_btn.jpg) no-repeat; color:#fff; font-size:15px; font-weight:500; " >
					<a href="<spring:eval expression="@setProperties['isp.domain']"/>" style="color:#fff; text-decoration:none;">	<p style="padding:15px 0 0 40px;">홈페이지 바로가기</p></a>
				</div>                
			</div>
			<p style="background:url(<spring:eval expression="@setProperties['isp.domain']"/>/publish/ma/images/mail/mail_from_info.png) no-repeat 40px 9px #f9fafa; height:25px;margin:38px 0 0 0; padding:10px 0 0 65px; font-size:11px; color:#888888; ">
				본 메일은 발신전용 메일이므로 궁금한점은 고객센터로연락주시거나 서비스 문의를 이용해 주시기 바랍니다. 
			</p>
			<div style="margin-top:29px; padding-left:80px; background:url('<spring:eval expression="@setProperties['isp.domain']"/>/publish/ma/images/mail/mail_logo_btom.png') 40px top no-repeat";>
				<ul style="list-style:none;  line-height:17px; font-size:11px; font-weight:100; color:#555555">
					<li>서울특별시 양천구 목동중앙로13나길 3  </li>
				    <li>TEL : 02.317.6000     FAX: (02)317.6060</li>
				    <li>Copyright © 2020 by Korea Radio Promotion Association. All Rights Reserved.</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div id="pdfFormC" style="display: none;">
	<div style="width: 100%;height:100%;margin:0;padding:0;font-size:14px;line-height:1.4;font-family:'Noto Sans KR', 'Malgun Gothic', 'Helvetica Neue', 'Helvetica', 'Dotum';color:#000000; ">    
		<div style="width:720px;margin:0px 0 0 45px;border:1px solid #e2e2e2; box-shadow: 0px 0px 10px #e2e2e2; border-top:none; background:url(<spring:eval expression="@setProperties['isp.domain']"/>/publish/ma/images/mail/bg_mail_bg.jpg) repeat-x;">
			<h1 style="padding-left:45px; padding-top:20px;">
				<img src="<spring:eval expression="@setProperties['isp.domain']"/>/publish/ma/images/mail/mail_logoW_top.png" alt="한국전파진흥협회">
			</h1>
			<div style="margin:50px 0 0 45px;">
				<h2 style="; font-size:34px; font-weight:500; letter-spacing:-0.8px;"> 서비스 문의에 대한 답변드립니다.</h2>
				<span style="border-top:2px solid #0080c9; padding-left:35px;"></span>
				             
				<div style="width:608px;padding:0px 0 10px 0;color:#333333; line-height:24px;">&nbsp;</div>
				<div style="width:221px; height:50px; background:url(<spring:eval expression="@setProperties['isp.domain']"/>/publish/ma/images/mail/mail_from_btn.jpg) no-repeat; color:#fff; font-size:15px; font-weight:500; " >
					<a href="<spring:eval expression="@setProperties['isp.domain']"/>" style="color:#fff; text-decoration:none;"><p style="padding:15px 0 0 40px;">홈페이지 바로가기</p></a>
				</div>                
			</div>
			<div style="background:#d3d3dd; width:720px; height:145px; margin:40px 0 0 0">
				<h3 style="float:left; margin:30px 0 0 40px;"> <img src="<spring:eval expression="@setProperties['isp.domain']"/>/publish/ma/images/mail/mail_logoW_btom.png" alt=""> </h3>
				<p style="float:left; width:568px; background:url(<spring:eval expression="@setProperties['isp.domain']"/>/publish/ma/images/mail/mail_from_info.png) no-repeat; margin:30px 0 0 20px; height:25px;padding:0px 0 5px 25px; font-size:11px; color:#888888;border-bottom:1px solid #e5e5eb; ">
					본 메일은 발신전용 메일이므로 궁금한점은 고객센터로연락주시거나 서비스 문의를 이용해 주시기 바랍니다. 
				</p>
				<ul style="list-style:none; float:left;  line-height:17px; font-size:11px; font-weight:100; color:#555555">
					<li>서울특별시 양천구 목동중앙로13나길 3  </li>
				    <li>TEL : 02.317.6000     FAX: (02)317.6060</li>
				    <li>Copyright © 2020 by Korea Radio Promotion Association. All Rights Reserved.</li>
				</ul>
		  	</div>
		</div>
	</div>
</div>
<%-- 양식 끝 --%>

<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
<%-- 부모창과 자식창(팝업) 사이에서 공유될 변수. 선택한 체크박스의 정보를 담는용도로 쓰인다. 현재 페이지 내에선 var col1Json=[] 와 동일하게 쓰인다--%>
window.col1Json=[];

var oEditors = [];
	
<%-- 에디터 --%>
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "cont",
    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
}); 
$("#btn_submit").on("click", function(){
	
	if($("#title").val() == "" || $("#title").val() == null) {
		alert("제목을 입력해주세요");
		$("#title").focus();
		return false;
	}
		oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
		
	if($("#cont").val()=='<p>&nbsp;</p>') {
		alert("내용을 입력해주세요");
		oEditors.getById["cont"].exec("FOCUS"); /* 에디터 */
		return false;
	}		
	
	if($("[ID^=pickedcol1Item_]").size() < 1){
		alert("받는사람을 선택해주세요");
		return false;
	}
	fncPageBoard('submit','${searchVO.procType}Proc.do');
	return false;
});

$("#btn_returnView").click(function(){
	$("#boardSeq").val($("#boardGrpSeq").val());
	fncPageBoard('view','view.do');
});

<%--팝업창을 띄우는 코드--%>
var popupUserList=function() {
	<%-- 체크박스에서 선택한  strJson 데이터들을 child(popup)에 보낼때 쓰이는 코드 --%>
	window.col1JsonStr=$("#col1").val().trim();
	fncPageBoard('pop','pop.do','','','1000','500');
}

<%--모달창을 띄우는 코드--%>
var modalEmailList=function(){
	$.ajax({
	    url: "popModal.do",
	    dataType: "HTML",  
	    success: function(data) { 
	    	$("#display_view1").html(data);
	    	view_show(1);
	    }
	});	
}

var fncUserDel=function(elemntId){
	$("#picked"+elemntId).remove();
	return false;
}

<%--이메일 보낼때 내용의 양식을 선택하는 코드--%>
function fncContStyle(val) {
	$("#cont").next().remove();
	
	var htmlContStyle = '';
	
	if (val == '0') {
		htmlContStyle = '';
	} else if (val == '1') {
		htmlContStyle = $("#pdfFormA").html();
	} else if (val == '2') {
		htmlContStyle = $("#pdfFormB").html();
	} else if (val == '3') {
		htmlContStyle = $("#pdfFormC").html();
	}
	
	$("#cont").val(htmlContStyle);
	
	<%-- 에디터  --%>
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "cont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
	
}
</script>