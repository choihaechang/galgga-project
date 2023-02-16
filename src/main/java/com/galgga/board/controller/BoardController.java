package com.galgga.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.galgga.board.service.BoardService;
import com.galgga.board.service.ReplyService;
import com.galgga.board.vo.BoardVO;
import com.galgga.board.vo.PageMaker;
import com.galgga.board.vo.QAVO;
import com.galgga.board.vo.ReplyVO;
import com.galgga.board.vo.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	BoardService service;

	@Inject
	ReplyService replyService;


	// 게시판 글 작성
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception {
		logger.info("write");

		service.write(boardVO);

		return "redirect:/board/boardlist.do";
	}

	// 게시판 목록 조회
	@RequestMapping(value = "/boardlist", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");

		model.addAttribute("list", service.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "/board/boardlist";
	}

	// 게시판 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("read");

		model.addAttribute("read", service.read(boardVO.getBno()));

		model.addAttribute("scri", scri);

		List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
		model.addAttribute("replyList", replyList);

		return "/board/readView";
	}

	
	  //게시판 수정뷰
	  
	  @RequestMapping(value="/updateView",method = RequestMethod.GET) 
	  public String updateView(BoardVO boardVO, SearchCriteria scri, Model model) throws Exception{
	  logger.info("updateView");
	  
	  model.addAttribute("update", service.read(boardVO.getBno()));
	  model.addAttribute("scri",scri);
	  
	  return "/board/updateView"; 
	  }
	 

	// 게시물 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception {
		logger.info("update");

		service.update(boardVO);

		return "redirect:/board/boardlist.do";
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO) throws Exception {
		logger.info("delete");

		service.delete(boardVO.getBno());

		return "redirect:/board/boardlist.do";
	}

	// 댓글 작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Writer");

		replyService.writeReply(vo);

		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/board/readView";

	}


	// 댓글 수정 
	@ResponseBody
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public Map<String, String> replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
		
		Map<String,String> map = new HashMap<String,String>();
		
		replyService.updateReply(vo);

		/*
		 * rttr.addAttribute("bno", vo.getBno()); rttr.addAttribute("page",
		 * scri.getPage()); rttr.addAttribute("perPageNum", scri.getPerPageNum());
		 * rttr.addAttribute("searchType", scri.getSearchType());
		 * rttr.addAttribute("keyword", scri.getKeyword());
		 */
		
		map.put("content", vo.getContent());
		return map;
	}



	// 댓글 삭제
	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");

		replyService.deleteReply(vo);

		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/board/readView.do";
	}

	// qa 등록
	@RequestMapping(value = "/QA_add", method = RequestMethod.POST)
	public String QAadd(QAVO qaVO, @RequestParam("lod_id") String lod_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("qa write");

		service.QAadd(qaVO);

		return "redirect:/lods/lodsDetail.do?lod_id=" + lod_id;
	}

}