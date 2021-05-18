package com.open.ma.mdev.mtchrmng;

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
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.vo.TchrMngVO;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class MTchrMngController {

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
	private final static String PROGRAM_ID = "TchrMng";

	/** folderPath **/
	private final static String folderPath = "/ma/mdev/mtchrmng/";

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
		int pageSize = propertiesService.getInt("pageSize");
		int pageUnit = propertiesService.getInt("pageUnit");
		searchVO.setPageSize(pageSize);
		searchVO.setPageUnit(pageUnit);
		
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
		List<TchrMngVO> resultList = (List<TchrMngVO>) cmmnService.selectList(searchVO, PROGRAM_ID);
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
	public String view(@ModelAttribute("searchVO") TchrMngVO searchVO, Model model, HttpServletRequest request)
			throws Exception {

		return "forward:"+folderPath+"updateForm.do";
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
	public String form(@ModelAttribute("searchVO") TchrMngVO searchVO, Model model, @PathVariable String procType,
			HttpServletRequest request) throws Exception {

		TchrMngVO tchrMngVO = new TchrMngVO();
		if (procType.equals("update")) {
			tchrMngVO = (TchrMngVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
			if (!StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()).equals("1")
					&& !StringUtil.nullString(tchrMngVO.getRgstId())
							.equals(StringUtil.nullString(SessionUtil.getUserDetails().getLoginSeq()))) {
				model.addAttribute("message", "비정상적인 접근입니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
			}
		}
		searchVO.setProcType(procType);
		tchrMngVO.setSearchVO(searchVO);
		model.addAttribute("tchrMngVO", tchrMngVO);

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
	public String proc(@ModelAttribute("searchVO") TchrMngVO searchVO, Model model, SessionStatus status,
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
	
	@RequestMapping(value = folderPath + "checkId.json")
	@ResponseBody
	public Map<String,Object> checkId(@ModelAttribute("searchVO") TchrMngVO searchVO) throws Exception {
		Map<String,Object> data=new HashMap<>();
		Object exId=cmmnService.selectContents(searchVO, PROGRAM_ID+".getId");
		if(exId!=null) {
			data.put("success", false);
			data.put("msg", "중복된 아이디 입니다");
		}else {
			data.put("success", true);
			data.put("msg", "사용가능한 아이디 입니다");
		}
		return data;
	}
	
	@RequestMapping(value = folderPath + "checkEmail.json")
	@ResponseBody
	public Map<String,Object> checkEmail(@ModelAttribute("searchVO") TchrMngVO searchVO) throws Exception {
		Map<String,Object> data=new HashMap<>();
		Object exId=cmmnService.selectContents(searchVO, PROGRAM_ID+".getEmail");
		if(exId!=null) {
			data.put("success", false);
			data.put("msg", "중복된 이메일 입니다");
		}else {
			data.put("success", true);
			data.put("msg", "사용가능한 이메일 입니다");
		}
		return data;
	}

}
