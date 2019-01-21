package user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UserProfileUpdateController.do")
public class UserProfileUpdateController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDTO udto = new UserDTO();
		UserDAO udao = new UserDAO();
		// System.out.println("여기는 일반회원정보 수정");
		HttpSession session = request.getSession();
		UserDTO session_dto = (UserDTO)session.getAttribute("udto");
		// 일반회원 0, 구글 1, 카카오 2
		// SNS계정은 닉네임만 수정할 수 있도록 분기 처리
		int userflag = (int)session.getAttribute("login_val");
		
		/*System.out.println("userflag : "+userflag);*/
		
		// 일반회원이면 전체 변경
		if(userflag ==0){
			
			udto.setEmail(request.getParameter("email"));
			udto.setName(request.getParameter("nick_name"));
			if(request.getParameter("passwd_ch") != null){
				udto.setPass(request.getParameter("passwd_ch"));				
			}else{
				udto.setPass(session_dto.getPass());
			}		
			
		}else{
			
			udto.setName(request.getParameter("nick_name"));						
		}
		
		udao.userProfileUpdate(session_dto.getEmail(),udto);
		
		RequestDispatcher dis = request.getRequestDispatcher("./home.jsp");
		
		dis.forward(request, response);
				
				
		
		
	}


}
