package com.galgga.businessLods.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.Lods.vo.UnitImgFileVO;
import com.galgga.Lods.vo.UnitVO;

@Repository("businessUnitsDAO")
public class BusinessUnitDAOImpl implements BusinessUnitDAO{
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int insertNewUnits(Map newUnitsMap) throws DataAccessException{
		sqlSession.insert("mapper.lods.insertNewUnits", newUnitsMap);
		return Integer.parseInt(String.valueOf(newUnitsMap.get("unit_id")));
	}
	
	@Override
	public void insertUnitsImageFile(List unitsImgList) throws DataAccessException{
		for(int i=0; i<unitsImgList.size(); i++) {
			UnitImgFileVO unitImgFileVO=(UnitImgFileVO)unitsImgList.get(i);
			sqlSession.insert("mapper.lods.insertNewUnitImg", unitImgFileVO);
		}
	}
	
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
	  public List<UnitImgFileVO> selectUnitDetailImage_common(String lod_id) throws DataAccessException{
		  List<UnitImgFileVO> unitImgList_com = (ArrayList)sqlSession.selectList("mapper.lods.selectUnitImgInfo",lod_id);
		  return unitImgList_com;
	  }
	  
	  @Override
	  public void updatetunitsInfo (UnitVO unitVO) throws DataAccessException{
		sqlSession.update("mapper.lods.unitsInfoUpdate",unitVO);
		}
	  
	  @Override
	  public UnitVO unitInfo(String unit_id) throws DataAccessException{
		  UnitVO unitVO = (UnitVO) sqlSession.selectOne("mapper.lods.unitInfo", unit_id);
		  return unitVO;
	  }
	  
	  @Override
	  public List<UnitImgFileVO> unitImg(String unit_id) throws DataAccessException{
		  List<UnitImgFileVO> unitImgList = (ArrayList)sqlSession.selectList("mapper.lods.unitImgInfo", unit_id);
		  return unitImgList;
	  }
	  
}
