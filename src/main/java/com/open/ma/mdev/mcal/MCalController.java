package com.open.ma.mdev.mcal;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Iterator;
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
    	// 데이터 초기화
    	// DateUtils를 이용하여 현재 날짜 조회
		if(StringUtil.nullString(searchVO.getSelectedYear()).equals("") || StringUtil.nullString(searchVO.getSchYearMonth()).equals("")){
			String nowDate = DateUtils.getNowDate("yyyy.MM.dd");
			searchVO.setNowDate(nowDate);
			
			searchVO.setSelectedYear(DateUtils.getNowDate("yyyy"));
			searchVO.setSelectedMonth(DateUtils.getNowDate("MM"));
			searchVO.setSchYearMonth(DateUtils.getNowDate("yyyyMM"));
			
		}
		searchVO.setSelectedDate(searchVO.getSelectedYear()+searchVO.getSelectedMonth()+DateUtils.getNowDate("dd"));
		
		searchVO.setPrevYear(DateUtils.addYearMonthDay(searchVO.getSelectedDate(), 0, -1, 0).substring(0, 4));
		searchVO.setPrevMonth(DateUtils.addYearMonthDay(searchVO.getSelectedDate(), 0, -1, 0).substring(4, 6));
		searchVO.setNextYear(DateUtils.addYearMonthDay(searchVO.getSelectedDate(), 0, 1, 0).substring(0, 4));
		searchVO.setNextMonth(DateUtils.addYearMonthDay(searchVO.getSelectedDate(), 0, 1, 0).substring(4, 6));
		searchVO.setLastDateOfMonth(DateUtils.getLastDayOfMonth(searchVO.getSelectedDate(), "yyyyMMdd")+"");
		searchVO.setFirstWeekdayOfMonth(DateUtils.getFirstWeekdayOfMonth(searchVO.getSelectedDate(), "yyyyMMdd")+1 +"");
		
		List<CaVO> holidayList=(List<CaVO>)cmmnService.selectList(searchVO, PROGRAM_ID+".calSelectList");
		List<CaVO> memoList=(List<CaVO>) cmmnService.selectList(searchVO, PROGRAM_ID+".selectContList");
		model.addAttribute("memoList", memoList);
		model.addAttribute("holidayList", holidayList);
		
		return ".mLayout:"+folderPath+"listV2";
	}
    
    @RequestMapping(value=folderPath+"{procType}proc.do")
    public String proc(@ModelAttribute("searchVO") CaVO searchVO, ModelMap model, HttpServletRequest request, 
    		@PathVariable String procType, SessionStatus status) throws Exception{
    	procType=StringUtil.nullString(procType);
    	Iterator<CaVO> i = searchVO.getCaList().iterator();
		while (i.hasNext()) {
			CaVO e = i.next(); // must be called before you can call i.remove()
			if (e.getCont() == null || "".equals(e.getCont().trim())) {
				i.remove();
			}
		}
    		
    	if(procType.equals("update")){
    		cmmnService.updateContents(searchVO, PROGRAM_ID);
    		cmmnService.deleteContents(searchVO, PROGRAM_ID+".deleteContContents");
			for (CaVO e : searchVO.getCaList()) {
				e.setCalSeq(searchVO.getSeq());
				e.setDataDate(searchVO.getDataDate());
				if(StringUtil.nullString(e.getSeq()).equals("") ){
					cmmnService.insertContents(e, PROGRAM_ID+".insertContContent");
				}
				else {
					cmmnService.updateContents(e, PROGRAM_ID+".updateContContents");
				}
			}
    	}else if(procType.equals("insert")){
    		cmmnService.insertContents(searchVO, PROGRAM_ID);
    		for (CaVO e : searchVO.getCaList()) {
				e.setCalSeq(searchVO.getSeq());
				e.setDataDate(searchVO.getDataDate());
			}
			cmmnService.insertContents(searchVO.getCaList(), PROGRAM_ID+".insertContList");
    	}else if(procType.equals("delete")){
			cmmnService.deleteContents(searchVO, PROGRAM_ID);
			cmmnService.deleteContents(searchVO, PROGRAM_ID+".deleteContContents");
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
    	int resultListSize= 0;
    	List<CaVO> resultList=null;
    	if(caVO !=null){
    		if(!StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()).equals("1") && !StringUtil.nullString(caVO.getRgstId()).equals(StringUtil.nullString(SessionUtil.getUserDetails().getLoginSeq()))){
    			model.addAttribute("message", "비정상적인 접근입니다.");
    			model.addAttribute("cmmnScript", "list.do");
    			return "cmmn/execute";
    		}
    		System.out.println("## dataDate: "+caVO.getDataDate());
    		resultList=(List<CaVO>) cmmnService.selectList(caVO, PROGRAM_ID+".selectContByCalSeqList");
    		resultListSize=resultList==null? 0 : resultList.size();
    		model.addAttribute("resultList", resultList);
    	}   
    	model.addAttribute("resultListSize",resultListSize );
    	model.addAttribute("caVO", caVO);
    	
    	return ".mLayout:"+folderPath+"form";
    }
    
}
