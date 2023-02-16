package com.galgga.business.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.galgga.business.service.BusinessService;
import com.galgga.business.vo.BusinessVO;

@Controller("businessController")
@RequestMapping(value="/business")
public class BusinessControllerImpl implements BusinessController{
	@Autowired
	private BusinessService businessService;
	@Autowired
	private BusinessVO businessVO;
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Override
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			ModelAndView mav = new ModelAndView();

			businessVO=businessService.login(loginMap);
			boolean pwMatch = pwEncoder.matches(loginMap.get("business_pw"), businessVO.getBusiness_pw());
			if(pwMatch){
				HttpSession session=request.getSession();
				session.setAttribute("isLogOn", true);
				session.setAttribute("businessInfo",businessVO);
				String action=(String)session.getAttribute("action");
				
				if(action!=null && action.equals("/order/orderEachGoods.do")){
					mav.setViewName("forward:"+action);
				} else {
					mav.setViewName("redirect:/main/main.do");	
				}

			} else {
				String message="아이디나 비밀번호가 틀립니다. 다시 시도해주세요";
				mav.addObject("message", message);
				mav.setViewName("/member/loginForm");
			}
			return mav;
		} catch(NullPointerException e) {
			ModelAndView mav = new ModelAndView();
			String message = "아이디나 비밀번호가 틀립니다. 다시 시도해주세요";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
			return mav;
		}
	}
	
	@Override
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("businessInfo");
		String message="로그아웃합니다.";
		mav.addObject("message", message);
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/addBusiness.do" ,method = RequestMethod.POST)
	public ResponseEntity addBusiness(@ModelAttribute("businessVO") BusinessVO _businessVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    businessService.addBusiness(_businessVO);
		    message  = "<script>";
		    message += " location.href='"+request.getContextPath()+"/member/businesspersonlogin.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해주세요');";
		    message += " location.href='"+request.getContextPath()+"/member/addbusinessperson.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = businessService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
}
