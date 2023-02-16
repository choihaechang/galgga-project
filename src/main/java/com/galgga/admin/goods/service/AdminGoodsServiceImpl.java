package com.galgga.admin.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.galgga.admin.goods.dao.AdminGoodsDAO;
import com.galgga.board.vo.Criteria;
import com.galgga.goods.vo.GoodsImgFileVO;
import com.galgga.goods.vo.GoodsVO;

@Service("adminGoodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminGoodsServiceImpl implements AdminGoodsService {
	@Autowired
	private AdminGoodsDAO adminGoodsDAO;
	
	public List<Criteria> goodsList(Criteria cri) throws Exception {
		return adminGoodsDAO.selectGoodsList(cri);
	}
	
	public int goodsListCount() throws Exception {
		return adminGoodsDAO.goodsListCount();
	}
	
	@Override
	public int addNewGoods(Map newGoodsMap) throws Exception{
		int goods_no = adminGoodsDAO.insertNewGoods(newGoodsMap);
		
		ArrayList<GoodsImgFileVO> goodsImgFileList = (ArrayList)newGoodsMap.get("goodsImgFileList");
		for(GoodsImgFileVO goodsImgFileVO : goodsImgFileList) {
			goodsImgFileVO.setGoods_no(goods_no);
		}
		adminGoodsDAO.insertGoodsImgFile(goodsImgFileList);
		return goods_no;
	}
	
	@Override
	public Map goodsUpdateView(int goods_no) throws Exception {
		Map goodsMap = new HashMap();
		GoodsVO goodsVO=adminGoodsDAO.selectgoodsUpdateView(goods_no);
		List imageFileList =adminGoodsDAO.selectGoodsImageFileList(goods_no);
		goodsMap.put("goodsVO", goodsVO);
		goodsMap.put("imageFileList", imageFileList);
		return goodsMap;
	}
	
	@Override
	public void addNewGoodsImage(List imageFileList) throws Exception{
		adminGoodsDAO.insertGoodsImgFile(imageFileList);
	}
	
	@Override
	public void goodsDelete(int goods_no) throws Exception {
		adminGoodsDAO.goodsDelete(goods_no);
	}
	
	@Override
	public void removeGoodsImage(int goodsImgid) throws Exception{
		adminGoodsDAO.deleteGoodsImage(goodsImgid);
	}
	
	@Override
	public int modifyGoodsInfo(Map goodsMap) throws Exception{
		
		int goods_no = adminGoodsDAO.updateGoodsInfo(goodsMap);
		ArrayList<GoodsImgFileVO> goodsImgFileList = (ArrayList)goodsMap.get("goodsImgFileList");
		for(GoodsImgFileVO goodsImgFileVO : goodsImgFileList) {
			goodsImgFileVO.setGoods_no(goods_no);
		}
		adminGoodsDAO.updateGoodsImage(goodsImgFileList);
		return goods_no;
	}
	
	@Override
	public void modifyGoodsImage(List<GoodsImgFileVO> imageFileList) throws Exception{
		adminGoodsDAO.updateGoodsImage(imageFileList); 
	}
	
	@Override
	public void deleteGoodsImageByGoodsNo(int goods_no) throws Exception {
		adminGoodsDAO.deleteGoodsImageByGoodsNo(goods_no);
	}

}