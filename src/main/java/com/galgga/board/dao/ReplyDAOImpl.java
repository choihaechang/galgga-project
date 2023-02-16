package com.galgga.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.galgga.board.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject SqlSession sql;
	
	//댓글조회
	public List<ReplyVO> readReply(int bno) throws Exception{
		return sql.selectList("mapper.reply.readReply",bno);
	}
	
	//댓글작성
	public void writeReply(ReplyVO vo) throws Exception{
		sql.insert("mapper.reply.writeReply",vo);
	}
	
	//댓글수정
	public void updateReply(ReplyVO vo) throws Exception{
		sql.update("mapper.reply.updateReply",vo);
	}
	
	//댓글삭제
	public void deleteReply(ReplyVO vo) throws Exception{
		sql.delete("mapper.reply.deleteReply",vo);
	}
	
	//선택댓글조회
	public ReplyVO selectReply(int rno) throws Exception{
		return sql.selectOne("mapper.reply.selectReply",rno);
	}

}
