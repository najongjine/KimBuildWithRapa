package com.open.ma.sys.mipmanage;

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
public class MIpManageController {

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
    private final static String PROGRAM_ID = "BannedIP";

    /** folderPath **/
    private final static String folderPath = "/ma/sys/mipmanage/";

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
	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

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
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		

		/**Cache sample */
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
		
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID );
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		

		@SuppressWarnings("unchecked")
		List<LogManageVO> resultList = (List<LogManageVO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("resultList", resultList);
		

		
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
		System.out.println("## schEtc13: "+searchVO.getSchEtc13());
		System.out.println("## schEtc14: "+searchVO.getSchEtc14());
		System.out.println("## schEtc15: "+searchVO.getSchEtc15());
		/* 게시판 상세정보 */
		LogManageVO ipVO = new LogManageVO();
		ipVO = (LogManageVO) cmmnService.selectContents(searchVO, PROGRAM_ID +".selectDetailContents");
		model.addAttribute("ipVO", ipVO);
		
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
		
		LogManageVO ipVO = new LogManageVO();
		if (procType.equals("update")) {
			ipVO = (LogManageVO) cmmnService.selectContents(searchVO, PROGRAM_ID+".selectDetailContents");
			if(!StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()).equals("1") && !StringUtil.nullString(ipVO.getRgstId()).equals(StringUtil.nullString(SessionUtil.getUserDetails().getLoginSeq()))){
				model.addAttribute("message", "비정상적인 접근입니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
			}
		}
		searchVO.setProcType(procType);
		ipVO.setSearchVO(searchVO);
		model.addAttribute("ipVO", ipVO);

		return ".mLayout:"+ folderPath + "form";
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
		searchVO.setIp(searchVO.getIp().replace(',', '.'));
		if(procType != null){
			
			if (procType.equals("insert")) {
				
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				
			} else if (procType.equals("update") ) {				
				cmmnService.updateContents(searchVO, PROGRAM_ID);				
			} else if (procType.equals("delete")) {				
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
				
			} 
			
			status.setComplete(); // 중복 Submit 방지 : 세션에 저장된 model 을 삭제한다.
			
			if(procType.equals("update")){
				model.addAttribute("message", "수정되었습니다.");
				// cmmn/execute 에 변수 여러개 실어 보내기
				model.addAttribute("pName", "seq,schEtc13,schEtc14,schEtc15");	
				model.addAttribute("pValue", searchVO.getSeq()+",13"+",14"+",15");
				model.addAttribute("cmmnScript", "view.do");
				return "cmmn/execute";
	    	}else if(procType.equals("insert")){
				model.addAttribute("message", "등록되었습니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
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
