package com.open.ft;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import com.open.ma.sys.mn.service.MnVO;
import com.open.vo.AllowPendRejectVO;
import com.open.vo.BImgVO;
import com.open.vo.MMainBannerVO;
import com.open.vo.MMainVO;
import com.open.vo.NoticeVO;
import com.open.vo.PopupVO;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
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

	// @Resource(name = "beanValidator")
	// protected DefaultBeanValidator beanValidator;

	@Autowired
	private EhCacheCacheManager cacheManager;

	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(folderPath + "main.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		searchVO.setFirstIndex(0);
		searchVO.setRecordCountPerPage(4);
		List<NoticeVO> noticeList = (List<NoticeVO>) cmmnService.selectList(searchVO,
				"MainPage.selectMainpageNoticeList");
		List<PopupVO> popupList = (List<PopupVO>) cmmnService.selectList(searchVO, "MainPage.selectPopupList");
		searchVO.setRecordCountPerPage(3);
		List<BImgVO> bexamList = (List<BImgVO>) cmmnService.selectList(searchVO, "BExamp.selectList");
		List<BImgVO> brecoList = (List<BImgVO>) cmmnService.selectList(searchVO, "BReco.selectList");
		List<BImgVO> bfieldList = (List<BImgVO>) cmmnService.selectList(searchVO, "BField.selectList");
		List<BImgVO> binteexammList = (List<BImgVO>) cmmnService.selectList(searchVO, "InteExam.selectList");

		MMainVO mmainVO = (MMainVO) cmmnService.selectContents(searchVO, "MMain.selectLatestContents");
		List<MMainBannerVO> bannerList = (List<MMainBannerVO>) cmmnService.selectList(mmainVO,
				"MMain.selectMainBannerList");
		mmainVO.setMmainbannerList(bannerList);

		MnVO mnVO1 = (MnVO) cmmnService.selectContents(mmainVO.getmAdBoard1Seq(), "Mn.selectContents");
		MnVO mnVO2 = (MnVO) cmmnService.selectContents(mmainVO.getmAdBoard2Seq(), "Mn.selectContents");
		MnVO mnVO3 = (MnVO) cmmnService.selectContents(mmainVO.getmAdBoard3Seq(), "Mn.selectContents");
		MnVO mnVO4 = (MnVO) cmmnService.selectContents(mmainVO.getmAdBoard4Seq(), "Mn.selectContents");

		if (mnVO1 != null) {
			Object dynamicContent1 = cmmnService.selectList(searchVO, mnVO1.getProgramId() + ".selectList");
			Map<String, Object> dynamicContMap1 = new HashMap<>();
			dynamicContMap1.put("dyCat", mnVO1.getMenuNm());
			dynamicContMap1.put("data", dynamicContent1);
			dynamicContMap1.put("url", mnVO1.getUrl());
			model.addAttribute("dynamicContMap1", dynamicContMap1);
		}

		if (mnVO2 != null) {
			Object dynamicContent2 = cmmnService.selectList(searchVO, mnVO2.getProgramId() + ".selectList");
			Map<String, Object> dynamicContMap2 = new HashMap<>();
			dynamicContMap2.put("dyCat", mnVO2.getMenuNm());
			dynamicContMap2.put("data", dynamicContent2);
			dynamicContMap2.put("url", mnVO2.getUrl());
			model.addAttribute("dynamicContMap2", dynamicContMap2);
		}

		if (mnVO3 != null) {
			searchVO.setSelectNoticeDateCat(null);
			Object dynamicContent3 = cmmnService.selectList(searchVO, mnVO3.getProgramId() + ".selectList");
			Map<String, Object> dynamicContMap3 = new HashMap<>();
			dynamicContMap3.put("dyCat", mnVO3.getMenuNm());
			dynamicContMap3.put("data", dynamicContent3);
			dynamicContMap3.put("url", mnVO3.getUrl());
			model.addAttribute("dynamicContMap3", dynamicContMap3);
		}

		
		if (mnVO4 != null) {
			AllowPendRejectVO dummyVO=new AllowPendRejectVO();
			Object dynamicContent4 = cmmnService.selectList(dummyVO, mnVO4.getProgramId() + ".selectList");
			Map<String, Object> dynamicContMap4 = new HashMap<>();
			dynamicContMap4.put("dyCat", mnVO4.getMenuNm());
			dynamicContMap4.put("data", dynamicContent4);
			dynamicContMap4.put("url", mnVO4.getUrl());
			model.addAttribute("dynamicContMap4", dynamicContMap4);
		}
		

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("bexamList", bexamList);
		model.addAttribute("brecoList", brecoList);
		model.addAttribute("bfieldList", bfieldList);
		model.addAttribute("binteexammList", binteexammList);
		model.addAttribute("popupList", popupList);
		model.addAttribute("bannerList", mmainVO.getMmainbannerList());
		return folderPath + "main";
	}

}