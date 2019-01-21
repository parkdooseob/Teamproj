package user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/HostProfileUpdateController.do")
public class HostProfileUpdateController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HostDTO hdto = new HostDTO();
		UserDAO udao = new UserDAO();
		// System.out.println("여기는 일반회원정보 수정");
		HttpSession session = request.getSession();
		HostDTO session_dto = (HostDTO)session.getAttribute("hdto");
		
		// 호스트 회원 정보 수정		
		hdto.setHost_id(request.getParameter("host_id"));
		hdto.setHost_nic(request.getParameter("host_nic"));
		hdto.setHost_phone(request.getParameter("host_phone"));
		// 비밀번호 변경이 일어 나면
		if(request.getParameter("passwd_ch") != null){		
			hdto.setHost_pass(request.getParameter("passwd_ch"));				
		}else{
			// 변경이 없으면 세션에 패스워드
			hdto.setHost_pass(session_dto.getHost_pass());
		}			
		
		udao.hostProfileUpdate(session_dto.getHost_id(), hdto);
		
		RequestDispatcher dis = request.getRequestDispatcher("./home.jsp");
		
		dis.forward(request, response);
				
				
		
		
	}


}
