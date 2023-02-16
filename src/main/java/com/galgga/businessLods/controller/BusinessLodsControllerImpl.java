package com.galgga.businessLods.controller;

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

import com.galgga.Lods.vo.LodImgFileVO;
import com.galgga.Lods.vo.LodVO;
import com.galgga.Lods.vo.UnitImgFileVO;
import com.galgga.Lods.vo.UnitVO;
import com.galgga.business.service.BusinessService;
import com.galgga.business.vo.BusinessVO;
import com.galgga.businessLods.service.BusinessLodService;
import com.galgga.imgCntroller.imgController;
import com.galgga.reserve.service.ReserveService;

@Controller("businessLodsController")
@RequestMapping(value = "/businessLods")
public class BusinessLodsControllerImpl extends imgController implements BusinessLodsController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\galgga\\";

	@Autowired
	private BusinessLodService businessLodService;
	@Autowired
	private BusinessVO businessVO;
	@Autowired
	private BusinessService businessService;
	
	@Autowired(required=false)
	private LodVO lodVO;
	@Autowired
	private ReserveService reserveService;
	
	
	@RequestMapping(value = "/addNewLods.do", method = { RequestMethod.POST })
	public ResponseEntity addNewLods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String lodImgFileName = null;
		String unitImgFileName = null;

		// 숙소 등록
		Map newLodsMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		
		
		HttpSession session = multipartRequest.getSession();
		session = multipartRequest.getSession();
		session.getAttribute("businessInfo");
		businessVO = (BusinessVO) session.getAttribute("businessInfo");
		int b_id = businessVO.getB_id();
		

		
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value =  multipartRequest.getParameter(name);
			newLodsMap.put(name, value);
			newLodsMap.put("b_id", b_id);
		}

		List<LodImgFileVO> lodImgFileList = lodupload(multipartRequest);
		if (lodImgFileList != null && lodImgFileList.size() != 0) {
			newLodsMap.put("lodImgFileList", lodImgFileList);
		}
	 

		List<UnitImgFileVO> unitImgFileList = unitupload(multipartRequest);
		if (unitImgFileList != null && unitImgFileList.size() != 0) {
			newLodsMap.put("unitImgFileList", unitImgFileList);
		}

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int lod_id = businessLodService.addNewLods(newLodsMap);
			

			if (lodImgFileList != null && lodImgFileList.size() != 0) {
				for (LodImgFileVO lodImgFileVO : lodImgFileList) {
					lodImgFileName = lodImgFileVO.getLod_imgName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\" + lodImgFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\" + "lods" + "\\" + lod_id +"\\"+ "lod");
					FileUtils.moveFileToDirectory(srcFile, destDir, true);

				}
				if (unitImgFileList != null && unitImgFileList.size() != 0) {
					for (UnitImgFileVO unitImgFileVO : unitImgFileList) {
						unitImgFileName = unitImgFileVO.getUnit_imgName();
						File srcFile1 = new File(CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\" + unitImgFileName);
						File DestDir1 = new File (CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\"+"lods"+"\\"+lod_id+"\\"+"unit"+"\\"+unitImgFileVO.getUnit_id());
						FileUtils.moveFileToDirectory(srcFile1, DestDir1, true);

					}
				}

			}

			message = "<script>";
			message += " alert('숙소 등록에 성공했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/businessLods/business_main.do';";
			message += (" </script>");
			
		} catch (Exception e) {
			if (lodImgFileList != null && lodImgFileList.size() != 0) {
				for (LodImgFileVO lodimgFileVO : lodImgFileList) {
					lodImgFileName = lodimgFileVO.getLod_imgName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + lodImgFileName);
					srcFile.delete();
				}
			}
			if (unitImgFileList != null && unitImgFileList.size() != 0) {
				for (UnitImgFileVO unitimgFileVO : unitImgFileList) {
					unitImgFileName = unitimgFileVO.getUnit_imgName();
					File srcFile1 = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + unitImgFileName);
					srcFile1.delete();
				}
			}

			message = "<script>";
			message += " alert('오류 발생 다시 등록해 주세요.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/businessLods/business_addLod.do';";
			message += (" </script>");
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	
	@RequestMapping(value = "/addNewUnits.do", method = { RequestMethod.POST })
	public ResponseEntity addNewUnits (MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		String unitImgFileName = null;
		Map newUnitsMap = new HashMap(); 
		Enumeration enu = multipartRequest.getParameterNames(); 
		
		//현재 로그인 되어있는 사업주 확인
		HttpSession session = multipartRequest.getSession();
		session = multipartRequest.getSession();
		session.getAttribute("businessInfo");

		businessVO = (BusinessVO) session.getAttribute("businessInfo"); // 로그인 되어있는 사업주 확인
		int b_id = businessVO.getB_id();

		int lod_id = Integer.parseInt(multipartRequest.getParameter("lod_id"));   //객실 추가할 숙소의 아이디 값 확인
		newUnitsMap.put("lod_id", lod_id);

		  while (enu.hasMoreElements()) {
		  String name = (String) enu.nextElement(); 
		  String value = multipartRequest.getParameter(name);
		  newUnitsMap.put(name, value);
		  
		  }
		  List<UnitImgFileVO> unitImgFileList = unitupload(multipartRequest);
			if (unitImgFileList != null && unitImgFileList.size() != 0) {
				newUnitsMap.put("unitImgFileList", unitImgFileList);
			}
			
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
			try {
				int unit_id = businessLodService.addNewUnits(newUnitsMap);
				
					if (unitImgFileList != null && unitImgFileList.size() != 0) {
						for (UnitImgFileVO unitImgFileVO : unitImgFileList) {
							unitImgFileName = unitImgFileVO.getUnit_imgName();
							File srcFile1 = new File(CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\" + unitImgFileName);
							File DestDir1 = new File (CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\"+"lods"+"\\"+lod_id+"\\"+"unit"+"\\"+unitImgFileVO.getUnit_id());
							FileUtils.moveFileToDirectory(srcFile1, DestDir1, true);

						}
					}

					message = "<script>";
					message += " alert('숙소 등록에 성공했습니다.');";
					message += " location.href='" + multipartRequest.getContextPath() + "/businessLods/business_main.do';";
					message += (" </script>");	
			}catch (Exception e) {

			if (unitImgFileList != null && unitImgFileList.size() != 0) {
				for (UnitImgFileVO unitimgFileVO : unitImgFileList) {
					unitImgFileName = unitimgFileVO.getUnit_imgName();
					File srcFile1 = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + unitImgFileName);
					srcFile1.delete();
				}
			}
	
			message = "<script>";
			message += " alert('오류 발생 다시 등록해 주세요.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/businessLods/business_addUnit.do';";
			message += (" </script>");
			e.printStackTrace();
		}
	resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
	return resEntity;
	}
	
	
	@RequestMapping(value="/business_main.do", method=RequestMethod.GET)
	public ModelAndView businessMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		BusinessVO businessVO = (BusinessVO)session.getAttribute("businessInfo");
		int b_id = businessVO.getB_id();		
		List myLodsList = businessLodService.myLodsList(b_id);
		mav.addObject("myLodsList", myLodsList);
		
		return mav;
	}
	
	// 현재 디테일 비지니스에서 >>>> lods로 변경 여기엔 수정창 필요
	@RequestMapping(value="/lods.do" ,method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView lodsDetail(@RequestParam("lod_id") String lod_id,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		Map lodsDetailMap = businessLodService.lodsInfo(lod_id);
		Map unitsDetailMap = businessLodService.unitsInfo(lod_id); 
				
		session.setAttribute("lodsDetailMap", lodsDetailMap);
		session.setAttribute("unitsDetailMap", unitsDetailMap);
		ModelAndView mav = new ModelAndView(viewName);
		
		mav.addObject("lodsDetailMap", lodsDetailMap);	
		mav.addObject("unitsDetailMap", unitsDetailMap);
		
		return mav;
		
	}
	
	@RequestMapping(value="/business_reserveList.do", method=RequestMethod.GET)
	public ModelAndView reserveList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		BusinessVO businessVO = (BusinessVO)session.getAttribute("businessInfo");
		int b_id = businessVO.getB_id();		
		List myLodsReserveList = businessLodService.myLodsReserveList(b_id);
		mav.addObject("myLodsReserveList", myLodsReserveList);
		
		return mav;
	}
	
	  @RequestMapping(value="/lodsModi.do", method=RequestMethod.POST) 
	  public ResponseEntity lodsModi(LodVO lodVO, @RequestParam("lod_id") int lod_id,
			  HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			businessLodService.modiLodsInfo(lodVO);
			String lod_name = lodVO.lod_name;
			reserveService.lodUpdate(lod_id, lod_name);
			message = "<script>";
			message += " alert('수정을 완료했습니다.');";
			message += " location.href='" + request.getContextPath() + "/businessLods/lods.do?lod_id="+lod_id+"'";
			message += (" </script>");
			
		} catch (Exception e){
			message = "<script>";
			message += " alert('수정에 실패했습니다.');";
			message += " location.href='" + request.getContextPath() + "/businessLods/lods.do?lod_id="+lod_id+"'";
			message += (" </script");
		}
		
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	  }
	 

	  // select one unit_info, can be change
	  @RequestMapping(value="/units.do", method=RequestMethod.GET)
		public ModelAndView unitinfo(@RequestParam("lod_id") String lod_id, @RequestParam("unit_id") String unit_id,
				HttpServletRequest request, HttpServletResponse response) throws Exception{
		  
		  	String viewName=(String)request.getAttribute("viewName");
			
			Map lodsMap = businessLodService.lodsInfo(lod_id);
			Map unitsMap = businessLodService.unit_Info(unit_id);
				
			ModelAndView mav = new ModelAndView(viewName);
			
			mav.addObject("lodsMap", lodsMap);	
			mav.addObject("unitsMap", unitsMap);	
 
		  return mav;
	  }
	  
	  @RequestMapping(value="/unitsModi.do", method=RequestMethod.POST)
	  public ResponseEntity unitsModi(UnitVO unitVO,@RequestParam("lod_id") String lod_id,
			  							HttpServletRequest request, HttpServletResponse response)	throws Exception{

		  	request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		
		try {
			
			businessLodService.modiunitsInfo(unitVO);
			message = "<script>";
			message += " alert('수정을 완료했습니다.');";
			message += " location.href='" + request.getContextPath() + "/businessLods/lods.do?lod_id="+lod_id+"'";
			message += (" </script>");
			
		} catch (Exception e){
			message = "<script>";
			message += " alert('수정에 실패했습니다.');";
			message += " location.href='" + request.getContextPath() + "/businessLods/lods.do?lod_id="+lod_id+"'";
			message += (" </script");
		}
		
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	  }
	  
		  @RequestMapping(value="/refund.do", method=RequestMethod.GET) 
		  public ResponseEntity lodsModi(@RequestParam("refund") String refund, @RequestParam("lod_id") int lod_id, HttpServletRequest request, HttpServletResponse response) throws Exception{
			  	
			  	request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				String message = null;
				ResponseEntity resEntity = null;
				HttpHeaders responseHeaders = new HttpHeaders();
				responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		 
				try {
					
					businessLodService.lodRefund(lod_id, refund);
					message = "<script>";
					message += " alert('수정을 완료했습니다.');";
					message += " location.href='" + request.getContextPath() + "/businessLods/lods.do?lod_id="+lod_id+"'";
					message += (" </script>");
					
				} catch (Exception e){
					message = "<script>";
					message += " alert('수정에 실패했습니다.');";
					message += " location.href='" + request.getContextPath() + "/businessLods/lods.do?lod_id="+lod_id+"'";
					message += (" </script");
				}
				
				resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
				return resEntity;
		  }
}
