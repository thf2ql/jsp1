<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html><html><head><meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	table { height: 450px; border: 2px solid green; width: 90%; table-layout: fixed; oberflow: hidden; }
	div { height: 400px; overflow: scroll;}
</style>
<script type="text/javascript">
//	���� function ���� ���. ��������
	let websocket = new WebSocket("ws://192.168.40.46:8080/ch17/websocket");
	let disp;
	websocket.onopen = function(){ //�� ó�� ����Ǹ� 
		disp = document.getElementById("disp");
		disp.innerHTML += "����Ǿ����ϴ�<br>";
	}
	websocket.onclose = function(){// ���� �����ϸ�
		disp.innerHTML += "����Ǿ����ϴ�<br>";
	}
	websocket.onerr = function() {// ������ �߻��ϸ�
		disp.innerHTML +="������ �߻��߽��ϴ�.<br>";
	}
	websocket.onmessage = function(){ // �޽����� �����ϸ�
		disp.innerHTMl += event.data+"<br>";
	}
	function webstart(){
		let message = document.getElementById("content");
		let name = document.getElementById("name").value;
		websocket.send(name+" > "+message); // �������� ����Ͽ� ������ �޼����� ����
		document.getElementById("content").value = ""; // �Է��� �޼��� ����
	}
</script>
</head>
<body>
	���� : <input type="text" name="name" id="name">
<table border="1">
	<tr><th height="400" id="a"><div id="disp"></div></th></tr>
	<tr><td height="50"><input type="text" id="content"><br>
		<button onclick="webstart()">�� ä��</button>
	
</table>
</body>
</html>