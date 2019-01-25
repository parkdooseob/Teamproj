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


@WebServlet("/UserLoginController.do")
public class UserLoginController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// home.jsp 로그인 모달창에서 로그인 버튼 클릭후
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		// DB 작업 객체 생성
		UserDAO udao = new UserDAO();
		
		// check = 1 -> 이메일, 패스워드 일치
		// check = 0 -> 이메일, 패스워드 불일치
		// check = -1 -> 아이디 존재 하지 않음
		
		int check = udao.userCheck(email,pass);
		
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
		
		UserDTO udto = udao.getUser(email);
		
		session.setAttribute("udto", udto);
		
		// 일반 로그인시 0
		// 구글 로그인시 1
		// 카카오 로그인시 2
		session.setAttribute("login_val", 0);
		
		RequestDispatcher dis = request.getRequestDispatcher("/index.jsp");
		
		dis.forward(request, response);
		
		
	}

}
