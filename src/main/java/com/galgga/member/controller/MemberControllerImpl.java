package com.galgga.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.galgga.member.service.MemberService;
import com.galgga.member.vo.MemberVO;

@Controller("memberController")
@SessionAttributes("loginUser")
@RequestMapping(value = "/member")
public class MemberControllerImpl implements MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	BCryptPasswordEncoder pwEncoder;

	@Override
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			ModelAndView mav = new ModelAndView();

			MemberVO memberVO = (MemberVO) memberService.login(loginMap);
			boolean pwMatch = pwEncoder.matches(loginMap.get("member_pw"), memberVO.getMember_pw());
			if (pwMatch) {
				HttpSession session = request.getSession();
				session.setAttribute("isLogOn", true);
				session.setAttribute("memberInfo", memberVO);

				String action = (String) session.getAttribute("action");
				if (action != null && action.equals("/order/orderEachGoods.do")) {
					mav.setViewName("forward:" + action);
				} else {
					mav.setViewName("redirect:/main/main.do");
				}

			} else {
				String message = "아이디나 비밀번호가 틀립니다. 다시 시도해주세요";
				mav.addObject("message", message);
				mav.setViewName("/member/loginForm");
			}
			return mav;
		} catch (NullPointerException e) {
			ModelAndView mav = new ModelAndView();
			String message = "아이디나 비밀번호가 틀립니다. 다시 시도해주세요";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");

		mav.setViewName("redirect:/main/main.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/addMember.do", method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String email1 = _memberVO.getEmail1();
		String email2 = _memberVO.getEmail2();
		String totalemail = email1 + "@" + email2;
		_memberVO.setTotalemail(totalemail);
		try {
			memberService.addMember(_memberVO);
			message = "<script>";
			message += " location.href='" + request.getContextPath() + "/member/joinSuccess.do';";
			message += " </script>";

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해주세요');";
			message += " location.href='" + request.getContextPath() + "/member/addMemberWrite.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	// 회원정보 수정
	@Override
	@RequestMapping(value = "/memberUpdateView", method = RequestMethod.GET)
	public String memberUpdateView() throws Exception {
		return "member/memberUpdateView";
	}

	@Override
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(MemberVO vo, HttpSession session) throws Exception {
		String email1 = vo.getEmail1();
		String email2 = vo.getEmail2();
		String totalemail = email1 + "@" + email2;
		vo.setTotalemail(totalemail);
		memberService.memberUpdate(vo);
		/* session.invalidate(); */
		return "redirect:/main/main.do";
	}

	@Override
	@RequestMapping(value = "/overlapped.do", method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

	@ResponseBody
	@RequestMapping(value = "/passChk", method = RequestMethod.POST)
	public int passChk(MemberVO vo) throws Exception {
		int result = memberService.passChk(vo);
		return result;
	}

	// 회원탈퇴 POST
	@Override
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		// 세션에있는 비밀번호
		String sessionPass = member.getMember_pw();
		// 회원탈퇴폼에 입력한 비밀번호와 세션에 있는 비밀번호가 일치하는지 매치
		boolean pwMatch = pwEncoder.matches(vo.getMember_pw(), sessionPass);
		if (!pwMatch) {
			rttr.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
			return "redirect:/member/memberDelete.do";
		}
		memberService.memberDelete(vo);
		session.invalidate();
		return "redirect:/main/main.do";
	}

	// 아이디 찾기
	@Override
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String findId(MemberVO memberVO, Model model) throws Exception {
		logger.info("totalemail" + memberVO.getTotalemail());

		if (memberService.findIdCheck(memberVO.getTotalemail()) == 0) {
			model.addAttribute("msg", "이메일을 확인해주세요");
			return "/member/id_find";
		} else {
			model.addAttribute("memberInfo", memberService.findId(memberVO.getTotalemail()));
			return "/member/id_find3";
		}

	}

	// 비밀번호 찾기
	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public String findPw(MemberVO memberVO, Model model) throws Exception {
		logger.info("member_Pw" + memberVO.getMember_id());

		if (memberService.findPwCheck(memberVO) == 0) {
			logger.info("memberPWCheck");
			model.addAttribute("msg", "아이디와 이메일을 확인해주세요");

			return "/member/pw_find";
		} else {
			memberService.findPw(memberVO.getTotalemail(), memberVO.getMember_id());
			model.addAttribute("member", memberVO.getTotalemail());

			return "/member/pw_find4";
		}
	}
}
