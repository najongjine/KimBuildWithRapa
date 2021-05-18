<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<%--
<table class="state_tbl">
	<colgroup>
		<col style="width:25%">
		<col style="width:25%">
		<col>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">구분</th>
			<th scope="col">합계</th>
		</tr>
	</thead>
	<tbody>
		<th scope="row">${compl.visitDate }년도 민원 전체합계</th>
		<td class="point01"><fmt:formatNumber value="${compl.total }" pattern="#,###"/></td>
	</tbody>
</table>

 --%>
<table class="state_tbl">
	<colgroup>
		<c:forEach var="result" items="${complChrtList }">
			<col>
		</c:forEach>
	</colgroup>
	<thead>
		<tr>
			<c:forEach var="result" items="${complChrtList }">
				<th scope="col"><c:out value="${result.visitDate}"/></th>
			</c:forEach>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="result" items="${complChrtList }">
			<td class="point01"><fmt:formatNumber value="${result.total }" pattern="#,###"/></td>
		</c:forEach>
	</tbody>
</table>

<script type="text/javascript">
<%-- 차트를 그릴때 필요한 합계 데이터.--%>
var arrComplData = [];
<%-- 차트를 그릴때 필요한 년도 데이터.--%>
var arrComplCategory = [];

<c:forEach var="result" items="${complChrtList }" varStatus="status">
	arrComplData.push(+'${result.total}');
	arrComplCategory.push('${result.visitDate}');
</c:forEach>

<%--차트를 그릴 element id--%>
Highcharts.chart('chart01', {
    chart: {//
        type: 'line'
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
     categories: arrComplCategory
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
		data: arrComplData,
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

fncPageBoard('addList','addList.do','1');
</script>
