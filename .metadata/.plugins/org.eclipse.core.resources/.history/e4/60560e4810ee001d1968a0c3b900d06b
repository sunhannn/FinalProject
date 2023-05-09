package com.ggul.zip.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggul.zip.message.MessageTO;
import com.ggul.zip.message.impl.MessageDAO;

@Controller
public class MessageController {

	@Autowired
	private MessageDAO messageDao;
	
	// 메세지 목록
	@RequestMapping(value = "/message_list.do")
	public String message_list(HttpServletRequest request, HttpSession session) {

		String user_id = (String) session.getAttribute("user_id");
		int send_btn = Integer.parseInt(request.getParameter("send_btn"));
		
		MessageTO to = new MessageTO();
		to.setUser_id(user_id);
		to.setSend_btn(send_btn);
		
		// 메세지 리스트
		ArrayList<MessageTO> list = messageDao.messageList(to);

		request.setAttribute("list", list);

		
		if(to.getSend_btn()==1) {
			return "message/message_send";
		}else {
			return "message/message_list";
		}
	}
	
	// 새로고침 또는 페이지 이동시마다 메세지 수신 감지
	@ResponseBody
	@RequestMapping(value = "/message_chk_on.do")
	public int message_chk_on(HttpServletRequest request, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		MessageTO to = new MessageTO();
		to.setUser_id(user_id);
		int unread = messageDao.message_unread(to);
		session.setAttribute("unread", unread);
		
		return unread;
	}
	
	
	// 로그인시 메세지 수신감지
//	@RequestMapping(value = "/message_chk.do")
//	public String message_chk(HttpServletRequest request, HttpSession session) {
//
//		String user_id = (String) session.getAttribute("user_id");
//		
//		MessageTO to = new MessageTO();
//		to.setUser_id(user_id);
//		
//		int unread = messageDao.message_unread(to);
//		System.out.println("인덱스가기전에 unread는? "+unread);
//		session.setAttribute("unread", unread);
//		return "redirect:index.jsp";
//	}
	

	// 메세지 목록 ajax
	@RequestMapping(value = "/message_ajax_list.do")
	public String message_ajax_list(HttpServletRequest request, HttpSession session) {
		

		String user_id = (String) session.getAttribute("user_id");
		String other_user_id = request.getParameter("other_user_id");

		MessageTO to = new MessageTO();
		to.setUser_id(user_id);

		int send_btn = Integer.parseInt(request.getParameter("send_btn"));
		to.setSend_btn(send_btn);
		
		if(to.getSend_btn() == 1) {
			int message_room_param = Integer.parseInt(request.getParameter("message_room"));
			to.setMessage_room(message_room_param);
			
			
			to.setMessage_send_id(user_id);
			to.setMessage_recv_id(other_user_id);
			
			int message_room = to.getMessage_room();
			messageDao.messageSendChk(to);
			int exist_chat = to.getExist_chat();
			// 강사에게 직접 메세지 보내기를 할 경우 방번호 0을 가져오고 기존에 방이 없는경우 방생성
			if (message_room == 0 && exist_chat == 0) {
				messageDao.messageSendInlist(to);
			}
		}
		

		// 메세지(채팅방) 리스트
		ArrayList<MessageTO> list = messageDao.messageList(to);

		request.setAttribute("list", list);
		return "message/message_ajax_list";

	}
	

	// 메세지 상세내용 불러오기
	@RequestMapping(value = "/message_content_list.do")
	public String message_content_list(HttpServletRequest request, HttpSession session) {

		String other_user_id = request.getParameter("other_user_id");
		int message_room = Integer.parseInt(request.getParameter("message_room"));

		MessageTO to = new MessageTO();

		to.setMessage_room(message_room);
		to.setUser_id((String) session.getAttribute("user_id"));

		to.setOther_user_id(other_user_id);
		to.setMessage_recv_id(other_user_id);

		// 메세지 내용을 가져온다.
		ArrayList<MessageTO> clist = messageDao.roomContentList(to);
		request.setAttribute("clist", clist);
		
		int unread = messageDao.message_unread(to);
		session.setAttribute("unread", unread);
		
		return "message/message_content_list";
	}

	
	// 메세지 리스트에서 메세지 보내기
	@ResponseBody
	@RequestMapping(value = "/message_send_inlist.do")
	public int message_send_inlist(@RequestParam int message_room, @RequestParam String other_user_id,
			@RequestParam String message_cont, HttpSession session) {
		
		MessageTO to = new MessageTO();
		to.setMessage_room(message_room);
		to.setMessage_send_id((String) session.getAttribute("user_id"));
		to.setMessage_recv_id(other_user_id);
		to.setMessage_cont(message_cont);

		int flag = messageDao.messageSendInlist(to);

		return flag;
	}
	
}