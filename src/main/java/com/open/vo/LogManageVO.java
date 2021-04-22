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
@Alias("logmanageVO")
public class LogManageVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String seq;
	private String userkind;
	private String id;
	private String url;
	private String ip;
	private String name;
	private String rgstDt;
	private String atchFileId;
	private String rgstId;
	private String cnt;
	private String multipleConCount="0";
	private String loginFailCount;
	private String allow="N";
	private String cont;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getUserkind() {
		return userkind;
	}
	public void setUserkind(String userkind) {
		this.userkind = userkind;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getMultipleConCount() {
		return multipleConCount;
	}
	public void setMultipleConCount(String multipleConCount) {
		this.multipleConCount = multipleConCount;
	}
	public String getLoginFailCount() {
		return loginFailCount;
	}
	public void setLoginFailCount(String loginFailCount) {
		this.loginFailCount = loginFailCount;
	}
	public String getAllow() {
		return allow;
	}
	public void setAllow(String allow) {
		this.allow = allow;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	
}