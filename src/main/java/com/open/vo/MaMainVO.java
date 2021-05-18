package com.open.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

/**
 * Content VO 클래스
 * @author 공통서비스 개발팀 yd.go
 * @since 2016.09.08
 * @version 1.0
 * @see
 *  
 
 */
@Alias("maMainVO")
public class MaMainVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String seq;
	private String title;
	private String cont;
	private String rgstDt;
	private String atchFileId;
	private String staDate;
	private String endDate;
	private String rgstId;
	private String cnt;
	private String name;
	private String bStatus;
	
	private String maCnt;
	private String ftCnt;
	private String imonth;
	private String year;
	
	private String nStusCnt;
	private String pStusCnt;
	private String rStusCnt;
	private String oStusCnt;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getRgstDt() {
		return rgstDt;
	}
	public void setRgstDt(String rgstDt) {
		this.rgstDt = rgstDt;
	}
	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
	public String getStaDate() {
		return staDate;
	}
	public void setStaDate(String staDate) {
		this.staDate = staDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getRgstId() {
		return rgstId;
	}
	public void setRgstId(String rgstId) {
		this.rgstId = rgstId;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMaCnt() {
		return maCnt;
	}
	public void setMaCnt(String maCnt) {
		this.maCnt = maCnt;
	}
	public String getFtCnt() {
		return ftCnt;
	}
	public void setFtCnt(String ftCnt) {
		this.ftCnt = ftCnt;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getbStatus() {
		return bStatus;
	}
	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getnStusCnt() {
		return nStusCnt;
	}
	public void setnStusCnt(String nStusCnt) {
		this.nStusCnt = nStusCnt;
	}
	public String getpStusCnt() {
		return pStusCnt;
	}
	public void setpStusCnt(String pStusCnt) {
		this.pStusCnt = pStusCnt;
	}
	public String getrStusCnt() {
		return rStusCnt;
	}
	public void setrStusCnt(String rStusCnt) {
		this.rStusCnt = rStusCnt;
	}
	public String getoStusCnt() {
		return oStusCnt;
	}
	public void setoStusCnt(String oStusCnt) {
		this.oStusCnt = oStusCnt;
	}
	public String getImonth() {
		return imonth;
	}
	public void setImonth(String imonth) {
		this.imonth = imonth;
	}
	
}