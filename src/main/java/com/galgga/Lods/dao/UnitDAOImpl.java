package com.galgga.Lods.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.Lods.vo.UnitImgFileVO;
import com.galgga.Lods.vo.UnitVO;

@Repository("unitDAO")
public class UnitDAOImpl implements UnitDAO {
	@Autowired
	private SqlSession sqlSession;
	
	  @Override
	  public List<UnitVO> selectUnitsDetail(String lod_id) throws DataAccessException{
		  List<UnitVO> unitVO = (ArrayList) sqlSession.selectList("mapper.lods.selectUnitInfo",lod_id);
		  return unitVO;
	  }
	  @Override
	  public List<UnitImgFileVO> selectUnitDetailImage(String lod_id) throws DataAccessException{
		  List<UnitImgFileVO> unitImgList = (ArrayList)sqlSession.selectList("mapper.lods.selectUnitImgInfo",lod_id);
		  return unitImgList;
	  }
	  @Override
	  public List<UnitImgFileVO> selectUnitDetailImage_com(String lod_id) throws DataAccessException{
		  List<UnitImgFileVO> unitImgList_com = (ArrayList)sqlSession.selectList("mapper.lods.selectUnitImgInfo_com",lod_id);
		  return unitImgList_com;
	  }
	 
}
