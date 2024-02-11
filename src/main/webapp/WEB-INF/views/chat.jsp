<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/header.jsp"%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
	<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
    
    
 <style>
    body {
        font-family: Arial, sans-serif;
    }
    .chat-container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
    }
    .chat {
        background-color: #f5f5f5;
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 20px;
    }
    .chat .message {
        margin-bottom: 10px;
        display: flex; 
    }
    .chat .message:last-child {
        margin-bottom: 0;
    }
    .chat .message .sender {
        font-weight: bold;
        color: black; 
        flex: none; /* 발신자는 플렉스 아이템의 크기를 고정합니다. */
        margin-right: 10px; /* 발신자와 메시지 사이의 간격을 조정합니다. */
    }
    .chat .message .text {
        background-color: #ffffff;
        border-radius: 10px;
        padding: 10px;
        max-width: 70%;
    }
    .chat .my-message{
      display: flex; 
     justify-content: flex-end;
     margin-bottom: 10px;
    }
    .chat .my-message .text {
        background-color: #FFA500;
        align-self: flex-end;
        justify-content: flex-end;
    }
    .chat-input {
        display: flex;
        margin-top: 20px;
    }
    .chat-input input[type="text"] {
        flex: 1;
        padding: 10px;
        border-radius: 20px;
        border: 1px solid #ccc;
        outline: none;
    }
    .chat-input button {
        padding: 10px 20px;
        border-radius: 20px;
        background-color: #0066ff; /* 파란색 */
        color: #ffffff;
        border: none;
        cursor: pointer;
        margin-left: 10px;
        outline: none;
    }
</style>

</head>

   <div class="chat-container">
        <div class="chat">
        <input type="hidden" id="userid" value="${user.userid }"/>
            <div class="chat-messages" id="messageArea">
	          
            
            </div>
        </div>
        <div class="chat-input">
            <input type="text" id="message" placeholder="메세지를 입력하세요.">
            <button class="btn btn-primary" id="sendBtn">Send</button>
        </div>
    </div>
     

<script>


	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});

	let sock = new SockJS("http://localhost:8080/chat");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	
	//채팅창에 들어왔을 때
	function onOpen(evt) {
		
		var user = '${user.userid}';
		var str = user + "님이 입장하셨습니다.";
		
// 		$("#messageArea").append(str);
	}
	
	// 메시지 전송
	function sendMessage() {
		sock.send($("#message").val());
	}
	
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		var sessionId = null; //데이터를 보낸 사람
		var message = null;
		var arr = data.split(":");
		
		for(var i=0; i<arr.length; i++){
			console.log('arr[' + i + ']: ' + arr[i]);
			console.log('웹소켓 메세지');
		}
		
		var userId = $('#userid').val();
		
		sessionId = arr[0];
		message = arr[1];
		
		if (message) {
			
			if(sessionId == userId){
				var str = '<div class="message my-message">'
					str += '<div class="text"> ' + message + '</div>'
					str += '</div></div>'
			} else {
				var str = '<div class="message">'
					str += '<span class="sender">' + sessionId + '</span>  '
					str += '<div class="text">' + message + '</div>'
					str += '</div>'
			}

		    $("#messageArea").append(str);
		    
		} else {
		    var str = "<div class='col-6'>";
		    str += "<div class='alert alert-secondary'>";
		    str += "<b>" + sessionId + "</b>";
		    str += "</div></div>";

		    $("#messageArea").append(str);
		}

	}
	
	//채팅창에서 나갔을 때
	function onClose(evt) {
		
		var user = '${user.userid}';
		var str = user + " 님이 퇴장하셨습니다.";
		
// 		$("#messageArea").append(str);
	}
	
	
</script>

  <%@ include file="/WEB-INF/footer.jsp"%>