package com.galgga.cart.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface LodCartController {

	public ModelAndView lodCartList(@RequestParam("m_id") int m_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

}
