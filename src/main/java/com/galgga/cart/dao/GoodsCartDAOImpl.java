package com.galgga.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.board.vo.Criteria;
import com.galgga.cart.vo.GoodsCartVO;
import com.galgga.goods.vo.GoodsImgFileVO;
import com.galgga.goods.vo.GoodsVO;

@Repository("cartDAO")
public class GoodsCartDAOImpl  implements GoodsCartDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List<Criteria> selectCartList(Criteria cri) throws DataAccessException {
		List<Criteria> cartList =(List)sqlSession.selectList("mapper.cart.selectCartList", cri);
		return cartList;
	}
	
	public List<GoodsImgFileVO> selectGoodsList(int m_id) throws DataAccessException {
		List<GoodsImgFileVO> goodsImgList = sqlSession.selectList("mapper.cart.selectGoodsList", m_id);
		return goodsImgList;
	}
	public int cartListCount() throws Exception {
		return sqlSession.selectOne("mapper.cart.cartListCount");

	}
	public boolean selectCountInCart(GoodsCartVO goodsCartVO) throws DataAccessException {
		String result =sqlSession.selectOne("mapper.cart.selectCountInCart",goodsCartVO);
		return Boolean.parseBoolean(result);
	}

	public void insertGoodsInCart(GoodsCartVO goodsCartVO) throws DataAccessException{
		sqlSession.insert("mapper.cart.insertGoodsInCart",goodsCartVO);
	}
	
	public void updateCartGoodsQty(GoodsCartVO goodsCartVO) throws DataAccessException{
		sqlSession.insert("mapper.cart.updateCartGoodsQty",goodsCartVO);
	}
	
	public void deleteCartGoods(int cart_id) throws DataAccessException{
		sqlSession.delete("mapper.cart.deleteCartGoods",cart_id);
	}

}
