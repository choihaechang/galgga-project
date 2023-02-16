package com.galgga.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.galgga.board.vo.Criteria;
import com.galgga.cart.vo.GoodsCartVO;
import com.galgga.order.vo.OrderVO;

public interface GoodsCartController {
	public ModelAndView myCartList(Criteria cri, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public @ResponseBody String addGoodsInCart(@ModelAttribute("goodsCartVO") GoodsCartVO _goodsCartVO, OrderVO orderVO, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public  @ResponseBody String modifyCartQty(@RequestParam("goods_id") int goods_id,@RequestParam("cart_goods_qty") int cart_goods_qty,
			                  HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView removeCartGoods(@RequestParam("cart_id") int cart_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	

}
