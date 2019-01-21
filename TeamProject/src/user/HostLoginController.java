package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/HostLoginController.do")
public class HostLoginController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}
	
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("호스트 로그인");
		// home.jsp 로그인 모달창에서 호스트 로그인인 경우
		String host_id = request.getParameter("email");
		String host_pass = request.getParameter("pass");
		
		// DB 작업 객체 생성
		UserDAO udao = new UserDAO();
		
		// check = 1 -> 이메일, 패스워드 일치
		// check = 0 -> 이메일, 패스워드 불일치
		// check = -1 -> 아이디 존재 하지 않음
		
		int check = udao.hostCheck(host_id,host_pass);
		
		// check = 0 비밀번호 불일치
		if(check == 0 ){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호가 일치하지 않습니다.');");
			out.println("history.back()");
			out.println("</script>");
			out.close();			
			return;
			
		}
		
		if(check == -1 ){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.println("<script>");
			out.println("alert('아이디가 존재 하지 않습니다.');");
			out.println("history.back()");
			out.println("</script>");
			out.close();			
			return;
			
		}
		
		
		HttpSession session = request.getSession();
		
		HostDTO hdto = udao.getHost(host_id);
		
		session.setAttribute("hdto", hdto);		
		
		RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
		
		dis.forward(request, response);	
		
	}

}
