package com.galgga.Lods.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.galgga.Lods.service.LodsService;
import com.galgga.Lods.vo.CateVO;
import com.galgga.Lods.vo.UnitVO;
import com.galgga.board.service.BoardService;
import com.galgga.board.vo.QAVO;
import com.galgga.board.vo.ReviewImgVO;
import com.galgga.board.vo.ReviewReplVO;
import com.galgga.business.vo.BusinessVO;
import com.galgga.goods.vo.GoodsCateVO;
import com.galgga.imgCntroller.imgController;
import com.galgga.member.vo.MemberVO;
import com.galgga.reserve.service.ReserveService;

@Controller("lodsController")
@RequestMapping(value="/lods")
public class LodsControllerImpl extends imgController implements LodsController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\galgga\\";
	
	
	@Autowired 
	private LodsService lodsService; 
	@Autowired
	private BoardService boardService;
	@Autowired 
	private ReserveService reserveService;
	private UnitVO unitVO;
	private MemberVO memberVO;
	private BusinessVO businessVO;
	
	@RequestMapping(value="/lodsDetail.do" ,method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView lodsDetail(@RequestParam("lod_id") String lod_id,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		Map lodsDetailMap = lodsService.lodsInfo(lod_id);
		Map unitsDetailMap = lodsService.unitsInfo(lod_id); 
		Map reviewMap = boardService.reviewInfo(lod_id);
		
		
		List unit = (ArrayList) unitsDetailMap.get("unitVO");
		List QAList =  boardService.lodQA(lod_id);
		List QAReplList = boardService.replList(lod_id); 
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("memberInfo") != null && session.getAttribute("memberInfo")!= "") {
			MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
			int m_id = memberVO.getM_id();
			String member_id = memberVO.getMember_id();
			session.setAttribute("m_id", m_id);
			session.setAttribute("member_id", member_id);
		} else {
			session.setAttribute("m_id", 00000000); 
			//로그인 안되어 있을 시 m_id가 null값이 script가 깨지는 현상이 발생 하여 임의의 값을 넣어줌
		}
		
		if(session.getAttribute("businessInfo") != null && session.getAttribute("businessInfo") != "") {
			
			BusinessVO businessVO = (BusinessVO) session.getAttribute("businessInfo");
			int b_id = businessVO.getB_id();
			session.setAttribute("b_id", b_id);
		}
		
		//quick menu
		session.removeAttribute("lodsDetailMap");
		session.removeAttribute("unitsDetailMap");
		session.setAttribute("lodsDetailMap", lodsDetailMap);
		session.setAttribute("unitsDetailMap", unitsDetailMap);
		
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("lodsDetailMap", lodsDetailMap);	
		mav.addObject("unitsDetailMap", unitsDetailMap);
		mav.addObject("QAList", QAList);
		mav.addObject("reviewMap", reviewMap);
		mav.addObject("QAReplList", QAReplList);
		
		return mav;	
		
	}
	
	@RequestMapping(value="/lodsCate.do" ,method=RequestMethod.GET)
	public ModelAndView selectCate(@RequestParam("lod_category") String lod_category,
			 HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("category", lodsService.categoryView(lod_category));	

	   return mav;
	}
			
	@RequestMapping(value = "/addReveiw.do", method = { RequestMethod.POST })
	public ResponseEntity addReview(@RequestParam("lod_id") int lod_id, @RequestParam("unit_id") int unit_id,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		
		multipartRequest.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String reviewImgName = null;
		Map addReviewMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		
		
		HttpSession session = multipartRequest.getSession();
		session = multipartRequest.getSession();
		
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		int m_id = memberVO.getM_id();
		
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value =  multipartRequest.getParameter(name);
			addReviewMap.put(name, value);
			addReviewMap.put("m_id", m_id);
		}
		
		List<ReviewImgVO> reviewImgList = reviewUpload(multipartRequest);
		
		if (reviewImgList != null && reviewImgList.size() != 0) {
			
			addReviewMap.put("reviewImgList", reviewImgList);
		}
		
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		
		 if (reviewImgList != null && reviewImgList.size() != 0) {
		try {
			int review_id = boardService.addReviewImg(addReviewMap);
				boardService.unitStar(unit_id);
				boardService.lodStar(lod_id);
				if (reviewImgList != null && reviewImgList.size() != 0) {
					
				for (ReviewImgVO reviewImgVO : reviewImgList) {
					reviewImgName = reviewImgVO.getImgName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\" + reviewImgName);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\" + "lods" + "\\" + lod_id +"\\"+ "lod"+"\\"+"review"+"\\"+review_id);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);

				}
		}
			message = "<script>";
			message += " alert('리뷰를 등록했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/lods/lodsDetail.do?lod_id="+lod_id+"'";
			message += (" </script>");	
			
		} catch (Exception e) {
			if (reviewImgList != null && reviewImgList.size() != 0) {
				for (ReviewImgVO reviewImgVO : reviewImgList) {
					reviewImgName = reviewImgVO.getImgName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + reviewImgName);
					srcFile.delete();
				}
			}


			message = "<script>";
			message += " alert('리뷰등록에 실패했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/lods/lodsDetail.do?lod_id="+lod_id+"'";
			message += (" </script>");
			e.printStackTrace();
		}
			
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
		
		
		try {
		if(reviewImgList == null || reviewImgList.size() == 0 ) {
			int review_id = boardService.addReview(addReviewMap);
			boardService.unitStar(unit_id);
			boardService.lodStar(lod_id);
			}
		
		message = "<script>";
		message += " alert('리뷰등록에 성공했습니다.');";
		message += " location.href='" + multipartRequest.getContextPath() + "/lods/lodsDetail.do?lod_id="+lod_id+"'";
		message += (" </script>");}
		catch (Exception e) {
			message = "<script>";
			message += " alert('리뷰등록에 실패했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/lods/lodsDetail.do?lod_id="+lod_id+"'";
			message += (" </script>");
			e.printStackTrace();
		
		}
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/reviewReplAdd.do" ,method=RequestMethod.POST)
	public ResponseEntity reviewReplAdd(@RequestParam("lod_id") int _lod_id, @RequestParam("m_id") int _m_id, @RequestParam("repl_content") String _repl_content, 
			@RequestParam("review_id") int _review_id, @RequestParam("member_id") String _member_id,@RequestParam("lod_id") int lod_id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			ReviewReplVO reviewReplVO = new ReviewReplVO();
			reviewReplVO.setM_id(_m_id);
			reviewReplVO.setMember_id(_member_id);
			reviewReplVO.setRepl_content(_repl_content);
			reviewReplVO.setReview_id(_review_id);
			reviewReplVO.setLod_id(_lod_id);
			
			
			boardService.reviewReplAdd(reviewReplVO);
			
			message = "<script>";
			message += " alert('댓글을 성공적으로 달았습니다.');";
			message += " location.href='" + request.getContextPath() + "/lods/lodsDetail.do?lod_id="+lod_id+"'";
			message += (" </script>");
			
		} catch (Exception e){
			message = "<script>";
			message += " alert('댓글 등록에 실패했습니다.');";
			message += " location.href='" + request.getContextPath() + "/lods/lodsDetail.do?lod_id="+lod_id+"'";
			message += (" </script");
		}
		
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	
	}
	
	@RequestMapping(value="/QADelete.do" ,method=RequestMethod.GET)
	public ResponseEntity qaDelete(@RequestParam("QA_id") String QA_id, @RequestParam("lod_id") String lod_id,
							HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.qaListDelete(QA_id);
			
			message = "<script>";
			message += " alert('delete success');";
			message += " location.href='" + request.getContextPath() + "/lods/lodsDetail.do?lod_id="+lod_id+"'";
			message += (" </script>");
			
		} catch (Exception e){
			message = "<script>";
			message += " alert('delete fail');";
			message += " location.href='" + request.getContextPath() + "/lods/lodsDetail.do?lod_id="+lod_id+"'";
			message += (" </script");
		}
		
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	//qa 수정
	@RequestMapping(value="/QAUpdate.do", method=RequestMethod.POST) 
	  public ResponseEntity QAUpdate(QAVO qaVO,@RequestParam("lod_id") String lod_id,
			  HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			boardService.modiQA(qaVO);
			
			message = "<script>";
			message += " alert('update success');";
			message += " location.href='" + request.getContextPath() + "/lods/lodsDetail.do?lod_id="+lod_id+"'";
			message += (" </script>");
		}
		catch (Exception e){
			message = "<script>";
			message += " alert('update fail');";
			message += " location.href='" + request.getContextPath() + "/lods/lodsDetail.do?lod_id="+lod_id+"'";
			message += (" </script");
		}
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/QAReply.do", method = { RequestMethod.POST })
	public ResponseEntity QAReply(QAVO qaVO, @RequestParam("lod_id") int lod_id, @RequestParam("QA_id") int QA_id,
												HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		
		try {
			boardService.Replcon(qaVO);
			boardService.updateState(QA_id);
			
			message = "<script>";
			message += " alert('답변 등록을 완료했습니다.');";
			message += " location.href='"+request.getContextPath()+"/lods/lodsDetail.do?lod_id="+lod_id+"'";
			message += (" </script>");
			
		} catch (Exception e){
			
			
			
			message = "<script>";
			message += " alert('답변 등록을 실패했습니다.');";
			message += " location.href='" + request.getContextPath() + "/lods/lodsDetail.do?lod_id="+lod_id+"'";
			message += (" </script");
		}
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/lodsSearch", method=RequestMethod.GET)
	public ModelAndView lodsSearch(@RequestParam("keyword") String keyword,HttpServletRequest request, HttpServletResponse response ) throws Exception {
		List<CateVO> lodsList = lodsService.lodsSearch(keyword);
		List<GoodsCateVO> goodsList = lodsService.goodsSearch(keyword);
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("lodsList", lodsList);
		mav.addObject("goodsList", goodsList);
		
		return mav;
	}

	
}
