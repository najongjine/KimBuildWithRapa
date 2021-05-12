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
@Alias("mailVO")
public class MailVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String seq;
	private String mailSeq;
	private String title;
	private String cont;
	private String wform;
	private String rgstDt;
	private String rgstId;
	private String ip;
	private String rEmail;
	
	private String cnt;
	private String name;
	
	private String visitedCnt;
	
	/* 폼에서 넘어오는 데이터 받는 용도 */
	private String userid;
	private String userSeq;
	
	private List<MailVO> mailList=new ArrayList<>();

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

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

	public String getWform() {
		return wform;
	}

	public void setWform(String wform) {
		this.wform = wform;
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

	public List<MailVO> getMailList() {
		return mailList;
	}

	public void setMailList(List<MailVO> mailList) {
		this.mailList = mailList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getMailSeq() {
		return mailSeq;
	}

	public void setMailSeq(String mailSeq) {
		this.mailSeq = mailSeq;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getrEmail() {
		return rEmail;
	}

	public void setrEmail(String rEmail) {
		this.rEmail = rEmail;
	}

	public String getVisitedCnt() {
		return visitedCnt;
	}

	public void setVisitedCnt(String visitedCnt) {
		this.visitedCnt = visitedCnt;
	}

	public String getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	
}