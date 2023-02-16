package com.galgga.member.service;

import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.galgga.mail.MailUtils;
import com.galgga.mail.TempKey;
import com.galgga.member.dao.MemberDAO;
import com.galgga.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;

	@Autowired
	private JavaMailSender mailSender;
	
	
	@Override
	public MemberVO login(Map  loginMap) throws Exception{
		return memberDAO.login(loginMap);
	}
	
	@Override
	public void addMember(MemberVO memberVO) throws Exception{
		String encodePw = pwEncoder.encode(memberVO.getMember_pw());
		memberVO.setMember_pw(encodePw);
		memberDAO.insertNewMember(memberVO);
	}
	
	@Override
	public String overlapped(String id) throws Exception{
		return memberDAO.selectOverlappedID(id);
	}
	
	@Override
	public void memberUpdate(MemberVO vo) throws Exception{
		String pw = vo.getMember_pw();
		if(pw!=null && !pw.equals("")) {
			String encodePw = pwEncoder.encode(vo.getMember_pw());
			vo.setMember_pw(encodePw);
		}
		
		memberDAO.memberUpdate(vo);
	}
	
	@Override
	public int passChk(MemberVO vo) throws Exception{
		int result = memberDAO.passChk(vo);
		return result;
	}
	
	@Override
	public void memberDelete(MemberVO vo) throws Exception{
		memberDAO.memberDelete(vo);
	}
	
	@Override
	public List<MemberVO> findId(String totalemail) throws Exception{
		return memberDAO.findId(totalemail);
	}
	
	@Override
	public int findIdCheck(String totalemail) throws Exception{
		return memberDAO.findIdCheck(totalemail);
	}
	
	@Override
	public int findPwCheck(MemberVO memberVO) throws Exception{
		return memberDAO.findPwCheck(memberVO);
	}
	
	@Override
	public void findPw(String totalemail,String member_id) throws Exception{
		String memberKey = new TempKey().getKey(6,false);
		String member_pw = pwEncoder.encode(memberKey);
		memberDAO.findPw(totalemail,member_id,member_pw);
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[galgga 커뮤니티 임시 비밀번호 입니다.]"); //메일 제목
		sendMail.setText(
				"<h1>임시비밀번호 발급</h1>" +
						"<br/>"+member_id+"님 "+
						"<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
						"<br/>임시비밀번호 :  <h2>"+memberKey+"</h2>"+
						"<br/>로그인 후 비밀번호 변경을 해주세요."+
						"<a href='http://localhost:8080/galgga/member/loginForm.do"+
						">로그인 페이지</a>");
		sendMail.setFrom("chc9005@gmail.com", "galgga");
		sendMail.setTo(totalemail);
		sendMail.send();
		
	}
	
}
