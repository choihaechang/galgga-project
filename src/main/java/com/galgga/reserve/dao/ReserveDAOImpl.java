package com.galgga.reserve.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.Lods.vo.LodVO;
import com.galgga.reserve.vo.BeforeResVO;
import com.galgga.reserve.vo.ReserveVO;

@Repository("reserveDAO")
public class ReserveDAOImpl implements ReserveDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	  public void haveReserve(ReserveVO reserveVO) throws DataAccessException{
	  sqlSession.insert("mapper.reserve.haveReserve", reserveVO); 
	  
	  }
	 
	
	public BeforeResVO reserveData(String lod_id, String unit_name) throws DataAccessException{
		
		Map data = new HashMap();
		data.put("unit_name", unit_name);
		data.put("lod_id", lod_id);
		
		BeforeResVO beforeResVO =  (BeforeResVO) sqlSession.selectOne("mapper.lods.reserveData", data);
		return beforeResVO;
	}
	
	
	
	@Override
	  public List selectMyReserveList(int m_id) throws DataAccessException{ 
		  List<LodVO> myReserveList =  (ArrayList) sqlSession.selectList("mapper.reserve.selectMyReserve", m_id);
	  	return myReserveList;
		 }
	
	@Override
	 public List dateRange(String lod_id, String unit_name) throws DataAccessException{
		Map dataMap = new HashMap();
		dataMap.put("unit_name", unit_name);
		dataMap.put("lod_id", lod_id);
		
		List<ReserveVO> reserveVO = (ArrayList) sqlSession.selectList("mapper.reserve.dateRange", dataMap);
		return reserveVO;
	}
	
	@Override
	public List reserveCon(String lod_id,  String m_id) throws DataAccessException{
		Map infoMap = new HashMap();
		infoMap.put("lod_id", lod_id);
		
		infoMap.put("m_id", m_id);
		List<ReserveVO> reserveCon =(ArrayList) sqlSession.selectList("mapper.reserve.reserveCon",infoMap); 
		return reserveCon;
	}
	@Override
	public void lodNameUpdate(int lod_id, String lod_name) throws DataAccessException{
		Map lodUpdate = new HashMap();
		lodUpdate.put("lod_name", lod_name);
		lodUpdate.put("lod_id", lod_id);
		
		sqlSession.update("mapper.reserve.lodNameChange",lodUpdate);
	}
	

	@Override
	public int reserve_remove(int R_id) throws DataAccessException{
		return sqlSession.delete("mapper.reserve.reserve_remove",R_id);
	}
	
}
