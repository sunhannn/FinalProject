package com.ggul.zip.message.impl;

import java.util.ArrayList;

import org.apache.commons.lang.StringEscapeUtils;
//import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ggul.zip.message.MessageTO;

@Repository
public class MessageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 메인에서 안읽은 메세지 확인
	public int message_unread(MessageTO to) {
		int unread = sqlSession.selectOne("main_count_unread",to);
//		to.setUnread(unread);
		System.out.println("unreadunreadunread"+unread);
		return unread;
		
	}
	
	
	// 메세지 리스트
	public ArrayList<MessageTO> messageList(MessageTO to) {

		String user_id = to.getUser_id();

		// 메세지 리스트에 나타낼 것들 가져오기 - 가장 최근 메세지, 보낸사람 profile 사진, 보낸사람 nick
		ArrayList<MessageTO> list = (ArrayList) sqlSession.selectList("message_list", to);
		System.out.println("아이디가없음?"+user_id);
//		System.out.println("for문 돌리기전 list??"+list);
		for (MessageTO mto : list) {
			mto.setUser_id(user_id);
			
			// 현재 사용자가 해당 room에서 안읽은 메세지의 갯수를 가져온다.
			int unread = sqlSession.selectOne("count_unread", mto);
			
			// 현재 사용자가 메세지를 주고받는 상대 profile을 가져온다.
			String tiper_img = sqlSession.selectOne("get_other_profile", mto);
			
			// 안읽은 메세지 갯수를 mto에 set한다.
			mto.setUnread(unread);
			
			// 메세지 상대의 프로필사진을 mto에 set한다.
			mto.setTiper_img(tiper_img);
			
			// 메세지 상대 id를 세팅한다. other_user_id
			if (user_id.equals(mto.getMessage_send_id())) {
				mto.setOther_user_id(mto.getMessage_recv_id());
			} else {
				mto.setOther_user_id(mto.getMessage_send_id());
			}
//			System.out.println("mtomto:::===:::"+mto);
		}
//		System.out.println("mto list"+list);
		return list;
	}

	
	// room 별 메세지 내용을 가져온다.
	public ArrayList<MessageTO> roomContentList(MessageTO to) {
		String other_user_id = to.getOther_user_id();
		String user_id = to.getUser_id();

		// 메세지 내역을 가져온다
		ArrayList<MessageTO> clist = (ArrayList) sqlSession.selectList("room_content_list", to);
		// 해당 방의 메세지들 중 받는 사람이 현재사용자의 nick인 메세지를 모두 읽음 처리한다
		sqlSession.update("message_read_chk", to);

		return clist;
	}

	
	// 메세지 list에서 메세지를 보낸다.
	public int messageSendInlist(MessageTO to) {

		// 메세지리스트에서 보낸건지 프로필에서 보낸건지 구분하기 위함
		if (to.getMessage_room() == 0) { // room이 0이라면 프로필에서 보냄
			int exist_chat = sqlSession.selectOne("exist_chat", to);
			
			// 프로필에서 보낸것중 메세지 내역이없어서 첫메세지가 될경우를 구분하기 위함
			if (exist_chat == 0) { // 메세지 내역이 없어서 0이면 message 테이블의 room 최댓값을 구해서 to에 set 한다.
				int max_room = sqlSession.selectOne("max_room", to);
				to.setMessage_room(max_room + 1);
				
			} else { // 메세지 내역이 있다면 해당 room 번호를 가져온다.
				int room = Integer.parseInt(sqlSession.selectOne("select_room", to));
				to.setMessage_room(room);
			}
		}else {
			System.out.println("==============TEst=====================");
		}

		int flag = sqlSession.insert("messageSendInlist", to);
		return flag;
	}

	public void messageSendChk(MessageTO to) {
		System.out.println("룸넘버***"+to.getMessage_room());
		System.out.println("exist_chat***"+to.getExist_chat());
		// 메세지리스트에서 보낸건지 프로필에서 보낸건지 구분하기 위함
		if (to.getMessage_room() == 0) { // room이 0이라면 프로필에서 보냄
			int exist_chat = sqlSession.selectOne("exist_chat", to);
			to.setExist_chat(exist_chat);
			System.out.println("exist_chat셋팅값"+exist_chat);
			// 프로필에서 보낸것중 메세지 내역이없어서 첫메세지가 될경우를 구분하기 위함
			if (exist_chat == 0) { // 메세지 내역이 없어서 0이면 message 테이블의 room 최댓값을 구해서 to에 set 한다.
				int max_room = sqlSession.selectOne("max_room", to);
				to.setMessage_room(max_room + 1);
				
//				int exist_chat_fin = sqlSession.selectOne("exist_chat", to);
//				to.setExist_chat(exist_chat_fin);
				
			} else { // 메세지 내역이 있다면 해당 room 번호를 가져온다.
				int room = Integer.parseInt(sqlSession.selectOne("select_room", to));
				to.setMessage_room(room);
			}
		}
		System.out.println("끝날때 룸넘버"+to.getMessage_room());
		System.out.println("끝날때 exist_chat***"+to.getExist_chat());
	}
	

}