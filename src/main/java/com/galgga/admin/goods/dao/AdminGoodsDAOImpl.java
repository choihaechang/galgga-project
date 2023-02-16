package com.galgga.admin.goods.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.board.vo.Criteria;
import com.galgga.goods.vo.GoodsImgFileVO;
import com.galgga.goods.vo.GoodsVO;

@Repository("adminGoodsDAO")
public class AdminGoodsDAOImpl  implements AdminGoodsDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List<Criteria> selectGoodsList(Criteria cri) throws DataAccessException {
		List<Criteria> goodsList = sqlSession.selectList("mapper.admin.goods.selectGoodsList", cri);
		return goodsList;

	}
	
	public int goodsListCount() throws Exception {
		return (Integer)sqlSession.selectOne("mapper.admin.goods.goodsListCount");
	}
	
	@Override
	public int insertNewGoods(Map newGoodsMap) throws DataAccessException {
		sqlSession.insert("mapper.admin.goods.insertNewGoods",newGoodsMap);
		return (Integer) newGoodsMap.get("goods_no");
	}
	
	@Override
	public void insertGoodsImgFile(List fileList)  throws DataAccessException {
		for(int i=0; i<fileList.size();i++){
			GoodsImgFileVO goodsImgFileVO=(GoodsImgFileVO)fileList.get(i);
			sqlSession.insert("mapper.admin.goods.insertGoodsImgFile",goodsImgFileVO);
		}
	}
	
	@Override
	public GoodsVO selectgoodsUpdateView(int goods_no) throws DataAccessException{
		GoodsVO goodsBean = new GoodsVO();
		goodsBean=(GoodsVO)sqlSession.selectOne("mapper.admin.goods.selectgoodsUpdateView",goods_no);
		return goodsBean;
	}
	
	@Override
	public List selectGoodsImageFileList(int goods_no) throws DataAccessException {
		List imageList=new ArrayList();
		imageList=(List)sqlSession.selectList("mapper.admin.goods.selectGoodsImageFileList",goods_no);
		return imageList;
	}
	
	@Override
	public int updateGoodsInfo(Map goodsMap) throws DataAccessException{
		sqlSession.update("mapper.admin.goods.updateGoodsInfo",goodsMap);
		return (Integer) goodsMap.get("goods_no");
	}
	
	@Override
	public void updateGoodsImage(List<GoodsImgFileVO> goodsImgFileList) throws DataAccessException {
		
		for(int i=0; i<goodsImgFileList.size();i++){
			GoodsImgFileVO goodsImgFileVO = goodsImgFileList.get(i);
			sqlSession.update("mapper.admin.goods.updateGoodsImage",goodsImgFileVO);	
		}
		
	}
	
	@Override
	public void goodsDelete(int goods_no) throws DataAccessException {
		sqlSession.delete("mapper.admin.goods.goodsDelete", goods_no);
	}
	
	@Override
	public void deleteGoodsImage(int goodsImgid) throws DataAccessException{
		sqlSession.delete("mapper.admin.goods.deleteGoodsImage",goodsImgid);
	}
	
	@Override
	public void deleteGoodsImage(List fileList) throws DataAccessException{
		int goodsImgid;
		for(int i=0; i<fileList.size();i++){
			GoodsImgFileVO bean=(GoodsImgFileVO) fileList.get(i);
			goodsImgid=bean.getGoodsImgid();
			sqlSession.delete("mapper.admin.goods.deleteGoodsImage",goodsImgid);	
		}
	}
	
	@Override
	public void deleteGoodsImageByGoodsNo(int goods_no) throws DataAccessException {
		sqlSession.delete("mapper.admin.goods.deleteGoodsImageByGoodsNo", goods_no);
	}

}