package com.galgga.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.admin.vo.AdminVO;
import com.galgga.board.vo.Criteria;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public AdminVO login(Map loginMap) throws DataAccessException {
		AdminVO admin=(AdminVO)sqlSession.selectOne("mapper.admin.login", loginMap);
		return admin;
	}
	
	@Override
	public void insertNewAdmin(AdminVO adminVO) throws DataAccessException {
		sqlSession.insert("mapper.admin.insertNewAdmin", adminVO);
	}
	
	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  (String) sqlSession.selectOne("mapper.admin.selectOverlappedID",id);
		return result;
	}
	
	@Override
	public List<Criteria> selectbusinessList(Criteria cri) throws DataAccessException {
		List<Criteria> goodsList = sqlSession.selectList("mapper.business.selectbusinessList", cri);
		return goodsList;
	}
	
	@Override
	public int businessListCount() throws Exception {
		return (Integer)sqlSession.selectOne("mapper.business.businessListCount");
	}
}
