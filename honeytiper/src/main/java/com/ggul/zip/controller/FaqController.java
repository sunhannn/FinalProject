package com.ggul.zip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggul.zip.faq.FaqService;
import com.ggul.zip.faq.FaqVO;
import com.ggul.zip.notice.NoticeVO;

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
		return "faq/getFaqList";
	}
	
	//자묻질 등록
	@RequestMapping("/insertFaq")
	public String insertFaq(FaqVO vo) {
		faqService.insertFaq(vo);
		return "redirect:adminFaqList";
	}
	
	//자묻질 등록 이동
	@RequestMapping("/insertMoveFaq")
	public String insertMoveFaq(FaqVO vo) {
		return "queen/adminFaqInsert";
	}
	
	//자묻질 삭제
	@RequestMapping("/deleteFaq")
	public String deleteFaq(FaqVO vo) {
		faqService.deleteFaq(vo);
		return "redirect:adminFaqList";
	}
	
	//자묻질 수정
	@RequestMapping("/updateFaq")
	public String updateFaq(FaqVO vo) {
		faqService.updateFaq(vo);
		return "queen/adminFaqUpdateSuccess";
	}
	
	
	//자묻질 수정 이동
	@RequestMapping("/updateMoveFaq")
	public String updateMoveFaq(FaqVO vo, Model model) {
		model.addAttribute("faq",faqService.getFaq(vo));
		return "faq/updateFaq";
	}
	
	
	//관리자 질문과답변페이지 이동
    @RequestMapping(value = "/adminFaqList", method=RequestMethod.GET)
    public String adminFaqList(){
       return "queen/adminFaqList";
    }
    
    //관리자 질문과답변
    @RequestMapping(value = "/adminFaqList", method=RequestMethod.POST)
    @ResponseBody
    public List<FaqVO> adminFaqList(FaqVO vo){
       return faqService.getFaqList(vo);
    }
	
    
    //관리자 질문과답변페이지 이동
    @RequestMapping(value = "/adminFaqUpdate", method=RequestMethod.GET)
    public String adminFaqUpdate(FaqVO vo, Model model){
    	model.addAttribute("faqUpdate",faqService.getFaq(vo));
    	return "queen/adminFaqUpdate";
    }
	
}
