package com.open.ma.mdev.mexcel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFPicture;
import org.apache.poi.xssf.usermodel.XSSFPictureData;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFShape;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.vo.ImgVO;
import com.open.vo.KaWireVO;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

/**
 * 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class MExcelController {

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

	@Resource(name = "fileIdGnrService")
	private EgovIdGnrService idgenService;

	/**
	 * MappingJackson2JsonView.
	 */
	@Resource
	private MappingJackson2JsonView ajaxView;

	/** Program ID **/
	private final static String PROGRAM_ID = "Excel";

	/** folderPath **/
	private final static String folderPath = "/ma/mdev/mexcel/";

	// @Resource(name = "beanValidator")
	// protected DefaultBeanValidator beanValidator;

	@Autowired
	private EhCacheCacheManager cacheManager;

	Logger log = Logger.getLogger(this.getClass());

	/**
	 * 메뉴권한 목록화면
	 * 
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request)
			throws Exception {

		return ".mLayout:" + folderPath + "list";
	}

	/**
	 * 메뉴권한 목록화면
	 * 
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model,
			HttpServletRequest request) throws Exception {

		/** Cache sample */
		Ehcache cache = cacheManager.getCacheManager().getCache("properties");
		Element pageUnit = cache.get("pageUnit");
		Element pageSize = cache.get("pageSize");

		if (pageUnit != null && pageSize != null) {
			searchVO.setPageUnit(Integer.parseInt(pageUnit.getValue().toString()));
			searchVO.setPageSize(Integer.parseInt(pageSize.getValue().toString()));
		} else {
			/** EgovPropertyService.sample */
			searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
			searchVO.setPageSize(propertiesService.getInt("pageSize"));
			/** cache에 입력 */
			cache.put(new Element("pageUnit", propertiesService.getInt("pageUnit")));
			cache.put(new Element("pageSize", propertiesService.getInt("pageSize")));
		}

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

		@SuppressWarnings("unchecked")
		List<KaWireVO> resultList = (List<KaWireVO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("resultList", resultList);

		return folderPath + "addList";
	}

	/**
	 * 메뉴권한 상세화면
	 * 
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "view.do")
	public String view(@ModelAttribute("searchVO") KaWireVO searchVO, Model model, HttpServletRequest request)
			throws Exception {

		/* 게시판 상세정보 */
		KaWireVO kaWireVO = new KaWireVO();
		kaWireVO = (KaWireVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		List<ImgVO> imgList=(List<ImgVO>) cmmnService.selectList(kaWireVO, PROGRAM_ID+".selectImgList");
		kaWireVO.setImgList(imgList);
		model.addAttribute("kaWireVO", kaWireVO);

		return ".mLayout:" + folderPath + "view";
	}

	/**
	 * 메뉴권한 등록화면
	 * 
	 * @param searchVO
	 * @param model
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") KaWireVO searchVO, Model model, @PathVariable String procType,
			HttpServletRequest request) throws Exception {

		KaWireVO kaWireVO = new KaWireVO();
		if (procType.equals("update")) {
			kaWireVO = (KaWireVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
			if (!StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()).equals("1")
					&& !StringUtil.nullString(kaWireVO.getRgstId())
							.equals(StringUtil.nullString(SessionUtil.getUserDetails().getLoginSeq()))) {
				model.addAttribute("message", "비정상적인 접근입니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
			}
		}
		searchVO.setProcType(procType);
		kaWireVO.setSearchVO(searchVO);
		model.addAttribute("kaWireVO", kaWireVO);

		return ".mLayout:" + folderPath + "form";
	}

	/**
	 * 메뉴권한 처리
	 * 
	 * @param searchVO
	 * @param model
	 * @param status
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") KaWireVO searchVO, Model model, SessionStatus status,
			@PathVariable String procType, HttpServletRequest request) throws Exception {

		if (procType != null) {

			if (procType.equals("insert")) {

				cmmnService.insertContents(searchVO, PROGRAM_ID);

			} else if (procType.equals("update")) {
				cmmnService.updateContents(searchVO, PROGRAM_ID);
			} else if (procType.equals("delete")) {
				cmmnService.deleteContents(searchVO, PROGRAM_ID);

			}

			status.setComplete(); // 중복 Submit 방지 : 세션에 저장된 model 을 삭제한다.

			if (procType.equals("update")) {
				model.addAttribute("message", "수정되었습니다.");
				model.addAttribute("pName", "seq");
				model.addAttribute("pValue", searchVO.getSeq());
				model.addAttribute("cmmnScript", "view.do");
				return "cmmn/execute";
			} else if (procType.equals("insert")) {
				model.addAttribute("message", "등록되었습니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
			} else if (procType.equals("delete")) {
				model.addAttribute("message", "삭제되었습니다..");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
			} else {
				return "redirect:list.do";
			}
		}

		return "redirect:list.do";

	}

	// jsp 페이지에서 엑셀 업로드를 위해 호출하는 controller
	@RequestMapping(folderPath + "saveExcel.json")
	public ModelAndView COUNTRY_01_excelProc(@ModelAttribute("searchVO") KaWireVO searchVO, ModelMap model,
			HttpServletRequest request) throws Exception {
		List<KaWireVO> list = null;
		FileVO fileVO = new FileVO();

		int total = 0;// 총건수
		int cnt = 0;// 성공건수
		int fail = 0;// 실패건수

		String filePath = "";// 파일경로
		String atchFileId = "";// 첨부파일ID
		String fileSn = "";// 첨부파일순번
		String fileEncodingNm = "";// 변환된 파일이름 (ex : ATCH201709190721371290)
		String fileExtnnNm = "";// 확장자

		atchFileId = StringUtil.nullString(searchVO.getAtchFileId());
		fileSn = "0";

		// 첨부파일ID, 순번 셋팅
		fileVO.setAtchFileId(atchFileId);
		fileVO.setFileSn(fileSn);
		// 첨부파일정보 조회
		FileVO fvo = fileMngService.selectFileInf(fileVO);

		// 첨부파일이 있다면
		if (fvo != null) {

			fileEncodingNm = fvo.getStreFileNm(); // 변환파일명
			fileExtnnNm = fvo.getFileExtsn(); // 파일확장자

			// 파일경로
			filePath = fvo.getFileStreCours() + "/" + fileEncodingNm;
			// 확장자 : 엑셀97-2003 버전
			if ("xls".equals(fileExtnnNm)) {
				model.addAttribute("error", "엑셀파일확장자가 xlsx이 아닙니다.\n엑셀2007 이상 버전을 사용해주세요.");
				// 확장자 : 엑셀2007 이상 버전
			} else if ("xlsx".equals(fileExtnnNm)) {
				list = this.xlsxReadList(filePath);
			} else {
				model.addAttribute("error", "확장자가 엑셀파일이 아닙니다.");
			}

			// 엑셀에서 추출한 데이터 DB 저장
			if (list != null) {

				total = list.size();// 총건수
				cnt = 0;// 성공건수
				fail = 0;// 실패건수

				KaWireVO inData = new KaWireVO();
				inData.setExcelList(list);
				inData.setAtchFileId(atchFileId);

				try {
					cmmnService.insertContents(inData, PROGRAM_ID+".excelInsertContents");
					cnt++;

				} catch (FileNotFoundException fe) {

					fail++;
					// e.printStackTrace();
				}
			}

		} else {

			model.addAttribute("error", "파일이 없습니다.");
		}

		model.addAttribute("total", total);
		model.addAttribute("cnt", cnt);
		model.addAttribute("fail", fail);

		return new ModelAndView(ajaxView, model);
	}

	/**
	 * xlsx ( Excel 2007 이상 ) 파일을 분석하여 List<Em04VO> 객체에 반환
	 * 
	 * @param filePath
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "resource", "deprecation" })
	public List<KaWireVO> xlsxReadList(String filePath) throws Exception {

		List<KaWireVO> outArray = new ArrayList<>();
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		
		try {

			fis = new FileInputStream(filePath);
			workbook = new XSSFWorkbook(fis);

			XSSFSheet curSheet;
			XSSFRow curRow;
			XSSFCell curCell;
			KaWireVO outData;
			// 현재 sheet 반환 (첫번째시트 : 0)
			curSheet = workbook.getSheetAt(0);

			// row 길이
			int rowLength = curSheet.getPhysicalNumberOfRows();

			// row(세로데이터) 탐색 for문 (row 0은 헤더정보이기 때문에 1부터 시작)
			for (int rowIndex = 1; rowIndex < rowLength; rowIndex++) {
				String atchFileId="";
				// 현재 row 반환
				curRow = curSheet.getRow(rowIndex);
				outData = new KaWireVO();
				String value;

				// cell 길이
				int cellLength = curRow.getLastCellNum();

				// cell(가로데이터) 탐색 for문
				for (int cellIndex = 0; cellIndex <= cellLength; cellIndex++) {
					curCell = curRow.getCell(cellIndex);
					// cell 스타일이 다르더라도 String으로 변환 받음
					if (curCell != null) {
						switch (curCell.getCellType()) {
						case HSSFCell.CELL_TYPE_FORMULA:
							value = curCell.getCellFormula();
							break;
						case HSSFCell.CELL_TYPE_NUMERIC:
							value = (int) curCell.getNumericCellValue() + "";
							break;
						case HSSFCell.CELL_TYPE_STRING:
							value = curCell.getStringCellValue() + "";
							break;
						case HSSFCell.CELL_TYPE_BLANK:
							// value = curCell.getBooleanCellValue()+"";
							value = "";
							break;
						case HSSFCell.CELL_TYPE_ERROR:
							value = curCell.getErrorCellValue() + "";
							break;
						default:
							value = new String();
							break;
						}
					} else {
						value = "";
					}

					if (cellIndex == 0) {
						outData.setFctNm(value);
					}
					if (cellIndex == 1) {
						outData.setSrvcCls(value);
					}
					if (cellIndex == 2) {
						outData.setRsNm(value);
					}
					if (cellIndex == 3) {
						outData.setPermsSeq(value);
					}
					if (cellIndex == 4) {
						outData.setInspDt(value);
					}
					if (cellIndex == 5) {
						outData.setWiAddr(value);
					}
					if (cellIndex == 6) {
						outData.setMnger(value);
					}
					if (cellIndex == 7) {
						outData.setMngerHp(value);
					}
					if (cellIndex == 8) {
						outData.setWiEntMthd(value);
					}
					if (cellIndex == 9) {
						String fromFreq=value.split("~")[0].trim();
						String toFreq=value.split("~")[1].trim();
						outData.setTxFreqFrom(fromFreq);
						outData.setTxFreqTo(toFreq);
					}
					if (cellIndex == 11) {
						outData.setAnthPwrSum(value);
					}
					if (cellIndex == 12) {
						outData.setAnthKind(value);
					}
					if (cellIndex == 13) {
						outData.setAnthBnft(value);
					}
					if (cellIndex == 14) {
						outData.setAnthHght(value);
					}
					if (cellIndex == 15) {
						outData.setGrndHght(value);
					}
					if (cellIndex == 16) {
						outData.setAnthBmCnt(value);
					}
					if (cellIndex == 17) {
						outData.setAnthBmKind(value);
					}
					if (cellIndex == 18) {
						outData.setIstrRadPwr(value);
					}
					if (cellIndex == 19) {
						outData.setCntrFreq(value);
					}
					if (cellIndex == 20) {
						outData.setBndwth(value);
					}
					if (cellIndex == 21) {
						outData.setRefSigFreq(value);
					}
					if (cellIndex == 22) {
						outData.setAnthTiltAng(value);
					}
					if (cellIndex == 23) {
						outData.setMaxVertBeamAng(value);
					}
					if (cellIndex == 24) {
						outData.setMaxHorizBeamAng(value);
					}
					if (cellIndex == 25) {
						outData.setSyncSigGrpfrq(value);
					}
					if (cellIndex == 26) {
						outData.setSlotFmtCnt(value);
					}
					if (cellIndex == 27) {
						outData.setFreqrcBlockCnt(value);
					}
					if (cellIndex == 28) {
						outData.setSubWvCnt(value);
					}
					if (cellIndex == 29) {
						outData.setAbvGrdsmbCnt(value);
					}
					if (cellIndex == 30) {
						outData.setOneslotSmbCnt(value);
					}
					if (cellIndex == 31) {
						outData.setSlotFmtInfo(value);
					}
					if (cellIndex == 32) {
						outData.setMnfctr(value);
					}
					if (cellIndex == 33) {
						outData.setBsnMngId(value);
					}


					if (cellIndex == 34) {
						if("".equals(atchFileId)) {
							String _atchFileId = imageUp(curSheet, rowIndex, cellIndex);
							if(!StringUtil.nullConvert(_atchFileId).equals("")) {
								atchFileId=_atchFileId;
							}
						}else {
							imageUpWithSameAtchFileId(atchFileId,curSheet, rowIndex, cellIndex);
						}
						
						if (!StringUtil.nullConvert(atchFileId).equals("")) {
							outData.setAtchFileId(atchFileId);
						}
					} // 첨부파일A
					if (cellIndex == 35) {
						if("".equals(atchFileId)) {
							String _atchFileId = imageUp(curSheet, rowIndex, cellIndex);
							if(!StringUtil.nullConvert(_atchFileId).equals("")) {
								atchFileId=_atchFileId;
							}
						}else {
							imageUpWithSameAtchFileId(atchFileId,curSheet, rowIndex, cellIndex);
						}
						
						if (!StringUtil.nullConvert(atchFileId).equals("")) {
							outData.setAtchFileId(atchFileId);
						}
					} // 첨부파일B

				}
				outArray.add(outData);
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (workbook != null) {
					workbook = null;
				}
				if (fis != null) {
					fis.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return outArray;
	}

	public String imageUp(XSSFSheet curSheet, int rowIdx, int cellIdx) throws Exception {
		double beforeTime = System.currentTimeMillis();
		double afterTime = 0;
		String reTime = "-1";
		XSSFDrawing drawing = curSheet.createDrawingPatriarch();
		String atchFileIdString = ""; // 첨부파일 아이디
		for (XSSFShape shape : drawing.getShapes()) {
			if (shape instanceof XSSFPicture) {
				XSSFPicture picture = (XSSFPicture) shape;
				if (picture.getPictureData() == null) {
					continue;
				}
				XSSFPictureData xssfPictureData = picture.getPictureData();
				ClientAnchor anchor = picture.getPreferredSize();
				int row1 = anchor.getRow1();
				int row2 = anchor.getRow2();
				int col1 = anchor.getCol1();
				int col2 = anchor.getCol2();
				if (rowIdx == row1 && cellIdx == col1) { // 시트,셀위치 검사

					String ext = xssfPictureData.suggestFileExtension(); // 확장자
					String fileType = xssfPictureData.getMimeType(); // 파일타입
					byte[] data = xssfPictureData.getData(); // 파일 byte
					String fileUploadPath = fileUploadProperties.getProperty("file.upload.path").replaceAll("\\.\\.",
							"");
					String storePathString = fileUploadPath + getFolderPath();
					if (storePathString != null && !"".equals(storePathString)) {
						File saveFolder = new File(storePathString);
						if (!saveFolder.exists() || saveFolder.isFile()) {
							saveFolder.mkdirs();
						}
					}
					atchFileIdString = idgenService.getNextStringId();
					String newName = "EXCEL" + StringUtil.getTimeStamp() + atchFileIdString;
					FileOutputStream out = new FileOutputStream(storePathString + File.separator + newName);
					out.write(data);
					out.close();

					FileVO fileVO = new FileVO();
					fileVO.setFileStreCours(storePathString);
					fileVO.setAtchFileId(atchFileIdString);
					fileVO.setOrignFileNm("다운받을이미지." + ext);
					fileVO.setStreFileNm(newName);
					fileVO.setFileExtsn(ext);
					fileVO.setFileType(fileType);
					fileVO.setImageWidth((int)( (anchor.getDx2() - anchor.getDx1())/1000) );
					fileVO.setImageHeight((int)( (anchor.getDy2() - anchor.getDy1())/1000) );
					fileMngService.insertFileInf(fileVO);
					break;
				}
			}
		}

		afterTime = System.currentTimeMillis();
		double secDiffTime = (afterTime - beforeTime) / 1000;
		reTime = String.format("%.1f", secDiffTime);
		System.out.println("re :: " + reTime);
		return atchFileIdString;

	}
	
	public String imageUpWithSameAtchFileId(String atchFileIdString, XSSFSheet curSheet, int rowIdx, int cellIdx) throws Exception {
		if("".equals(atchFileIdString)) {
			return null;
		}
		double beforeTime = System.currentTimeMillis();
		double afterTime = 0;
		String reTime = "-1";
		XSSFDrawing drawing = curSheet.createDrawingPatriarch();
		for (XSSFShape shape : drawing.getShapes()) {
			if (shape instanceof XSSFPicture) {
				XSSFPicture picture = (XSSFPicture) shape;
				if (picture.getPictureData() == null) {
					continue;
				}
				XSSFPictureData xssfPictureData = picture.getPictureData();
				ClientAnchor anchor = picture.getPreferredSize();
				int row1 = anchor.getRow1();
				int row2 = anchor.getRow2();
				int col1 = anchor.getCol1();
				int col2 = anchor.getCol2();
				if (rowIdx == row1 && cellIdx == col1) { // 시트,셀위치 검사

					String ext = xssfPictureData.suggestFileExtension(); // 확장자
					String fileType = xssfPictureData.getMimeType(); // 파일타입
					byte[] data = xssfPictureData.getData(); // 파일 byte
					String fileUploadPath = fileUploadProperties.getProperty("file.upload.path").replaceAll("\\.\\.",
							"");
					String storePathString = fileUploadPath + getFolderPath();
					if (storePathString != null && !"".equals(storePathString)) {
						File saveFolder = new File(storePathString);
						if (!saveFolder.exists() || saveFolder.isFile()) {
							saveFolder.mkdirs();
						}
					}
					String newName = "EXCEL" + StringUtil.getTimeStamp() + atchFileIdString;
					FileOutputStream out = new FileOutputStream(storePathString + File.separator + newName);
					out.write(data);
					out.close();

					FileVO fileVO = new FileVO();
					fileVO.setFileStreCours(storePathString);
					fileVO.setAtchFileId(atchFileIdString);
					fileVO.setOrignFileNm("다운받을이미지." + ext);
					fileVO.setStreFileNm(newName);
					fileVO.setFileExtsn(ext);
					fileVO.setFileType(fileType);
					fileVO.setImageWidth((int)( (anchor.getDx2() - anchor.getDx1())/1000) );
					fileVO.setImageHeight((int)( (anchor.getDy2() - anchor.getDy1())/1000) );
					cmmnService.insertContents(fileVO, "FileManageDAO.insertFileDetail");
					break;
				}
			}
		}

		afterTime = System.currentTimeMillis();
		double secDiffTime = (afterTime - beforeTime) / 1000;
		reTime = String.format("%.1f", secDiffTime);
		System.out.println("re :: " + reTime);
		return atchFileIdString;

	}

	public String getFolderPath() {
		Calendar calVal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
		String today = dateFormat.format(calVal.getTime());

		StringBuffer datePath = new StringBuffer();
		datePath.append(File.separator).append(today.substring(0, 4)).append(File.separator)
				.append(today.substring(4, 6)).append(File.separator).append(today.substring(6, 8))
				.append(File.separator).append(today.substring(8, 10));

		return datePath.toString();
	}

}
