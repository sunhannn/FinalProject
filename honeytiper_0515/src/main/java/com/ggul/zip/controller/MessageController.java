package com.ggul.zip.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggul.zip.escrow.EscrowVO;
import com.ggul.zip.escrow.impl.EscrowDAO;
import com.ggul.zip.message.MessageTO;
import com.ggul.zip.message.impl.MessageDAO;

@Controller
public class MessageController {

	@Autowired
	private MessageDAO messageDao;
	
	@Autowired
	private EscrowDAO escrowDao;

	// 메세지 목록
	@RequestMapping(value = "/message_list")
	public String message_list(HttpServletRequest request, HttpSession session) {

		String user_id = (String) session.getAttribute("user_id");
		int send_btn = Integer.parseInt(request.getParameter("send_btn"));
		
		MessageTO to = new MessageTO();
		to.setUser_id(user_id);
		to.setSend_btn(send_btn);
		
		// 메세지 리스트
		ArrayList<MessageTO> list = messageDao.messageList(to);

		request.setAttribute("list", list);

//		System.out.println("메세지리스트는 "+list);
		
		if(to.getSend_btn()==1) {
			System.out.println("if탐==="+to.getSend_btn());
			return "message/message_send";
		}else {
			System.out.println("else탐==="+to.getSend_btn());
			return "message/message_list";
		}
	}
	
	// 새로고침 또는 페이지 이동시마다 메세지 수신 감지
	@ResponseBody
	@RequestMapping(value = "/message_chk_on")
	public int message_chk_on(HttpServletRequest request, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		System.out.println("=======무조건타는컨트롤러==========");
		System.out.println("=======아이디=========="+user_id);
		MessageTO to = new MessageTO();
		to.setUser_id(user_id);
		int unread = messageDao.message_unread(to);
		System.out.println("인덱스가기전에 unread는? "+unread);
		session.setAttribute("unread", unread);
		
		return unread;
	}
	

	// 메세지 목록 ajax
	@RequestMapping(value = "/message_ajax_list")
	public String message_ajax_list(HttpServletRequest request, HttpSession session) {
		

		String user_id = (String) session.getAttribute("user_id");
		String other_user_id = request.getParameter("other_user_id");

		MessageTO to = new MessageTO();
		to.setUser_id(user_id);

		int send_btn = Integer.parseInt(request.getParameter("send_btn"));
		System.out.println("to.getSend_btn()"+to.getSend_btn());
		to.setSend_btn(send_btn);
		
		if(to.getSend_btn() == 1) {
			int message_room_param = Integer.parseInt(request.getParameter("message_room"));
			to.setMessage_room(message_room_param);
			
			
			to.setMessage_send_id(user_id);
			to.setMessage_recv_id(other_user_id);
			
			int message_room = to.getMessage_room();
			messageDao.messageSendChk(to);
			int exist_chat = to.getExist_chat();
//			System.out.println("0받아야하는데..."+message_room);
//			System.out.println("exist_chat 0이어야됨..."+exist_chat);
			// 강사에게 직접 메세지 보내기를 할 경우 방번호 0을 가져오고 기존에 방이 없는경우 방생성
			if (message_room == 0 && exist_chat == 0) {
				System.out.println("방생성 if탐===exist_chat??"+exist_chat);
				messageDao.messageSendInlist(to);
			}
		}
		

		// 메세지(채팅방) 리스트
		ArrayList<MessageTO> list = messageDao.messageList(to);

		request.setAttribute("list", list);
//		System.out.println("lst::::::::::::"+list);
		return "message/message_ajax_list";

	}
	

	// 메세지 상세내용 불러오기
	@RequestMapping(value = "/message_content_list")
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
		System.out.println("메세지 읽고나서 재확인 unread는? "+unread);
		session.setAttribute("unread", unread);
		
		return "message/message_content_list";
	}

	
	// 메세지 리스트에서 메세지 보내기
	@ResponseBody
	@RequestMapping(value = "/message_send_inlist")
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
	
	// 수강생이 신청한 강사의 강의목록을 가져온다
	@RequestMapping(value = "/select_escrow")
	public String select_escrow(@RequestParam String escrow_user_id, HttpServletRequest request, HttpSession session) {
		String tiper_id = (String) session.getAttribute("user_id");
		System.out.println("tiper_id="+tiper_id+"/escrow_user_id="+escrow_user_id);
		
		EscrowVO vo = new EscrowVO();
		
		vo.setEscrow_user_id(escrow_user_id);
		vo.setTiper_user_id(tiper_id);
		
		System.out.println("vovovovo===="+vo.getEscrow_price()+escrow_user_id);
		
		ArrayList<EscrowVO> list = escrowDao.select_escrow(vo);
		System.out.println("강의목록 리스트="+list);
//		return list;
		
		request.setAttribute("list", list);
		
		return "message/message_content_list";
	}
	
	
	// 제시한 가격 설정
	@RequestMapping(value = "/update_price")
	public String update_price(@RequestParam int message_room, @RequestParam int escrow_price,
			@RequestParam int escrow_lesson_num, @RequestParam int escrow_tiper_code, @RequestParam String escrow_user_id,
			@RequestParam String lesson_title, HttpServletRequest request, HttpSession session) {
		EscrowVO vo = new EscrowVO();
		vo.setEscrow_price(escrow_price);
		vo.setEscrow_lesson_num(escrow_lesson_num);
		vo.setEscrow_tiper_code(escrow_tiper_code);
		vo.setEscrow_user_id(escrow_user_id);
		System.out.println("escrow_price="+escrow_price+"/레슨넘="+escrow_lesson_num+"/티퍼코드="+escrow_tiper_code+"/escrow_user_id"+escrow_user_id);
		escrowDao.update_price(vo);
		
		// 입력한 가격을 message테이블에도 insert
		MessageTO to = new MessageTO();
		to.setMessage_room(message_room);
		to.setMessage_send_id((String) session.getAttribute("user_id"));
		to.setMessage_recv_id(escrow_user_id);
		to.setMessage_cont("<pre class='lesson_title'>견적서<br>"+lesson_title+"</pre>"+"<br><p class='lesson_price'>"+String.valueOf(escrow_price)+" 페이"+"</p>"+"<button type='button' class='accept_btn'>수락하기</button><input class='escrow_lesson_num' type='hidden' value='"+escrow_lesson_num+"'><input class='escrow_tiper_code' type='hidden' value='"+escrow_tiper_code+"'>");
		messageDao.messageSendInlist(to);
		return "message/message_list";
	}
	
	
	// 제시된 가격 수락
	@ResponseBody
	@RequestMapping(value = "/escrow_status")
	public int escrow_status(HttpServletRequest request, HttpSession session, @RequestParam int escrow_tiper_code, @RequestParam int escrow_lesson_num) {
		EscrowVO vo = new EscrowVO();
		vo.setEscrow_user_id((String) session.getAttribute("user_id"));
		vo.setEscrow_tiper_code(escrow_tiper_code);
		vo.setEscrow_lesson_num(escrow_lesson_num);
		System.out.println("escrow_lesson_num"+escrow_lesson_num);
		int status = escrowDao.escrow_status(vo);
		
//		request.setAttribute("status", status);
		return status;
	}
	
}