package com.galgga.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.galgga.board.dao.ReplyDAO;
import com.galgga.board.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;
	
	//댓글조회
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception{
		return dao.readReply(bno);
	}
	
	//댓글작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception{
		dao.writeReply(vo);
	}
	
	//댓글수정
	@Override
	public void updateReply(ReplyVO vo) throws Exception{
		dao.updateReply(vo);
	}
	
	//댓글삭제
	@Override
	public void deleteReply(ReplyVO vo) throws Exception{
		dao.deleteReply(vo);
	}
	
	//선택댓글조회
	@Override
	public ReplyVO selectReply(int rno) throws Exception{
		return dao.selectReply(rno);
	}

}
