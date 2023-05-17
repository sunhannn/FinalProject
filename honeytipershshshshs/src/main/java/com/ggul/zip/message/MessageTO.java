package com.ggul.zip.message;

public class MessageTO {
	private String message_num; 
	private int message_room;
	private String message_send_id;
	private String message_recv_id;
	private String message_send_time;
	private String message_read_time;
	private String message_cont;
	private String message_read_chk;
	private int exist_chat;
	
	// 현재 사용자의 메세지 상대 nick을 담는다.
	private String other_user_id;
	
	// 현재 사용자의 메세지 상대 profile을 담는다.
	private String tiper_img;
	
	// 현재 사용자 nick
	private String user_id;
	
	// 안읽은 메세지 갯수 
	private int unread;
	
//	private String search_id;
	
	
	private int send_btn;
	
	private int user_role;
	
	
	public int getUser_role() {
		return user_role;
	}

	public void setUser_role(int user_role) {
		this.user_role = user_role;
	}

	public int getExist_chat() {
		return exist_chat;
	}
	
	public int setExist_chat(int exist_chat) {
		return this.exist_chat = exist_chat;
	}
	
	
	public int getSend_btn() {
		return send_btn;
	}
	
	public int setSend_btn(int send_btn) {
		return this.send_btn = send_btn;
	}
	
	public int getUnread() {
		return unread;
	}
	public void setUnread(int unread) {
		this.unread = unread;
	}
	public String getOther_user_id() {
		return other_user_id;
	}
	public void setOther_user_id(String other_user_id) {
		this.other_user_id = other_user_id;
	}
	
	public String getTiper_img() {
		return tiper_img;
	}
	public void setTiper_img(String tiper_img) {
		this.tiper_img = tiper_img;
	}
	
	public int getMessage_room() {
		return message_room;
	}
	public void setMessage_room(int message_room) {
		this.message_room = message_room;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMessage_num() {
		return message_num;
	}
	public void setMessage_num(String message_num) {
		this.message_num = message_num;
	}
	public String getMessage_send_id() {
		return message_send_id;
	}
	public void setMessage_send_id(String message_send_id) {
		this.message_send_id = message_send_id;
	}
	public String getMessage_recv_id() {
		return message_recv_id;
	}
	public void setMessage_recv_id(String message_recv_id) {
		this.message_recv_id = message_recv_id;
	}
	public String getMessage_send_time() {
		return message_send_time;
	}
	public void setMessage_send_time(String message_send_time) {
		this.message_send_time = message_send_time;
	}
	public String getMessage_read_time() {
		return message_read_time;
	}
	public void setMessage_read_time(String message_read_time) {
		this.message_read_time = message_read_time;
	}
	public String getMessage_cont() {
		return message_cont;
	}
	public void setMessage_cont(String message_cont) {
		this.message_cont = message_cont;
	}
	public String getMessage_read_chk() {
		return message_read_chk;
	}
	public void setMessage_read_chk(String message_read_chk) {
		this.message_read_chk = message_read_chk;
	}
	@Override
	public String toString() {
		return "MessageTO [message_num=" + message_num + ", message_room=" + message_room + ", message_send_id="
				+ message_send_id + ", message_recv_id=" + message_recv_id + ", message_send_time=" + message_send_time
				+ ", message_read_time=" + message_read_time + ", message_cont=" + message_cont + ", message_read_chk="
				+ message_read_chk + ", other_user_id=" + other_user_id + ", tiper_img=" + tiper_img + ", user_id="
				+ user_id + ", unread=" + unread + "]";
	}
	
	
	
}