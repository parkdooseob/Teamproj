package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserSignUpController.do")
public class UserSignUpController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}
	
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("회원가입 들어왔다!!");
		
		request.setCharacterEncoding("UTF-8");
		
		UserDTO udto = new UserDTO();
		
		udto.setEmail(request.getParameter("email"));
		udto.setName(request.getParameter("name"));
		udto.setPass(request.getParameter("pass"));
		
		boolean result = false;
		
		UserDAO udao = new UserDAO();
		
		result = udao.insertUser(udto);
		
		if(result == false){
			System.out.println("회원가입 실패");
			return;
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 가입 되었습니다.')");
		out.println("location.href='home.jsp'");
		out.println("</script>");	
		
		
	}

}
