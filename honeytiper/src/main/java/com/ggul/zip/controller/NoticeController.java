package com.ggul.zip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggul.zip.escrow.EscrowVO;
import com.ggul.zip.notice.NoticeService;
import com.ggul.zip.notice.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	//공지사항목록
	@RequestMapping(value="/listnotice", method=RequestMethod.GET)
	public String listNotice() {
		return "notice/listNotice";
	}
	
	//공지사항목록 아약스
	@RequestMapping(value="/listnotice", method=RequestMethod.POST)
	@ResponseBody
	public List<NoticeVO> listNotice(NoticeVO vo, Model model) {
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return noticeService.getNoticeList(vo);
	}
	
	//공지사항등록창으로이동	
	@RequestMapping("/insertMovenotice")
	public String insertMoveNotice(NoticeVO vo) {
		return "queen/adminNoticeInsert";
	}
	
	//공지사항등록
	@RequestMapping("/insertnotice")
	public String insertNotice(NoticeVO vo) {
		noticeService.insertNotice(vo);
		return "redirect:adminNoticeList";
	}
	
	//공지사항수정
	@RequestMapping("/updateNotice")
	public String updateNotice(NoticeVO vo) {
		noticeService.updateNotice(vo);
		return "redirect:adminNoticeList?suc=1";
	}
	
	//공지사항수정이동
	@RequestMapping("/updateMoveNotice")
	public String updateMoveNotice(NoticeVO vo, Model model) {
		model.addAttribute("getNotice",noticeService.getNotice(vo));
		return "notice/updateNotice";
	}
	
	//공지사항삭제
	@RequestMapping("/deleteNotice")
	public String deleteNotice(NoticeVO vo) {
		noticeService.deleteNotice(vo);
		return "redirect:adminNoticeList?del=1";
	}
	
	//공지사항상세보기
	@RequestMapping("/getnotice")
	public String getMoveNotice(NoticeVO  vo, Model model) {
		model.addAttribute("notice",noticeService.getNotice(vo));
		return "notice/getNotice";
	}

	
	
	//관리자 공지사항리스트페이지 이동
    @RequestMapping(value = "/adminNoticeList", method=RequestMethod.GET)
    public String adminNoticeList(){
       return "queen/adminNoticeList";
    }
    
    //관리자 공지사항리스트
    @RequestMapping(value = "/adminNoticeList", method=RequestMethod.POST)
    @ResponseBody
    public List<NoticeVO> adminNoticeList(NoticeVO vo){
       return noticeService.adminNoticeList(vo);
    }
    
	
}
