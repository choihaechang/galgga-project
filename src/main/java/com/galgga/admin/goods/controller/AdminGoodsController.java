package com.galgga.admin.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.galgga.board.vo.Criteria;
import com.galgga.goods.vo.GoodsVO;

public interface AdminGoodsController {

	public void  addNewGoodsImage(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	public ModelAndView modifyGoodsInfo(GoodsVO goodsVO,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	public void  removeGoodsImage(@RequestParam("goods_no") int goods_no,
			@RequestParam("goodsImgid") int goodsImgid,
			@RequestParam("imageFileName") String imageFileName,
			HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public String goodsDelete(int goodsVO, HttpSession session, RedirectAttributes rttr) throws Exception;
}
