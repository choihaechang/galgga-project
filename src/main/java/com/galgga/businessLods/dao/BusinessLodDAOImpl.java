package com.galgga.businessLods.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.Lods.vo.LodImgFileVO;
import com.galgga.Lods.vo.LodVO;
import com.galgga.main.vo.MainListVO;
import com.galgga.reserve.vo.ReserveVO;

@Repository("businessLodsDAO")
public class BusinessLodDAOImpl implements BusinessLodDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertNewLods(Map newLodsMap) throws DataAccessException{
		sqlSession.insert("mapper.lods.insertNewLods", newLodsMap);
		return Integer.parseInt(String.valueOf(newLodsMap.get("lod_id")));
	}
	
	@Override
	public void insertLodsImageFile(List lodsImgList) throws DataAccessException{
		for(int i=0; i<lodsImgList.size(); i++) {
			LodImgFileVO lodImgFileVO=(LodImgFileVO)lodsImgList.get(i);
			sqlSession.insert("mapper.lods.insertNewLodImg", lodImgFileVO);
		}
	}
	
	  @Override
	  public List selectMyLodsList(int b_id) throws DataAccessException{ 
		  List<LodVO> myLodsList =  (ArrayList) sqlSession.selectList("mapper.lods.selectMyLods", b_id);
	  	return myLodsList;
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
	  public List<MainListVO> lodList_value() throws DataAccessException{
		  List<MainListVO> lodImgList = (ArrayList)sqlSession.selectList("mapper.lods.mainpage_value");
		  return lodImgList;
	  }
	  
	  @Override
	  public List<MainListVO> lodList_reserve() throws DataAccessException{
		  List<MainListVO> lodImgList = (ArrayList)sqlSession.selectList("mapper.lods.mainpage_reserve");
		  return lodImgList;
	  }
	  
	  @Override
	  public List selectLodsReserveList(int b_id) throws DataAccessException{ 
		  List<ReserveVO> myLodsReserveList =  (ArrayList) sqlSession.selectList("mapper.reserve.selectLodsReserveList", b_id);
	  	return myLodsReserveList;
		 }
	  
	  @Override
	  public void updatetLodsInfo (LodVO lodVO) throws DataAccessException{
		sqlSession.update("mapper.lods.lodsInfoUpdate",lodVO);
		}
	  
	  @Override
	  public void updateRefund (int lod_id, String refund) throws DataAccessException{
		  Map refundMap = new HashMap();
		  refundMap.put("lod_id", lod_id);
		  refundMap.put("refund", refund);
		  
		  
		  sqlSession.update("mapper.lods.refundUpdate", refundMap);
	  }
	  
	}

