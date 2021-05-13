package com.open.vo;

import java.io.Serializable;

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
@Alias("msm0089VO")
public class Msm0089VO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String fileNm;
	private String regNm;
	private String regDate;
	private String propNum;
	private String fileSeq;
	private String reportSeq;
	private String totCnt;
	private String fileCnt;
	private String cnt1;
	private String cnt3;
	private String cntX;
	private String cntB;
	private String cnt2;
	private String cnt4;
	private String cnt0;
	
	private String seq;
	private String finDate;
	private String prpslSeq;
	private String equipNm;
	private String serviceDiv;
	private String radioNm;
	private String permiSeq;
	private String radioAdd;
	private String state;
	private String regDay;
	private String rstVal;
	private String rstCvalFrom;
	private String rstCvalTo;
	private String rstNm;
	private String freqDate;
	private String freqDate2;
	
	private String permiNum;
	private String electSum;
	private String freqFrom;
	private String freqTo;
	private String radioAdd1;
	private String radioAdd2;
	private String radioAdd3;
	private String palceDiv;
	private String rstWay;
	private String rstPhy;
	private String rstBase;
	private String rstCidx;
	private String radioStat;
	private String radioName;
	private String paralDo;
	private String paralBun;
	private String paralCho;
	private String longiDo;
	private String longiBun;
	private String longiCho;
	private String antenDivR;
	private String antenForm;
	private String antenGaiR;
	private String antenHeiR;
	private String groundHeight;
	private String antennaBeamCnt;
	private String antennaBeamForm;
	private String radiationPower;
	private String centerFrequency;
	private String bandWidth;
	private String standardSign;
	private String antennaAngle;
	private String verticalAngle;
	private String levelAngle;
	private String signalCycle;
	private String formatCnt;
	private String blockCnt;
	private String helpCnt;
	private String guardCnt;
	private String slotCnt;
	private String slotFormat;
	private String rstDef;
	private String eletKm;
	private String regPlace;
	private String etc;
	private String regTimeFrom;
	private String regTimeTo;
	private String condTemp;
	private String condHum;
	private String condWea;
	private String macMod;
	private String macNum;
	private String macCom;
	private String macFreFrom;
	private String macFreTo;
	private String macDate;
	private String recMod;
	private String recNum;
	private String recCom;
	private String recFreFrom;
	private String recFreTo;
	private String recDate;
	private String rstBas1;
	private String rstBas2;
	private String rstBas3;
	private String calVal1;
	private String calVal2;
	private String calVal3;
	private String rstTim;
	private String rewVal;
	private String trfRewVal;
	private String rstMax;
	private String calMax;
	private String rstCfre;
	private String rstForm;
	private String regDayw;
	private String rstCom;
	private String rstAddr;
	private String regName;
	private String sysLo;
	private String survDis;
	private String survPit;
	private String copyPit;
	private String expIdx;
	
	private String rstFileTxt1;
	private String rstFileTxt2;
	private String rstFileTxt3;
	private String rstFileTxt4;
	private String rstFileTxt5;
	private String rstFileTxt6;
	private String rstFileTxt7;
	private String rstFileTxt8;
	
	private String fn1;
	private String fn2;
	private String fn3;
	private String fn4;
	private String fn5;
	private String fn8;
	private String cmpy;
	private String cmpyClcd;
	private String imgYn;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String img5;
	private String img6;
	private String img7;
	private String img8;
	
    private String paralLongi;
    private String rstList;
    private String rstMacDst;
    private String macRstDst;
    private String rstSet;
    private String secCnt;
    private String actSecCnt;
    private String secRsn;
    private String secParalLongi;
    private String secStaRsn;
    private String survParalLongi;
    private String survRsn;
    private String macDst;
    private String macDivn;
    private String macImg;
    private String rstFileId;
    private String survPitVal;
    private String rstBas;
    private String calVal;
    private String rstIdx;
    private String copyLoc;
    private String copyRstResult;
    private String copyFreq;
    private String copyRstVal;
    private String totRstIdx;
    private String calResult;
    private String rstCnd;        
    private String resultSeq;        
    private String pState;        
	
    private String electChk;
	private String freqFromChk;
	private String freqToChk;
	private String radioAddChk;
	private String palceDivChk;
	private String rstWayChk;
	private String rstPhyChk;
	private String rstBasChk;
	private String rstValChk;
	private String rstCidxChk;
	private String radioNmChk;
	private String antenGaiChk;
	private String antenHeiChk;
	private String groundHeightChk;
	private String antennaBeamCntChk;
	private String antennaBeamFormChk;
	private String radiationPowerChk;
	private String centerFrequencyChk;
	private String bandWidthChk;
	private String standardSignChk;
	private String antennaAngleChk;
	private String verticalAngleChk;
	private String levelAngleChk;
	private String signalCycleChk;
	private String formatCntChk;
	private String blockCntChk;
	private String helpCntChk;
	private String guardCntChk;
	private String slotCntChk;
	private String slotFormatChk;
	private String rstDefChk;
	private String eletKmChk;
	private String regPlaceChk;
	private String regDayChk;
	private String regTimeChk;
	private String macDateChk;
	private String recDateChk;
	private String rstMaxChk;
	private String calMaxChk;
	private String rstNmChk;
	private String survDisChk;
	
	private String paralLongiChk;
	private String secParalLongiChk;
	private String survParalLongiChk;
	private String calValChk;
	private String rstIdxChk;
	private String excelRow;
   
    private String arrPermiSeq;
    private String area;
	
	private String[] arrSeq;
	private String[] arrResultSeq;
	private String[] arrReportSeq;
	
	
	
	public String getRstFileTxt1() {
		return rstFileTxt1;
	}
	public void setRstFileTxt1(String rstFileTxt1) {
		this.rstFileTxt1 = rstFileTxt1;
	}
	public String getRstFileTxt2() {
		return rstFileTxt2;
	}
	public void setRstFileTxt2(String rstFileTxt2) {
		this.rstFileTxt2 = rstFileTxt2;
	}
	public String getRstFileTxt3() {
		return rstFileTxt3;
	}
	public void setRstFileTxt3(String rstFileTxt3) {
		this.rstFileTxt3 = rstFileTxt3;
	}
	public String getRstFileTxt4() {
		return rstFileTxt4;
	}
	public void setRstFileTxt4(String rstFileTxt4) {
		this.rstFileTxt4 = rstFileTxt4;
	}
	public String getRstFileTxt5() {
		return rstFileTxt5;
	}
	public void setRstFileTxt5(String rstFileTxt5) {
		this.rstFileTxt5 = rstFileTxt5;
	}
	public String getRstFileTxt6() {
		return rstFileTxt6;
	}
	public void setRstFileTxt6(String rstFileTxt6) {
		this.rstFileTxt6 = rstFileTxt6;
	}
	public String getRstFileTxt7() {
		return rstFileTxt7;
	}
	public void setRstFileTxt7(String rstFileTxt7) {
		this.rstFileTxt7 = rstFileTxt7;
	}
	public String getRstFileTxt8() {
		return rstFileTxt8;
	}
	public void setRstFileTxt8(String rstFileTxt8) {
		this.rstFileTxt8 = rstFileTxt8;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getArrPermiSeq() {
		return arrPermiSeq;
	}
	public void setArrPermiSeq(String arrPermiSeq) {
		this.arrPermiSeq = arrPermiSeq;
	}
	public String getFileNm() {
		return fileNm;
	}
	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
	public String getRegNm() {
		return regNm;
	}
	public void setRegNm(String regNm) {
		this.regNm = regNm;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getPropNum() {
		return propNum;
	}
	public void setPropNum(String propNum) {
		this.propNum = propNum;
	}
	public String getFileSeq() {
		return fileSeq;
	}
	public void setFileSeq(String fileSeq) {
		this.fileSeq = fileSeq;
	}
	
	public String getReportSeq() {
		return reportSeq;
	}
	public void setReportSeq(String reportSeq) {
		this.reportSeq = reportSeq;
	}
	public String getTotCnt() {
		return totCnt;
	}
	public void setTotCnt(String totCnt) {
		this.totCnt = totCnt;
	}
	
	public String getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(String fileCnt) {
		this.fileCnt = fileCnt;
	}
	
	public String getCnt1() {
		return cnt1;
	}
	public void setCnt1(String cnt1) {
		this.cnt1 = cnt1;
	}
	public String getCnt3() {
		return cnt3;
	}
	public void setCnt3(String cnt3) {
		this.cnt3 = cnt3;
	}
	public String getCntX() {
		return cntX;
	}
	public void setCntX(String cntX) {
		this.cntX = cntX;
	}
	
	public String getCntB() {
		return cntB;
	}
	public void setCntB(String cntB) {
		this.cntB = cntB;
	}
	public String getCnt2() {
		return cnt2;
	}
	public void setCnt2(String cnt2) {
		this.cnt2 = cnt2;
	}
	public String getCnt4() {
		return cnt4;
	}
	public void setCnt4(String cnt4) {
		this.cnt4 = cnt4;
	}
	public String getCnt0() {
		return cnt0;
	}
	public void setCnt0(String cnt0) {
		this.cnt0 = cnt0;
	}
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getPrpslSeq() {
		return prpslSeq;
	}
	public void setPrpslSeq(String prpslSeq) {
		this.prpslSeq = prpslSeq;
	}
	public String getEquipNm() {
		return equipNm;
	}
	public void setEquipNm(String equipNm) {
		this.equipNm = equipNm;
	}
	public String getServiceDiv() {
		return serviceDiv;
	}
	public void setServiceDiv(String serviceDiv) {
		this.serviceDiv = serviceDiv;
	}
	public String getRadioNm() {
		return radioNm;
	}
	public void setRadioNm(String radioNm) {
		this.radioNm = radioNm;
	}
	public String getPermiSeq() {
		return permiSeq;
	}
	public void setPermiSeq(String permiSeq) {
		this.permiSeq = permiSeq;
	}
	public String getRadioAdd() {
		return radioAdd;
	}
	public void setRadioAdd(String radioAdd) {
		this.radioAdd = radioAdd;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRegDay() {
		return regDay;
	}
	public void setRegDay(String regDay) {
		this.regDay = regDay;
	}
	public String getRstVal() {
		return rstVal;
	}
	public void setRstVal(String rstVal) {
		this.rstVal = rstVal;
	}
	public String getRstNm() {
		return rstNm;
	}
	public void setRstNm(String rstNm) {
		this.rstNm = rstNm;
	}
	public String getFreqDate() {
		return freqDate;
	}
	public void setFreqDate(String freqDate) {
		this.freqDate = freqDate;
	}
	public String getFreqDate2() {
		return freqDate2;
	}
	public void setFreqDate2(String freqDate2) {
		this.freqDate2 = freqDate2;
	}
	public String getPermiNum() {
		return permiNum;
	}
	public void setPermiNum(String permiNum) {
		this.permiNum = permiNum;
	}
	public String getElectSum() {
		return electSum;
	}
	public void setElectSum(String electSum) {
		this.electSum = electSum;
	}
	public String getFreqFrom() {
		return freqFrom;
	}
	public void setFreqFrom(String freqFrom) {
		this.freqFrom = freqFrom;
	}
	public String getFreqTo() {
		return freqTo;
	}
	public void setFreqTo(String freqTo) {
		this.freqTo = freqTo;
	}
	public String getRadioAdd1() {
		return radioAdd1;
	}
	public void setRadioAdd1(String radioAdd1) {
		this.radioAdd1 = radioAdd1;
	}
	public String getRadioAdd2() {
		return radioAdd2;
	}
	public void setRadioAdd2(String radioAdd2) {
		this.radioAdd2 = radioAdd2;
	}
	public String getRadioAdd3() {
		return radioAdd3;
	}
	public void setRadioAdd3(String radioAdd3) {
		this.radioAdd3 = radioAdd3;
	}
	public String getPalceDiv() {
		return palceDiv;
	}
	public void setPalceDiv(String palceDiv) {
		this.palceDiv = palceDiv;
	}
	public String getRstWay() {
		return rstWay;
	}
	public void setRstWay(String rstWay) {
		this.rstWay = rstWay;
	}
	public String getRstPhy() {
		return rstPhy;
	}
	public void setRstPhy(String rstPhy) {
		this.rstPhy = rstPhy;
	}
	public String getRstBase() {
		return rstBase;
	}
	public void setRstBase(String rstBase) {
		this.rstBase = rstBase;
	}
	public String getRstCidx() {
		return rstCidx;
	}
	public void setRstCidx(String rstCidx) {
		this.rstCidx = rstCidx;
	}
	public String getRadioStat() {
		return radioStat;
	}
	public void setRadioStat(String radioStat) {
		this.radioStat = radioStat;
	}
	public String getRadioName() {
		return radioName;
	}
	public void setRadioName(String radioName) {
		this.radioName = radioName;
	}
	public String getParalDo() {
		return paralDo;
	}
	public void setParalDo(String paralDo) {
		this.paralDo = paralDo;
	}
	public String getParalBun() {
		return paralBun;
	}
	public void setParalBun(String paralBun) {
		this.paralBun = paralBun;
	}
	public String getParalCho() {
		return paralCho;
	}
	public void setParalCho(String paralCho) {
		this.paralCho = paralCho;
	}
	public String getLongiDo() {
		return longiDo;
	}
	public void setLongiDo(String longiDo) {
		this.longiDo = longiDo;
	}
	public String getLongiBun() {
		return longiBun;
	}
	public void setLongiBun(String longiBun) {
		this.longiBun = longiBun;
	}
	public String getLongiCho() {
		return longiCho;
	}
	public void setLongiCho(String longiCho) {
		this.longiCho = longiCho;
	}
	public String getAntenDivR() {
		return antenDivR;
	}
	public void setAntenDivR(String antenDivR) {
		this.antenDivR = antenDivR;
	}
	public String getAntenForm() {
		return antenForm;
	}
	public void setAntenForm(String antenForm) {
		this.antenForm = antenForm;
	}
	public String getAntenGaiR() {
		return antenGaiR;
	}
	public void setAntenGaiR(String antenGaiR) {
		this.antenGaiR = antenGaiR;
	}
	public String getAntenHeiR() {
		return antenHeiR;
	}
	public void setAntenHeiR(String antenHeiR) {
		this.antenHeiR = antenHeiR;
	}
	public String getGroundHeight() {
		return groundHeight;
	}
	public void setGroundHeight(String groundHeight) {
		this.groundHeight = groundHeight;
	}
	public String getAntennaBeamCnt() {
		return antennaBeamCnt;
	}
	public void setAntennaBeamCnt(String antennaBeamCnt) {
		this.antennaBeamCnt = antennaBeamCnt;
	}
	public String getAntennaBeamForm() {
		return antennaBeamForm;
	}
	public void setAntennaBeamForm(String antennaBeamForm) {
		this.antennaBeamForm = antennaBeamForm;
	}
	public String getRadiationPower() {
		return radiationPower;
	}
	public void setRadiationPower(String radiationPower) {
		this.radiationPower = radiationPower;
	}
	public String getCenterFrequency() {
		return centerFrequency;
	}
	public void setCenterFrequency(String centerFrequency) {
		this.centerFrequency = centerFrequency;
	}
	public String getBandWidth() {
		return bandWidth;
	}
	public void setBandWidth(String bandWidth) {
		this.bandWidth = bandWidth;
	}
	public String getStandardSign() {
		return standardSign;
	}
	public void setStandardSign(String standardSign) {
		this.standardSign = standardSign;
	}
	public String getAntennaAngle() {
		return antennaAngle;
	}
	public void setAntennaAngle(String antennaAngle) {
		this.antennaAngle = antennaAngle;
	}
	public String getVerticalAngle() {
		return verticalAngle;
	}
	public void setVerticalAngle(String verticalAngle) {
		this.verticalAngle = verticalAngle;
	}
	public String getLevelAngle() {
		return levelAngle;
	}
	public void setLevelAngle(String levelAngle) {
		this.levelAngle = levelAngle;
	}
	public String getSignalCycle() {
		return signalCycle;
	}
	public void setSignalCycle(String signalCycle) {
		this.signalCycle = signalCycle;
	}
	public String getFormatCnt() {
		return formatCnt;
	}
	public void setFormatCnt(String formatCnt) {
		this.formatCnt = formatCnt;
	}
	public String getBlockCnt() {
		return blockCnt;
	}
	public void setBlockCnt(String blockCnt) {
		this.blockCnt = blockCnt;
	}
	public String getHelpCnt() {
		return helpCnt;
	}
	public void setHelpCnt(String helpCnt) {
		this.helpCnt = helpCnt;
	}
	public String getGuardCnt() {
		return guardCnt;
	}
	public void setGuardCnt(String guardCnt) {
		this.guardCnt = guardCnt;
	}
	public String getSlotCnt() {
		return slotCnt;
	}
	public void setSlotCnt(String slotCnt) {
		this.slotCnt = slotCnt;
	}
	public String getSlotFormat() {
		return slotFormat;
	}
	public void setSlotFormat(String slotFormat) {
		this.slotFormat = slotFormat;
	}
	public String getRstDef() {
		return rstDef;
	}
	public void setRstDef(String rstDef) {
		this.rstDef = rstDef;
	}
	public String getEletKm() {
		return eletKm;
	}
	public void setEletKm(String eletKm) {
		this.eletKm = eletKm;
	}
	public String getRegPlace() {
		return regPlace;
	}
	public void setRegPlace(String regPlace) {
		this.regPlace = regPlace;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getRegTimeFrom() {
		return regTimeFrom;
	}
	public void setRegTimeFrom(String regTimeFrom) {
		this.regTimeFrom = regTimeFrom;
	}
	public String getRegTimeTo() {
		return regTimeTo;
	}
	public void setRegTimeTo(String regTimeTo) {
		this.regTimeTo = regTimeTo;
	}
	public String getCondTemp() {
		return condTemp;
	}
	public void setCondTemp(String condTemp) {
		this.condTemp = condTemp;
	}
	public String getCondHum() {
		return condHum;
	}
	public void setCondHum(String condHum) {
		this.condHum = condHum;
	}
	public String getCondWea() {
		return condWea;
	}
	public void setCondWea(String condWea) {
		this.condWea = condWea;
	}
	public String getMacMod() {
		return macMod;
	}
	public void setMacMod(String macMod) {
		this.macMod = macMod;
	}
	public String getMacNum() {
		return macNum;
	}
	public void setMacNum(String macNum) {
		this.macNum = macNum;
	}
	public String getMacCom() {
		return macCom;
	}
	public void setMacCom(String macCom) {
		this.macCom = macCom;
	}
	public String getMacFreFrom() {
		return macFreFrom;
	}
	public void setMacFreFrom(String macFreFrom) {
		this.macFreFrom = macFreFrom;
	}
	public String getMacFreTo() {
		return macFreTo;
	}
	public void setMacFreTo(String macFreTo) {
		this.macFreTo = macFreTo;
	}
	public String getMacDate() {
		return macDate;
	}
	public void setMacDate(String macDate) {
		this.macDate = macDate;
	}
	public String getRecMod() {
		return recMod;
	}
	public void setRecMod(String recMod) {
		this.recMod = recMod;
	}
	public String getRecNum() {
		return recNum;
	}
	public void setRecNum(String recNum) {
		this.recNum = recNum;
	}
	public String getRecCom() {
		return recCom;
	}
	public void setRecCom(String recCom) {
		this.recCom = recCom;
	}
	public String getRecFreFrom() {
		return recFreFrom;
	}
	public void setRecFreFrom(String recFreFrom) {
		this.recFreFrom = recFreFrom;
	}
	public String getRecFreTo() {
		return recFreTo;
	}
	public void setRecFreTo(String recFreTo) {
		this.recFreTo = recFreTo;
	}
	public String getRecDate() {
		return recDate;
	}
	public void setRecDate(String recDate) {
		this.recDate = recDate;
	}
	public String getRstBas1() {
		return rstBas1;
	}
	public void setRstBas1(String rstBas1) {
		this.rstBas1 = rstBas1;
	}
	public String getRstBas2() {
		return rstBas2;
	}
	public void setRstBas2(String rstBas2) {
		this.rstBas2 = rstBas2;
	}
	public String getRstBas3() {
		return rstBas3;
	}
	public void setRstBas3(String rstBas3) {
		this.rstBas3 = rstBas3;
	}
	public String getCalVal1() {
		return calVal1;
	}
	public void setCalVal1(String calVal1) {
		this.calVal1 = calVal1;
	}
	public String getCalVal2() {
		return calVal2;
	}
	public void setCalVal2(String calVal2) {
		this.calVal2 = calVal2;
	}
	public String getCalVal3() {
		return calVal3;
	}
	public void setCalVal3(String calVal3) {
		this.calVal3 = calVal3;
	}
	public String getRstTim() {
		return rstTim;
	}
	public void setRstTim(String rstTim) {
		this.rstTim = rstTim;
	}
	public String getRewVal() {
		return rewVal;
	}
	public void setRewVal(String rewVal) {
		this.rewVal = rewVal;
	}
	public String getTrfRewVal() {
		return trfRewVal;
	}
	public void setTrfRewVal(String trfRewVal) {
		this.trfRewVal = trfRewVal;
	}
	public String getRstMax() {
		return rstMax;
	}
	public void setRstMax(String rstMax) {
		this.rstMax = rstMax;
	}
	public String getCalMax() {
		return calMax;
	}
	public void setCalMax(String calMax) {
		this.calMax = calMax;
	}
	public String getRstCvalFrom() {
		return rstCvalFrom;
	}
	public void setRstCvalFrom(String rstCvalFrom) {
		this.rstCvalFrom = rstCvalFrom;
	}
	public String getRstCvalTo() {
		return rstCvalTo;
	}
	public void setRstCvalTo(String rstCvalTo) {
		this.rstCvalTo = rstCvalTo;
	}
	public String getRstCfre() {
		return rstCfre;
	}
	public void setRstCfre(String rstCfre) {
		this.rstCfre = rstCfre;
	}
	public String getRstForm() {
		return rstForm;
	}
	public void setRstForm(String rstForm) {
		this.rstForm = rstForm;
	}
	public String getRegDayw() {
		return regDayw;
	}
	public void setRegDayw(String regDayw) {
		this.regDayw = regDayw;
	}
	public String getRstCom() {
		return rstCom;
	}
	public void setRstCom(String rstCom) {
		this.rstCom = rstCom;
	}
	public String getRstAddr() {
		return rstAddr;
	}
	public void setRstAddr(String rstAddr) {
		this.rstAddr = rstAddr;
	}
	public String getRegName() {
		return regName;
	}
	public void setRegName(String regName) {
		this.regName = regName;
	}
	public String getSysLo() {
		return sysLo;
	}
	public void setSysLo(String sysLo) {
		this.sysLo = sysLo;
	}
	public String getSurvDis() {
		return survDis;
	}
	public void setSurvDis(String survDis) {
		this.survDis = survDis;
	}
	public String getSurvPit() {
		return survPit;
	}
	public void setSurvPit(String survPit) {
		this.survPit = survPit;
	}
	public String getCopyPit() {
		return copyPit;
	}
	public void setCopyPit(String copyPit) {
		this.copyPit = copyPit;
	}
	public String getExpIdx() {
		return expIdx;
	}
	public void setExpIdx(String expIdx) {
		this.expIdx = expIdx;
	}
	public String[] getArrSeq() {
		return arrSeq;
	}
	public void setArrSeq(String[] arrSeq) {
		this.arrSeq = arrSeq;
	}
	public String getFinDate() {
		return finDate;
	}
	public void setFinDate(String finDate) {
		this.finDate = finDate;
	}
	public String getFn1() {
		return fn1;
	}
	public void setFn1(String fn1) {
		this.fn1 = fn1;
	}
	public String getFn2() {
		return fn2;
	}
	public void setFn2(String fn2) {
		this.fn2 = fn2;
	}
	public String getFn3() {
		return fn3;
	}
	public void setFn3(String fn3) {
		this.fn3 = fn3;
	}
	public String getFn4() {
		return fn4;
	}
	public void setFn4(String fn4) {
		this.fn4 = fn4;
	}
	public String getFn5() {
		return fn5;
	}
	public void setFn5(String fn5) {
		this.fn5 = fn5;
	}
	public String getFn8() {
		return fn8;
	}
	public void setFn8(String fn8) {
		this.fn8 = fn8;
	}
	public String getCmpy() {
		return cmpy;
	}
	public void setCmpy(String cmpy) {
		this.cmpy = cmpy;
	}
	public String getImgYn() {
		return imgYn;
	}
	public void setImgYn(String imgYn) {
		this.imgYn = imgYn;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getImg4() {
		return img4;
	}
	public void setImg4(String img4) {
		this.img4 = img4;
	}
	public String getImg5() {
		return img5;
	}
	public void setImg5(String img5) {
		this.img5 = img5;
	}
	public String getImg6() {
		return img6;
	}
	public void setImg6(String img6) {
		this.img6 = img6;
	}
	public String getImg7() {
		return img7;
	}
	public void setImg7(String img7) {
		this.img7 = img7;
	}
	public String getImg8() {
		return img8;
	}
	public void setImg8(String img8) {
		this.img8 = img8;
	}
	public String getParalLongi() {
		return paralLongi;
	}
	public void setParalLongi(String paralLongi) {
		this.paralLongi = paralLongi;
	}
	public String getRstList() {
		return rstList;
	}
	public void setRstList(String rstList) {
		this.rstList = rstList;
	}
	public String getRstMacDst() {
		return rstMacDst;
	}
	public void setRstMacDst(String rstMacDst) {
		this.rstMacDst = rstMacDst;
	}
	public String getMacRstDst() {
		return macRstDst;
	}
	public void setMacRstDst(String macRstDst) {
		this.macRstDst = macRstDst;
	}
	public String getRstSet() {
		return rstSet;
	}
	public void setRstSet(String rstSet) {
		this.rstSet = rstSet;
	}
	public String getSecCnt() {
		return secCnt;
	}
	public void setSecCnt(String secCnt) {
		this.secCnt = secCnt;
	}
	public String getActSecCnt() {
		return actSecCnt;
	}
	public void setActSecCnt(String actSecCnt) {
		this.actSecCnt = actSecCnt;
	}
	public String getSecRsn() {
		return secRsn;
	}
	public void setSecRsn(String secRsn) {
		this.secRsn = secRsn;
	}
	public String getSecParalLongi() {
		return secParalLongi;
	}
	public void setSecParalLongi(String secParalLongi) {
		this.secParalLongi = secParalLongi;
	}
	public String getSecStaRsn() {
		return secStaRsn;
	}
	public void setSecStaRsn(String secStaRsn) {
		this.secStaRsn = secStaRsn;
	}
	public String getSurvParalLongi() {
		return survParalLongi;
	}
	public void setSurvParalLongi(String survParalLongi) {
		this.survParalLongi = survParalLongi;
	}
	public String getSurvRsn() {
		return survRsn;
	}
	public void setSurvRsn(String survRsn) {
		this.survRsn = survRsn;
	}
	public String getMacDst() {
		return macDst;
	}
	public void setMacDst(String macDst) {
		this.macDst = macDst;
	}
	public String getMacDivn() {
		return macDivn;
	}
	public void setMacDivn(String macDivn) {
		this.macDivn = macDivn;
	}
	public String getMacImg() {
		return macImg;
	}
	public void setMacImg(String macImg) {
		this.macImg = macImg;
	}
	public String getRstFileId() {
		return rstFileId;
	}
	public void setRstFileId(String rstFileId) {
		this.rstFileId = rstFileId;
	}
	public String getSurvPitVal() {
		return survPitVal;
	}
	public void setSurvPitVal(String survPitVal) {
		this.survPitVal = survPitVal;
	}
	public String getRstBas() {
		return rstBas;
	}
	public void setRstBas(String rstBas) {
		this.rstBas = rstBas;
	}
	public String getCalVal() {
		return calVal;
	}
	public void setCalVal(String calVal) {
		this.calVal = calVal;
	}
	public String getRstIdx() {
		return rstIdx;
	}
	public void setRstIdx(String rstIdx) {
		this.rstIdx = rstIdx;
	}
	public String getCopyLoc() {
		return copyLoc;
	}
	public void setCopyLoc(String copyLoc) {
		this.copyLoc = copyLoc;
	}
	public String getCopyRstResult() {
		return copyRstResult;
	}
	public void setCopyRstResult(String copyRstResult) {
		this.copyRstResult = copyRstResult;
	}
	public String getCopyFreq() {
		return copyFreq;
	}
	public void setCopyFreq(String copyFreq) {
		this.copyFreq = copyFreq;
	}
	public String getCopyRstVal() {
		return copyRstVal;
	}
	public void setCopyRstVal(String copyRstVal) {
		this.copyRstVal = copyRstVal;
	}
	public String getTotRstIdx() {
		return totRstIdx;
	}
	public void setTotRstIdx(String totRstIdx) {
		this.totRstIdx = totRstIdx;
	}
	public String getCalResult() {
		return calResult;
	}
	public void setCalResult(String calResult) {
		this.calResult = calResult;
	}
	public String getRstCnd() {
		return rstCnd;
	}
	public void setRstCnd(String rstCnd) {
		this.rstCnd = rstCnd;
	}
	public String[] getArrResultSeq() {
		return arrResultSeq;
	}
	public void setArrResultSeq(String[] arrResultSeq) {
		this.arrResultSeq = arrResultSeq;
	}
	public String[] getArrReportSeq() {
		return arrReportSeq;
	}
	public void setArrReportSeq(String[] arrReportSeq) {
		this.arrReportSeq = arrReportSeq;
	}
	public String getResultSeq() {
		return resultSeq;
	}
	public void setResultSeq(String resultSeq) {
		this.resultSeq = resultSeq;
	}
	public String getCmpyClcd() {
		return cmpyClcd;
	}
	public void setCmpyClcd(String cmpyClcd) {
		this.cmpyClcd = cmpyClcd;
	}
	public String getpState() {
		return pState;
	}
	public void setpState(String pState) {
		this.pState = pState;
	}
	public String getElectChk() {
		return electChk;
	}
	public void setElectChk(String electChk) {
		this.electChk = electChk;
	}
	public String getFreqFromChk() {
		return freqFromChk;
	}
	public void setFreqFromChk(String freqFromChk) {
		this.freqFromChk = freqFromChk;
	}
	public String getFreqToChk() {
		return freqToChk;
	}
	public void setFreqToChk(String freqToChk) {
		this.freqToChk = freqToChk;
	}
	public String getRadioAddChk() {
		return radioAddChk;
	}
	public void setRadioAddChk(String radioAddChk) {
		this.radioAddChk = radioAddChk;
	}
	public String getPalceDivChk() {
		return palceDivChk;
	}
	public void setPalceDivChk(String palceDivChk) {
		this.palceDivChk = palceDivChk;
	}
	public String getRstWayChk() {
		return rstWayChk;
	}
	public void setRstWayChk(String rstWayChk) {
		this.rstWayChk = rstWayChk;
	}
	public String getRstPhyChk() {
		return rstPhyChk;
	}
	public void setRstPhyChk(String rstPhyChk) {
		this.rstPhyChk = rstPhyChk;
	}
	public String getRstBasChk() {
		return rstBasChk;
	}
	public void setRstBasChk(String rstBasChk) {
		this.rstBasChk = rstBasChk;
	}
	public String getRstValChk() {
		return rstValChk;
	}
	public void setRstValChk(String rstValChk) {
		this.rstValChk = rstValChk;
	}
	public String getRstCidxChk() {
		return rstCidxChk;
	}
	public void setRstCidxChk(String rstCidxChk) {
		this.rstCidxChk = rstCidxChk;
	}
	public String getRadioNmChk() {
		return radioNmChk;
	}
	public void setRadioNmChk(String radioNmChk) {
		this.radioNmChk = radioNmChk;
	}
	public String getAntenGaiChk() {
		return antenGaiChk;
	}
	public void setAntenGaiChk(String antenGaiChk) {
		this.antenGaiChk = antenGaiChk;
	}
	public String getAntenHeiChk() {
		return antenHeiChk;
	}
	public void setAntenHeiChk(String antenHeiChk) {
		this.antenHeiChk = antenHeiChk;
	}
	public String getGroundHeightChk() {
		return groundHeightChk;
	}
	public void setGroundHeightChk(String groundHeightChk) {
		this.groundHeightChk = groundHeightChk;
	}
	public String getAntennaBeamCntChk() {
		return antennaBeamCntChk;
	}
	public void setAntennaBeamCntChk(String antennaBeamCntChk) {
		this.antennaBeamCntChk = antennaBeamCntChk;
	}
	public String getAntennaBeamFormChk() {
		return antennaBeamFormChk;
	}
	public void setAntennaBeamFormChk(String antennaBeamFormChk) {
		this.antennaBeamFormChk = antennaBeamFormChk;
	}
	public String getRadiationPowerChk() {
		return radiationPowerChk;
	}
	public void setRadiationPowerChk(String radiationPowerChk) {
		this.radiationPowerChk = radiationPowerChk;
	}
	public String getCenterFrequencyChk() {
		return centerFrequencyChk;
	}
	public void setCenterFrequencyChk(String centerFrequencyChk) {
		this.centerFrequencyChk = centerFrequencyChk;
	}
	public String getBandWidthChk() {
		return bandWidthChk;
	}
	public void setBandWidthChk(String bandWidthChk) {
		this.bandWidthChk = bandWidthChk;
	}
	public String getStandardSignChk() {
		return standardSignChk;
	}
	public void setStandardSignChk(String standardSignChk) {
		this.standardSignChk = standardSignChk;
	}
	public String getAntennaAngleChk() {
		return antennaAngleChk;
	}
	public void setAntennaAngleChk(String antennaAngleChk) {
		this.antennaAngleChk = antennaAngleChk;
	}
	public String getVerticalAngleChk() {
		return verticalAngleChk;
	}
	public void setVerticalAngleChk(String verticalAngleChk) {
		this.verticalAngleChk = verticalAngleChk;
	}
	public String getLevelAngleChk() {
		return levelAngleChk;
	}
	public void setLevelAngleChk(String levelAngleChk) {
		this.levelAngleChk = levelAngleChk;
	}
	public String getSignalCycleChk() {
		return signalCycleChk;
	}
	public void setSignalCycleChk(String signalCycleChk) {
		this.signalCycleChk = signalCycleChk;
	}
	public String getFormatCntChk() {
		return formatCntChk;
	}
	public void setFormatCntChk(String formatCntChk) {
		this.formatCntChk = formatCntChk;
	}
	public String getBlockCntChk() {
		return blockCntChk;
	}
	public void setBlockCntChk(String blockCntChk) {
		this.blockCntChk = blockCntChk;
	}
	public String getHelpCntChk() {
		return helpCntChk;
	}
	public void setHelpCntChk(String helpCntChk) {
		this.helpCntChk = helpCntChk;
	}
	public String getGuardCntChk() {
		return guardCntChk;
	}
	public void setGuardCntChk(String guardCntChk) {
		this.guardCntChk = guardCntChk;
	}
	public String getSlotCntChk() {
		return slotCntChk;
	}
	public void setSlotCntChk(String slotCntChk) {
		this.slotCntChk = slotCntChk;
	}
	public String getSlotFormatChk() {
		return slotFormatChk;
	}
	public void setSlotFormatChk(String slotFormatChk) {
		this.slotFormatChk = slotFormatChk;
	}
	public String getRstDefChk() {
		return rstDefChk;
	}
	public void setRstDefChk(String rstDefChk) {
		this.rstDefChk = rstDefChk;
	}
	public String getEletKmChk() {
		return eletKmChk;
	}
	public void setEletKmChk(String eletKmChk) {
		this.eletKmChk = eletKmChk;
	}
	public String getRegPlaceChk() {
		return regPlaceChk;
	}
	public void setRegPlaceChk(String regPlaceChk) {
		this.regPlaceChk = regPlaceChk;
	}
	public String getRegDayChk() {
		return regDayChk;
	}
	public void setRegDayChk(String regDayChk) {
		this.regDayChk = regDayChk;
	}
	public String getRegTimeChk() {
		return regTimeChk;
	}
	public void setRegTimeChk(String regTimeChk) {
		this.regTimeChk = regTimeChk;
	}
	public String getMacDateChk() {
		return macDateChk;
	}
	public void setMacDateChk(String macDateChk) {
		this.macDateChk = macDateChk;
	}
	public String getRecDateChk() {
		return recDateChk;
	}
	public void setRecDateChk(String recDateChk) {
		this.recDateChk = recDateChk;
	}
	public String getRstMaxChk() {
		return rstMaxChk;
	}
	public void setRstMaxChk(String rstMaxChk) {
		this.rstMaxChk = rstMaxChk;
	}
	public String getCalMaxChk() {
		return calMaxChk;
	}
	public void setCalMaxChk(String calMaxChk) {
		this.calMaxChk = calMaxChk;
	}
	public String getRstNmChk() {
		return rstNmChk;
	}
	public void setRstNmChk(String rstNmChk) {
		this.rstNmChk = rstNmChk;
	}
	public String getSurvDisChk() {
		return survDisChk;
	}
	public void setSurvDisChk(String survDisChk) {
		this.survDisChk = survDisChk;
	}
	public String getParalLongiChk() {
		return paralLongiChk;
	}
	public void setParalLongiChk(String paralLongiChk) {
		this.paralLongiChk = paralLongiChk;
	}
	public String getSecParalLongiChk() {
		return secParalLongiChk;
	}
	public void setSecParalLongiChk(String secParalLongiChk) {
		this.secParalLongiChk = secParalLongiChk;
	}
	public String getSurvParalLongiChk() {
		return survParalLongiChk;
	}
	public void setSurvParalLongiChk(String survParalLongiChk) {
		this.survParalLongiChk = survParalLongiChk;
	}
	public String getCalValChk() {
		return calValChk;
	}
	public void setCalValChk(String calValChk) {
		this.calValChk = calValChk;
	}
	public String getRstIdxChk() {
		return rstIdxChk;
	}
	public void setRstIdxChk(String rstIdxChk) {
		this.rstIdxChk = rstIdxChk;
	}
	public String getExcelRow() {
		return excelRow;
	}
	public void setExcelRow(String excelRow) {
		this.excelRow = excelRow;
	}
	
	
	
	
	
}