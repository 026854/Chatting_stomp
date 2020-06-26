<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>stomp chattting</title>
</head>
<body>
	<h1>Chatting page</h1>
	<div>
		<input type = "button" id = "chattinglistbtn" value = "채팅 참여자 리스">
		<input type = "button" id = "outroom" value = "채팅방 out">	
			
	</div>
	
	<br>
	<div>
		<textarea id = "chatOutput" name="" class="chatting_history" rows = "30" cols = "70"></textarea>
		<div>
			<input id= "chatInput" type = "text" class = "chat">&nbsp;
			<input type="button" id= "sendbtn" value="send">
			
		</div>
	</div>
	<input type="hidden" value='${userid}' id="sessionuserid">
</body>
<script src="/js/sockjs.min.js"></script>
<script src="/js/stomp.min.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
/* document.addEventListener("DOMContentLoaded", function(){
	WebSocket.init();
}); */

connect();
//연결
var sessionId = document.getElementById("sessionuserid").value;
var text = document.getElementById("chatInput").value;
function connect(){
   var socket = new SockJS("/websockethandler");
   stompClient = Stomp.over(socket);
   
   stompClient.connect({}, function(){
      stompClient.subscribe('/topic/roomId', function(msg){
         printMessage(JSON.parse(msg.body).sendMessage + '/' + JSON.parse(msg.body).senderName);
      });
      
      stompClient.subscribe('/topic/out', function(msg){
         printMessgae(msg.body);
      });
      
      stompClient.subscribe('/topic/in', function(msg){
         printMessage(msg.body);
      });
      
      stompClient.send("/app/in", {},sessionId + ' 님 채팅방 입장');
   });
}

function printMessage(message){
	$("#chatOutput").append(message+'\r\n');
	
	
}


function disconnect(){
   if(stompClient !== null){
      stompClient.send("/app/out", {}, sessionId + ' 님 채팅방 퇴장');
      stompClient.disconnect();
   }
}

//메세지 전송
function sendMessage(text){
   stompClient.send("/app/hello", {}, JSON.stringify({'sendMessage':text, 'senderName':''+sessionId}));
}

$(function() { 
	$("#sendbtn").click(function() {
		      sendMessage($("#chatInput").val()) ; 
		});
	});


</script>
</html>