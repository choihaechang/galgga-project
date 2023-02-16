package com.galgga.businessLods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.galgga.Lods.vo.LodVO;
import com.galgga.Lods.vo.UnitVO;

public interface BusinessLodsController {

	public ResponseEntity addNewLods (MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewUnits (MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ModelAndView businessMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView lodsDetail(@RequestParam("lod_id") String lod_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView reserveList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity lodsModi(LodVO lodVO,@RequestParam("lod_id") int lod_id,
			  HttpServletRequest request, HttpServletResponse response) throws Exception;
	 public ResponseEntity unitsModi(UnitVO unitVO,@RequestParam("lod_id") String lod_id,
				HttpServletRequest request, HttpServletResponse response)	throws Exception;
	
	
	public ModelAndView unitinfo(@RequestParam("lod_id") String lod_id, @RequestParam("unit_id") String unit_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity lodsModi(@RequestParam("refund") String refund,@RequestParam("lod_id") int lod_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
