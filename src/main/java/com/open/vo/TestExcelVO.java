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
@Alias("testexcelVO")
public class TestExcelVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String seq;
	private String testCol1;
	private String testCol2;
	private String testCol3;
	private String testCol4;
	private String testCol5;
	
	private String imgCol1;
	
	private List<TestExcelVO> excelList;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getTestCol1() {
		return testCol1;
	}
	public void setTestCol1(String testCol1) {
		this.testCol1 = testCol1;
	}
	public String getTestCol2() {
		return testCol2;
	}
	public void setTestCol2(String testCol2) {
		this.testCol2 = testCol2;
	}
	public String getTestCol3() {
		return testCol3;
	}
	public void setTestCol3(String testCol3) {
		this.testCol3 = testCol3;
	}
	public String getTestCol4() {
		return testCol4;
	}
	public void setTestCol4(String testCol4) {
		this.testCol4 = testCol4;
	}
	public String getTestCol5() {
		return testCol5;
	}
	public void setTestCol5(String testCol5) {
		this.testCol5 = testCol5;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public List<TestExcelVO> getExcelList() {
		return excelList;
	}
	public void setExcelList(List<TestExcelVO> excelList) {
		this.excelList = excelList;
	}
	public String getImgCol1() {
		return imgCol1;
	}
	public void setImgCol1(String imgCol1) {
		this.imgCol1 = imgCol1;
	}

	
}