package com.open.vo;

import org.apache.ibatis.type.Alias;

/**
 * Content VO 클래스
 * @author 공통서비스 개발팀 yd.go
 * @since 2016.09.08
 * @version 1.0
 * @see
 *  
 
 */
@Alias("mmainbannerVO")
public class MMainBannerVO {
	/**
	 * 
	 */
	private String seq;
	private String mmainSeq;
	private String bannerTitle;
	private String url;
	private String notiYn;
	private String rgstDt;
	private String rgstId;
	private String rvseDt;
	private String rvseId;
	private String useYn;
	private String staDate;
	private String endDate;
	private String iorder;
	private String newtab;
	private String atchFileId;
	private String minFileSn="0";

	private String cnt;
	private String name;
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getMmainSeq() {
		return mmainSeq;
	}
	public void setMmainSeq(String mmainSeq) {
		this.mmainSeq = mmainSeq;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getNotiYn() {
		return notiYn;
	}
	public void setNotiYn(String notiYn) {
		this.notiYn = notiYn;
	}
	public String getRgstDt() {
		return rgstDt;
	}
	public void setRgstDt(String rgstDt) {
		this.rgstDt = rgstDt;
	}
	public String getRgstId() {
		return rgstId;
	}
	public void setRgstId(String rgstId) {
		this.rgstId = rgstId;
	}
	public String getRvseDt() {
		return rvseDt;
	}
	public void setRvseDt(String rvseDt) {
		this.rvseDt = rvseDt;
	}
	public String getRvseId() {
		return rvseId;
	}
	public void setRvseId(String rvseId) {
		this.rvseId = rvseId;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
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
	public String getNewtab() {
		return newtab;
	}
	public void setNewtab(String newtab) {
		this.newtab = newtab;
	}
	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
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
	public String getBannerTitle() {
		return bannerTitle;
	}
	public void setBannerTitle(String bannerTitle) {
		this.bannerTitle = bannerTitle;
	}
	public String getIorder() {
		return iorder;
	}
	public void setIorder(String iorder) {
		this.iorder = iorder;
	}
	public String getMinFileSn() {
		return minFileSn;
	}
	public void setMinFileSn(String minFileSn) {
		this.minFileSn = minFileSn;
	}
	
}