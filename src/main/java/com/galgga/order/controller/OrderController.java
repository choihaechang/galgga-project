package com.galgga.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.galgga.goods.vo.GoodsVO;
import com.galgga.order.vo.OrderVO;

public interface OrderController {
	public ModelAndView orderForm(@ModelAttribute("goodsVO") GoodsVO _goodsVO, @ModelAttribute("OrderVO") OrderVO _orderVO, HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
