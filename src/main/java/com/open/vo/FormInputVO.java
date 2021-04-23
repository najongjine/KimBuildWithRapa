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
@Alias("forminputVO")
public class FormInputVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String seq;
	private String title;
	private String cont;
	private String rgstDt;
	private String atchFileId;
	private String hp;
	private String mail;
	private String rgstId;
	private String cnt;
	private String name;
	private List<FormInputCheckboxListVO> checkBoxList;
	private String scale;
	private String city;
	private String color;
	private String date1;
	private String radio1;
	private String url;
	private String keyword;
	private String datalist;
	private List<String> belongkind=new ArrayList<String>();
	
	private String addr;
	private String addrDetail;
	private String zonecode;
	private String socialSecNum;
	private String businessLicNum;
	
	
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getZonecode() {
		return zonecode;
	}
	public void setZonecode(String zonecode) {
		this.zonecode = zonecode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getSocialSecNum() {
		return socialSecNum;
	}
	public void setSocialSecNum(String socialSecNum) {
		this.socialSecNum = socialSecNum;
	}
	public String getBusinessLicNum() {
		return businessLicNum;
	}
	public void setBusinessLicNum(String businessLicNum) {
		this.businessLicNum = businessLicNum;
	}
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
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
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
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
	public String getRadio1() {
		return radio1;
	}
	public void setRadio1(String radio1) {
		this.radio1 = radio1;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public List<FormInputCheckboxListVO> getCheckBoxList() {
		return checkBoxList;
	}
	public void setCheckBoxList(List<FormInputCheckboxListVO> checkBoxList) {
		this.checkBoxList = checkBoxList;
	}
	public List<String> getBelongkind() {
		return belongkind;
	}
	public void setBelongkind(List<String> belongkind) {
		this.belongkind = belongkind;
	}
	public String getDatalist() {
		return datalist;
	}
	public void setDatalist(String datalist) {
		this.datalist = datalist;
	}
	
}
