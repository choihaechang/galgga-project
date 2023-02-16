package com.galgga.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.board.vo.BoardVO;
import com.galgga.board.vo.QAReplyVO;
import com.galgga.board.vo.QAVO;
import com.galgga.board.vo.ReviewImgVO;
import com.galgga.board.vo.ReviewReplVO;
import com.galgga.board.vo.ReviewVO;
import com.galgga.board.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("mapper.board.insert", boardVO);
		
	}
	
	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
	List<BoardVO> list = sqlSession.selectList("mapper.board.listPage",scri);	
	return sqlSession.selectList("mapper.board.listPage",scri);

	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("mapper.board.listCount",scri);
	}
		
	// 게시물 조회
	@Override
	public BoardVO read(int bno) throws Exception{
		return sqlSession.selectOne("mapper.board.read",bno);
	}
	
	//게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		sqlSession.update("mapper.board.update",boardVO);
		
	}
	
	//게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("mapper.board.delete",bno);
	}
	
	    //QA insert
		@Override
		public void addQA(QAVO qaVO) throws Exception {
			sqlSession.insert("mapper.board.addQA", qaVO);
		}
		//QA list
		@Override
		public List QAList(String lod_id) throws DataAccessException{
			List<QAVO> qaList = (ArrayList) sqlSession.selectList("mapper.board.selectQA", lod_id);
			return qaList;
		}
		@Override
		public void QARepl(QAVO qaVO) throws Exception {
			sqlSession.update("mapper.board.QARepl",qaVO);
			
		}
		
	
		
		//-------------------
		
		  @Override public void replyQA(QAReplyVO qaReplyVO) throws Exception {
		  sqlSession.insert("mapper.board.qaReply", qaReplyVO); }
		  
		  @Override public List QAReplList(String lod_id) throws DataAccessException{
		  List<QAVO> qaReplList = (ArrayList)
		  sqlSession.selectList("mapper.board.selectQARepl", lod_id); return
		  qaReplList; }
		 
		//-------------------
	
		
		//review content
		@Override
		public int review(Map reviewMap) throws DataAccessException{
			sqlSession.insert("mapper.board.addReview", reviewMap);
			return Integer.parseInt(String.valueOf(reviewMap.get("review_id")));
		}
		
		//review img
		@Override
		public void reviewImg(List imgList)  throws DataAccessException{
			for(int i=0; i<imgList.size(); i++) {
				ReviewImgVO reviewImgVO=(ReviewImgVO)imgList.get(i);
				sqlSession.insert("mapper.board.reviewImg",reviewImgVO );
			}
		
		}
		@Override
		public void insertStarpoint(int unit_id) throws DataAccessException{
			sqlSession.update("mapper.board.updateStar", unit_id);
		}
		
		@Override
		public void insertlodStar(int lod_id) throws DataAccessException{
			sqlSession.update("mapper.board.lodStar", lod_id);
		}
		
		@Override
		public void qaDelete(String QA_id) throws DataAccessException{
			sqlSession.delete("mapper.board.qadelete",QA_id);
		}
		@Override
		public void qaUpdate(QAVO qaVO) throws DataAccessException{
			sqlSession.update("mapper.board.qaUpdate", qaVO);
		}
		
		@Override
		public void update(int QA_id) throws DataAccessException{
			sqlSession.update("mapper.board.state", QA_id);
			
		}
		
		
		
		  @Override
		  public List<ReviewVO> reviewList(String lod_id) throws DataAccessException{
			  List <ReviewVO> reviewVO = (ArrayList)sqlSession.selectList("mapper.board.reviewList", lod_id);
			  return reviewVO;
		  }
		  
		  @Override
		  public List<ReviewImgVO> reviewImgList(String lod_id) throws DataAccessException{
			  List<ReviewImgVO> reviewList = (ArrayList)sqlSession.selectList("mapper.board.reviewImgList", lod_id);
			  return reviewList;
		  }
		  
		  @Override
		  public void reviewRepl(ReviewReplVO reviewReplVO) throws DataAccessException{
			  sqlSession.insert("mapper.board.reviewReplAdd", reviewReplVO);
		  }
		  
		  @Override
		  public List<ReviewReplVO> reviewReplList(int lod_id, int review_id) throws DataAccessException{
			  		  
			  Map replMap = new HashMap();
			  replMap.put("lod_id", lod_id);
			  replMap.put("review_id", review_id);
			  
			  
			 List<ReviewReplVO> reviewRepl = (ArrayList) sqlSession.selectList("mapper.board.reviewReplList", replMap);
			 return reviewRepl;
		  }
			
}