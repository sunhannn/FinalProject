package com.ggul.zip.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

import com.ggul.zip.tiper.TiperService;
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
	private TiperService tiperService;

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
		public String sendEmail(UserVO vo, Model model) {
			String userEmail = vo.getUser_email();
			System.out.println("user_email출력 : " + userEmail);
			
			userService.mailSend(userEmail, model);

			String sendNum = (String) model.getAttribute("sendNum");
			return sendNum;

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
				Map<String, String> chkVal = new HashMap<String, String>();
				
				UserVO user = userService.getUserByKakaoAccount(vo);

				if (user != null) {
					session.setAttribute("user_id", user.getUser_id());
					session.setAttribute("user_name", user.getUser_name());
					session.setAttribute("user_role", userService.getUser(vo).getUser_role());
					chkVal.put("check", "success");
				} else {
					chkVal.put("check", "failed");
				}
				return chkVal;
			}
			
			//카카오 회원가입
			@RequestMapping("/joinByKakao")
			public String joinByKakao(UserVO vo, Model model) {
				System.out.println("vo값 " + vo.getUser_id());
				model.addAttribute("user_id", vo.getUser_id());
				model.addAttribute("user_name", vo.getUser_name());
				model.addAttribute("user_email", vo.getUser_email());
				
				return "user/kakaoJoin";
			}

	//회원정보 수정
		   @RequestMapping("/userEdit")
		   public String userEdit(UserVO vo, @RequestParam("show_user_tel") String tel, @RequestParam("show_user_email") String email, @RequestParam("show_pw") String pw) {
			   
			   if(vo.getUser_email() == "") {vo.setUser_email(email);}
			   if(vo.getUser_tel() == "") {vo.setUser_tel(tel);}
			   if(vo.getUser_pw() == "") {
				   vo.setUser_pw(pw);
				   System.out.println("pw : " + pw);
			   }else {
				   System.out.println("user_pw : " + vo.getUser_pw());
				   String hashedPw = userService.hashedChk(vo.getUser_pw());
				   vo.setUser_pw(hashedPw);
			   }
			   
			   
			   boolean done = userService.updateUserInfo(vo);
			   
			   if(done) {
				   return "redirect:userMyPageGo";
			   }else {
				   return "user/userEdit";
			   }
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
				String blackChk = userService.viewBlackList(vo);

				if (chk) {
					
					if(blackChk.equals("로그인")) {
						session.setAttribute("user_id", userService.getUser(vo).getUser_id());
						session.setAttribute("user_name", userService.getUser(vo).getUser_name());
						session.setAttribute("user_role", userService.getUser(vo).getUser_role());
						return "redirect:/index";
					}else if(blackChk.equals("탈퇴")) {
						return "redirect:login?error=1";
					}else {
						return "redirect:login?error=2";
					}
					
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
	   public List<String> findUser(UserVO vo, Model model) {
	      List<String> user = userService.findUser(vo, model);
	      
	      boolean vali = (boolean)model.getAttribute("vali");
	      
	      if(vali) {
	    	  System.out.println("user 출력 : " + user.isEmpty());
	    	  return user;
	    	  
	      }else {
	    	  System.out.println("user null값 반환 : ");
	    	  return null;
	      }
	   }
		
		//전화번호, 아이디로 개인정보 가져오기
		@RequestMapping("/findUserPW")
		@ResponseBody
		public String findUserPW(UserVO vo, Model model) {
			boolean user = userService.findUserPW(vo);
			
			if(user) {
				return "true";
			}else {
				return "false";
			}
			
		}

	//비밀번호 일치 확인
		   @RequestMapping(value = "/checkPW")
		   public String checkPW(UserVO vo, HttpSession session, Model model) {
		      UserVO user = null;
		      String user_id = (String)session.getAttribute("user_id");
		      vo.setUser_id(user_id);
		      
		      // parameter로 받은값
		      String user_pw = vo.getUser_pw();
		      
		      if (userService.getUser(vo) != null) {
		         System.out.println("null 아님");
		         // db 값
		         user = userService.getUser(vo);
		         String chkPassword = user.getUser_pw();
		         
		         boolean chk = false;
		         if (user_pw != null) {
		            // db값과 parameter값이 일치하는지 확인
		            chk = userService.pwMatchChk(user_pw, chkPassword);
		         }
		         
		         if (chk) {
		            System.out.println("success");
		            model.addAttribute("edit", user);
		            System.out.println("user model : " + ((UserVO) model.getAttribute("edit")).getUser_tel());
		            return "user/userEdit";
		         } else {
		            return "redirect:chkPassword?error=1";
		         }
		      } else {
		         return "redirect:chkPassword?error=1";
		      }
		   }
		   
		   //비밀번호 확인 이동
		   @RequestMapping("/chkPassword")
		   public String chkPassword() {
		      return "user/pwCheck";
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

	// 카카오 회원가입
	   @RequestMapping(value = "/userJoinByKakao")
	   public String userJoinByKakao(UserVO vo, HttpSession session) throws Exception {
	      
	      if (userService.getUser(vo) != null) {
	         return "join.jsp?error=1";
	      } else {
	         String hashedPw = userService.hashedChk(vo.getUser_pw());
	         vo.setUser_pw(hashedPw);
	         userService.joinUser(vo);
	         session.setAttribute("user_id", vo.getUser_id());
	         session.setAttribute("user_name", vo.getUser_name());
	         session.setAttribute("user_role", userService.getUser(vo).getUser_role());
	      }
	      return "redirect:/index";
	   }
	
	
		
		
		
		
		
    //소연누나부분
    
    //회원리스트 호출
    @RequestMapping(value = "/listuser", method = RequestMethod.GET)
    public String listUser() {
       return "queen/adminUserList";
    }

    //회원리스트
    @RequestMapping(value = "/listuser", method = RequestMethod.POST)
    @ResponseBody
    public List<UserVO> listUser(UserVO vo, Model model) {
       model.addAttribute("userList", userService.getUserList(vo));
       return userService.getUserList(vo);
    }

    //회원상세보기
    @RequestMapping("/updateMoveUser")
    public String updateMoveUser(UserVO vo, Model model) {
       model.addAttribute("getUser", userService.getUserSY(vo));
       return "queen/adminUserDetail";
    }
		
    
    
		//상현이 부분
		
		// 강사 신청 창이동
		@RequestMapping(value = "/tiperSignUpMove")
		public String tiperSignUp(HttpSession session, Model model, UserVO vo, TiperVO tiperVO) {

			vo.setUser_id((String) session.getAttribute("user_id"));
			tiperVO.setTiper_user_id(vo.getUser_id());
			vo = userService.selectName(vo);
			model.addAttribute("user_name", vo.getUser_name());
			int check = tiperService.selecTiperCount(tiperVO);
			System.out.println(check);
			model.addAttribute("tiperCheck", check);

			return "user/userTiperSignup";

		}
		
}