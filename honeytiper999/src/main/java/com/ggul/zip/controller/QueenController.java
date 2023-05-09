package com.ggul.zip.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggul.zip.lesson.LessonService;
import com.ggul.zip.lesson.LessonVO;
import com.ggul.zip.queen.QueenService;
import com.ggul.zip.queen.QueenVO;
import com.ggul.zip.user.UserService;
import com.ggul.zip.user.UserVO;

@Controller
public class QueenController {
	@Autowired
	private QueenService queenService;
	
	@Autowired
	private LessonService lessonService;
	
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


	
}
