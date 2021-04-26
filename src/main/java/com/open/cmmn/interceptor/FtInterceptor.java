package com.open.cmmn.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ma.sys.mn.service.MnVO;
import com.open.vo.LogManageVO;

public class FtInterceptor extends HandlerInterceptorAdapter implements HandlerInterceptor {

	/**
	 * Log4j Logger.
	 */
	private static final Logger LOGGER = LogManager.getLogger(FtInterceptor.class.getName());

	/**
	 * Session Loding Time.
	 */
	private static long loadingTime = 0;

	/**
	 * CmmnService.
	 */
	@Autowired
	private CmmnService cmmnService;

	@SuppressWarnings("unchecked")
	@Override
	public boolean preHandle(final HttpServletRequest request, final HttpServletResponse response, final Object handler) throws Exception {

		HttpSession session = request.getSession();
		Object exMenu=session.getAttribute("ftMenu");
		
		if(exMenu!=null) {
			return true;
		}
		
		/* 1차메뉴 목록 */
		MnVO menuVO = new MnVO();
		menuVO.setLvl("1");
		menuVO.setMenuCl("ft");
		menuVO.setSchEtc03("LAYOUT");
		
		List<MnVO> menuList = (List<MnVO>) cmmnService.selectList(menuVO, "Mn.frontMenuSelectList");
		menuVO.setMenuList(menuList);
		for (MnVO menuVO2 : menuVO.getMenuList()) {
			menuVO2.setLvl("2");
			menuVO2.setMenuCl("ft");
			menuVO2.setSchEtc03("LAYOUT");
			List<MnVO> manu2List = (List<MnVO>) cmmnService.selectList(menuVO2, "Mn.frontMenuSelectList");
			menuVO2.setMenuList(manu2List);
			
			for (MnVO menuVO3 : manu2List) {
				menuVO3.setLvl("3");
				menuVO3.setMenuCl("ft");
				menuVO3.setSchEtc03("LAYOUT");
				List<MnVO> manu3List = (List<MnVO>) cmmnService.selectList(menuVO3, "Mn.frontMenuSelectList");
				menuVO3.setMenuList(manu3List);
				menuVO2.setMenuvo(menuVO3);
			}
			
			menuVO.setMenuvo(menuVO2);
		}
		/** 세션 정보 입력 */
		session.setAttribute(SessionUtil.SESSION_MANAGE_MENU_KEY, menuVO.getMenuList());//메뉴목록
		session.setAttribute("ftMenu", menuVO.getMenuList());	//메뉴목록
		return true;
	}
	@Override
	public void afterCompletion(final HttpServletRequest request, final HttpServletResponse response, final Object handler, final Exception ex) throws Exception {
		long endTime = System.currentTimeMillis();
		HttpSession session = request.getSession();	
		LOGGER.debug("=================================== Loading Report afterHandle ::: " + (endTime - loadingTime));
		LOGGER.debug("=================================== request URI ::: " + request.getRequestURI());
		LogManageVO logManageVO=new LogManageVO();
		String id=(String)session.getAttribute("loginFtSeq");
		String url=request.getRequestURI();
		String ip = StringUtil.getClientIp(request);
		String userkind="user";
		logManageVO.setId(id);
		logManageVO.setUrl(url);
		logManageVO.setIp(ip);
		logManageVO.setUserkind(userkind);
		cmmnService.insertContents(logManageVO, "LogManage.insertContents");
	}

}