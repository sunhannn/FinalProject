package com.ggul.zip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ggul.zip.faq.FaqService;
import com.ggul.zip.faq.FaqVO;

@Controller
public class FaqController {
	
	
	@Autowired
	private FaqService faqService;
	
	
	/*-----------자주묻는질문-------------*/
	
	//자묻질 리스트
	@RequestMapping("/faqList")
	public String listFaq(FaqVO vo, Model model) {
		List<FaqVO> a =  faqService.getFaqList(vo);
		model.addAttribute("faqList",a);
//		for(FaqVO i :a) {
//			System.out.println("i:::: "+i);
//		}
		return "faq/getFaqList";
	}
	
	//자묻질 등록
	@RequestMapping("/insertFaq")
	public String insertFaq(FaqVO vo) {
		faqService.insertFaq(vo);
		return "redirect:faqList";
	}
	
	//자묻질 등록 이동
	@RequestMapping("/insertMoveFaq")
	public String insertMoveFaq(FaqVO vo) {
		return "faq/insertFaq";
	}
	
	//자묻질 삭제
	@RequestMapping("/deleteFaq")
	public String deleteFaq(FaqVO vo) {
		faqService.deleteFaq(vo);
		return "redirect:faqList";
	}
	
	//자묻질 수정
	@RequestMapping("/updateFaq")
	public String updateFaq(FaqVO vo) {
		faqService.updateFaq(vo);
		
		return "redirect:faqList?update=1";
	}
	
	//자묻질 수정 이동
	@RequestMapping("/updateMoveFaq")
	public String updateMoveFaq(FaqVO vo, Model model) {
		model.addAttribute("faq",faqService.getFaq(vo));
		return "faq/updateFaq";
	}
	
}
