package com.galgga.admin.goods.service;

import java.util.List;
import java.util.Map;

import com.galgga.board.vo.Criteria;
import com.galgga.goods.vo.GoodsImgFileVO;
import com.galgga.goods.vo.GoodsVO;

public interface AdminGoodsService {
	public int addNewGoods(Map newGoodsMap) throws Exception;
	public void addNewGoodsImage(List imageFileList) throws Exception;
	public List<Criteria> goodsList(Criteria cri) throws Exception;
	public Map goodsUpdateView(int goods_no) throws Exception;
	public int goodsListCount() throws Exception;
	public void goodsDelete(int goods_no) throws Exception;
	public void removeGoodsImage(int goodsImgid) throws Exception;
	public int modifyGoodsInfo(Map goodsMap) throws Exception;
	public void modifyGoodsImage(List<GoodsImgFileVO> imageFileList) throws Exception;
	public void deleteGoodsImageByGoodsNo(int goods_no) throws Exception;
}