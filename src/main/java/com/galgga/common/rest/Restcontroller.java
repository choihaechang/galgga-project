package com.galgga.common.rest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.galgga.board.service.BoardService;
import com.galgga.board.vo.ReviewReplVO;
import com.galgga.cart.service.LodCartService;
import com.galgga.reserve.service.ReserveService;

@RestController
@RequestMapping(value="/getData")
public class Restcontroller {
	@Autowired 
	ReserveService reserveService;
	@Autowired
	LodCartService lodCartService;
	@Autowired
	BoardService boardService;
	
	
	//reserve check in, out date 확인, 출력용
	/*
	 * @RequestMapping(value="/checkDate.do" ,method=RequestMethod.GET) public
	 * ResponseEntity<List> checkDate(@PathVariable("_lod_id") String
	 * lod_id, @PathVariable("_unit_name") String unit_name, HttpServletRequest
	 * request, HttpServletResponse response) throws Exception{
	 * 
	 * List Date = (List) reserveService.date(lod_id, unit_name);
	 * 
	 * return new ResponseEntity<List>(Date, HttpStatus.OK); }
	 */
	
	@RequestMapping(value="/checkDate.do" ,method=RequestMethod.GET) 
	public List checkDate(@RequestParam("lod_id") String _lod_id, @RequestParam("unit_name") String _unit_name,
										HttpServletRequest request, HttpServletResponse response)throws Exception{
		List Date =  (ArrayList) reserveService.date(_lod_id, _unit_name);
		return Date;
	}

	@RequestMapping(value="/checkReserve.do" ,method=RequestMethod.GET)
	public Map checkReserve(@RequestParam("lod_id") String _lod_id,  @RequestParam("m_id") String _m_id,
										HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		int check;
		
		if(reserveService.reserveCheck(_lod_id,  _m_id) == null || reserveService.reserveCheck(_lod_id, _m_id).size() == 0) {
			check = 0;
		}
		else {
			check = 1;
		}
		
		Map info = new HashMap();
		if(check == 0) {
			info.put("result", "false");
		}
		else {
			info.put("result", "true");
		}

		return info; 
	}
	
	@RequestMapping(value="/beforeqa.do" ,method=RequestMethod.GET)
	public Map beforeqa(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session=request.getSession();
		
		Map loginInfo = new HashMap();
		
		if(session.getAttribute("memberInfo") == null || session.getAttribute("memberInfo") == "") {
			loginInfo.put("result", "false");
		}
		else {
			loginInfo.put("result", "true");
		}
		
		
		
		return loginInfo;
	}
	
	
	
	
	
	
	@RequestMapping(value="/lodCart.do" ,method= {RequestMethod.GET})
	public Map lodCart(@RequestParam("lod_id") int _lod_id, @RequestParam("m_id") int _m_id,
										HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		Map lodCart = new HashMap();
		HttpSession session = request.getSession();
		
		
			if(session.getAttribute("memberInfo") == null || session.getAttribute("memberInfo") == "") {
				lodCart.put("result","_m_id null");
			}
		
			else if(lodCartService.lodCartList(_lod_id, _m_id) == null || lodCartService.lodCartList(_lod_id, _m_id).size() == 0) {
				lodCart.put("state", "no");
				lodCart.put("result", "insert");
				lodCartService.lodCartInsert(_lod_id, _m_id);
			}
			else {
				lodCart.put("state", "do");
				lodCart.put("result", "delete");
				lodCartService.lodCartDelete(_lod_id, _m_id);
			}
			
			return lodCart;
	}
	
	
	
	@RequestMapping(value="/lodCartCheck.do" ,method= {RequestMethod.GET})
	public Map lodCartCheck(@RequestParam("lod_id") int _lod_id, @RequestParam("m_id") int _m_id,
										HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		
		
		Map lodCartCheck = new HashMap();
		if(lodCartService.lodCartList(_lod_id, _m_id) == null || lodCartService.lodCartList(_lod_id, _m_id).size() == 0) {
			lodCartCheck.put("state", _lod_id+"no");
			
		}
		else {
			lodCartCheck.put("state", _lod_id+"do");
			
		}
		return lodCartCheck;
	}

	
	@RequestMapping(value="/reviewReplList.do" ,method=RequestMethod.GET)
	public  Map reviewReplAdd(@RequestParam("lod_id") int _lod_id, @RequestParam("review_id") int _review_id, 
									HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{	
		
		
		Map reviewReplListMap = new HashMap();
		try {
			List<ReviewReplVO> replList = boardService.reviewReplList(_lod_id, _review_id);
			reviewReplListMap.put("replList", replList);
			reviewReplListMap.put("state", "true");
			/* model.addAttribute("replList", replList); */
			
		}
		catch (Exception e) {
			reviewReplListMap.put("state", "false");
		}
		
		return reviewReplListMap;
	}
}
