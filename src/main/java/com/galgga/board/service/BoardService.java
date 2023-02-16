package com.galgga.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.galgga.board.vo.BoardVO;
import com.galgga.board.vo.QAReplyVO;
import com.galgga.board.vo.QAVO;
import com.galgga.board.vo.ReviewReplVO;
import com.galgga.board.vo.SearchCriteria;

public interface BoardService {
	//게시글작성
	public void write(BoardVO boardVO) throws Exception;

	// 게시물 목록 조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	//게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 게시물 조회
	public BoardVO read(int bno) throws Exception;
	
	// 게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;
	
	

	//QA add
	public void QAadd(QAVO qaVO) throws Exception;
	//QA List
	public List lodQA(String lod_id) throws DataAccessException;
	public void QARepl(QAReplyVO qaReplyVO) throws Exception;
	public void qaListDelete(String QA_id) throws Exception;
	public void modiQA(QAVO qaVO) throws Exception;
	public void updateState(int QA_id) throws Exception;
	public List replList(String lod_id) throws Exception;
	
	public void Replcon(QAVO qaVO) throws Exception;
	
	
	
	//review add
	public int addReview(Map reviewMap) throws Exception;
	//review Img add
	public int addReviewImg(Map reviewMap) throws Exception;
	//review list
	public Map reviewInfo(String lod_id) throws Exception;
	//after review, starpoint change
	public void unitStar(int unit_id) throws Exception;
	//리뷰 작성 후 lod 평점 자동 수정
	public void lodStar(int lod_id) throws Exception;
	
	
	//리뷰 댓글 기능
	public void reviewReplAdd(ReviewReplVO reviewreplVO) throws Exception;
	//댓 글 출력
	public List reviewReplList(int lod_id, int review_id) throws Exception;

}

