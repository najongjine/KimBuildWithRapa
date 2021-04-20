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
@Alias("forminputCheckboxListVO")
public class FormInputCheckboxListVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String seq;
	private String forminputSeq;
	private String checkboxContent;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getForminputSeq() {
		return forminputSeq;
	}
	public void setForminputSeq(String forminputSeq) {
		this.forminputSeq = forminputSeq;
	}
	public String getCheckboxContent() {
		return checkboxContent;
	}
	public void setCheckboxContent(String checkboxContent) {
		this.checkboxContent = checkboxContent;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
