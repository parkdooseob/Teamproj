package RechargePayment;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;

@WebServlet("/RechargeController.do")
public class RechargeController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("point1");
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		int addedPoint = Integer.parseInt(request.getParameter("addedPoint"));
		
		UserDAO dao = new UserDAO();

		
		
		int result = dao.recharge(email, addedPoint);
		System.out.println(email);
		System.out.println(addedPoint);
				
		if(result == 1){//성공
			// 현재 세션에 변경된 포인트값을 넣어준다.
			HttpSession session = request.getSession();
			if(session.getAttribute("udto")!= null){
				user.UserDTO udto = (user.UserDTO)session.getAttribute("udto");
				String uemail = udto.getEmail();
				
				user.UserDTO dto = dao.getUser(uemail);
				
				udto.setPoint(dto.getPoint());
				
				session.setAttribute("udto", udto);
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter printWriter = response.getWriter();
				printWriter.println("<script>");
				printWriter.println("alert('충전 완료')");
				printWriter.println("location.href='user/userPage.jsp'");//마이페이지로 수정
				printWriter.println("</script>");
			}else{
				user.HostDTO hdto = (user.HostDTO)session.getAttribute("hdto");
				String uemail = hdto.getEmail();
				
				user.UserDTO dto = dao.getUser(uemail);				
				
				session.setAttribute("point", dto.getPoint());
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter printWriter = response.getWriter();
				printWriter.println("<script>");
				printWriter.println("alert('충전 완료')");
				printWriter.println("location.href='user/hostPage.jsp'");//마이페이지로 수정
				printWriter.println("</script>");
				
			}
			
			
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter printWriter = response.getWriter();
			printWriter.println("<script>");
			printWriter.println("alert('재 확인 필요')");
			printWriter.println("location.href='user/userPage.jsp'");//마이페이지로 수정
			printWriter.println("</script>");
		}
		
	}

}
