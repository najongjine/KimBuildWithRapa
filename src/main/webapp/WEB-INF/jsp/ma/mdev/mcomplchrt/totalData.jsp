<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<%-- 차트화면 부분 --%>
<div class="main_chart">
	<h2 class="m_title">전자파 민원 통계 현황</h2>
	<br/>
	<div class="chart_box">
		<div id="chart01" class="w100p" style="height:100%"></div>
	</div>
</div>

<%-- 엑셀 다운로드, 업로드 버튼. element들을 한줄로 보이게 하는 css까지 다 들어있음 --%>
<div class="tbl_top mar_t15">
	<div class="tbl_left"></div>
	<div class="tbl_right">  
        <a href="javascript:void(0)" class="btn btn_excel btn_sml03" onclick="fncPageBoard('list','excelDown.do')"><span>엑셀 다운로드</span></a>
        <a href="#" class="btn btn_save btn_sml03" onclick="fncAddFileForm();">데이터등록</a>
    </div>
</div>

<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup>
			<col>
			<col>
			<col>
			<col>
			<col>
			<col>
			<col>
			<col>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">${searchVO.schEtc01 eq 'Y' ? '연도' : searchVO.schEtc01 eq 'M' ? '월' : '-' }</th>
				<th scope="col">수도권</th>
				<th scope="col">경상권</th>
				<th scope="col">충청권</th>
				<th scope="col">전라권</th>
				<th scope="col">강원권</th>
				<th scope="col">제주권</th>
				<!-- <th scope="col">기타</th> -->
				<th scope="col">합계</th>	
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">						
					<c:forEach var="result" items="${resultList }" varStatus="status">
						<tr>
							<td>${result.visitDate}</td>
							<td class="r"><a href="javascript:void(0);" onclick="fncAddList('${result.visitDateReal}','수도권');"><fmt:formatNumber  value="${result.area1}" pattern="#,###" /> 건</a></td>
							<td class="r"><a href="javascript:void(0);" onclick="fncAddList('${result.visitDateReal}','경상권');"><fmt:formatNumber  value="${result.area2}" pattern="#,###" /> 건</a></td>		
							<td class="r"><a href="javascript:void(0);" onclick="fncAddList('${result.visitDateReal}','충청권');"><fmt:formatNumber  value="${result.area3}" pattern="#,###" /> 건</a></td>
							<td class="r"><a href="javascript:void(0);" onclick="fncAddList('${result.visitDateReal}','전라권');"><fmt:formatNumber  value="${result.area4}" pattern="#,###" /> 건</a></td>
							<td class="r"><a href="javascript:void(0);" onclick="fncAddList('${result.visitDateReal}','강원권');"><fmt:formatNumber  value="${result.area5}" pattern="#,###" /> 건</a></td>									
							<td class="r"><a href="javascript:void(0);" onclick="fncAddList('${result.visitDateReal}','제주권');"><fmt:formatNumber  value="${result.area6}" pattern="#,###" /> 건</a></td>								
							<%-- <td class="r"><a href="javascript:void(0);" onclick="fncAddList('${result.visitDateReal}','기타');"><fmt:formatNumber  value="${result.area7}" pattern="#,###" /> 건</a></td> --%>																		
							<%-- <td class="r"><a href="javascript:void(0);" onclick="fncAddList('${result.visitDateReal}','');"><fmt:formatNumber  value="${result.area1+result.area2+result.area3+result.area4+result.area5+result.area6+result.area7}" pattern="#,###" /> 건</a></td> --%>
							<td class="r"><a href="javascript:void(0);" onclick="fncAddList('${result.visitDateReal}','');"><fmt:formatNumber  value="${result.area1+result.area2+result.area3+result.area4+result.area5+result.area6}" pattern="#,###" /> 건</a></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<%-- //tbl end --%>
<script type="text/javascript">
$(document).ready(function(){
	fncColLength();
});

<%-- 엑셀업로드 버튼 누를시 모달창을 띄우는 코드 --%>
var fncAddFileForm=function(){
	$.ajax({
	    method: "POST",
	    url: "addFileForm.do",	    
	    dataType: "HTML",  
	    success: function(data) { 
	    	$("#display_view1").html(data);
	    	view_show(1);
	    }
	});	
}

<%-- 통계 테이블에서 x건 누를시 addList 테이블을 갱신 시켜주는 코드 --%>
function fncAddList(schEtc05, schEtc06){
	$("#schEtc05").val(schEtc05); //년도
	$("#schEtc06").val(schEtc06); // 지역명칭
	fncPageBoard('addList','addList.do','1');
}

/*json으로 묶으면 차트를 그릴때 문제가 생긴다*/
/* 차트를 그릴때 필요한 합계 데이터.*/
var arrData = [];
/* 차트를 그릴때 필요한 년도 데이터.*/
var arrCategory = [];
<c:choose>
	<c:when test="${searchVO.schEtc01 eq 'Y'}">
		<%-- 통계 쿼리로 나온 데이터 --%>
		<c:forEach var="list" items="${resultList }" varStatus="status">
			<%--x년도의 데이터 총 합계를 뜻함 --%>
			var totalNum=Number("<c:out value="${list.area1+list.area2+list.area3+list.area4+list.area5+list.area6+list.area7 }"/>");
			var year="<c:out value="${list.visitDate }"/>";
			arrData.unshift(totalNum);
			arrCategory.unshift(year);
		</c:forEach>
	</c:when>
	<c:when test="${searchVO.schEtc01 eq 'M'}">
		<c:forEach var="list" items="${resultList }" varStatus="status">
			arrData.push(Number("<c:out value="${list.area1+list.area2+list.area3+list.area4+list.area5+list.area6+list.area7 }"/>"));
			arrCategory.push("<c:out value="${list.visitDate }"/>");
		</c:forEach>
	</c:when>
</c:choose>

<%--차트를 그릴 element id--%>
Highcharts.chart('chart01', {
    chart: {//
        type: 'column'
    },
    <%-- 제목 부분은 opennote 양식을 사용하기 때문에 false--%>
    title: false,
    navigation: {
       buttonOptions: {
         y: -1000 //차트 다운버튼 화면에서 숨김
       }
    },
    credits: {
       enabled: false //하단 하이차트 주소 숨김
    },
    yAxis: {
        title: false,
        labels : {//
            format: '{value:,.0f}'
        }
    },
    xAxis: {
     categories: arrCategory
    },
    plotOptions: {
        line: {
          dataLabels: {
            enabled: true
          }
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span>',
        pointFormat: '<table><tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                   '<td style="padding:0"><b>{point.y:,.0f}건</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    series: [{
		name: '민원합계',
		data: arrData,
		color:'#063D7C',
		pointWidth: 40,
		dataLabels: {
		    enabled: true, // 차트(막대) 안의 데이터 표기 여부 (true : 표기, false : 미표기)
		    rotation: 0, // 차트(막대) 안의 데이터 텍스트 각도
		    color: '#FFFFFF', // 차트(막대) 안의 데이터 텍스트 색상
		    align: 'right', // 정렬
		    format: '{point.y:,.0f}', // one decimal
		    y: 0, // 10 pixels down from the top
		    x: -5,
		    style: {
		      fontSize: '13px',
		      fontFamily: 'Verdana, sans-serif'
		    }
		  }
    }]
});
Highcharts.setOptions({
    lang : {
       thousandsSep:','
    }
});
</script>