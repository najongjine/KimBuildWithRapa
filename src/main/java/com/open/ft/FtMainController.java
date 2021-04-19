package com.open.ft;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.vo.BImgVO;
import com.open.vo.NoticeVO;
import com.open.vo.PopupVO;

import egovframework.rte.fdl.property.EgovPropertyService;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class FtMainController {

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
	
	
    /** Program ID **/
    private final static String PROGRAM_ID = "";

    /** folderPath **/
    private final static String folderPath = "/ft/";

	//@Resource(name = "beanValidator")
	//protected DefaultBeanValidator beanValidator;
	
    @Autowired
	private EhCacheCacheManager cacheManager;
    
	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(folderPath + "main.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		searchVO.setFirstIndex(0);
		searchVO.setRecordCountPerPage(4);
		List<NoticeVO> noticeList=(List<NoticeVO>) cmmnService.selectList(searchVO, "MainPage.selectMainpageNoticeList");
		List<PopupVO> popupList=(List<PopupVO>) cmmnService.selectList(searchVO, "MainPage.selectPopupList");
		searchVO.setRecordCountPerPage(3);
		List<BImgVO> bexamList=(List<BImgVO>) cmmnService.selectList(searchVO, "BExamp.selectList");
		List<BImgVO> brecoList=(List<BImgVO>) cmmnService.selectList(searchVO, "BReco.selectList");
		List<BImgVO> bfieldList=(List<BImgVO>) cmmnService.selectList(searchVO, "BField.selectList");
		List<BImgVO> binteexammList=(List<BImgVO>) cmmnService.selectList(searchVO, "InteExam.selectList");
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("bexamList", bexamList);
		model.addAttribute("brecoList", brecoList);
		model.addAttribute("bfieldList", bfieldList);
		model.addAttribute("binteexammList", binteexammList);
		model.addAttribute("popupList", popupList);
		return folderPath + "main";
	}

}