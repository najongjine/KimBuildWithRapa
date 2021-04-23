package com.open.ma.sys.mlogmanage;

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
import com.open.vo.LogManageVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class MLogManageController {

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
    private final static String PROGRAM_ID = "LogManage";

    /** folderPath **/
    private final static String folderPath = "/ma/sys/mlogmanage/";

	//@Resource(name = "beanValidator")
	//protected DefaultBeanValidator beanValidator;
	
    @Autowired
	private EhCacheCacheManager cacheManager;
    
	Logger log = Logger.getLogger(this.getClass());

	/**
	 * 메뉴권한 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "{listType}list.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, @PathVariable String listType ,ModelMap model, HttpServletRequest request) throws Exception {
		listType=StringUtil.nullString(listType);
		if(listType.equals("multipleConAttemp")) {
			return ".mLayout:"+ folderPath + "list_multipleConAttemp";
		}
		else if(listType.equals("nonWorktimeConnect")) {
			return ".mLayout:"+ folderPath + "list_nonWorktimeConnect";
		}
		else if(listType.equals("bannedIpConAttemp")) {
			return ".mLayout:"+ folderPath + "list_bannedIpConAttemp";
		}else if(listType.equals("loginFailed")) {
			return ".mLayout:"+ folderPath + "list_loginFailed";
		}
		return ".mLayout:"+ folderPath + "list";
	}
	
	/**
	 * 메뉴권한 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") LogManageVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		

		/**Cache sample */
		Ehcache cache = cacheManager.getCacheManager().getCache("properties");
		Element pageUnit = cache.get("pageUnit");
		Element pageSize = cache.get("pageSize");		 	

		
		if (pageUnit != null && pageSize != null) {
			searchVO.setPageUnit(Integer.parseInt(pageUnit.getObjectValue().toString()));
			searchVO.setPageSize(Integer.parseInt(pageSize.getObjectValue().toString()));
		} else {
			/** EgovPropertyService.sample */
			searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
			searchVO.setPageSize(propertiesService.getInt("pageSize"));
			/** cache에 입력 */
			cache.put(new Element("pageUnit", propertiesService.getInt("pageUnit")));
			cache.put(new Element("pageSize", propertiesService.getInt("pageSize")));
		}

		if(searchVO.getCustomPageUnit()!=null && !"".equals(searchVO.getCustomPageUnit())) {
			searchVO.setPageUnit(Integer.parseInt(searchVO.getCustomPageUnit()));
		}
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
	
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt=0;
		List<LogManageVO> resultList=null;
		if("multipleConAttemp".equals(searchVO.getSchEtc01())) {
			totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID+".selectMulitpleConAttempCount" );
			resultList = (List<LogManageVO>) cmmnService.selectList(searchVO, PROGRAM_ID+".selectMulipleConAttempList" );
		}
		else if("bannedIpConAttemp".equals(searchVO.getSchEtc01())) {
			totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID+".selectBannedIpConAttempCount" );
			resultList = (List<LogManageVO>) cmmnService.selectList(searchVO, PROGRAM_ID+".selectBannedIpConAttempList" );
		}
		else if("loginFailed".equals(searchVO.getSchEtc01())) {
			totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID+".selectLoginFailedCount" );
			resultList = (List<LogManageVO>) cmmnService.selectList(searchVO, PROGRAM_ID+".selectLoginFailedList" );
		}
		else {
			totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID );
			resultList = (List<LogManageVO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		}
		System.out.println("## pageUnit : "+searchVO.getPageUnit());
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		model.addAttribute("resultList", resultList);
		
		if("multipleConAttemp".equals(searchVO.getSchEtc01())) {
			return folderPath + "addList_multipleConAttemp";
		}
		else if("bannedIpConAttemp".equals(searchVO.getSchEtc01())) {
			return folderPath + "addList_bannedIpConAttemp";
		}
		else if("loginFailed".equals(searchVO.getSchEtc01())) {
			return folderPath + "addList_loginfail";
		}
		return folderPath + "addList";
	}



	/**
	 * 메뉴권한 상세화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"view.do")
	public String view(@ModelAttribute("searchVO") LogManageVO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		/* 게시판 상세정보 */
		LogManageVO logManageVO = new LogManageVO();
		logManageVO = (LogManageVO) cmmnService.selectContents(searchVO, PROGRAM_ID );
		model.addAttribute("logManageVO", logManageVO);
		
		return ".mLayout:"+ folderPath + "view";
	}

	/**
	 * 메뉴권한 등록화면
	 * @param searchVO
	 * @param model
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") LogManageVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		procType=StringUtil.nullString(procType);
		LogManageVO logManageVO = new LogManageVO();
		if (procType.equals("update")) {
			logManageVO = (LogManageVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
			if(!StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()).equals("1") && !StringUtil.nullString(logManageVO.getRgstId()).equals(StringUtil.nullString(SessionUtil.getUserDetails().getLoginSeq()))){
				model.addAttribute("message", "비정상적인 접근입니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
			}
		}
		model.addAttribute("message", "비정상적인 접근입니다.");
		model.addAttribute("cmmnScript", "list.do");
		return "cmmn/execute";
	}

	/**
	 * 메뉴권한 처리
	 * @param searchVO
	 * @param model
	 * @param status
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") LogManageVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		
		if(procType != null){
			
			if (procType.equals("insert")) {
			} else if (procType.equals("update") ) {				
				cmmnService.updateContents(searchVO, PROGRAM_ID);				
			} else if (procType.equals("delete")) {				
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
				
			} 
			
			status.setComplete(); // 중복 Submit 방지 : 세션에 저장된 model 을 삭제한다.
			
			if(procType.equals("update")){
				model.addAttribute("message", "수정되었습니다.");
				model.addAttribute("pName", "seq");	
				model.addAttribute("pValue", searchVO.getSeq());
				model.addAttribute("cmmnScript", "view.do");
				return "cmmn/execute";
	    	}else if(procType.equals("insert")){
	    	}else if(procType.equals("delete") ){
				model.addAttribute("message", "삭제되었습니다..");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
	    	}else{
	    		return "redirect:list.do";
	    	}
		}

		return "redirect:list.do";

	}

	

	
		

}
