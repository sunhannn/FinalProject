package com.ggul.zip.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggul.zip.tiper.TiperVO;
import com.ggul.zip.user.UserService;
import com.ggul.zip.user.UserVO;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	JavaMailSender mailsender;

	final DefaultMessageService messageService;

	public UserController() {
		this.messageService = NurigoApp.INSTANCE.initialize("INSERT API KEY", "INSERT API SECRET KEY",
				"https://api.coolsms.co.kr");
	}

	// 회원가입
	@RequestMapping(value = "/userJoin")
	public String join(UserVO vo) throws Exception {

		if (userService.getUser(vo) != null) {
			return "join.jsp?error=1";
		} else {
			String hashedPw = userService.hashedChk(vo.getUser_pw());
			vo.setUser_pw(hashedPw);
			userService.joinUser(vo);
		}
		return "redirect:/index";
	}

	// 이메일 전송
	@ResponseBody
	@RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
	public String sendEmail(String userEmail, Model model) {
		userService.mailSend(userEmail, model);

		String sendNum = (String) model.getAttribute("sendNum");
		return sendNum;

	}

	//이메일 중복확인
	@RequestMapping("/mailCheck")
	@ResponseBody
	public Object mailChk(UserVO vo, Model model) {
		UserVO usermail = userService.chkMail(vo, model);

		Map<String, String> chkVal = new HashMap<String, String>();
		if (usermail != null) {
			chkVal.put("check", "success");
		} else {
			chkVal.put("check", "failed");
		}
		return chkVal;
	}


	// 인증번호 확인
	@RequestMapping("/confirmNum")
	@ResponseBody
	public Object confirmNum(@RequestParam("confirmNum") String confirmNum, @RequestParam("sendNum") String sendNum) {

		Map<String, String> chkVal = new HashMap<String, String>();
		if (confirmNum.equals(sendNum)) {
			chkVal.put("check", "success");
		} else {
			chkVal.put("check", "failed");
		}
		return chkVal;
	}

	//카카오 로그인 : 코드받기 
	@RequestMapping("/kakaoLogin")
	public Object kakaoLogin(@RequestParam("code") String code,HttpServletRequest request) throws Exception {

		if (code != null) {
			return code;
		} else {
			return "redirect:login.jsp?error=1"; 
		}
	}

	//카카오 로그인 : 로그인하기
	@ResponseBody
	@RequestMapping("/loginByKakao")
	public Object loginByKakao(UserVO vo, HttpSession session) {

		String user_email = vo.getUser_email();

		Map<String, String> chkVal = new HashMap<String, String>();

		UserVO user = userService.getUSerByEmail(vo);

		if (user != null) {
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("user_name", user.getUser_name());
			chkVal.put("check", "success");
		} else {
			chkVal.put("check", "failed");
		}
		return chkVal;
	}

	//로그인으로이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(UserVO vo) {
		return "user/login";
	}
	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {

		// parameter로 받은값
		String user_pw = vo.getUser_pw();

		if (userService.getUser(vo) != null) {
			// db 값
			String chkPassword = userService.getUser(vo).getUser_pw();

			boolean chk = false;
			if (user_pw != null) {
				// db값과 parameter값이 일치하는지 확인
				chk = userService.pwMatchChk(user_pw, chkPassword);
			}

			if (chk) {
				session.setAttribute("user_id", userService.getUser(vo).getUser_id());
				session.setAttribute("user_name", userService.getUser(vo).getUser_name());
				session.setAttribute("user_role", userService.getUser(vo).getUser_role());
				return "redirect:/index";
			} else {
				return "redirect:login?error=1";
			}
		} else {
			return "redirect:login?error=1";
		}
	}

	//로그인 페이지 이동
	@RequestMapping("/loginBtn")
	public String loginBtn() {
		return "user/login";
	}

	//회원가입 페이지 이동
	@RequestMapping("/joinBtn")
	public String joinBtn() {
		return "user/join";
	}

	//약관동의 페이지 이동
	@RequestMapping("/agreementBtn")
	public String agreementBtn() {
		return "user/agreement";
	}


	// 회원 조회
	@RequestMapping("/viewUser")
	public String viewUser(@ModelAttribute("user") UserVO vo) {
		return "user/getUser";
	}

	//전화번호로 id 찾기
	@RequestMapping("/findUser")
	@ResponseBody
	public String findUser(UserVO vo, Model model) {
		userService.findUser(vo, model);

		String user_id = (String)model.getAttribute("user_id");

		return user_id;
	}


	// 아이디 중복확인
	@RequestMapping("/idCheck")
	@ResponseBody
	public Object idCheck(UserVO vo) {
		UserVO userId = userService.chkId(vo);

		Map<String, String> chkVal = new HashMap<String, String>();
		if (userId != null) {
			chkVal.put("check", "failed");
		} else {
			chkVal.put("check", "success");
		}
		return chkVal;
	}

	//sms 발송
	@RequestMapping(value = "/sendSMS")
	@ResponseBody
	public String sendSMS(UserVO vo, Model model) { // 휴대폰 문자보내기

		userService.smsSend(vo, model);
		String sendNum = (String) model.getAttribute("num");
		return sendNum;

	}

	@RequestMapping(value = "/logOut")
	public String logOut(HttpSession session) { 
		session.invalidate();
		return "redirect:/index";
	}


	@RequestMapping(value = "/index")
	public String index(HttpSession session) { 
		return "redirect:/index";

	}

	@RequestMapping(value= "/find")
	public String find(@RequestParam("find") String find) {
		if(find.equals("id")) {
			return "user/findId";
		}else {
			return "user/findPw";
		}
	}

	//비밀번호 변경
	@RequestMapping(value= "/updatePW")
	public String updatePW(UserVO vo) {
		if(vo.getUser_id() != null) {
			String hashedPw = userService.hashedChk(vo.getUser_pw());
			vo.setUser_pw(hashedPw);
			boolean check = userService.updatePW(vo);

			if (check) {
				return "redirect:/index";
			}
		} else {
		}
		return "redirect:/index";
	}


	
	
	
	
	
	//admin 로그인
			@RequestMapping(value = "/adminLogin")
			public String adminLogin(UserVO vo, HttpSession session) {
				
				
				if(!vo.getUser_id().equals("admin")) {
					System.out.println("admin 아님");
					return "redirect:adminLoginBtn?error=1";
				}else {
					// parameter로 받은값
					String user_pw = vo.getUser_pw();
					if (userService.getUser(vo) != null) {
						// db 값
						String chkPassword = userService.getUser(vo).getUser_pw();
						System.out.println("비밀번호 확인 : " + chkPassword);
						boolean chk = false;
						if (user_pw != null) {
							// db값과 parameter값이 일치하는지 확인
							chk = userService.pwMatchChk(user_pw, chkPassword);
						}
						if (chk) {
							System.out.println("일치함");
							session.setAttribute("user_id", userService.getUser(vo).getUser_id());
							session.setAttribute("user_name", userService.getUser(vo).getUser_name());
							session.setAttribute("user_role", userService.getUser(vo).getUser_role());
							return "redirect:goChart";
						} else {
							System.out.println("일치하지 않음");
							System.out.println("일치하지 않음");
							return "redirect:adminLoginBtn?error=1";
						}
					} else {
						return "adminLogin";
					}
				}
			}
			
		//admin 로그인 페이지 이동
		@RequestMapping("/adminLoginBtn")
		public String adminLoginBtn() {
			return "queen/adminLogin";
		}
	
	
	
		
		
		
		
		
		
		//소연누나부분
		
		// 회원 목록
		@RequestMapping("/getUserListUser")
		public String getUserListPost(UserVO vo, Model model) {
			model.addAttribute("userList", userService.getUserList(vo));
			return "queen/adminUserList";
		}

		// 회원 목록 Ajax
		@RequestMapping("/getUserListUserAjax")
		@ResponseBody
		public ArrayList<UserVO> getUserListPostAjax(UserVO vo, Model model) {

			ArrayList<UserVO> userListAjax = (ArrayList<UserVO>) userService.getUserList(vo);
			System.out.println("유저목록Ajax 컨트롤러도착" + userListAjax);

			return userListAjax;
		}

		// 회원 목록 검색
		@RequestMapping("/getUserListPostSearch")
		@ResponseBody
		public ArrayList<UserVO> getUserListPostSearch(@RequestParam("userSearch") Object user_search,
				@RequestParam("userCondition") Object user_condition, Model model) {

			String userSearch1 = (String) user_search;
			String userCondition1 = (String) user_condition;

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user_search", userSearch1);
			map.put("user_condition", userCondition1);

			ArrayList<UserVO> userSearchList = (ArrayList<UserVO>) userService.getUserListPostSearch((HashMap<String, Object>) map);

			return userSearchList;
		}

		
		
		
		//상현이 부분
		
		// 강사 신청 창이동
		@RequestMapping(value = "/tiperSignUpMove")
		public String tiperSignUp(HttpServletRequest request, HttpSession session, UserVO vo, TiperVO tiperVO) {

			vo.setUser_id((String) session.getAttribute("user_id"));
			tiperVO.setTiper_user_id(vo.getUser_id());
			vo = userService.selectName(vo);
			request.setAttribute("user_name", vo.getUser_name());
			return "user/userTiperSignup";

		}
		
		
}