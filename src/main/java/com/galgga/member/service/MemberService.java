package com.galgga.member.service;

import java.util.List;
import java.util.Map;

import com.galgga.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(Map  loginMap) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String id) throws Exception;
	public void memberUpdate(MemberVO vo) throws Exception;
	public int passChk(MemberVO vo) throws Exception;
	public void memberDelete(MemberVO vo) throws Exception;
	
	public List<MemberVO> findId(String totalemail) throws Exception;
	public int findIdCheck(String totalemail) throws Exception;
	public void findPw(String totalemail,String member_id) throws Exception;
	public int findPwCheck(MemberVO memberVO) throws Exception;
	
	
}
