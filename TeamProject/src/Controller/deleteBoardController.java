package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DAO;
import DB.HostingDTO;


@WebServlet("/deleteBoardController.do")
public class deleteBoardController extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//room_no값으로 where 찾아서 delete
		int room_no ;
		room_no =  Integer.parseInt(request.getParameter("roomNo"));
		
		DAO dao = new DAO();
		HostingDTO dto = new HostingDTO();
		dto.setRoom_no(room_no);
		
		dao.delete(dto);
		
		//작업다 끝낸뒤 detail.jsp로 이동
		RequestDispatcher dis = 
					request.getRequestDispatcher("MyPageDetail.jsp");
		
		dis.forward(request	,response);
		
		
		
	}

}
