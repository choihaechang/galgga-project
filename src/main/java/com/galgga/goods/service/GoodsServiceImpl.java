package com.galgga.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.galgga.board.vo.Criteria;
import com.galgga.goods.dao.GoodsDAO;
import com.galgga.goods.vo.GoodsCateVO;
import com.galgga.goods.vo.GoodsImgFileVO;
import com.galgga.goods.vo.GoodsVO;

@Service("goodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsDAO goodsDAO;
	
	public Map goodsDetail(String goods_no) throws Exception {
		Map goodsMap=new HashMap();
		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(goods_no);
		goodsMap.put("goodsVO", goodsVO);
		List<GoodsImgFileVO> imageList =goodsDAO.selectGoodsDetailImage(goods_no);
		goodsMap.put("imageList", imageList);
		return goodsMap;
	}
	
	@Override
	public List<Criteria> categoryView(Criteria cri) throws Exception{
		List cateList = goodsDAO.selectCateList(cri);
		return cateList;
	}
	
	public int goodsListCount() throws Exception {
		return goodsDAO.goodsListCount();
	}
	
}
