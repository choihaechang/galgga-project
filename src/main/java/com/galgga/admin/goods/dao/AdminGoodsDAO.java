package com.galgga.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.galgga.board.vo.Criteria;
import com.galgga.goods.vo.GoodsImgFileVO;
import com.galgga.goods.vo.GoodsVO;

public interface AdminGoodsDAO {
	public int insertNewGoods(Map newGoodsMap) throws DataAccessException;
	public void insertGoodsImgFile(List fileList)  throws DataAccessException;
	public List<Criteria> selectGoodsList(Criteria cri) throws DataAccessException;
	public int goodsListCount() throws Exception;
	public GoodsVO selectgoodsUpdateView(int goods_no) throws DataAccessException;
	public List selectGoodsImageFileList(int goods_no) throws DataAccessException;
	public int updateGoodsInfo(Map goodsMap) throws DataAccessException;
	public void updateGoodsImage(List<GoodsImgFileVO> imageFileList) throws DataAccessException;
	public void deleteGoodsImage(int goodsImgid) throws DataAccessException;
	public void deleteGoodsImage(List fileList) throws DataAccessException;
	public void goodsDelete(int goods_no) throws DataAccessException;
	public void deleteGoodsImageByGoodsNo(int goods_no) throws DataAccessException;
}
