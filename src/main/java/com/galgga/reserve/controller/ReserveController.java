package com.galgga.reserve.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.galgga.reserve.vo.ReserveVO;

public interface ReserveController {
	

	 public ResponseEntity reservation(@ModelAttribute("reserveVO") ReserveVO reserveVO,
	  HttpServletRequest request, HttpServletResponse response) throws
	 Exception;
	 
	public ModelAndView beforeReserve(@ModelAttribute("lod_id") String lod_id,
										@ModelAttribute("unit_name") String unit_name,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String reserve_remove(ReserveVO reserveVO) throws Exception;
	
}
