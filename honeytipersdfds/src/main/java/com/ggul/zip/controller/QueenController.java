package com.ggul.zip.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ggul.zip.escrow.EscrowService;
import com.ggul.zip.escrow.EscrowVO;
import com.ggul.zip.lesson.LessonDetailVO;
import com.ggul.zip.lesson.LessonService;
import com.ggul.zip.lesson.LessonVO;
import com.ggul.zip.queen.QueenService;
import com.ggul.zip.queen.QueenVO;
import com.ggul.zip.tiper.TiperService;
import com.ggul.zip.tiper.TiperVO;
import com.ggul.zip.user.ReportVO;
import com.ggul.zip.user.UserService;
import com.ggul.zip.user.UserVO;
import com.google.gson.Gson;

@Controller
public class QueenController {
	@Autowired
	private QueenService queenService;
	
	@Autowired
	private LessonService lessonService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private EscrowService escrowService;
	
	@Autowired
	private TiperService tiperService;
	
	/*------------------------------------구글차트----------------------------------------*/
	//차트보기 아약스
	@RequestMapping(value="/chartAjax", method=RequestMethod.POST)
	@ResponseBody
	public List<QueenVO> chartAjax(QueenVO vo, Model model) {
		return queenService.getChart(vo);
	}

	//관리자 차트보기 이동
    @RequestMapping("/goChart")
    public String moveChart(QueenVO vo, Model model) {
    	vo.setWeektop_sales(queenService.weekTop());
    	System.out.println("컨트롤러에서 값은 가져왔니? " + vo.getWeektop_sales());
    	vo.setWeekavg_sales(queenService.weekAvg());
    	vo.setWeektotal_sales(queenService.weekTotal());
    	vo.setMonthtop_sales(queenService.monthTop());
    	vo.setMonthavg_sales(queenService.monthAvg());
    	vo.setMonthtotal_sales(queenService.monthTotal());
		model.addAttribute("sales",vo);
    	model.addAttribute("abc", queenService.getChart(vo));
    	return "queen/adminMain";
    }
    

    
  //승희님부분
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
  					return "redirect:adminLoginBtn?error=1";
  				}
  			} else {
  				return "goChart";
  			}
  		}
  	}
  	
  	//admin 로그인 페이지 이동
  	@RequestMapping("/adminLoginBtn")
  	public String adminLoginBtn() {
  		return "queen/adminLogin";
  	}
      
  	
  	//admin정보 수정
  	   @RequestMapping("/adminEdit")
  	   public String adminEdit(UserVO vo, @RequestParam("show_user_email") String email, @RequestParam("show_pw") String pw, Model model) {
  		   
  		   if(vo.getUser_email() == "") {vo.setUser_email(email);}
  		   if(vo.getUser_pw() == "") {
  			   vo.setUser_pw(pw);
  			   System.out.println("pw : " + pw);
  		   }else {
  			   System.out.println("user_pw : " + vo.getUser_pw());
  			   String hashedPw = userService.hashedChk(vo.getUser_pw());
  			   vo.setUser_pw(hashedPw);
  		   }
  		   
  		   boolean done = queenService.updateAdminInfo(vo);
  		   
  		   if(done) {
  			   return "redirect:goChart?suc=1";
  		   }else {
  			   model.addAttribute("error",1);
  			   return "queen/adminEdit";
  		   }
  	   }
  	
  	 //관리자 수정 비밀번호 일치 확인
  	   @RequestMapping(value = "/adminChkPassword", method = RequestMethod.POST)
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
  	            return "queen/adminEdit";
  	         } else {
  	            return "redirect:adminChkBtn?error=1";
  	         }
  	      } else {
  	         return "redirect:adminChkBtn?error=1";
  	      }
  	   }
  	   
  	   //비밀번호 확인 이동
  	   @RequestMapping("/adminChkBtn")
  	   public String chkPassword() {
  	      return "queen/adminPwCheck";
  	   }
  	   
  	 //admin 메인페이지 이동
  	   @RequestMapping("adminMyPageGO")
  	   public String adminMyPageGO() {
  		   return "queen/adminMain";
  	   }
    
    
    
    
  	   // 소연누나부분

  	   // 강의리스트 호출
  	   @RequestMapping(value = "/listlesson", method = RequestMethod.GET)
  	   public String listLesson() {
  	      return "queen/adminLessonList";
  	   }

  	   // 강의리스트
  	   @RequestMapping(value = "/listlesson", method = RequestMethod.POST)
  	   @ResponseBody
  	   public List<LessonVO> listLesson(LessonVO vo, Model model) {
  	      model.addAttribute("lessonList", lessonService.getLessonList(vo));
  	      return lessonService.getLessonList(vo);
  	   }

  	   // 강의상세보기
  	   @RequestMapping("/updateMoveLesson")
  	   public String updateMoveLesson(LessonVO vo, Model model) {
  	      model.addAttribute("getLesson", lessonService.getLesson(vo));
  	      return "queen/adminLessonDetail";
  	   }

  	   // 강의 삭제
  	   @RequestMapping(value = "/deleteLesson")
  	   public void lessonDelete(Model model, HttpServletResponse response, HttpServletRequest request,
  	                              HttpSession session, UserVO vo, TiperVO tiperVO, LessonVO lessonVO) throws IOException {
  	       tiperVO.setTiper_user_id((String) session.getAttribute("user_id"));
  	       lessonVO.setLesson_num(Integer.parseInt(request.getParameter("lesson_num")));
  	       tiperVO = tiperService.selectTiperInfo(tiperVO);
  	       lessonVO = lessonService.selectLessonNum(lessonVO);

  	       if (lessonService.selectLessonfromEscrow(lessonVO) > 0) {
  	           response.setContentType("text/html; charset=UTF-8");
  	           PrintWriter writer = response.getWriter();
  	           writer.println("<script type='text/javascript'>alert('아직 수강중이거나 수강신청한 회원이 있습니다.'); history.back();</script>");
  	           writer.flush();
  	       } else {
  	           lessonService.lessonDelete(lessonVO);
  	           response.setContentType("text/html; charset=UTF-8");
  	           PrintWriter writer = response.getWriter();
  	           writer.println("<script type='text/javascript'>alert('강의 삭제가 완료되었습니다.'); location.href='/listlesson';</script>");
  	           writer.flush();
  	       }

  	   }

	
	
  	// 브랜드소개 페이지 이동
  	    @RequestMapping(value = "/getBrand")
  	    public String getBrand() {
  	       return "queen/getBrand";
  	    }
	
	
	
	
	
	
	

	//===================================================================================
		// 정성현 - 블랙리스트 관리, 승급관리 ========================================================

		// 승급 - 강사승급 신청한 티퍼리스트 불러오기
		@RequestMapping("/getPotentialTiperList")
		public String getPotentialTiperList(UserVO vo, Model model) {

			model.addAttribute("TiperList", userService.getPotentialTiperList(vo));

			String potentialTiperListJSON = new Gson().toJson(userService.getPotentialTiperList(vo));
			model.addAttribute("TiperListJSON", potentialTiperListJSON);

			return "/queen/adminPotentialTiperList";
		}

			// 승급 - TIPER_AGREE 0에서 2로
		@RequestMapping("/updateTiperReject")
		public String updateTiperReject(UserVO vo, Model model) {

			userService.updateTiperReject(vo);

			return "redirect:getPotentialTiperList";
		}

		// 승급 - 승급대기회원 : 조건에 따른 검색
		@RequestMapping("/searchPotentialTiperList")
		@ResponseBody
		public ArrayList<UserVO> searchPotentialTiperList(@RequestParam("search_condition") String search_condition,
				@RequestParam(value = "search_keyword", required = false) String search_keyword) {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("search_condition", search_condition);
			map.put("search_keyword", search_keyword);

			ArrayList<UserVO> searchPotentialTiperList = userService
					.searchPotentialTiperList((HashMap<String, Object>) map);

			return searchPotentialTiperList;
		}

		// 블랙리스트 관리 - 신고접수된 회원 리스트 + 블랙리스트
		@RequestMapping("/getReportList")
		public String getReportList(ReportVO rvo, UserVO uvo, Model model) {

			model.addAttribute("ReportList", userService.getReportList(rvo));

			String reportListJSON = new Gson().toJson(userService.getReportList(rvo));
			model.addAttribute("ReportListJSON", reportListJSON);

			model.addAttribute("BlackList", userService.getBlackList(uvo));
			String blackListJSON = new Gson().toJson(userService.getBlackList(uvo));
			model.addAttribute("BlackListJSON", blackListJSON);
			
			return "/queen/adminReportList";
		}

		// 블랙리스트 관리 - 계정정지 : REPORT_STATUS 0 -> 2 (정지처리), USER_ROLE -> 3 (블랙리스트)
		@RequestMapping("/updateReportUserRole")
		public String updateReportUserRole(UserVO uvo, ReportVO rvo, LessonDetailVO ldvo, Model model, HttpServletResponse response) throws Exception {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			String message = "";

			//이미 3인 경우 : 무조건 반려처리. 
			if (userService.checkUserRole(uvo) == 3) {
				
				userService.updateReportStatus01(rvo); //이미 정지된 계정일 시 반려처리

				writer.println("<script type='text/javascript'>alert('이미 정지된 계정입니다.');location.href='/getReportList';</script>");
				writer.flush();
			} 
			//3이 아닌 경우 : 신규정지처리 - REPORT_STATUS, USER_ROLE, LESSON_ONOFF
			else {
				userService.updateReportStatus(rvo);
				userService.updateReportUserRole03(uvo);
				userService.updateLessonOnoff(rvo);
			}
			
			return "redirect:/getReportList";
		}

		// 블랙리스트 관리 - 신고반려 : REPORT_STATUS 0 -> 1 (반려처리), USER_ROLE -> 변화없음
		@RequestMapping("/updateReportReject")
		public String updateReportReject(UserVO uvo, ReportVO rvo, Model model) {

			userService.updateReportStatus01(rvo);

			return "redirect:getReportList";
		}
		
		
		// 블랙리스트 - 블랙리스트 가져오기(사용안함)
		@RequestMapping("/getBlackList")
		public String getBlackList(UserVO vo, Model model) {

			model.addAttribute("BlackList", userService.getBlackList(vo));
			System.out.println(userService.getBlackList(vo)+"ctrl블랙리스트vo=========================");

			String blackListJSON = new Gson().toJson(userService.getBlackList(vo));
			model.addAttribute("BlackListJSON", blackListJSON);

			return "/queen/adminBlackList";
		}

		// 블랙리스트 관리 - 계정복구 : REPORT_STATUS 2 -> 3 (복구계정), USER_ROLE 3 -> 0
		@RequestMapping("/resetUserRole")
		public String resetUserRole(UserVO uvo, ReportVO rvo, Model model, HttpServletResponse response) throws Exception {
			
			System.out.println("복구확인 컨트롤러" + rvo);
			userService.updateReportStatus23(rvo);
			userService.updateReportUserRole30(uvo);
			
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script type='text/javascript'>alert('정지 해제 처리되었습니다.');location.href='/getReportList';</script>");
			writer.flush();
			
			return "redirect:getReportList";
		}

	// 블랙리스트 관리 - 블랙리스트 : 조건에 따른 검색
		@RequestMapping("/searchBlackList")
		@ResponseBody
		public ArrayList<UserVO> searchBlackList(@RequestParam("search_condition") String search_condition,
				@RequestParam(value = "search_keyword", required = false) String search_keyword) {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("search_condition", search_condition);
			map.put("search_keyword", search_keyword);

			ArrayList<UserVO> searchBlackList = userService.searchBlackList((HashMap<String, Object>) map);

			return searchBlackList;
		}
		
		// 승급 -TIPER_AGREE 0에서 1로
				@RequestMapping("/updateTiperAgree")
				public String updateTiperAgree(UserVO vo, Model model) {

					userService.updateTiperAgree(vo); //TIPER_AGREE 0에서 1로
					userService.updateUserRole01(vo); //USER_ROLE 0에서 1로
					

					return "redirect:getPotentialTiperList";
				}
