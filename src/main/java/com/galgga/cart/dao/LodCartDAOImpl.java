package com.galgga.cart.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.cart.vo.LodCartVO;

@Repository("lodCartDAO")
public class LodCartDAOImpl implements LodCartDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void addLodCart(int lod_id, int m_id) throws DataAccessException{
		Map lodCartAddMap = new HashMap();
		lodCartAddMap.put("lod_id", lod_id);
		lodCartAddMap.put("m_id", m_id);
		sqlSession.insert("mapper.lodCart.lodCartInsert", lodCartAddMap);
		
	}
	
	@Override
	public List<LodCartVO> lodCart(int lod_id, int m_id) throws DataAccessException{
		
		Map lodCartMap = new HashMap();
		lodCartMap.put("lod_id", lod_id);
		lodCartMap.put("m_id", m_id);
		
		List<LodCartVO> lodCart = (ArrayList) sqlSession.selectList("mapper.lodCart.lodCart",lodCartMap);
		
		return lodCart;
	}
	
	@Override
	public void deleteLodCart(int lod_id, int m_id) throws DataAccessException{
		Map lodCartDeleteMap = new HashMap();
		lodCartDeleteMap.put("lod_id",lod_id);
		lodCartDeleteMap.put("m_id",m_id);
		
		
		sqlSession.delete("mapper.lodCart.lodCartDelete",lodCartDeleteMap);
	}
	
	@Override
	public List<LodCartVO> lodCartList(int m_id) throws DataAccessException{
		List<LodCartVO> lodCart = (ArrayList) sqlSession.selectList("mapper.lodCart.lodCartList", m_id);
		return lodCart;
	} 
}
