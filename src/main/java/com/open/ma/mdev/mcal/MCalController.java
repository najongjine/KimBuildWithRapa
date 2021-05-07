package com.open.ma.mdev.mcal;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.DateUtils;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.vo.CaVO;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class MCalController {

	/**
	 * globalProperties.
	 */
	@Resource(name = "globalProperties")
	private Properties globalProperties;
	
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
    private final static String PROGRAM_ID = "Cal";

    /** folderPath **/
    private final static String folderPath = "/ma/mdev/mcal/";
    
    @Autowired
	private EhCacheCacheManager cacheManager;
    
	Logger log = Logger.getLogger(this.getClass());
	

    @SuppressWarnings("unchecked")
    @RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") CaVO searchVO, Model model,
			HttpServletRequest request) throws IOException, InvocationTargetException, SQLException, Exception {
		//<c:set var="lastDateOfMonth" value='${util:getLastDayOfMonth(selectedDate, "yyyyMMdd") }' />
    	// 데이터 초기화
    	// DateUtils를 이용하여 현재 날짜 조회
		if(StringUtil.nullString(searchVO.getSelectedYear()).equals("") || StringUtil.nullString(searchVO.getSchYearMonth()).equals("")){
			String nowDate = DateUtils.getNowDate("yyyy.MM.dd");
			searchVO.setNowDate(nowDate);
			searchVO.setSelectedYear(DateUtils.getNowDate("yyyyMM").substring(0,4));
			searchVO.setSelectedMonth(DateUtils.getNowDate("yyyyMM").substring(4));
			searchVO.setSchYearMonth(DateUtils.getNowDate("yyyyMM"));
		}
		
		List<CaVO> resultList=(List<CaVO>)cmmnService.selectList(searchVO, PROGRAM_ID+".calSelectList");
		model.addAttribute("resultList", resultList);
		
		return ".mLayout:"+folderPath+"list";
	}
    
    @RequestMapping(value=folderPath+"{procType}proc.do")
    public String proc(@ModelAttribute("searchVO") CaVO searchVO, ModelMap model, HttpServletRequest request, 
    		@PathVariable String procType, SessionStatus status) throws Exception{
    	
    		
    	if(procType.equals("update")){
    		cmmnService.updateContents(searchVO, PROGRAM_ID);
    	}else if(procType.equals("insert")){
    		cmmnService.insertContents(searchVO, PROGRAM_ID);
    	}else if(procType.equals("delete")){
			cmmnService.deleteContents(searchVO, PROGRAM_ID);
    	}
    	status.setComplete();
    	if(procType.equals("update")){
    		model.addAttribute("message", "수정되었습니다.");
    		model.addAttribute("pValue",searchVO.getDataDate());
    		model.addAttribute("pName", "dataDate");
    		model.addAttribute("cmmnScript", "form.do");
    		return "cmmn/execute";
    	}else if(procType.equals("insert")){
    		model.addAttribute("message", "등록되었습니다.");
    		model.addAttribute("pValue",searchVO.getDataDate());
    		model.addAttribute("pName", "dataDate");
    		model.addAttribute("cmmnScript", "form.do");
    		return "cmmn/execute";
    	}else if(procType.equals("delete")){
    		model.addAttribute("message", "삭제되었습니다.");
    		model.addAttribute("pValue",searchVO.getDataDate());
    		model.addAttribute("pName", "dataDate");
    		model.addAttribute("cmmnScript", "form.do");
    		return "cmmn/execute";
    	}else{
    		return "redirect:"+folderPath+"list.do";
    	}
    	
    }
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value=folderPath+"form.do")
    public String form(@ModelAttribute("searchVO") CaVO searchVO, ModelMap model, HttpServletRequest request) throws Exception{
    	
    	CaVO caVO = new CaVO();
    	caVO =(CaVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
    	if(caVO !=null){
    		if(!StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()).equals("1") && !StringUtil.nullString(caVO.getRgstId()).equals(StringUtil.nullString(SessionUtil.getUserDetails().getLoginSeq()))){
    			model.addAttribute("message", "비정상적인 접근입니다.");
    			model.addAttribute("cmmnScript", "list.do");
    			return "cmmn/execute";
    		}
    	}    	
    	model.addAttribute("caVO", caVO);
    	
    	return ".mLayout:"+folderPath+"form";
    }
    
}
