package com.open.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.util.StringUtil;

@Alias("caVO")
public class CaVO  extends CmmnDefaultVO implements Serializable{

	private static final long serialVersionUID = 2172623835339565860L;
	
	private String calSeq;				// 일련번호
	private String dataDate;		// 등록일
	private String startTime;		// 시작시간
	private String endTime;			// 종료시간
	private String holYn;			// 기념일구분
	private String calCont;				// 내용
	private String rgstId;			// 작성자
	private String rgstDt;			// 작성일
	private String rvseId;			// 수정자
	private String rvseDt;			// 수정일
	private String useYn;			// 사용여부
	private String selectedYear;	// 선택 년도
	private String selectedMonth;	// 선택 월
	private String schYearMonth;	// 선택 년월
	
	private String endHour;			// 종료 시
	private String endMinute;		// 종료 분
	private String startHour;		// 시작 시
	private String startMinute;		// 시작 분
	
	private String[] arrSelect;
	

	public String[] getArrSelect() {
		String[] newArrSelect = null;
		if(this.arrSelect!=null){
			newArrSelect = new String[arrSelect.length];
			for (int i = 0; i < arrSelect.length; i++) {
				newArrSelect[i] = this.arrSelect[i];
			}
		}
		return newArrSelect;
	}
	public void setArrSelect(String[] arrSelect) {
		this.arrSelect = arrSelect;
		this.arrSelect = new String[arrSelect.length];
		for (int i = 0; i < arrSelect.length; i++)
			this.arrSelect[i] = arrSelect[i];
	}
	public String getStartTime() throws Exception {
		
		if(!StringUtil.nullString(this.getStartHour()).equals("") && !StringUtil.nullString(this.getStartMinute()).equals("")){
			
			this.startTime = this.getStartHour() + ":" + this.getStartMinute();
			
		}
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() throws Exception {
		
		if(!StringUtil.nullString(this.getEndHour()).equals("") && !StringUtil.nullString(this.getEndMinute()).equals("")){
			
			this.endTime = this.getEndHour() + ":" + this.getEndMinute();
			
		}
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getStartHour() {
		return startHour;
	}
	public void setStartHour(String startHour) {
		this.startHour = startHour;
	}
	public String getStartMinute() {
		return startMinute;
	}
	public void setStartMinute(String startMinute) {
		this.startMinute = startMinute;
	}
	public String getEndHour() {
		return endHour;
	}
	public void setEndHour(String endHour) {
		this.endHour = endHour;
	}
	public String getEndMinute() {
		return endMinute;
	}
	public void setEndMinute(String endMinute) {
		this.endMinute = endMinute;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getHolYn() {
		return holYn;
	}
	public void setHolYn(String holYn) {
		this.holYn = holYn;
	}
	public String getSchYearMonth() {
		return schYearMonth;
	}
	public void setSchYearMonth(String schYearMonth) {
		this.schYearMonth = schYearMonth;
	}
	public String getSelectedYear() {
		return selectedYear;
	}
	public void setSelectedYear(String selectedYear) {
		this.selectedYear = selectedYear;
	}
	public String getSelectedMonth() {
		return selectedMonth;
	}
	public void setSelectedMonth(String selectedMonth) {
		this.selectedMonth = selectedMonth;
	}
	public String getDataDate() {
		return dataDate;
	}
	public void setDataDate(String dataDate) {
		this.dataDate = dataDate;
	}
	public String getRgstId() {
		return rgstId;
	}
	public void setRgstId(String rgstId) {
		this.rgstId = rgstId;
	}
	public String getRgstDt() {
		return rgstDt;
	}
	public void setRgstDt(String rgstDt) {
		this.rgstDt = rgstDt;
	}
	public String getRvseId() {
		return rvseId;
	}
	public void setRvseId(String rvseId) {
		this.rvseId = rvseId;
	}
	public String getRvseDt() {
		return rvseDt;
	}
	public void setRvseDt(String rvseDt) {
		this.rvseDt = rvseDt;
	}
	public String getCalSeq() {
		return calSeq;
	}
	public void setCalSeq(String calSeq) {
		this.calSeq = calSeq;
	}
	public String getCalCont() {
		return calCont;
	}
	public void setCalCont(String calCont) {
		this.calCont = calCont;
	}
	
	
}
