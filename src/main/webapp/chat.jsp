<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html><html><head><meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	table { height: 450px; border: 2px solid green; width: 90%; table-layout: fixed; oberflow: hidden; }
	div { height: 400px; overflow: scroll;}
</style>
<script type="text/javascript">
//	여러 function 같이 사용. 전역변수
	let websocket = new WebSocket("ws://192.168.40.46:8080/ch17/websocket");
	let disp;
	websocket.onopen = function(){ //맨 처음 연결되면 
		disp = document.getElementById("disp");
		disp.innerHTML += "연결되었습니다<br>";
	}
	websocket.onclose = function(){// 연결 종료하면
		disp.innerHTML += "종료되었습니다<br>";
	}
	websocket.onerr = function() {// 에러가 발생하면
		disp.innerHTML +="에러가 발생했습니다.<br>";
	}
	websocket.onmessage = function(){ // 메시지가 도착하면
		disp.innerHTMl += event.data+"<br>";
	}
	function webstart(){
		let message = document.getElementById("content");
		let name = document.getElementById("name").value;
		websocket.send(name+" > "+message); // 웹소켓을 사용하여 서버에 메세지를 전달
		document.getElementById("content").value = ""; // 입력한 메세지 삭제
	}
</script>
</head>
<body>
	별명 : <input type="text" name="name" id="name">
<table border="1">
	<tr><th height="400" id="a"><div id="disp"></div></th></tr>
	<tr><td height="50"><input type="text" id="content"><br>
		<button onclick="webstart()">웹 채팅</button>
	
</table>
</body>
</html>