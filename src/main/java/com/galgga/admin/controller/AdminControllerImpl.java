package com.galgga.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.galgga.admin.service.AdminService;
import com.galgga.admin.vo.AdminVO;
import com.galgga.board.service.BoardService;
import com.galgga.board.service.ReplyService;
import com.galgga.board.vo.BoardVO;
import com.galgga.board.vo.Criteria;
import com.galgga.board.vo.PageMaker;
import com.galgga.board.vo.ReplyVO;
import com.galgga.board.vo.SearchCriteria;

@Controller("adminController")
@RequestMapping(value="/admin")
public class AdminControllerImpl implements AdminController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private AdminVO adminVO;
	
	@Inject
	BoardService service;

	@Inject
	ReplyService replyService;
	
	@Override
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		try{
		ModelAndView mav = new ModelAndView();
		adminVO=adminService.login(loginMap);
		String a_pw = request.getParameter("Admin_pw");
		String b_pw = adminVO.getAdmin_pw();	
		boolean pwMatch = pwEncoder.matches(loginMap.get("Admin_pw"), adminVO.getAdmin_pw());
		if(pwMatch){
			HttpSession session=request.getSession();
			session=request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("adminInfo",adminVO);
			
			String action=(String)session.getAttribute("action");
			if(action!=null && action.equals("/order/orderEachGoods.do")){
				mav.setViewName("forward:"+action);
			}else{
				mav.setViewName("redirect:/main/main.do");
			}

		} else {
			String message="아이디나 비밀번호가 틀립니다. 다시 시도해주세요";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
		} catch(NullPointerException e) {
			ModelAndView mav = new ModelAndView();
			String message="아이디나 비밀번호가 틀립니다. 다시 시도해주세요";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		return mav;
		}
	}
	
	@Override
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("adminInfo");
		String message = "로그아웃합니다.";
		mav.addObject("message", message);
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/addAdmin.do" ,method = RequestMethod.POST)
	public ResponseEntity addAdmin(@ModelAttribute("adminVO") AdminVO _adminVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    adminService.addAdmin(_adminVO);
		    message  = "<script>";
		    message += " location.href='"+request.getContextPath()+"/admin/adminJoinSc.do';";
		    message += " </script>";
		    
		} catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해주세요');";
		    message += " location.href='"+request.getContextPath()+"/admin/addAdmin.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = adminService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	
	@RequestMapping(value = "/admin_BusinessList.do", method = RequestMethod.GET)
	public ModelAndView admin_BusinessList(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.businessListCount());
		
		List<Criteria> businessList = adminService.businessList(cri);
		mav.addObject("businessList", businessList);
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}

		// 게시판 글 작성
		@RequestMapping(value = "/admin/write", method = RequestMethod.POST)
		public String write(BoardVO boardVO) throws Exception {

			service.write(boardVO);

			return "redirect:/admin/admin_boardList.do";
		}

		// 게시판 목록 조회
		@RequestMapping(value = "/admin_boardList", method = RequestMethod.GET)
		public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

			model.addAttribute("list", service.list(scri));

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));

			model.addAttribute("pageMaker", pageMaker);

			return "/admin/admin_boardList";
		}

		// 게시판 조회
		@RequestMapping(value = "/admin_readView", method = RequestMethod.GET)
		public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {

			model.addAttribute("read", service.read(boardVO.getBno()));

			model.addAttribute("scri", scri);

			List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
			model.addAttribute("replyList", replyList);

			return "/admin/admin_readView";
		}

		
		  //게시판 수정뷰
		  
		  @RequestMapping(value="/admin_updateView",method = RequestMethod.GET) public String
		  updateView(BoardVO boardVO, SearchCriteria scri, Model model) throws Exception{
		  
		  model.addAttribute("update", service.read(boardVO.getBno()));
		  model.addAttribute("scri",scri);
		  
		  return "/admin/admin_updateView"; 
		  }
		 

		// 게시물 수정
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(BoardVO boardVO) throws Exception {

			service.update(boardVO);

			return "redirect:/admin/admin_boardList.do";
		}

		// 게시물 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(BoardVO boardVO) throws Exception {

			service.delete(boardVO.getBno());

			return "redirect:/admin/admin_boardList.do";
		}

		// 댓글 작성
		@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
		public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {

			replyService.writeReply(vo);

			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/admin/admin_readView";

		}


		// 댓글 수정 
		@ResponseBody
		@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
		public Map<String, String> replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			
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

			replyService.deleteReply(vo);

			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/admin/admin_readView.do";
		}

}
