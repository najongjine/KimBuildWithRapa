package com.open.ma.sample;

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
import com.open.cmmn.model.ExcelImgRowCellVO;
import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ma.sample.service.SampleVO;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

/**
 * ???????????? ???????????? ???????????? ???????????? ???????????? ????????????.
 */
@Controller
public class SampleController {

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
	private final static String PROGRAM_ID = "Sample";

	/** folderPath **/
	private final static String folderPath = "/ma/sam/sample/";

	// @Resource(name = "beanValidator")
	// protected DefaultBeanValidator beanValidator;

	@Autowired
	private EhCacheCacheManager cacheManager;

	Logger log = Logger.getLogger(this.getClass());

	/**
	 * ???????????? ????????????
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
	 * ???????????? ????????????
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
			/** cache??? ?????? */
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
		List<SampleVO> resultList = (List<SampleVO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("resultList", resultList);

		return folderPath + "addList";
	}

	/**
	 * ???????????? ????????????
	 * 
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "view.do")
	public String view(@ModelAttribute("searchVO") SampleVO searchVO, Model model, HttpServletRequest request)
			throws Exception {

		/* ????????? ???????????? */
		SampleVO sampleVO = new SampleVO();
		sampleVO = (SampleVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		model.addAttribute("sampleVO", sampleVO);

		return ".mLayout:" + folderPath + "view";
	}

