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
import com.ggul.zip.payment.PointVO;
import com.ggul.zip.payment.impl.PointDAO;

@Controller
public class MessageController {

	@Autowired
	private MessageDAO messageDao;
	
	@Autowired
	private EscrowDAO escrowDao;
	
	@Autowired
	private PointDAO pointDao;
	

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
		
		if(to.getSend_btn() == 1) {
			System.out.println("if탐==="+to.getSend_btn());
			return "message/message_send";
		}else if(to.getSend_btn() == 3){
			System.out.println("else if탐==="+to.getSend_btn());
			return "message/message_list_m";
		}else if(to.getSend_btn() == 4){
			System.out.println("else if탐==="+to.getSend_btn());
			return "message/message_send_m";
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
		int send_btn = Integer.parseInt(request.getParameter("send_btn"));
		
		MessageTO to = new MessageTO();
		to.setUser_id(user_id);

		to.setSend_btn(send_btn);
		System.out.println("to.getSend_btn(직접보내기는0,4)"+to.getSend_btn());
		
		if(to.getSend_btn() == 1 || to.getSend_btn() == 4) {
			int message_room_param = Integer.parseInt(request.getParameter("message_room"));
			to.setMessage_room(message_room_param);
			
			
			to.setMessage_send_id(user_id);
			to.setMessage_recv_id(other_user_id);
			
			messageDao.messageSendChk(to);
			int message_room = to.getMessage_room();
			int exist_chat = to.getExist_chat();
			System.out.println("방없으면맥스+1, 있으면 있는방번호..."+message_room);
			System.out.println("exist_chat 0이어야됨..."+exist_chat);
			// 강사에게 직접 메세지 보내기를 할 경우 방번호 0을 가져오고 기존에 방이 없는경우 방생성
			if (message_room == 0 || exist_chat == 0) {
				System.out.println("방생성 if탐===exist_chat??"+exist_chat);
				messageDao.messageSendInlist(to);
			}
		}
		

		// 메세지(채팅방) 리스트
		ArrayList<MessageTO> list = messageDao.messageList(to);

		request.setAttribute("list", list);
		System.out.println("list::::::::::::"+list);
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
		
//		return "message/message_content_list";
		return "message/message_escrow_list";
	}
	
	
	// 제시한 가격 설정
	@RequestMapping(value = "/update_price")
	public String update_price(@RequestParam int message_room, @RequestParam int escrow_price,
			@RequestParam int escrow_lesson_num, @RequestParam int escrow_tiper_code, @RequestParam String escrow_user_id,
			@RequestParam String lesson_title, @RequestParam int escrow_status, String startDate, HttpServletRequest request, HttpSession session) throws java.text.ParseException {
		EscrowVO vo = new EscrowVO();
		
		String escrow_price_str = String.valueOf(escrow_price);
		escrow_price_str = escrow_price_str.replaceAll(",","");
		int price = Integer.parseInt(escrow_price_str);
		
		
		vo.setEscrow_price(price);
		vo.setEscrow_lesson_num(escrow_lesson_num);
		vo.setEscrow_tiper_code(escrow_tiper_code);
		vo.setEscrow_user_id(escrow_user_id);
		vo.setEscrow_status(escrow_status);
		vo.setStartDate(startDate);
		System.out.println("escrow_price="+price+"/레슨넘="+escrow_lesson_num+"/티퍼코드="+escrow_tiper_code+"/escrow_user_id"+escrow_user_id+"/startDate"+startDate);
		escrowDao.update_price(vo);
		
		// 입력한 가격을 message테이블에도 insert
		MessageTO to = new MessageTO();
		to.setMessage_room(message_room);
		to.setMessage_send_id((String) session.getAttribute("user_id"));
		to.setMessage_recv_id(escrow_user_id);
		
		String price_str = String.valueOf(escrow_price);
		price_str = price_str.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
		
//		String price_tot = "<pre class='lesson_title'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-receipt-cutoff' viewBox='0 0 16 16'><path d='M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zM11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z'/><path d='M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293 2.354.646zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118l.137-.274z'/></svg>견적서<br>"+lesson_title+"</pre>"+"<br><p class='lesson_price'>"+price_str+" 페이"+"</p>"+"<button type='button' class='accept_btn'>수락하기</button><input class='escrow_lesson_num' type='hidden' value='"+escrow_lesson_num+"'><input class='escrow_tiper_code' type='hidden' value='"+escrow_tiper_code+"'>";
//		String escaped_price_tot = StringEscapeUtils.escapeHtml(price_tot);
//		to.setMessage_cont(escaped_price_tot);
		
//		to.setMessage_cont("<pre class='lesson_title'>견적서<br>"+lesson_title+"</pre>"+"<br><p class='lesson_price'>"+price_str+" 페이"+"</p>"+"<button type='button' class='accept_btn'>수락하기</button><input class='escrow_lesson_num' type='hidden' value='"+escrow_lesson_num+"'><input class='escrow_tiper_code' type='hidden' value='"+escrow_tiper_code+"'>");
//		to.setMessage_cont("[<@강의명>]"+lesson_title+"[<@/강의명>]"+"[<@가격>]"+"꿀TIP 전수일: "+startDate+"[<@/전수일>]"+price_str+" 허니페이"+"[<@/가격|버튼>]"+escrow_lesson_num+"[<@/버튼|코드>]"+escrow_tiper_code+"[<@/코드>]"+escrow_status+"[<@status>]");
		to.setMessage_cont("[<@전수일>]"+startDate+"[<@강의명>]"+lesson_title+"[<@/강의명>]"+"[<@가격>]"+price_str+" 허니페이"+"[<@/가격|버튼>]"+escrow_lesson_num+"[<@/버튼|코드>]"+escrow_tiper_code+"[<@/코드>]"+escrow_status+"[<@status>]");
		messageDao.messageSendInlist(to);
		return "message/message_list";
	}
	
