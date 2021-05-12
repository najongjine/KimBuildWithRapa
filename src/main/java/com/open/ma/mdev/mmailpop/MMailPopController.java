package com.open.ma.mdev.mmailpop;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
import com.open.ma.login.service.LoginVO;
import com.open.vo.MailVO;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

/**
 * 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class MMailPopController {

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
	private final static String PROGRAM_ID = "Mail";

	/** folderPath **/
	private final static String folderPath = "/ma/mdev/mmailpop/";

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
		List<MailVO> resultList = (List<MailVO>) cmmnService.selectList(searchVO, PROGRAM_ID);
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
	public String view(@ModelAttribute("searchVO") MailVO searchVO, Model model, HttpServletRequest request)
			throws Exception {
		String ip = StringUtil.getClientIp(request);
		/* 게시판 상세정보 */
		MailVO mailVO = new MailVO();
		mailVO = (MailVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		
		String strEmails="";
		List<MailVO> mailList=(List<MailVO>) cmmnService.selectList(searchVO, PROGRAM_ID+".selectREmailList");
		mailVO.setMailList(mailList);
		for(int i=0;i<mailList.size();i++ ) {
			strEmails+=mailList.get(i).getName();
			if(i != mailList.size() -1) {
				strEmails+="("+mailList.get(i).getrEmail()+"), ";
			}else {
				strEmails+="("+mailList.get(i).getrEmail()+")";
			}
		}
		
		mailVO.setIp(ip);
		Object ipVisited=cmmnService.selectContents(mailVO, PROGRAM_ID+".selectVisitedIpContents");
		if(ipVisited==null) {
			cmmnService.selectContents(mailVO, PROGRAM_ID+".insertVisitedIpContent");
		}
		model.addAttribute("mailVO", mailVO);
		model.addAttribute("strEmails", strEmails);

		return ".mLayout:" + folderPath + "view";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "contView.do")
	public String contView(@ModelAttribute("searchVO") MailVO searchVO, Model model, HttpServletRequest request) throws Exception {

		MailVO mailVO = new MailVO();
		mailVO = (MailVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		model.addAttribute("mailVO", mailVO);
		return folderPath + "contView";
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
	public String form(@ModelAttribute("searchVO") MailVO searchVO, Model model, @PathVariable String procType,
			HttpServletRequest request) throws Exception {
		procType = StringUtil.nullString(procType);
		MailVO mailVO = new MailVO();
		List<MailVO> mailList=new ArrayList<>();
		if (procType.equals("update")) {
			mailVO = (MailVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
			if (!StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()).equals("1")
					&& !StringUtil.nullString(mailVO.getRgstId())
							.equals(StringUtil.nullString(SessionUtil.getUserDetails().getLoginSeq()))) {
				model.addAttribute("message", "비정상적인 접근입니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
			}
			mailList=(List<MailVO>) cmmnService.selectList(mailVO, PROGRAM_ID+".selectREmailList");
		}
		mailVO.setSeq(searchVO.getSeq());
		mailVO.setMailList(mailList);
		searchVO.setProcType(procType);
		mailVO.setSearchVO(searchVO);
		model.addAttribute("mailVO", mailVO);

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
	public String proc(@ModelAttribute("searchVO") MailVO searchVO, Model model, SessionStatus status,
			@PathVariable String procType, HttpServletRequest request) throws Exception {
		procType = StringUtil.nullString(procType);
		
		if (procType.equals("insert")) {
			for (MailVO item : searchVO.getMailList()) {
				sendMail(item.getrEmail(), StringUtil.unEscape(searchVO.getCont()), searchVO.getTitle());
			}
			cmmnService.insertContents(searchVO, PROGRAM_ID);
			for (MailVO item : searchVO.getMailList()) {
				item.setMailSeq(searchVO.getSeq());
				cmmnService.insertContents(item, PROGRAM_ID+".insertREmailContent");
			}

		} else if (procType.equals("update")) {
			//cmmnService.updateContents(searchVO, PROGRAM_ID);
		} else if (procType.equals("delete")) {
			//cmmnService.deleteContents(searchVO, PROGRAM_ID);

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
		}

		return "redirect:list.do";

	}

	/* 팝업창 기본 페이지 */
	@RequestMapping(folderPath + "pop.do")
	public String pop(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		return ".mPopLayout:" + folderPath + "pop";
	}
	
	@RequestMapping(folderPath + "popModal.do")
	public String popModel(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		return folderPath + "popModal";
	}
	
	/* 팝업창 페이지네이션 지원 페이지 */
	@RequestMapping(folderPath + "popList.do")
	public String popList(@ModelAttribute("modalSearchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		if(StringUtil.nullString(searchVO.getSchEtc05()).equals("")) {
			searchVO.setSchEtc05("user");
		}
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

		List<LoginVO> boardList = (List<LoginVO>) cmmnService.selectList(searchVO, PROGRAM_ID + ".selectUserList");
		System.out.println("## poplist count: "+boardList.size());
		System.out.println("## schEtc05: "+searchVO.getSchEtc05());
		model.addAttribute("resultList", boardList);

		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID + ".selectUserCount");
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return folderPath + "popList";
	}
	
	/* 팝업창 페이지네이션 지원 페이지 */
	@RequestMapping(folderPath + "popListModal.do")
	public String popListModal(@ModelAttribute("modalSearchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		if(StringUtil.nullString(searchVO.getSchEtc05()).equals("")) {
			searchVO.setSchEtc05("user");
		}
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

		List<LoginVO> boardList = (List<LoginVO>) cmmnService.selectList(searchVO, PROGRAM_ID + ".selectUserList");
		System.out.println("## poplist count: "+boardList.size());
		System.out.println("## schEtc05: "+searchVO.getSchEtc05());
		model.addAttribute("resultList", boardList);

		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID + ".selectUserCount");
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return folderPath + "popListModal";
	}
	
	public static void sendMail(String mail, String htmlContent, String ttl) throws Exception {
		if(StringUtil.nullString(mail).equals("")) {
			return;
		}
		String host = "smtp.gmail.com";
		String useraddr = "najongjine.opennote@gmail.com";
		
		//앱 비밀번호인가 그런것임
		String userpwd = "ceeecpnezzwueuzm";
		/* IMAP/SMTP 설정 */
		Properties props = new Properties();

		// 호스트, 계정 비번 설정

		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.port", "587");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		
		final String username = useraddr; // 계정
		final String password = userpwd; // 비밀번호

		// mailForm에 따른 메일 설정

		/* Session 생성 */
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		/* Message 설정 */
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(useraddr, MimeUtility.encodeText("한국전파진흥협회", "UTF-8", "B")));
		message.setSender(new InternetAddress(useraddr));
		message.setSubject(ttl);

		session.setDebug(true); // for debug

		String htmlContents = htmlContent;
		// 메일 주소 변수 :: mail

		// 보낼 사람의 메일주소 셋팅해주기(한명기준)
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(mail));

		//메일의 내용 셋팅해주기
		Multipart mp = new MimeMultipart();
		MimeBodyPart mbp1 = new MimeBodyPart(); // 내용
		mbp1.setContent(htmlContents, "text/html;charset=UTF-8");
		mp.addBodyPart(mbp1);

		MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
		mc.addMailcap("text/html; x-java-content-handler=com.sun.mail.handlers.text_html");
		mc.addMailcap("text/xml; x-java-content-handler=com.sun.mail.handlers.text_xml");
		mc.addMailcap("text/plain; x-java-content-handler=com.sun.mail.handlers.text_plain");
		mc.addMailcap("multipart/*; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
		mc.addMailcap("message/rfc822; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
		CommandMap.setDefaultCommandMap(mc);

		message.setContent(mp);
		Transport.send(message);

	}
	
}
