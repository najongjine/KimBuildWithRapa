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
@Alias("tchrMngVO")
public class TchrMngVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String seq;
	private String name;
	private String id;
	private String pwd;
	private String rgstDt;
	private String rgstId;
	private String rvseDt;
	private String rvseId;
	private String useYn;
	private String atchFileId;
	private String hp;
	private String phone;
	private String email;
	private String emailYn;
	private String birthdt;
	private String addr;
	private String zonecode;
	private String addrDetail;
	private String job;
	private String jobName;
	private String dptName;
	private String position;
	private String homepage;
	private String workPhone;
	private String workFax;
	private String memberYn;
	private String memberAlwYn;
	private String bNrmlMember;
	private String bAlTchrStus;
	private String cname;
	private String lctrL;
	private String lctrM;
	private String lctrS;
	private String lctrD;
	private String lctrO;
	private String piYn;
	private String uiYn;
	private String pioYn;
	private String tchrMngSeq;
	private String period;
	private String schlName;
	private String target;
	private String lecSubject;
	private String lecTime;
	private String book;
	private String ect;
	private String bookNm;
	private String publisher;
	private String pubYear;
	private String coAuth;
	private String association;
	private String irole;
	private String wPlace;
	private String dpt;
	private String rank;
	private String mWork;
	private String major;
	private String aDegree;
	private String etc;
	private String gender;
	private String byear;
	private String bmonth;
	private String bdate;

	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailYn() {
		return emailYn;
	}
	public void setEmailYn(String emailYn) {
		this.emailYn = emailYn;
	}
	public String getBirthdt() {
		return birthdt;
	}
	public void setBirthdt(String birthdt) {
		this.birthdt = birthdt;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getZonecode() {
		return zonecode;
	}
	public void setZonecode(String zonecode) {
		this.zonecode = zonecode;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getDptName() {
		return dptName;
	}
	public void setDptName(String dptName) {
		this.dptName = dptName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getWorkPhone() {
		return workPhone;
	}
	public void setWorkPhone(String workPhone) {
		this.workPhone = workPhone;
	}
	public String getWorkFax() {
		return workFax;
	}
	public void setWorkFax(String workFax) {
		this.workFax = workFax;
	}
	public String getMemberYn() {
		return memberYn;
	}
	public void setMemberYn(String memberYn) {
		this.memberYn = memberYn;
	}
	public String getMemberAlwYn() {
		return memberAlwYn;
	}
	public void setMemberAlwYn(String memberAlwYn) {
		this.memberAlwYn = memberAlwYn;
	}
	public String getbNrmlMember() {
		return bNrmlMember;
	}
	public void setbNrmlMember(String bNrmlMember) {
		this.bNrmlMember = bNrmlMember;
	}
	public String getbAlTchrStus() {
		return bAlTchrStus;
	}
	public void setbAlTchrStus(String bAlTchrStus) {
		this.bAlTchrStus = bAlTchrStus;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getLctrL() {
		return lctrL;
	}
	public void setLctrL(String lctrL) {
		this.lctrL = lctrL;
	}
	public String getLctrM() {
		return lctrM;
	}
	public void setLctrM(String lctrM) {
		this.lctrM = lctrM;
	}
	public String getLctrS() {
		return lctrS;
	}
	public void setLctrS(String lctrS) {
		this.lctrS = lctrS;
	}
	public String getLctrD() {
		return lctrD;
	}
	public void setLctrD(String lctrD) {
		this.lctrD = lctrD;
	}
	public String getLctrO() {
		return lctrO;
	}
	public void setLctrO(String lctrO) {
		this.lctrO = lctrO;
	}
	public String getPiYn() {
		return piYn;
	}
	public void setPiYn(String piYn) {
		this.piYn = piYn;
	}
	public String getUiYn() {
		return uiYn;
	}
	public void setUiYn(String uiYn) {
		this.uiYn = uiYn;
	}
	public String getPioYn() {
		return pioYn;
	}
	public void setPioYn(String pioYn) {
		this.pioYn = pioYn;
	}
	public String getTchrMngSeq() {
		return tchrMngSeq;
	}
	public void setTchrMngSeq(String tchrMngSeq) {
		this.tchrMngSeq = tchrMngSeq;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getSchlName() {
		return schlName;
	}
	public void setSchlName(String schlName) {
		this.schlName = schlName;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getLecSubject() {
		return lecSubject;
	}
	public void setLecSubject(String lecSubject) {
		this.lecSubject = lecSubject;
	}
	public String getLecTime() {
		return lecTime;
	}
	public void setLecTime(String lecTime) {
		this.lecTime = lecTime;
	}
	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
	}
	public String getEct() {
		return ect;
	}
	public void setEct(String ect) {
		this.ect = ect;
	}
	public String getBookNm() {
		return bookNm;
	}
	public void setBookNm(String bookNm) {
		this.bookNm = bookNm;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPubYear() {
		return pubYear;
	}
	public void setPubYear(String pubYear) {
		this.pubYear = pubYear;
	}
	public String getCoAuth() {
		return coAuth;
	}
	public void setCoAuth(String coAuth) {
		this.coAuth = coAuth;
	}
	public String getAssociation() {
		return association;
	}
	public void setAssociation(String association) {
		this.association = association;
	}
	public String getIrole() {
		return irole;
	}
	public void setIrole(String irole) {
		this.irole = irole;
	}
	public String getwPlace() {
		return wPlace;
	}
	public void setwPlace(String wPlace) {
		this.wPlace = wPlace;
	}
	public String getDpt() {
		return dpt;
	}
	public void setDpt(String dpt) {
		this.dpt = dpt;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getmWork() {
		return mWork;
	}
	public void setmWork(String mWork) {
		this.mWork = mWork;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getaDegree() {
		return aDegree;
	}
	public void setaDegree(String aDegree) {
		this.aDegree = aDegree;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getByear() {
		return byear;
	}
	public void setByear(String byear) {
		this.byear = byear;
	}
	public String getBmonth() {
		return bmonth;
	}
	public void setBmonth(String bmonth) {
		this.bmonth = bmonth;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	
}