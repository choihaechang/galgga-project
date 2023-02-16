package com.galgga.cart.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.galgga.board.vo.Criteria;
import com.galgga.cart.vo.GoodsCartVO;
import com.galgga.goods.vo.GoodsImgFileVO;
import com.galgga.goods.vo.GoodsVO;

public interface GoodsCartDAO {
	public List<Criteria> selectCartList(Criteria cri) throws DataAccessException;
	public int cartListCount() throws Exception;
	public boolean selectCountInCart(GoodsCartVO goodsCartVO) throws DataAccessException;
	public void insertGoodsInCart(GoodsCartVO goodsCartVO) throws DataAccessException;
	public void updateCartGoodsQty(GoodsCartVO goodsCartVO) throws DataAccessException;
	public void deleteCartGoods(int cart_id) throws DataAccessException;
	public List<GoodsImgFileVO> selectGoodsList(int m_id) throws DataAccessException;
}