//-------------------------------보영-------------------------------------------------------
				@RequestMapping(value = "/searchAndStatus", method = RequestMethod.POST)
				@ResponseBody
				public List<EscrowVO> searchAndStatus(EscrowVO vo){
					System.out.println("여기왔으면 좋겠다");
						return escrowService.searchAndStatus(vo);
				}

				//분쟁해결관리- 전체리스트 가져오기 상태가 0또는 1만 가져옴
			@RequestMapping("/getDisputeResolutionList")
			public String getDisputeResolutionList(EscrowVO vo, Model model) {
				model.addAttribute("DisputeResolution", escrowService.getDisputeResolutionList(vo));
				String disputeListtJSON = new Gson().toJson(escrowService.getDisputeResolutionList(vo));
				model.addAttribute("DisputeListtJSON", disputeListtJSON);
				System.out.println(vo);
				return "/escrow/disputeResolution";
			}

			//분쟁해결관리- 검색결과 가져오기
			@RequestMapping("/searchDispute")
			@ResponseBody
			public ArrayList<EscrowVO> searchDispute(@RequestParam("search_condition") String search_condition,	
				@RequestParam(value = "search_keyword", required = false) String search_keyword) {
				System.out.println("검색결과받아오기");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("search_condition", search_condition);
			map.put("search_keyword", search_keyword);				
			ArrayList<EscrowVO>searchDispute=escrowService.searchDispute((HashMap<String, Object>) map);
			return searchDispute;
			}
			
			
		//   분쟁해결관리-상태가 (진행중) 인사람이 <강제완료>누를시=>3으로변경
	         @RequestMapping("/forcedCompletion")
	         public String forcedCompletion(EscrowVO vo, RedirectAttributes redirectAttributes) throws Exception {
	             String message = "";
	             
	             // 진행상태가 0(신청)인 경우: 해당 사항 없음.
	             if (escrowService.checkStatus(vo) == 0) {
	                 message = "신청단계에서는 변경 해당사항이 없습니다.";
	             } else {
	                 // 진행상태가 1(진행중)인 경우: 3으로 변경, 티퍼이름으로 포인트리스트에 +내역 insert, 티퍼한테 point 업데이트
	                 escrowService.updateStatus0103(vo); // 받아온 status를 3으로 변경, 완료날짜 설정
	                 escrowService.insertSalesCommission(vo);//세일즈테이블에 5%커미션넣기
	                 escrowService.insertTiperPointList(vo); // 티퍼의 point를 +내역으로 인서트
	                 escrowService.updateTiperPoint(vo); // tiper-id 기준으로 join해서 해당 아이디 list를 통합해서 update함
	                 message = "강사에게 수강료가 전달되었습니다.";
	             }
	             
	             redirectAttributes.addFlashAttribute("message", message);
	             return "redirect:getDisputeResolutionList";
	         }

			
			//분쟁해결관리-취소누를시 진행상태 4로변경, 포인트테이블 유저환불
			@RequestMapping("/cancel")
			public String cancel(EscrowVO vo, Model model, RedirectAttributes redirectAttributes) throws Exception{
				String message = "";
				//진행상태가 0(신청)인 경우 : 4로 변경되면서 날짜 인서트
				if(escrowService.checkStatus(vo) == 0) {
					escrowService.updateStatus04(vo);//받아온 status를 4로 변경,완료날짜설정
					message = "신청이 취소되었습니다.";
				}
				//진행상태가 1(진행중)인경우 : 4로 변경,유저이름으로 포인트리스트에 +내역insert, 유저한테 point업데이트
				else {
					escrowService.updateStatus04(vo);//받아온 status를 4로 변경,완료날짜설정
					escrowService.insertUserPointList(vo);//유저의 point테이블에 +내역으로 인서트 
					escrowService.updateUserPoint(vo);//유저에게 pointlist합해서 유저테이블에 업데이트
					message = "강의가 취소되었습니다. 회원에게 강의 수강료가 환급됩니다.";
				}
				redirectAttributes.addFlashAttribute("message", message);
				return "redirect:getDisputeResolutionList";
				
			}
	
}
