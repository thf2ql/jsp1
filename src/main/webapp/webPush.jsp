<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="common.css">
<script type="text/javascript">
	function push() {
		let es = new EventSource('push.action');
		// es에 message가 전달되면 처리, 전달된 메세지가 event에 포함
		es.addEventListener("message", function(event) {
			let disp = document.getElementById("disp");
			// 이벤트 넘어온 데이터를 id가 disp인 곳의 안에 html형식 출력 
			disp.innerHTML = event.data;
		});
		
	}
</script>
</head><body>
<button onclick="push()">웹푸시 시작</button>
<div id="disp"></div>
</body>
</html>