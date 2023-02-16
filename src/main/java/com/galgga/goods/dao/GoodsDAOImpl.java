package com.galgga.goods.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.board.vo.Criteria;
import com.galgga.goods.vo.GoodsCateVO;
import com.galgga.goods.vo.GoodsImgFileVO;
import com.galgga.goods.vo.GoodsVO;

@Repository("goodsDAO")
public class GoodsDAOImpl  implements GoodsDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public GoodsVO selectGoodsDetail(String goods_no) throws DataAccessException{		
		GoodsVO goodsVO=(GoodsVO)sqlSession.selectOne("mapper.goods.selectGoodsDetail", goods_no);
		return goodsVO;
	}
	
	@Override
	public List<GoodsImgFileVO> selectGoodsDetailImage(String goods_no) throws DataAccessException{
		List<GoodsImgFileVO> imageList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsDetailImage", goods_no);
		return imageList;
	}
	
	@Override
	public List<Criteria> selectCateList(Criteria cri) throws DataAccessException{
		List<Criteria> cateList = (ArrayList) sqlSession.selectList("mapper.goods.selectCategory", cri);
			return cateList;
	}
	
	@Override
	public int goodsListCount() throws Exception {
		return (Integer)sqlSession.selectOne("mapper.goods.goodsListCount");
	}
}
