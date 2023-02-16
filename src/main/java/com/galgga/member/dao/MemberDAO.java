package com.galgga.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.galgga.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO login(Map loginMap) throws DataAccessException;
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public void memberUpdate(MemberVO vo) throws DataAccessException;
	public int passChk(MemberVO vo) throws DataAccessException;
	public void memberDelete(MemberVO vo) throws DataAccessException;
	public List<MemberVO> findId(String email1) throws Exception;
	
	
	public int findIdCheck(String totalemail) throws DataAccessException;
	public int findPwCheck(MemberVO memberVO) throws DataAccessException;
	public int findPw(String member_pw,String totalemail,String member_id) throws DataAccessException;
}
