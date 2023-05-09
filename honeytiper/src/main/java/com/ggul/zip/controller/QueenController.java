package com.ggul.zip.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggul.zip.lesson.LessonDetailVO;
import com.ggul.zip.lesson.LessonService;
import com.ggul.zip.lesson.LessonVO;
import com.ggul.zip.queen.QueenService;
import com.ggul.zip.queen.QueenVO;
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
    	System.out.println("컨트롤러에서 vo weekTop의 값은? " + vo.getWeektop_sales());
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
    
    // 강의 목록 Ajax
    @RequestMapping("/getLessonListLessonAjax")
    @ResponseBody
    public ArrayList<LessonVO> getLessonListPastAjax(LessonVO vo, Model model) {
       ArrayList<LessonVO> lessonListAjax = (ArrayList<LessonVO>) lessonService.getLessonList(vo);
       return lessonListAjax;
    }

    // 강의 목록 검색
    @RequestMapping("/getLessonListPostSearch")
    @ResponseBody
    public ArrayList<LessonVO> getLessonListPostSearch(@RequestParam("lessonSearch") Object lesson_search,
          @RequestParam("lessonCondition") Object lesson_condition, Model model) {
       String lessonSearch1 = (String) lesson_search;
       String lessonCondition1 = (String) lesson_condition;
       Map<String, Object> map = new HashMap<String, Object>();
       map.put("lesson_search", lessonSearch1);
       map.put("lesson_condition", lessonCondition1);
       ArrayList<LessonVO> lessonSearchList = (ArrayList<LessonVO>) lessonService.getLessonListPostSearch((HashMap<String, Object>) map);

       return lessonSearchList;
    }
    
	// 강의 목록
	@RequestMapping("/getLessonListLesson")
	public String getLessonListPost(LessonVO vo, Model model) {
		model.addAttribute("lessonList", lessonService.getLessonList(vo));
		return "queen/adminTiperList";
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

		// 승급 -TIPER_AGREE 0에서 1로
		@RequestMapping("/updateTiperAgree")
		public String updateTiperAgree(UserVO vo, Model model) {

			userService.updateTiperAgree(vo);

			return "redirect:getPotentialTiperList";
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

	
}
