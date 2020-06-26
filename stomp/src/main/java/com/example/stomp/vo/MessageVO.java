package com.example.stomp.vo;

import lombok.Data;


public class MessageVO {
	
	private String sendMessage;
	private String senderName;
	
	public MessageVO() {
		
	}

	public String getSendMessage() {
		return sendMessage;
	}

	public void setSendMessage(String sendMessage) {
		this.sendMessage = sendMessage;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}



}
