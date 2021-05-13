package com.open.ma.mdev.mcomplchrt;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.ibm.icu.text.SimpleDateFormat;
import com.open.cmmn.excel.ExcelView;
import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.StringUtil;
import com.open.vo.ComplChrtVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class MComplChrtControllerV2 {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
    
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** fileUploadProperties */
	@Resource(name = "fileUploadProperties")
	Properties fileUploadProperties;
	
	/**
	 * MappingJackson2JsonView.
	 */
	@Resource
	private MappingJackson2JsonView ajaxView;
	
	@Autowired
	ExcelView excelView;
	
	
    /** Program ID **/
    private final static String PROGRAM_ID = "ComplChrt";

    /** folderPath **/
    private final static String folderPath = "/ma/mdev/mcomplchrt/";

	//@Resource(name = "beanValidator")
	//protected DefaultBeanValidator beanValidator;
	
    @Autowired
	private EhCacheCacheManager cacheManager;
    
	Logger log = Logger.getLogger(this.getClass());

	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") ComplChrtVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		return ".mLayout:"+ folderPath + "listV2";
	}
	
	/**
	 * 차트와 통계 테이블 페이지를 보내주는 코드
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "totalData.do")
	public String totalData(@ModelAttribute("searchVO") ComplChrtVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		
		return folderPath + "totalDataV2";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") ComplChrtVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
			
		int pageSize = propertiesService.getInt("pageSize");
		searchVO.setPageSize(pageSize);
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		List<ComplChrtVO> resultList = (List<ComplChrtVO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("resultList", resultList);
		
		return folderPath + "addList";
	}
	
	
	@RequestMapping(folderPath + "addFileForm.do")
	public String addFileForm(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		return folderPath + "addFileForm";
	}
	
	@RequestMapping(folderPath+"saveExcel.json")
	public ModelAndView saveExcel(@ModelAttribute("searchVO") ComplChrtVO searchVO, ModelMap model , HttpServletRequest request) throws Exception {
		
		List<ComplChrtVO> list = null;
		FileVO fileVO = new FileVO();
		
		int total = 0;	// 총건수

		String filePath   = "";		// 파일경로
		String atchFileId = "";		// 첨부파일ID
		String fileSn	  = "";		// 첨부파일순번
		String fileEncodingNm 	= "";	// 변환된 파일이름 (ex : ATCH201709190721371290)
    	String fileExtnnNm 		= "";	// 확장자
    	
    	atchFileId = StringUtil.nullString(searchVO.getAtchFileId());
		fileSn	   = "0";
		
		// 첨부파일ID, 순번 셋팅
	    fileVO.setAtchFileId(atchFileId);
	    fileVO.setFileSn(fileSn);
	    // 첨부파일정보 조회
	    FileVO fvo = fileMngService.selectFileInf(fileVO);
	    
	    // 첨부파일이 있다면
	    if(fvo != null){
	    	
	    	fileEncodingNm  = fvo.getStreFileNm(); //변환파일명
	    	fileExtnnNm 	= fvo.getFileExtsn();  //파일확장자
	    	
	    	// 파일경로
	    	filePath = fvo.getFileStreCours() + "/" + fileEncodingNm;
	    	// 확장자 : 엑셀97-2003 버전
		    if("xls".equals(fileExtnnNm)){
		    	//model.addAttribute("error", "엑셀파일확장자가 xlsx이 아닙니다.\n엑셀2007 이상 버전을 사용해주세요.");
		    	list = this.xlsReadList(filePath);
		    // 확장자 : 엑셀2007 이상 버전
		    }else if("xlsx".equals(fileExtnnNm)){
		    	list = this.xlsxReadList(filePath);
		    }else{
		    	model.addAttribute("error", "확장자가 엑셀파일이 아닙니다.");
		    }
		    // 엑셀에서 추출한 데이터 DB 저장
		    if(list != null){
		    	
	    		ComplChrtVO inData = new ComplChrtVO();
	    		inData.setExcelList(list);
	    		cmmnService.deleteContents(inData, PROGRAM_ID); // 엑셀 업로드로 insert 했던 데이터들 전부 삭제
	    		cmmnService.insertContents(inData, PROGRAM_ID +".excelInsertContents");
		    }
		    
	    }else{
	    	model.addAttribute("error", "파일이 없습니다.");
	    }
		return new ModelAndView(ajaxView,model);
	}	

	@SuppressWarnings({ "resource", "deprecation" })
	public List<ComplChrtVO> xlsReadList(String filePath){
		
		List<ComplChrtVO> outArray = new ArrayList<>();
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		
		try{
	    	
	    	fis = new FileInputStream(filePath);
	    	workbook = new HSSFWorkbook(fis);
	    	
	    	HSSFSheet curSheet;
	    	HSSFRow	curRow;
	    	HSSFCell curCell;
	    	ComplChrtVO outData;
	    	
	    	// sheet 탐색 for문
	    	//for(int sheetIndex=0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++){
	    		
	    	// 현재 sheet 반환 (첫번째시트 : 0)
    		curSheet = workbook.getSheetAt(0);
    		
    		// row 길이
    		int rowLength = curSheet.getPhysicalNumberOfRows();
    		
    		// row(세로데이터) 탐색 for문 (row 0은 헤더정보이기 때문에 1부터 시작)
    		for(int rowIndex=1; rowIndex < rowLength; rowIndex++){
			
				// 현재 row 반환
				curRow = curSheet.getRow(rowIndex);
				outData = new ComplChrtVO();
				String value;
				
				// cell 길이
				int cellLength = 4;
				if(curRow != null){
				// cell(가로데이터) 탐색 for문
				for(int cellIndex = 0; cellIndex <= cellLength; cellIndex++){
					
					curCell = curRow.getCell(cellIndex);
					
					// cell 스타일이 다르더라도 String으로 변환 받음
					if(curCell != null){
						switch (curCell.getCellType()){
						case HSSFCell.CELL_TYPE_FORMULA :
							value = curCell.getCellFormula();
							break;
						case HSSFCell.CELL_TYPE_NUMERIC :
							if( DateUtil.isCellDateFormatted(curCell)) {
								Date date = curCell.getDateCellValue();
								value = new SimpleDateFormat("yyyyMMdd").format(date);
							}else{
								value = (int)curCell.getNumericCellValue()+"";
							}

							break;
						case HSSFCell.CELL_TYPE_STRING :
							value = curCell.getStringCellValue()+"";
							break;
						case HSSFCell.CELL_TYPE_BLANK :
	//						value = curCell.getBooleanCellValue()+"";
							value = "";
							break;
						case HSSFCell.CELL_TYPE_ERROR :
							value = curCell.getErrorCellValue()+"";
							break;
						default :
							value = new String();
							break;
						}
					}else{
						value="";
					}
					if(cellIndex == 0 ){ outData.setCom(value); }
					if(cellIndex == 1 ){ outData.setArea(value); }
					if(cellIndex == 2 ){ outData.setAddress(value); }
					if(cellIndex == 3 ){ outData.setVisitDate(value); }
				}
				
				outArray.add(outData);
				}
    		}
	    	
	    }catch(FileNotFoundException e){
	    	e.printStackTrace();
	    }catch(IOException e){
	    	e.printStackTrace();
	    }finally{
	    	try{
	    		if(workbook != null) {
	    			workbook = null;
	    		}
	    		if(fis != null){
	    			fis.close();
	    		}
	    	}catch(IOException e){
	    		e.printStackTrace();
	    	}
	    }

		return outArray;
	}
	
	/**
	 * xlsx ( Excel 2007 이상 ) 파일을 분석하여 List<Em04VO> 객체에 반환
	 * @param filePath
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings({ "resource", "deprecation" })
	public List<ComplChrtVO> xlsxReadList(String filePath) throws Exception{
		
		List<ComplChrtVO> outArray = new ArrayList<>();
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		
		try{
	    	
	    	fis = new FileInputStream(filePath);
	    	workbook = new XSSFWorkbook(fis);
	    	
	    	XSSFSheet curSheet;
	    	XSSFRow	curRow;
	    	XSSFCell curCell;
	    	ComplChrtVO outData;
    		// 현재 sheet 반환 (첫번째시트 : 0)
    		curSheet = workbook.getSheetAt(0);
    		
    		// row 길이
    		int rowLength = curSheet.getPhysicalNumberOfRows();

    		// row(세로데이터) 탐색 for문 (row 0은 헤더정보이기 때문에 1부터 시작)
    		for(int rowIndex=1; rowIndex < rowLength; rowIndex++){
			
				// 현재 row 반환
				curRow = curSheet.getRow(rowIndex);
				outData = new ComplChrtVO();
				String value;
				
				// cell 길이
				int cellLength = 4;
				if(curRow != null){
				
				// cell(가로데이터) 탐색 for문
				for(int cellIndex = 0; cellIndex <= cellLength; cellIndex++){
					curCell = curRow.getCell(cellIndex);
					// cell 스타일이 다르더라도 String으로 변환 받음
					if(curCell != null){
						switch (curCell.getCellType()){
						case HSSFCell.CELL_TYPE_FORMULA :
							value = curCell.getCellFormula();
							break;
						case HSSFCell.CELL_TYPE_NUMERIC :
							if( DateUtil.isCellDateFormatted(curCell)) {
								Date date = curCell.getDateCellValue();
								value = new SimpleDateFormat("yyyyMMdd").format(date);
							}else{
								value = (int)curCell.getNumericCellValue()+"";
							}
							break;
						case HSSFCell.CELL_TYPE_STRING :
							value = curCell.getStringCellValue()+"";
							break;
						case HSSFCell.CELL_TYPE_BLANK :
//						value = curCell.getBooleanCellValue()+"";
							value = "";
							break;
						case HSSFCell.CELL_TYPE_ERROR :
							value = curCell.getErrorCellValue()+"";
							break;
						default :
							value = new String();
							break;
						}
					}else{
						value = "";
					}
					if(cellIndex == 0 ){ outData.setCom(value); }
					if(cellIndex == 1 ){ outData.setArea(value); }
					if(cellIndex == 2 ){ outData.setAddress(value); }
					if(cellIndex == 3 ){ outData.setVisitDate(value); }
				}
				outArray.add(outData);
				}
    		}
	    	
	    }catch(FileNotFoundException e){
	    	e.printStackTrace();
	    }catch(IOException e){
	    	e.printStackTrace();
	    }finally{
	    	try{
	    		if(workbook != null) {
	    			workbook = null;
	    		}
	    		if(fis != null){
	    			fis.close();
	    		}
	    	}catch(IOException e){
	    		e.printStackTrace();
	    	}
	    }
		
		return outArray;
	}	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "excelDown.do")
	public ModelAndView excelDown1(@ModelAttribute("searchVO") ComplChrtVO searchVO, ModelMap model, HttpServletRequest request) throws Exception{
		
		ModelAndView mav = new ModelAndView(excelView);
		String tit = "전자파 민원 통계";
		
		/*코드만 들어있는 깡통 excel*/
		String url = "/mgr0149.xlsx";
		
		searchVO.setSchEtc15("E");
		List<ComplChrtVO> resultList =  (List<ComplChrtVO>) cmmnService.selectList(searchVO, PROGRAM_ID);;
		
		mav.addObject("target", tit);
		mav.addObject("source", url);
		
		/*엑셀안에 resultlist 를 뿌리는 코드가 있음. 엑셀안에 데이터를를 쏴주는거*/
		if(resultList.size() > 0){
			mav.addObject("result", resultList);
		}
		return mav;
	}
	
}
