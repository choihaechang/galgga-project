package com.galgga.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.galgga.cart.service.LodCartService;
import com.galgga.cart.vo.LodCartVO;

@Controller("lodCartController")
@RequestMapping(value="/lodCart")
public class LodCartControllerImpl implements LodCartController {
	
	@Autowired
	private LodCartService lodCartService;
	@Autowired
	private LodCartVO lodCartVO;
	
	@RequestMapping(value="/lodCartList.do", method=RequestMethod.GET)
	public ModelAndView lodCartList(@RequestParam("m_id") int m_id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List lodCartList = lodCartService.cartList(m_id);
		mav.addObject("lodCartList", lodCartList);
		
		return mav;
		
	}
	
	
}
