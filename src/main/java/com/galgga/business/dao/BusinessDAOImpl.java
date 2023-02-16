package com.galgga.business.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.business.vo.BusinessVO;

@Repository("businessDAO")
public class BusinessDAOImpl implements BusinessDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public BusinessVO login(Map loginMap) throws DataAccessException {
		BusinessVO business=(BusinessVO)sqlSession.selectOne("mapper.business.login", loginMap);
		return business;
	}
	
	@Override
	public void insertNewBusiness(BusinessVO businessVO) throws DataAccessException {
		sqlSession.insert("mapper.business.insertNewBusiness", businessVO);
	}
	
	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result = (String)sqlSession.selectOne("mapper.business.selectOverlappedID", id);
		return result;
	}
}
