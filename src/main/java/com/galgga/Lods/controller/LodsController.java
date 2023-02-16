package com.galgga.Lods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface LodsController {
	public ModelAndView lodsDetail(@RequestParam("lod_id") String lod_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
