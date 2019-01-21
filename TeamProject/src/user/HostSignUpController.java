package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/HostSignUpController.do")
public class HostSignUpController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}
	
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("호스트 가입");
		HostDTO hdto = new HostDTO();
		UserDAO udao = new UserDAO();
		
		HttpSession session = request.getSession();
		UserDTO sessionDTO = (UserDTO)session.getAttribute("udto");
		
		// 호스트 가입페이지에서 넘어온 정보들
		hdto.setHost_id(request.getParameter("host_id"));
		hdto.setEmail(sessionDTO.getEmail());
		hdto.setHost_nic(request.getParameter("host_name"));
		hdto.setHost_phone(request.getParameter("host_phone"));
		hdto.setHost_pass(request.getParameter("host_pass"));		
		hdto.setPoint(sessionDTO.getPoint());		
		
		boolean result = udao.insertHost(hdto);
		
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
