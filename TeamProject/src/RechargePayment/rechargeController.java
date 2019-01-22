package RechargePayment;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;

@WebServlet("/rechargeController.do")
public class rechargeController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		int addedPoint = Integer.parseInt(request.getParameter("addedPoint"));
		
		UserDAO dao = new UserDAO();
		
		int result = dao.recharge(email, addedPoint);
		System.out.println(email);
		System.out.println(addedPoint);
				
		if(result == 1){//성공
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter printWriter = response.getWriter();
			printWriter.println("<script>");
			printWriter.println("alert('충전 완료')");
			printWriter.println("location.href='./Main.me'");//마이페이지로 수정
			printWriter.println("</script>");
			
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter printWriter = response.getWriter();
			printWriter.println("<script>");
			printWriter.println("alert('재 확인 필요')");
			printWriter.println("location.href='./Main.me'");//마이페이지로 수정
			printWriter.println("</script>");
		}
		
	}

}
