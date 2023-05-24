package com.ggul.zip.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	public void insertEscrow(EscrowVO evo, Model model, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception{

		evo.setEscrow_user_id((String) session.getAttribute("user_id"));
		String tiper_user_id = request.getParameter("tiper_user_id");
		
		int result = lessonDetailService.isDupEscrowLesson(evo); //0 일 때 : 중복 수강신청 없음, 1 일 때 이미 수강신청한 내역 있음.
		String user_id = (String) session.getAttribute("user_id");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		if(tiper_user_id.equals(user_id)) {
			writer.println("<script type='text/javascript'>alert('\uD83D\uDE02자신의 꿀TIP은 전수 요청할 수 없어요!');history.back();</script>");
			writer.flush();
		} else {
		
		// 로그인했으면 계속 진행, 비로그인 시 로그인창으로.
		if(user_id != null) {
					
		if (result == 0) {
			escrowService.insertEscrow(evo);	//기존에 수강신청된 내역 없을 시 Escrow테이블에 insert
			
			writer.println("<script type='text/javascript'>alert('\uD83E\uDD29전수 요청이 완료되었어요!');history.back();</script>");
			writer.flush();
		} else if (result == 1) {
						
//			writer.println("<script type='text/javascript'>alert('이미 수강신청한 강의입니다.');location.href='/allSearch';</script>");
			writer.println("<script type='text/javascript'>alert('\uD83D\uDE0E이미 전수 요청한 꿀TIP이에요!');history.back();</script>");
			writer.flush();
			}
		} else {
			writer.println("<script type='text/javascript'>alert('\uD83D\uDE0A로그인이 필요한 서비스에요!');location.href='/login';</script>");
		}
		}
	}

	
}
