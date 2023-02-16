package com.galgga.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl  implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public MemberVO login(Map loginMap) throws DataAccessException{
		MemberVO member=(MemberVO)sqlSession.selectOne("mapper.member.login",loginMap);
	   return member;
	}
	
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewMember",memberVO);
	}

	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  (String) sqlSession.selectOne("mapper.member.selectOverlappedID",id);
		return result;
	}
	
	@Override
	public void memberUpdate(MemberVO vo) throws DataAccessException{
	 sqlSession.update("mapper.member.memberUpdate",vo);
	}
	
	@Override
	public int passChk(MemberVO vo) throws DataAccessException{
		int result = sqlSession.selectOne("mapper.member.passChk",vo);
		return result;
	}
	
	@Override
	public void memberDelete(MemberVO vo) throws DataAccessException{
		sqlSession.delete("mapper.member.memberDelete",vo);
	}
	
	@Override
	public List<MemberVO> findId(String totalemail) throws DataAccessException{
		return sqlSession.selectList("mapper.member.findId",totalemail);
	}
	
	@Override
	public int findIdCheck(String totalemail) throws DataAccessException{
		return sqlSession.selectOne("mapper.member.findIdCheck",totalemail);
	}
	
	@Override
	public int findPwCheck(MemberVO memberVO) throws DataAccessException{
		return sqlSession.selectOne("mapper.member.findPwCheck",memberVO);
	}
	
	@Override
	public int findPw(String totalemail,String member_id,String member_pw) throws DataAccessException{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("totalemail",totalemail);
		map.put("member_id",member_id);
		map.put("member_pw",member_pw);
		return sqlSession.update("mapper.member.findPw",map);
	}
	
}
