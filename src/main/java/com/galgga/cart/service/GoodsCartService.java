package com.galgga.cart.service;

import java.util.List;
import java.util.Map;

import com.galgga.board.vo.Criteria;
import com.galgga.cart.vo.GoodsCartVO;
import com.galgga.goods.vo.GoodsImgFileVO;
import com.galgga.goods.vo.GoodsVO;


public interface GoodsCartService {
	public List<Criteria> myCartList(Criteria cri) throws Exception;
	public List<GoodsImgFileVO> selectGoodsList(int m_id) throws Exception;
	public boolean findCartGoods(GoodsCartVO goodsCartVO) throws Exception;
	public void addGoodsInCart(GoodsCartVO goodsCartVO) throws Exception;
	public boolean modifyCartQty(GoodsCartVO goodsCartVO) throws Exception;
	public void removeCartGoods(int cart_id) throws Exception;
	public int myCartListCount() throws Exception;
}
