package com.ggul.zip.message.impl;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggul.zip.message.MessageService;
import com.ggul.zip.message.MessageTO;
 
@Service("messageService")
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageDAO dao;
	
	public ArrayList<MessageTO> messageList(MessageTO to){
		return dao.messageList(to);
	}
	
	public ArrayList<MessageTO> roomContentList(MessageTO to){
		return dao.roomContentList(to);
	}
	
	public int messageSendInlist(MessageTO to) {
		return dao.messageSendInlist(to);
	}
}
