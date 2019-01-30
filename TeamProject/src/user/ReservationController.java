package user;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReservationController
 */
@WebServlet("/ReservationController.do")
public class ReservationController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("get요청");
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("userId");
//		System.out.println(id);
		ReservListDAO dao = new ReservListDAO();
		
		Vector<ReservListDTO> rList = dao.getList(id);
		
		request.setAttribute("rList", rList);
//		System.out.println("Getlist 담김2");
		RequestDispatcher dis = request.getRequestDispatcher("/user/reservationList.jsp");
		dis.forward(request, response);
//		System.out.println("Getlist 보내짐");
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post요청");
	}

}
