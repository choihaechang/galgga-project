package com.galgga.goods.controller;

import java.io.File;
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

import com.galgga.board.service.BoardService;
import com.galgga.board.vo.Criteria;
import com.galgga.board.vo.PageMaker;
import com.galgga.board.vo.QAVO;
import com.galgga.board.vo.ReviewImgVO;
import com.galgga.common.base.BaseController;
import com.galgga.goods.service.GoodsService;
import com.galgga.member.vo.MemberVO;

@Controller("goodsController")
@RequestMapping(value="/goods")
public class GoodsControllerImpl extends BaseController implements GoodsController {
	
	private static String CURR_IMAGE_REPO_PATH = "C:\\galgga\\";
	
	@Autowired
	private GoodsService goodsService;
	
	private MemberVO memberVO;
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/goodsDetail.do", method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("goods_no") String goods_no,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		Map goodsMap=goodsService.goodsDetail(goods_no);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsMap", goodsMap);
		/* GoodsVO goodsVO=(GoodsVO)goodsMap.get("goodsVO"); */
		/* addGoodsInQuick(goods_no, goodsVO, session); */
		return mav;
	}
	
	@RequestMapping(value="/goodsCate.do" ,method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView goodsCate(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(goodsService.goodsListCount());
		
		List<Criteria> cateList = goodsService.categoryView(cri);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("cateList", cateList);	

	   return mav;
	}
	
	@RequestMapping(value = "/addReveiw.do", method = { RequestMethod.POST })
	public ResponseEntity addReview(@RequestParam("goods_no") int goods_no, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {

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
			String value = multipartRequest.getParameter(name);
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

				if (reviewImgList != null && reviewImgList.size() != 0) {

					for (ReviewImgVO reviewImgVO : reviewImgList) {
						reviewImgName = reviewImgVO.getImgName();
						File srcFile = new File(
								CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\" + reviewImgName);
						File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\"
								+ "goods_review" + "\\" + goods_no + "\\" + review_id);
						FileUtils.moveFileToDirectory(srcFile, destDir, true);

					}
				}
				message = "<script>";
				message += " alert('리뷰를 등록했습니다.');";
				message += " location.href='" + multipartRequest.getContextPath() + "/goods/goodsDetail.do?goods_no="
						+ goods_no + "'";
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
				message += " location.href='" + multipartRequest.getContextPath() + "/goods/goodsDetail.do?goods_no="
						+ goods_no + "'";
				message += (" </script>");
				e.printStackTrace();
			}

			resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
			return resEntity;
		}

		try {
			if (reviewImgList == null || reviewImgList.size() == 0) {
				int review_id = boardService.addReview(addReviewMap);

			}

			message = "<script>";
			message += " alert('리뷰등록에 성공했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/goods/goodsDetail.do?goods_no=" + goods_no
					+ "'";
			message += (" </script>");
		} catch (Exception e) {
			message = "<script>";
			message += " alert('리뷰등록에 실패했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/goods/goodsDetail.do?goods_no=" + goods_no
					+ "'";
			message += (" </script>");
			e.printStackTrace();

		}

		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/QADelete.do" ,method=RequestMethod.GET)
	public ResponseEntity qaDelete(@RequestParam("QA_id") String QA_id, @RequestParam("goods_no") String goods_no,
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
			message += " location.href='" + request.getContextPath() + "/goods/goodsDetail.do?goods_no="+goods_no+"'";
			message += (" </script>");
			
		} catch (Exception e){
			message = "<script>";
			message += " alert('delete fail');";
			message += " location.href='" + request.getContextPath() + "/goods/goodsDetail.do?goods_no="+goods_no+"'";
			message += (" </script");
		}
		
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	//qa 수정
	@RequestMapping(value="/QAUpdate.do", method=RequestMethod.POST) 
	  public ResponseEntity QAUpdate(QAVO qaVO,@RequestParam("goods_no") String goods_no,
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
			message += " location.href='" + request.getContextPath() + "/goods/goodsDetail.do?goods_no="+goods_no+"'";
			message += (" </script>");
		}
		catch (Exception e){
			message = "<script>";
			message += " alert('update fail');";
			message += " location.href='" + request.getContextPath() + "/goods/goodsDetail.do?goods_no="+goods_no+"'";
			message += (" </script");
		}
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/QAReply.do", method =RequestMethod.POST)
	public ResponseEntity QAReply(QAVO qaVO, @RequestParam("goods_no") int goods_no, @RequestParam("QA_id") int QA_id,
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
			message += " location.href='"+request.getContextPath()+"/goods/goodsDetail.do?goods_no="+goods_no+"'";
			message += (" </script>");
			
		} catch (Exception e){
			
			
			
			message = "<script>";
			message += " alert('답변 등록을 실패했습니다.');";
			message += " location.href='" + request.getContextPath() + "/goods/goodsDetail.do?goods_no="+goods_no+"'";
			message += (" </script");
		}
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

}
