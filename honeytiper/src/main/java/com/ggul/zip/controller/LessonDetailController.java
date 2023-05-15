package com.ggul.zip.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ggul.zip.escrow.EscrowService;
import com.ggul.zip.escrow.EscrowVO;
import com.ggul.zip.lesson.LessonDetailService;
import com.ggul.zip.lesson.LessonDetailVO;
import com.ggul.zip.lesson.ReviewVO;

@Controller
@SessionAttributes("lesson")
public class LessonDetailController {

	@Autowired
	private LessonDetailService lessonDetailService;
	
	@Autowired
	private EscrowService escrowService;


	// 강의 상세 조회
	@RequestMapping("/getLessonDetail")
	public String getLessonDetail(@RequestParam("lesson_num") int lesson_num, LessonDetailVO ldvo, Model model) {

		double sugarAvg = 0;

		model.addAttribute("lessonDetail", lessonDetailService.getLessonDetail(ldvo));
		model.addAttribute("sugarAvg", Math.round(lessonDetailService.getSugarAvg(lesson_num) * 100) / 100.0);
		System.out.println(lessonDetailService.getSugarAvg(lesson_num));

		return "lesson/getLessonDetail";
	}

	// 강의 목록
	@RequestMapping("/getLessonList")
	public String getLessonListPost(LessonDetailVO ldvo, Model model) {

		model.addAttribute("lessonList", lessonDetailService.getLessonList(ldvo));

		//model.addAttribute("lessonList", lessonDetailService.getLessonList(ldvo));
		// 여기까지 기존내용.

		// 여기부터 추가된 코드

		// 서비스에서 받은 리스트형식을 JSON형식으로 변환
		//String lessonListJSON = new Gson().toJson(lessonDetailService.getLessonList(ldvo));
		//model.addAttribute("lessonListJSON", lessonListJSON);

		return "lesson/getLessonList";
	}

	// Ajax로 총 리뷰 수 가져오기
	@RequestMapping("/getTotalReviewList")
	@ResponseBody
	public ArrayList<ReviewVO> getTotalReviewList(@RequestParam("lesson_num") Integer lesson_num,
			@RequestParam(value = "select_key", required = false) String select_key) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lesson_num", lesson_num);
		map.put("select_key", select_key);

		ArrayList<ReviewVO> totalReviewList = (ArrayList<ReviewVO>) lessonDetailService.getTotalReviewList((HashMap<String, Object>) map);

		return totalReviewList;
	}
	
	@RequestMapping("/insertEscrow")
	public void insertEscrow(EscrowVO evo, Model model, HttpSession session, HttpServletResponse response) throws Exception{

		int result = lessonDetailService.isDupEscrowLesson(evo); //0 일 때 : 중복 수강신청 없음, 1 일 때 이미 수강신청한 내역 있음.
		String user_id = (String) session.getAttribute("user_id");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		// 로그인했으면 계속 진행, 비로그인 시 로그인창으로.
		if(user_id != null) {
		
			System.out.println("로그인 된 계정이 수강신청 클릭");
			
		if (result == 0) {
			escrowService.insertEscrow(evo);	//기존에 수강신청된 내역 없을 시 Escrow테이블에 insert
			System.out.println(" 에스크로 인서트 성공");
//			writer.println("<script type='text/javascript'>alert('수강신청에 성공했습니다.');location.href='/allSearch';</script>");
			writer.println("<script type='text/javascript'>alert('수강신청에 성공했습니다.');history.back();</script>");
			writer.flush();
		} else if (result == 1) {
			
			System.out.println(" 중복된 신청 있음");
//			writer.println("<script type='text/javascript'>alert('이미 수강신청한 강의입니다.');location.href='/allSearch';</script>");
			writer.println("<script type='text/javascript'>alert('이미 수강신청한 강의입니다.');history.back();</script>");
			writer.flush();
			}
		} else {
			System.out.println("로그인 안 한 수강신청 클릭");
			writer.println("<script type='text/javascript'>alert('로그인이 필요한 서비스입니다.');location.href='/login';</script>");
		}
		
	}

	
}