	/**
	 * ???????????? ????????????
	 * 
	 * @param searchVO
	 * @param model
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") SampleVO searchVO, Model model, @PathVariable String procType,
			HttpServletRequest request) throws Exception {

		SampleVO sampleVO = new SampleVO();
		if (procType.equals("update")) {
			sampleVO = (SampleVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
			if (!StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()).equals("1")
					&& !StringUtil.nullString(sampleVO.getRgstId())
							.equals(StringUtil.nullString(SessionUtil.getUserDetails().getLoginSeq()))) {
				model.addAttribute("message", "??????????????? ???????????????.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
			}
		}
		searchVO.setProcType(procType);
		sampleVO.setSearchVO(searchVO);
		model.addAttribute("sampleVO", sampleVO);

		return ".mLayout:" + folderPath + "form";
	}

	/**
	 * ???????????? ??????
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
	public String proc(@ModelAttribute("searchVO") SampleVO searchVO, Model model, SessionStatus status,
			@PathVariable String procType, HttpServletRequest request) throws Exception {

		if (procType != null) {

			if (procType.equals("insert")) {

				cmmnService.insertContents(searchVO, PROGRAM_ID);

			} else if (procType.equals("update")) {
				cmmnService.updateContents(searchVO, PROGRAM_ID);
			} else if (procType.equals("delete")) {
				cmmnService.deleteContents(searchVO, PROGRAM_ID);

			}

			status.setComplete(); // ?????? Submit ?????? : ????????? ????????? model ??? ????????????.

			if (procType.equals("update")) {
				model.addAttribute("message", "?????????????????????.");
				model.addAttribute("pName", "seq");
				model.addAttribute("pValue", searchVO.getSeq());
				model.addAttribute("cmmnScript", "view.do");
				return "cmmn/execute";
			} else if (procType.equals("insert")) {
				model.addAttribute("message", "?????????????????????.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
			} else if (procType.equals("delete")) {
				model.addAttribute("message", "?????????????????????..");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
			} else {
				return "redirect:list.do";
			}
		}

		return "redirect:list.do";

	}

	// jsp ??????????????? ?????? ???????????? ?????? ???????????? controller
	@RequestMapping(folderPath + "saveExcel.json")
	public ModelAndView COUNTRY_01_excelProc(@ModelAttribute("searchVO") SampleVO searchVO, ModelMap model,
			HttpServletRequest request) throws Exception {
		List<SampleVO> list = null;
		FileVO fileVO = new FileVO();

		int total = 0;// ?????????
		int cnt = 0;// ????????????
		int fail = 0;// ????????????

		String filePath = "";// ????????????
		String atchFileId = "";// ????????????ID
		String fileSn = "";// ??????????????????
		String fileEncodingNm = "";// ????????? ???????????? (ex : ATCH201709190721371290)
		String fileExtnnNm = "";// ?????????

		atchFileId = StringUtil.nullString(searchVO.getAtchFileId());
		fileSn = "0";

		// ????????????ID, ?????? ??????
		fileVO.setAtchFileId(atchFileId);
		fileVO.setFileSn(fileSn);
		// ?????????????????? ??????
		FileVO fvo = fileMngService.selectFileInf(fileVO);

		// ??????????????? ?????????
		if (fvo != null) {

			fileEncodingNm = fvo.getStreFileNm(); // ???????????????
			fileExtnnNm = fvo.getFileExtsn(); // ???????????????

			// ????????????
			filePath = fvo.getFileStreCours() + "/" + fileEncodingNm;
			// ????????? : ??????97-2003 ??????
			if ("xls".equals(fileExtnnNm)) {
				model.addAttribute("error", "???????????????????????? xlsx??? ????????????.\n??????2007 ?????? ????????? ??????????????????.");
				// ????????? : ??????2007 ?????? ??????
			} else if ("xlsx".equals(fileExtnnNm)) {
				list = this.xlsxReadList(filePath);
			} else {
				model.addAttribute("error", "???????????? ??????????????? ????????????.");
			}

			// ???????????? ????????? ????????? DB ??????
			if (list != null) {

				total = list.size();// ?????????
				cnt = 0;// ????????????
				fail = 0;// ????????????

				SampleVO inData = new SampleVO();
				inData.setExcelList(list);
				inData.setAtchFileId(atchFileId);

				try {
					cmmnService.insertContents(inData, PROGRAM_ID+".insertExcelContents");
					cnt++;

				} catch (FileNotFoundException fe) {

					fail++;
					// e.printStackTrace();
				}
			}

		} else {

			model.addAttribute("error", "????????? ????????????.");
		}

		model.addAttribute("total", total);
		model.addAttribute("cnt", cnt);
		model.addAttribute("fail", fail);

		return new ModelAndView(ajaxView, model);
	}

	/**
	 * xlsx ( Excel 2007 ?????? ) ????????? ???????????? List<Em04VO> ????????? ??????
	 * 
	 * @param filePath
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "resource", "deprecation" })
	public List<SampleVO> xlsxReadList(String filePath) throws Exception {

		List<SampleVO> outArray = new ArrayList<>();
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		
		try {

			fis = new FileInputStream(filePath);
			workbook = new XSSFWorkbook(fis);

			XSSFSheet curSheet;
			XSSFRow curRow;
			XSSFCell curCell;
			SampleVO outData;
			// ?????? sheet ?????? (??????????????? : 0)
			curSheet = workbook.getSheetAt(0);

			// row ??????
			int rowLength = curSheet.getPhysicalNumberOfRows();

			// row(???????????????) ?????? for??? (row 0??? ?????????????????? ????????? 1?????? ??????)
			for (int rowIndex = 1; rowIndex < rowLength; rowIndex++) {
				String atchFileId="";
				// ?????? row ??????
				curRow = curSheet.getRow(rowIndex);
				outData = new SampleVO();
				String value;

				// cell ??????
				int cellLength = curRow.getLastCellNum();

				// cell(???????????????) ?????? for???
				for (int cellIndex = 0; cellIndex <= cellLength; cellIndex++) {
					curCell = curRow.getCell(cellIndex);
					// cell ???????????? ??????????????? String?????? ?????? ??????
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
						outData.setTitle(value);
					}
					if (cellIndex == 1) {
						outData.setCont(value);
					}

					if (cellIndex == 2) {
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
					} // ????????????A
					if (cellIndex == 3) {
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
					} // ????????????B

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
		String atchFileIdString = ""; // ???????????? ?????????
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
				if (rowIdx == row1 && cellIdx == col1) { // ??????,????????? ??????

					String ext = xssfPictureData.suggestFileExtension(); // ?????????
					String fileType = xssfPictureData.getMimeType(); // ????????????
					byte[] data = xssfPictureData.getData(); // ?????? byte
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
					fileVO.setOrignFileNm("?????????????????????." + ext);
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
				if (rowIdx == row1 && cellIdx == col1) { // ??????,????????? ??????

					String ext = xssfPictureData.suggestFileExtension(); // ?????????
					String fileType = xssfPictureData.getMimeType(); // ????????????
					byte[] data = xssfPictureData.getData(); // ?????? byte
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
					fileVO.setOrignFileNm("?????????????????????." + ext);
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
