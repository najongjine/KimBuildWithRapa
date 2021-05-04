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
@Alias("kaWireVO")
public class KaWireVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String seq;
	private String fctNm;
	private String srvcCls;
	private String rsNm;
	private String permsSeq;
	private String inspDt;
	private String wiAddr;
	private String atchFileId;
	private String mnger;
	private String mngerHp;
	private String wiEntMthd;
	private String txFreqFrom;
	private String txFreqTo;
	private String anthPwrSum;
	private String anthKind;
	private String anthBnft;
	private String anthHght;
	private String grndHght;
	private String anthBmCnt;
	private String anthBmKind;
	private String istrRadPwr;
	private String cntrFreq;
	private String bndwth;
	private String refSigFreq;
	private String anthTiltAng;
	private String maxVertBeamAng;
	private String maxHorizBeamAng;
	private String syncSigGrpfrq;
	private String slotFmtCnt;
	private String freqrcBlockCnt;
	private String subWvCnt;
	private String abvGrdsmbCnt;
	private String oneslotSmbCnt;
	private String slotFmtInfo;
	private String mnfctr;
	private String bsnMngId;
	private String rgstDt;
	private String rgstId;
	private String rvseDt;
	private String rvseId;
	private String useYn;

	private String cnt;
	private String name;
	
	private List<KaWireVO> excelList;
	private List<ImgVO> imgList;

	public String getSeq() {
		return seq;
	}


	public void setSeq(String seq) {
		this.seq = seq;
	}


	public String getFctNm() {
		return fctNm;
	}


	public void setFctNm(String fctNm) {
		this.fctNm = fctNm;
	}


	public String getSrvcCls() {
		return srvcCls;
	}



	public void setSrvcCls(String srvcCls) {
		this.srvcCls = srvcCls;
	}



	public String getRsNm() {
		return rsNm;
	}



	public void setRsNm(String rsNm) {
		this.rsNm = rsNm;
	}



	public String getPermsSeq() {
		return permsSeq;
	}



	public void setPermsSeq(String permsSeq) {
		this.permsSeq = permsSeq;
	}



	public String getInspDt() {
		return inspDt;
	}



	public void setInspDt(String inspDt) {
		this.inspDt = inspDt;
	}



	public String getWiAddr() {
		return wiAddr;
	}



	public void setWiAddr(String wiAddr) {
		this.wiAddr = wiAddr;
	}



	public String getAtchFileId() {
		return atchFileId;
	}



	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}



	public String getMnger() {
		return mnger;
	}



	public void setMnger(String mnger) {
		this.mnger = mnger;
	}



	public String getMngerHp() {
		return mngerHp;
	}



	public void setMngerHp(String mngerHp) {
		this.mngerHp = mngerHp;
	}



	public String getWiEntMthd() {
		return wiEntMthd;
	}



	public void setWiEntMthd(String wiEntMthd) {
		this.wiEntMthd = wiEntMthd;
	}



	public String getTxFreqFrom() {
		return txFreqFrom;
	}



	public void setTxFreqFrom(String txFreqFrom) {
		this.txFreqFrom = txFreqFrom;
	}



	public String getTxFreqTo() {
		return txFreqTo;
	}



	public void setTxFreqTo(String txFreqTo) {
		this.txFreqTo = txFreqTo;
	}



	public String getAnthPwrSum() {
		return anthPwrSum;
	}



	public void setAnthPwrSum(String anthPwrSum) {
		this.anthPwrSum = anthPwrSum;
	}



	public String getAnthKind() {
		return anthKind;
	}



	public void setAnthKind(String anthKind) {
		this.anthKind = anthKind;
	}



	public String getAnthBnft() {
		return anthBnft;
	}



	public void setAnthBnft(String anthBnft) {
		this.anthBnft = anthBnft;
	}



	public String getAnthHght() {
		return anthHght;
	}



	public void setAnthHght(String anthHght) {
		this.anthHght = anthHght;
	}



	public String getGrndHght() {
		return grndHght;
	}



	public void setGrndHght(String grndHght) {
		this.grndHght = grndHght;
	}



	public String getAnthBmCnt() {
		return anthBmCnt;
	}



	public void setAnthBmCnt(String anthBmCnt) {
		this.anthBmCnt = anthBmCnt;
	}



	public String getAnthBmKind() {
		return anthBmKind;
	}



	public void setAnthBmKind(String anthBmKind) {
		this.anthBmKind = anthBmKind;
	}



	public String getIstrRadPwr() {
		return istrRadPwr;
	}



	public void setIstrRadPwr(String istrRadPwr) {
		this.istrRadPwr = istrRadPwr;
	}



	public String getCntrFreq() {
		return cntrFreq;
	}



	public void setCntrFreq(String cntrFreq) {
		this.cntrFreq = cntrFreq;
	}



	public String getBndwth() {
		return bndwth;
	}



	public void setBndwth(String bndwth) {
		this.bndwth = bndwth;
	}



	public String getRefSigFreq() {
		return refSigFreq;
	}



	public void setRefSigFreq(String refSigFreq) {
		this.refSigFreq = refSigFreq;
	}



	public String getAnthTiltAng() {
		return anthTiltAng;
	}



	public void setAnthTiltAng(String anthTiltAng) {
		this.anthTiltAng = anthTiltAng;
	}



	public String getMaxVertBeamAng() {
		return maxVertBeamAng;
	}



	public void setMaxVertBeamAng(String maxVertBeamAng) {
		this.maxVertBeamAng = maxVertBeamAng;
	}



	public String getMaxHorizBeamAng() {
		return maxHorizBeamAng;
	}



	public void setMaxHorizBeamAng(String maxHorizBeamAng) {
		this.maxHorizBeamAng = maxHorizBeamAng;
	}



	public String getSyncSigGrpfrq() {
		return syncSigGrpfrq;
	}



	public void setSyncSigGrpfrq(String syncSigGrpfrq) {
		this.syncSigGrpfrq = syncSigGrpfrq;
	}



	public String getSlotFmtCnt() {
		return slotFmtCnt;
	}



	public void setSlotFmtCnt(String slotFmtCnt) {
		this.slotFmtCnt = slotFmtCnt;
	}



	public String getFreqrcBlockCnt() {
		return freqrcBlockCnt;
	}



	public void setFreqrcBlockCnt(String freqrcBlockCnt) {
		this.freqrcBlockCnt = freqrcBlockCnt;
	}



	public String getSubWvCnt() {
		return subWvCnt;
	}



	public void setSubWvCnt(String subWvCnt) {
		this.subWvCnt = subWvCnt;
	}



	public String getAbvGrdsmbCnt() {
		return abvGrdsmbCnt;
	}



	public void setAbvGrdsmbCnt(String abvGrdsmbCnt) {
		this.abvGrdsmbCnt = abvGrdsmbCnt;
	}



	public String getOneslotSmbCnt() {
		return oneslotSmbCnt;
	}



	public void setOneslotSmbCnt(String oneslotSmbCnt) {
		this.oneslotSmbCnt = oneslotSmbCnt;
	}



	public String getSlotFmtInfo() {
		return slotFmtInfo;
	}



	public void setSlotFmtInfo(String slotFmtInfo) {
		this.slotFmtInfo = slotFmtInfo;
	}



	public String getMnfctr() {
		return mnfctr;
	}



	public void setMnfctr(String mnfctr) {
		this.mnfctr = mnfctr;
	}



	public String getBsnMngId() {
		return bsnMngId;
	}



	public void setBsnMngId(String bsnMngId) {
		this.bsnMngId = bsnMngId;
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



	public List<KaWireVO> getExcelList() {
		return excelList;
	}



	public void setExcelList(List<KaWireVO> excelList) {
		this.excelList = excelList;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
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


	public List<ImgVO> getImgList() {
		return imgList;
	}


	public void setImgList(List<ImgVO> imgList) {
		this.imgList = imgList;
	}
	
	
}