package ch17.controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/push.action")
public class PushController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/evet-stream");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		int num = (int)(Math.random()*45)+1 // 1~45까지 랜덤한 정수
		out.println("data : "+num+"\n\n");
		try { // 하루에 한번씩 1000 * 60 * 60 * 24
			Thread.sleep(1000); // 1초에 한번씩
		} catch (Exception e) {
			out.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
