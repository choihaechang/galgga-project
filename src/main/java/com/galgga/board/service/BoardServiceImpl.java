package com.galgga.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.galgga.board.dao.BoardDAO;
import com.galgga.board.vo.BoardVO;
import com.galgga.board.vo.QAReplyVO;
import com.galgga.board.vo.QAVO;
import com.galgga.board.vo.ReviewImgVO;
import com.galgga.board.vo.ReviewReplVO;
import com.galgga.board.vo.ReviewVO;
import com.galgga.board.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}

	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}
	
	//게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return dao.listCount(scri);
	}
	
	// 게시물 조회
	@Override
	public BoardVO read(int bno) throws Exception{
		return dao.read(bno);
	}
	
	//게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception{
		dao.update(boardVO);
	}
	
	//게시물 삭제
	@Override
	public void delete(int bno) throws Exception{
		dao.delete(bno);
	}
	

	// QA add
	@Override
	public void QAadd(QAVO qaVO) throws Exception {
		dao.addQA(qaVO);
	}
	
	//QA List
	@Override
	public List lodQA(String lod_id) throws DataAccessException{
		List lodQAList = dao.QAList(lod_id);
		if(lodQAList.size()==0) {
			   return null;
		   }
		return lodQAList;
	}
	
	//리플 업뎃
	@Override
	public void Replcon(QAVO qaVO) throws Exception{
		dao.QARepl(qaVO);
		
	}
	
	
	
	
	
	//구버전
	@Override
	public void QARepl(QAReplyVO qaReplyVO) throws Exception {
		dao.replyQA(qaReplyVO);
	}
	
	
	@Override
	public int addReview(Map reviewMap) throws Exception{
		int review_id = dao.review(reviewMap);
		return review_id;
	}
	
	@Override
	public int addReviewImg(Map reviewMap) throws Exception{
		int review_id = dao.review(reviewMap);
		ArrayList<ReviewImgVO> imgList = (ArrayList)reviewMap.get("reviewImgList");
		
		
		for(ReviewImgVO reviewImgVO : imgList) {
			reviewImgVO.setReview_id(review_id);
		}
		dao.reviewImg(imgList);
		return review_id;
		
	}
	
	
	@Override
	  public Map reviewInfo(String lod_id) throws Exception{
		Map reviewInfoMap = new HashMap();
		List <ReviewVO> reviewVO = dao.reviewList(lod_id);
		List <ReviewImgVO> reviewImg = dao.reviewImgList(lod_id);
		reviewInfoMap.put("reviewVO", reviewVO);
		reviewInfoMap.put("reviewImg", reviewImg);
		
		  return reviewInfoMap;
	  }
	
	
	@Override
	public void unitStar(int unit_id) throws Exception{
		dao.insertStarpoint(unit_id);
	}
	@Override
	public void lodStar(int lod_id) throws Exception{
		dao.insertlodStar(lod_id);
	}
	
	@Override
	public void updateState(int QA_id) throws Exception{
		dao.update(QA_id);
		
	}
	
	
	
	@Override
	public void qaListDelete(String QA_id) throws Exception{
		dao.qaDelete(QA_id);
	}
	
	@Override
	  public void modiQA(QAVO qaVO) throws Exception{
		  dao.qaUpdate(qaVO);
	  }
	@Override
	public List replList(String lod_id) throws Exception{
		List replyList = dao.QAReplList(lod_id);
		if(replyList.size()==0) {
			   return null;
		   }
		return replyList;
	}
	@Override
	public void reviewReplAdd(ReviewReplVO reviewreplVO) throws Exception{
		dao.reviewRepl(reviewreplVO);
	}
	
	@Override
	public List reviewReplList(int lod_id, int review_id) throws Exception{
		List replList = dao.reviewReplList(lod_id, review_id);
		return replList;
	}
	
}