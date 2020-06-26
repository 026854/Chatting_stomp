package com.example.stomp.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.RestController;

import com.example.stomp.vo.MessageVO;

@RestController
public class MessageController {

	@MessageMapping("/hello")
	@SendTo("/topic/roomId")
	public MessageVO broadcasting(MessageVO message) throws Exception {
		System.out.println("message: " + message.getSendMessage());
		return message;
	}
	
	@MessageMapping("/out")
	@SendTo("/topic/out")
	public String outroom(String message) throws Exception{
		System.out.println("out message : " + message);
		return message;
	}
	
	@MessageMapping("/in")
	@SendTo("/topic/in")
	public String inroom(String message) throws Exception {
		System.out.println("in message : " + message);
		return message;
	}
}
