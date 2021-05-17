package com.open.ma;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
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
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ma.sample.service.SampleVO;
import com.open.vo.ComplChrtVO;
import com.open.vo.MaMainVO;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

@Controller
public class MaMainController {
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
	private final static String PROGRAM_ID = "MaMain";

	/** folderPath **/
	private final static String folderPath = "/ma/";

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
	@RequestMapping(folderPath + "main.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		
		MaMainVO maFtCnt= (MaMainVO) cmmnService.selectContents(searchVO, PROGRAM_ID+".selectConCount");
		List<MaMainVO> allowNList=(List<MaMainVO>) cmmnService.selectList(searchVO, PROGRAM_ID+".selectAllowNList");
		List<MaMainVO> allowPList=(List<MaMainVO>) cmmnService.selectList(searchVO, PROGRAM_ID+".selectAllowPList");
		
		List<MaMainVO> yearList=(List<MaMainVO>) cmmnService.selectList(searchVO, "ComplChrt.yearList");
		model.addAttribute("maFtCnt", maFtCnt);
		model.addAttribute("allowNList", allowNList);
		model.addAttribute("allowPList", allowPList);
		model.addAttribute("yearList", yearList);
		return folderPath + "main";
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
	@RequestMapping(folderPath + "/mc01/compl.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model,
			HttpServletRequest request) throws Exception {

		@SuppressWarnings("unchecked")
		ComplChrtVO compl =  (ComplChrtVO) cmmnService.selectContents(searchVO, PROGRAM_ID+".selectComplTotal");
		List<ComplChrtVO> complChrtList =  (List<ComplChrtVO>) cmmnService.selectList(searchVO, PROGRAM_ID+".complTotalChrt");
		model.addAttribute("compl", compl);
		model.addAttribute("complChrtList", complChrtList);

		return folderPath + "compl";
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
	public String view(@ModelAttribute("searchVO") SampleVO searchVO, Model model, HttpServletRequest request)
			throws Exception {

		/* 게시판 상세정보 */
		SampleVO sampleVO = new SampleVO();
		sampleVO = (SampleVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		model.addAttribute("sampleVO", sampleVO);

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
	public String form(@ModelAttribute("searchVO") SampleVO searchVO, Model model, @PathVariable String procType,
			HttpServletRequest request) throws Exception {

		SampleVO sampleVO = new SampleVO();
		if (procType.equals("update")) {
			sampleVO = (SampleVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
			if (!StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()).equals("1")
					&& !StringUtil.nullString(sampleVO.getRgstId())
							.equals(StringUtil.nullString(SessionUtil.getUserDetails().getLoginSeq()))) {
				model.addAttribute("message", "비정상적인 접근입니다.");
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
}
