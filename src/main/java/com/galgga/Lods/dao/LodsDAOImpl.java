package com.galgga.Lods.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.Lods.vo.CateVO;
import com.galgga.Lods.vo.LodImgFileVO;
import com.galgga.Lods.vo.LodVO;
import com.galgga.goods.vo.GoodsCateVO;
import com.galgga.main.vo.MainListVO;


@Repository("lodsDAO")
public class LodsDAOImpl implements LodsDAO{
	
	@Autowired
	private SqlSession sqlSession;
	  @Override
	  public List<MainListVO> lodList_value() throws DataAccessException{
		  List<MainListVO> lodImgList = (ArrayList) sqlSession.selectList("mapper.lods.mainpage_value");
		  return lodImgList;
	  }
	  
	  @Override
	  public List<MainListVO> lodList_reserve() throws DataAccessException{
		  List<MainListVO> lodImgList = (ArrayList) sqlSession.selectList("mapper.lods.mainpage_reserve");
		  return lodImgList;
	  }
	  @Override
	  public LodVO selectLodsDetail(String lod_id) throws DataAccessException{
		  LodVO lodVO = (LodVO) sqlSession.selectOne("mapper.lods.selectLodInfo",lod_id);
		  return lodVO;
	  }
	  
	  @Override
	  public List<LodImgFileVO> selectLodComImg(String lod_id) throws DataAccessException{
		  List<LodImgFileVO> lodComImgList = (ArrayList)sqlSession.selectList("mapper.lods.selectLodComImgInfo",lod_id);
		  return lodComImgList;
	  }
	  
	  @Override
	  public List<CateVO> selectCateList(String lod_category) throws DataAccessException{
		  List<CateVO> cateList = (ArrayList) sqlSession.selectList("mapper.lods.selectCate", lod_category);
		  return cateList;
	  }
	  
	  @Override
	  public List<CateVO> selectLodSearch(String keyword) throws DataAccessException {
		  List<CateVO> lodList = (ArrayList) sqlSession.selectList("mapper.lods.selectLodSearch", keyword);
		  return lodList;
	  }
	  
	  @Override
	  public List<GoodsCateVO> selectGoodsSearch(String keyword) throws DataAccessException {
		  List<GoodsCateVO> goodsList = (ArrayList) sqlSession.selectList("mapper.goods.selectGoodsSearch", keyword);
		  return goodsList;
	  }
	
}
