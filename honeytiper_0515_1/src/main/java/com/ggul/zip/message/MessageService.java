package com.ggul.zip.message;

import java.util.ArrayList;

public interface MessageService {
	
	public ArrayList<MessageTO> messageList(MessageTO to);
	
	public ArrayList<MessageTO> roomContentList(MessageTO to);
	
	public int messageSendInlist(MessageTO to);
	
	
}
