package com.galgga.admin.goods.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.galgga.admin.goods.service.AdminGoodsService;
import com.galgga.board.vo.Criteria;
import com.galgga.board.vo.PageMaker;
import com.galgga.board.vo.SearchCriteria;
import com.galgga.common.base.BaseController;
import com.galgga.goods.vo.GoodsImgFileVO;
import com.galgga.goods.vo.GoodsVO;
import com.galgga.member.vo.MemberVO;

@Controller("adminGoodsController")
@RequestMapping(value = "/admin/goods")
public class AdminGoodsControllerImpl extends BaseController implements AdminGoodsController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\galgga\\file_goodsImgRepo";
	@Autowired
	private AdminGoodsService adminGoodsService;

	private SearchCriteria scri;
	
	@RequestMapping(value = "/admin_GoodsList.do", method = RequestMethod.GET)
	public ModelAndView adminGoodsList(SearchCriteria scri, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminGoodsService.goodsListCount());
		
		List<Criteria> goodsList = adminGoodsService.goodsList(scri);
		mav.addObject("goodsList", goodsList);
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}

	@RequestMapping(value = "/addNewGoods.do", method = { RequestMethod.POST })
	public ResponseEntity addNewGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String imageFileName = null;

		Map newGoodsMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			newGoodsMap.put(name, value);
		}

		List<GoodsImgFileVO> goodsImgFileList = upload(multipartRequest);
		newGoodsMap.put("goodsImgFileList", goodsImgFileList);

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int goods_no = adminGoodsService.addNewGoods(newGoodsMap);
			if (goodsImgFileList != null && goodsImgFileList.size() != 0) {
				for (GoodsImgFileVO goodsImgFileVO : goodsImgFileList) {
					imageFileName = goodsImgFileVO.getFile_name();
					String fileType = goodsImgFileVO.getFileType();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + goods_no + "\\" + fileType);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}

			message = "<script>";
			message += " alert('새 상품을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/admin/goods/admin_GoodsList.do';";
			message += ("</script>");

		} catch (Exception e) {
			if (goodsImgFileList != null && goodsImgFileList.size() != 0) {
				for (GoodsImgFileVO goodsImgFileVO : goodsImgFileList) {
					imageFileName = goodsImgFileVO.getFile_name();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/admin/goods/admin_GoodsList.do';";
			message += ("</script>");
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@RequestMapping(value="/goodsUpdateForm.do" ,method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView goodsUpdateForm(@RequestParam("goods_no") int goods_no,
			                            HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		Map goodsMap=adminGoodsService.goodsUpdateView(goods_no);
		mav.addObject("goodsMap",goodsMap);
		
		return mav;
	}
	
	@RequestMapping(value="/modifyGoodsInfo.do" ,method={RequestMethod.POST})
	public ModelAndView modifyGoodsInfo(GoodsVO goodsVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ModelAndView mav = new ModelAndView();
		String imageFileName=null;
		Map goodsMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			goodsMap.put(name,value);
		}
		
		List<GoodsImgFileVO> goodsImgFileList = upload(multipartRequest);
		goodsMap.put("goodsImgFileList", goodsImgFileList);
		
		try {
			int goods_no = adminGoodsService.modifyGoodsInfo(goodsMap);
			if (goodsImgFileList != null && goodsImgFileList.size() != 0) {
				for (GoodsImgFileVO goodsImgFileVO : goodsImgFileList) {
					imageFileName = goodsImgFileVO.getFile_name();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + goods_no);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			
		} catch (Exception e) {
			if (goodsImgFileList != null && goodsImgFileList.size() != 0) {
				for (GoodsImgFileVO goodsImgFileVO : goodsImgFileList) {
					imageFileName = goodsImgFileVO.getFile_name();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}
			e.printStackTrace();
		}
		mav.setViewName("redirect:/admin/goods/admin_GoodsList.do");
		return mav;
	}

	@RequestMapping(value="/modifyGoodsImageInfo.do" ,method={RequestMethod.POST})
	public void modifyGoodsImageInfo(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String imageFileName=null;
		
		Map goodsMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			goodsMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String imgAddDate = memberVO.getMember_id();
		
		List<GoodsImgFileVO> imageFileList=null;
		int goods_no=0;
		int goodsImgid=0;
		try {
			imageFileList =upload(multipartRequest);
			if(imageFileList!= null && imageFileList.size()!=0) {
				for(GoodsImgFileVO imageFileVO : imageFileList) {
					goods_no = Integer.parseInt((String)goodsMap.get("goods_no"));
					goodsImgid = Integer.parseInt((String)goodsMap.get("goodsImgid"));
					imageFileVO.setGoods_no(goods_no);
					imageFileVO.setGoodsImgid(goodsImgid);
					imageFileVO.setImgAddDate(imgAddDate);
				}
				
			    adminGoodsService.modifyGoodsImage(imageFileList);
				for(GoodsImgFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFile_name();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH+"\\"+goods_no);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(GoodsImgFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFile_name();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			e.printStackTrace();
		}
		
	}
	
	@Override
	@RequestMapping(value="/addNewGoodsImage.do" ,method={RequestMethod.POST})
	public void addNewGoodsImage(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String imageFileName=null;
		
		Map goodsMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			goodsMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String imgAddDate = memberVO.getMember_id();
		
		List<GoodsImgFileVO> imageFileList=null;
		int goods_no=0;
		try {
			imageFileList =upload(multipartRequest);
			if(imageFileList!= null && imageFileList.size()!=0) {
				for(GoodsImgFileVO imageFileVO : imageFileList) { 
					goods_no = Integer.parseInt((String)goodsMap.get("goods_no"));
					imageFileVO.setGoods_no(goods_no);
					imageFileVO.setImgAddDate(imgAddDate);
				}
				
			    adminGoodsService.addNewGoodsImage(imageFileList);
				for(GoodsImgFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFile_name();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH+"\\"+goods_no);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(GoodsImgFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFile_name();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			e.printStackTrace();
		}
	}
	@Override
	@RequestMapping(value="/goodsDelete.do", method=RequestMethod.POST)
	public String goodsDelete(@RequestParam("goods_no") int goods_no, HttpSession session, RedirectAttributes rttr) throws Exception {
		adminGoodsService.deleteGoodsImageByGoodsNo(goods_no);
		adminGoodsService.goodsDelete(goods_no);
		return "redirect:/admin/goods/admin_GoodsList.do";
	}
	
	@Override
	@RequestMapping(value="/removeGoodsImage.do" ,method={RequestMethod.POST})
	public void  removeGoodsImage(@RequestParam("goods_no") int goods_no,
			                      @RequestParam("goodsImgid") int goodsImgid,
			                      @RequestParam("file_name") String file_name,
			                      HttpServletRequest request, HttpServletResponse response)  throws Exception {
		
		adminGoodsService.removeGoodsImage(goodsImgid);
		try{
			File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+goods_no+"\\"+goodsImgid);
			srcFile.delete();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}