	// 제시된 가격 수락
	@ResponseBody
	@RequestMapping(value = "/escrow_status")
	public int escrow_status(HttpServletRequest request, HttpSession session, @RequestParam int escrow_tiper_code,
			@RequestParam String escrow_price, @RequestParam String lesson_title, @RequestParam int escrow_lesson_num) {
		EscrowVO vo = new EscrowVO();
		vo.setEscrow_user_id((String) session.getAttribute("user_id"));
		vo.setEscrow_tiper_code(escrow_tiper_code);
		vo.setEscrow_lesson_num(escrow_lesson_num);
		System.out.println("escrow_lesson_num"+escrow_lesson_num);
		
		System.out.println("수락할때 가져오는 값들 :"+escrow_tiper_code+"+"+escrow_price+"+"+lesson_title.replace("견적서","")+"+"+escrow_lesson_num);
		
		// 업데이트
		int status = escrowDao.escrow_status(vo);
		
		// 상태조회
		vo = escrowDao.select_status(vo);
		
		vo.getEscrow_status();
		System.out.println("vo.getEscrow_status()====;"+vo.getEscrow_status()+"status======"+status);
		int select_status = vo.getEscrow_status();
				
		int status_con = 0;
		
		if(status == 2 && select_status == 1) { // 신청완료됨
			// point 차감내역 insert
			PointVO pvo = new PointVO();
			
			String escrow_price_str = String.valueOf(escrow_price);
			escrow_price_str = escrow_price_str.replaceAll("[,허니페이 ]","");
			int price = Integer.parseInt(escrow_price_str);
			
			String title = lesson_title.replace("견적서", "");
			
			pvo.setPoint_id((String) session.getAttribute("user_id"));
			pvo.setPoint_price(-price);
			pvo.setPoint_history(title);
			pointDao.insertPoint(pvo);
			
			status_con = 1;
			System.out.println("status_con1="+status_con);
			return status_con;
		}else if(status == 0 && select_status == 1) { // 이미 신청됨
			status_con = 2;
			System.out.println("status_con2="+status_con);
			return status_con;
		}else if(status == 0 && select_status == 0){ // 잔액이 부족함
			status_con = 3;
			System.out.println("status_con3="+status_con);
			return status_con;
		}else {
			System.out.println("status_con0="+status_con);
			return status_con;
		}
	}
	
}