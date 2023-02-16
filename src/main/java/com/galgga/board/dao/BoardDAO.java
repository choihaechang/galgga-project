package com.galgga.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.galgga.board.vo.BoardVO;
import com.galgga.board.vo.QAReplyVO;
import com.galgga.board.vo.QAVO;
import com.galgga.board.vo.ReviewImgVO;
import com.galgga.board.vo.ReviewReplVO;
import com.galgga.board.vo.ReviewVO;
import com.galgga.board.vo.SearchCriteria;

public interface BoardDAO {
	//게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	// 게시물 목록 조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	// 게시물 총 갯수
	public int listCount(SearchCriteria scir) throws Exception;
		
	//게시물 조회
	public BoardVO read(int bno) throws Exception;
	
	//게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	
	//게시물 삭제
	public void delete(int bno) throws Exception;
	

	//QA add
		public void addQA(QAVO qaVO) throws Exception;
		//QA list
		public List QAList(String lod_id) throws DataAccessException;
		public void replyQA(QAReplyVO qaReplyVO) throws Exception;
		public void update(int QA_id) throws DataAccessException;
		public void qaDelete(String QA_id) throws DataAccessException;
		public void qaUpdate(QAVO qaVO) throws DataAccessException;
		public List QAReplList(String lod_id) throws DataAccessException;
		
		public void QARepl(QAVO qaVO) throws Exception;
		//review add
		public int review(Map reviewMap) throws DataAccessException;
		public void reviewImg(List reviewImg)  throws DataAccessException;
		
		
		
		public void insertStarpoint(int unit_id) throws DataAccessException;
		public void insertlodStar(int lod_id) throws DataAccessException;
		
		
		public List<ReviewVO> reviewList(String lod_id) throws DataAccessException;
		public List<ReviewImgVO> reviewImgList(String lod_id) throws DataAccessException;
		
	    public void reviewRepl(ReviewReplVO reviewReplVO) throws DataAccessException;
	    public List<ReviewReplVO> reviewReplList(int lod_id, int review_id) throws DataAccessException;
		
}
