package com.galgga.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.galgga.board.vo.Criteria;
import com.galgga.board.vo.PageMaker;
import com.galgga.cart.service.GoodsCartService;
import com.galgga.cart.vo.GoodsCartVO;
import com.galgga.common.base.BaseController;
import com.galgga.goods.vo.GoodsImgFileVO;
import com.galgga.member.vo.MemberVO;
import com.galgga.order.vo.OrderVO;

@Controller("goodsCartController")
@RequestMapping(value="/cart")
public class GoodsCartControllerImpl extends BaseController implements GoodsCartController{
	@Autowired
	private GoodsCartService goodsCartService;
	@Autowired
	private GoodsCartVO goodsCartVO;
	@Autowired
	private MemberVO memberVO;
	
	@RequestMapping(value="/myCartList.do" ,method = RequestMethod.GET)
	public ModelAndView myCartList(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		PageMaker pageMaker = new PageMaker();
		HttpSession session=request.getSession();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
		int m_id = memberVO.getM_id();
		cri.set_id(m_id);
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(goodsCartService.myCartListCount());
		List<Criteria> cartList = goodsCartService.myCartList(cri);
		List<GoodsImgFileVO> goodsImgList = goodsCartService.selectGoodsList(m_id);
		
		mav.addObject("goodsImgList", goodsImgList);
		mav.addObject("cartList", cartList);
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}
	@RequestMapping(value="/addGoodsInCart.do", method = RequestMethod.POST)
	public  @ResponseBody String addGoodsInCart(@ModelAttribute("goodsCartVO") GoodsCartVO _goodsCartVO, OrderVO orderVO,
			                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		int m_id=memberVO.getM_id();
		
		goodsCartVO.setM_id(m_id);
		goodsCartVO.setGoods_name(_goodsCartVO.getGoods_name());
		goodsCartVO.setGoods_price(_goodsCartVO.getGoods_price());
		goodsCartVO.setGoods_no(_goodsCartVO.getGoods_no());
		goodsCartVO.setCart_goods_qty(orderVO.getOrder_qty());
		goodsCartVO.setGoods_discount(orderVO.getGoods_discount());
		boolean isAreadyExisted=goodsCartService.findCartGoods(goodsCartVO);
		if(isAreadyExisted==true){
			return "already_existed";
		}else{
			goodsCartService.addGoodsInCart(goodsCartVO);
			return "add_success";
		}
	}
	
	@RequestMapping(value="/modifyCartQty.do" ,method = RequestMethod.POST)
	public @ResponseBody String  modifyCartQty(@RequestParam("goods_no") int goods_no,
			                                   @RequestParam("cart_goods_qty") int cart_goods_qty,
			                                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		int m_id=memberVO.getM_id();
		goodsCartVO.setGoods_no(goods_no);
		goodsCartVO.setM_id(m_id);
		goodsCartVO.setCart_goods_qty(cart_goods_qty);
		boolean result=goodsCartService.modifyCartQty(goodsCartVO);
		
		if(result==true){
		   return "modify_success";
		}else{
			  return "modify_failed";	
		}
		
	}
	
	@RequestMapping(value="/removeCartGoods.do" ,method = RequestMethod.POST)
	public ModelAndView removeCartGoods(@RequestParam("cart_id") int cart_id,
			                          HttpServletRequest request, HttpServletResponse response)  throws Exception{
		ModelAndView mav=new ModelAndView();
		goodsCartService.removeCartGoods(cart_id);
		mav.setViewName("redirect:/cart/myCartList.do");
		return mav;
	}
}
