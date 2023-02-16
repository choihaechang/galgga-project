package com.galgga.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.galgga.board.vo.Criteria;
import com.galgga.board.vo.PageMaker;
import com.galgga.common.base.BaseController;
import com.galgga.goods.vo.GoodsVO;
import com.galgga.member.vo.MemberVO;
import com.galgga.order.service.OrderService;
import com.galgga.order.vo.OrderVO;

@Controller("orderController")
@RequestMapping(value="/order")
public class OrderControllerImpl extends BaseController implements OrderController {

	@Autowired
	private OrderService orderService;

	private OrderVO orderVO;
	private GoodsVO goodsVO;
	
	@RequestMapping(value="/orderForm.do" ,method = RequestMethod.POST)
	public ModelAndView orderForm(@ModelAttribute("goodsVO") GoodsVO _goodsVO, @ModelAttribute("orderVO") OrderVO _orderVO, HttpServletRequest request, HttpServletResponse response)  throws Exception{
		
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		
		Boolean isLogOn=(Boolean)session.getAttribute("isLogOn");
		String action=(String)session.getAttribute("action");
		
		if(isLogOn==null || isLogOn==false){
			session.setAttribute("goodsInfo", _goodsVO);
			session.setAttribute("orderInfo", _orderVO);
			
			String referer = request.getHeader("Referer");
			request.getSession().setAttribute("redirectURI", referer);
			
			ModelAndView mav = new ModelAndView();
			String message="로그인이 필요합니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
			
			return mav;
			
		}else{
			 if(action!=null && action.equals("/order/orderForm.do")){
				 goodsVO=(GoodsVO)session.getAttribute("goodsInfo");
				 orderVO=(OrderVO)session.getAttribute("orderInfo");
				session.removeAttribute("action");
			 }else{
				 goodsVO=_goodsVO;
				 orderVO=_orderVO;
			 }
		}
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		Map goodsMap = new HashMap();
		goodsMap.put("_goodsVO", _goodsVO);
		Map orderMap=new HashMap();
		orderMap.put("_orderVO", _orderVO);
		
		MemberVO memberInfo=(MemberVO)session.getAttribute("memberInfo");
		
		session.setAttribute("goodsMap", goodsMap);
		session.setAttribute("orderMap", orderMap);
		session.setAttribute("orderer", memberInfo);
		return mav;
	}
	
	@RequestMapping(value="/addOrder.do" ,method = RequestMethod.POST)
	public ModelAndView addOrder(@ModelAttribute("orderVO") OrderVO _orderVO, HttpServletRequest request, HttpServletResponse response)  throws Exception{
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		session=request.getSession();
		
		ModelAndView mav = new ModelAndView();
		
		orderService.addOrder(_orderVO);
		List myOrderList = new ArrayList<OrderVO>();
		myOrderList.add(_orderVO);
		
		mav.addObject("myOrderList", myOrderList);
		mav.setViewName("redirect:/order/addOrder.do");
		return mav;
	}
	
	@RequestMapping(value="/myOrderList.do" , method = RequestMethod.GET)
	public ModelAndView myOrderList(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		session=request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(orderService.myOrderListCount());
		List<OrderVO> orderList = orderService.myOrderList(cri);
		
		mav.addObject("orderList", orderList);
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}
	
	@RequestMapping(value="/orderAllCartGoods.do" ,method = RequestMethod.POST)
	public ModelAndView orderAllCartGoods( @RequestParam("cart_goods_qty")  String[] cart_goods_qty,
			                 HttpServletRequest request, HttpServletResponse response)  throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		Map cartMap=(Map)session.getAttribute("cartMap");
		List myOrderList=new ArrayList<OrderVO>();
		
		List<GoodsVO> myGoodsList=(List<GoodsVO>)cartMap.get("myGoodsList");
		MemberVO memberVO=(MemberVO)session.getAttribute("memberInfo");
		
		for(int i=0; i<cart_goods_qty.length;i++){
			String[] cart_goods=cart_goods_qty[i].split(":");
			for(int j = 0; j< myGoodsList.size();j++) {
				GoodsVO goodsVO = myGoodsList.get(j);
				int goods_no = goodsVO.getGoods_no();
				if(goods_no==Integer.parseInt(cart_goods[0])) {
					OrderVO _orderVO=new OrderVO();
					String goods_name=goodsVO.getGoods_name();
					int goods_price=goodsVO.getGoods_price();
					int goods_discount=goodsVO.getGoods_discount();
					_orderVO.setGoods_no(goods_no);
					_orderVO.setGoods_name(goods_name);
					_orderVO.setGoods_price(goods_price);
					_orderVO.setGoods_discount(goods_discount);
					_orderVO.setOrder_qty(Integer.parseInt(cart_goods[1]));
					myOrderList.add(_orderVO);
					break;
				}
			}
		}
		session.setAttribute("myOrderList", myOrderList);
		session.setAttribute("orderer", memberVO);
		return mav;
	}
}
