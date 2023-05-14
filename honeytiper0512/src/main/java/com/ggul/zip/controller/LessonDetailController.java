package com.ggul.zip.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	public String insertEscrow(EscrowVO evo, Model model) {

		System.out.println("============================ctrl진입! " + evo);

		escrowService.insertEscrow(evo);
//		model.addAttribute("lessonList", lessonDetailService.getLessonList(ldvo));

		return "redirect:allSearch";
	}

	
}
