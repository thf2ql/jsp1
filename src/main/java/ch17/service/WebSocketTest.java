package ch17.service;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@ServerEndpoint("websocket")
public class WebSocketTest {
	// 접속한 사람들의 sessiong번호를 저장하는 곳
		private static final Set<Session> clients = new HashSet<Session>();
		private Session session;
		@OnOpen // 웹소켓에 연결
		public void open(Sessiong session) {
			this.session = session;
			clients.add(session);
			String message = "content";
			broadcast(message);
		}
		private void broadcast(String message) {
			for(Session client : clients) { //연결된 모든 사람에게 전달
				try{
					client.getBasicRemote().sendText(message);
				} catch (IOException e) {
					clients.remove(client); //연결이 끊어진 것으로 보고 제거
					try { client.close(); } catch (IOException e1) { }
						message = "close";
						broadcast(message);
				}
	
			}
			
		}
		@OnMessage // 메세지가 도착하면
		public void onmessage(String message) {
			if (message == null || message.equals("")) return;
			else broadcast(message);
		}
		@OnClose //채팅을 종료하면
		public void close() {
			clients.remove(sessiong);
			String message = "disconnect";
		}
}
