package com.galgga.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.galgga.board.vo.Criteria;
import com.galgga.cart.dao.GoodsCartDAO;
import com.galgga.cart.vo.GoodsCartVO;
import com.galgga.goods.vo.GoodsImgFileVO;
import com.galgga.goods.vo.GoodsVO;

@Service("goodsCartService")
@Transactional(propagation=Propagation.REQUIRED)
public class GoodsCartServiceImpl  implements GoodsCartService{
	@Autowired
	private GoodsCartDAO goodsCartDAO;
	
	public List<Criteria> myCartList(Criteria cri) throws Exception{
		return goodsCartDAO.selectCartList(cri);
	}

	public boolean findCartGoods(GoodsCartVO goodsCartVO) throws Exception{
		 return goodsCartDAO.selectCountInCart(goodsCartVO);
		
	}
	public List<GoodsImgFileVO> selectGoodsList(int m_id) throws Exception {
		List<GoodsImgFileVO> goodsImgList = goodsCartDAO.selectGoodsList(m_id);
		return goodsImgList;
	}
	public int myCartListCount() throws Exception {
		return goodsCartDAO.cartListCount();
	}
	
	public void addGoodsInCart(GoodsCartVO goodsCartVO) throws Exception{
		goodsCartDAO.insertGoodsInCart(goodsCartVO);
	}
	
	public boolean modifyCartQty(GoodsCartVO goodsCartVO) throws Exception{
		boolean result=true;
		goodsCartDAO.updateCartGoodsQty(goodsCartVO);
		return result;
	}
	public void removeCartGoods(int cart_id) throws Exception{
		goodsCartDAO.deleteCartGoods(cart_id);
	}
	
}
