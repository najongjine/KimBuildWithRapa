package com.open.vo;

import java.io.Serializable;
import java.util.ArrayList;
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
@Alias("mmainVO")
public class MMainVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String seq;
	private String mainTitle;
	private String mainSubtitle;
	private String mainAddr;
	private String mainHp;
	private String mainFax;
	private String rprsntr;
	private String rgstDt;
	private String rgstId;
	private String rvseDt;
	private String rvseId;
	private String useYn;
	private String bgImg;
	private String mBgImg;
	private String mAdBoard1Seq;
	private String mAdBoard2Seq;
	private String mAdBoard3Seq;
	private String mAdBoard4Seq;
	
	private String cnt;
	private String name;
	
	private List<MMainBannerVO> mmainbannerList=new ArrayList<>();
	
	
	public String getMainAddr() {
		return mainAddr;
	}
	public void setMainAddr(String mainAddr) {
		this.mainAddr = mainAddr;
	}
	public String getMainHp() {
		return mainHp;
	}
	public void setMainHp(String mainHp) {
		this.mainHp = mainHp;
	}
	public String getMainFax() {
		return mainFax;
	}
	public void setMainFax(String mainFax) {
		this.mainFax = mainFax;
	}
	public String getRprsntr() {
		return rprsntr;
	}
	public void setRprsntr(String rprsntr) {
		this.rprsntr = rprsntr;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getMainTitle() {
		return mainTitle;
	}
	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}
	public String getMainSubtitle() {
		return mainSubtitle;
	}
	public void setMainSubtitle(String mainSubtitle) {
		this.mainSubtitle = mainSubtitle;
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
	public String getBgImg() {
		return bgImg;
	}
	public void setBgImg(String bgImg) {
		this.bgImg = bgImg;
	}
	public String getmBgImg() {
		return mBgImg;
	}
	public void setmBgImg(String mBgImg) {
		this.mBgImg = mBgImg;
	}
	public String getmAdBoard1Seq() {
		return mAdBoard1Seq;
	}
	public void setmAdBoard1Seq(String mAdBoard1Seq) {
		this.mAdBoard1Seq = mAdBoard1Seq;
	}
	public String getmAdBoard2Seq() {
		return mAdBoard2Seq;
	}
	public void setmAdBoard2Seq(String mAdBoard2Seq) {
		this.mAdBoard2Seq = mAdBoard2Seq;
	}
	public String getmAdBoard3Seq() {
		return mAdBoard3Seq;
	}
	public void setmAdBoard3Seq(String mAdBoard3Seq) {
		this.mAdBoard3Seq = mAdBoard3Seq;
	}
	public String getmAdBoard4Seq() {
		return mAdBoard4Seq;
	}
	public void setmAdBoard4Seq(String mAdBoard4Seq) {
		this.mAdBoard4Seq = mAdBoard4Seq;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public List<MMainBannerVO> getMmainbannerList() {
		return mmainbannerList;
	}
	public void setMmainbannerList(List<MMainBannerVO> mmainbannerList) {
		this.mmainbannerList = mmainbannerList;
	}
	
	
}