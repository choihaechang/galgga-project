package com.galgga.goods.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.galgga.board.vo.Criteria;
import com.galgga.goods.vo.GoodsCateVO;
import com.galgga.goods.vo.GoodsImgFileVO;
import com.galgga.goods.vo.GoodsVO;

public interface GoodsDAO {
	public GoodsVO selectGoodsDetail(String goods_no) throws DataAccessException;
	public List<GoodsImgFileVO> selectGoodsDetailImage(String goods_no) throws DataAccessException;
	public List<Criteria> selectCateList(Criteria cri) throws DataAccessException;
	public int goodsListCount() throws Exception;
}
