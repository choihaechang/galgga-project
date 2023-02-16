package com.galgga.goods.service;

import java.util.List;
import java.util.Map;

import com.galgga.board.vo.Criteria;
import com.galgga.goods.vo.GoodsCateVO;

public interface GoodsService {
	
	public Map goodsDetail(String goods_no) throws Exception;
	public List<Criteria> categoryView(Criteria cri) throws Exception;
	public int goodsListCount() throws Exception;
}
