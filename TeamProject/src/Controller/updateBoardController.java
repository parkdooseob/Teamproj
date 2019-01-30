package Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DB.DAO;
import DB.SelectDTO;


@WebServlet("/updateBoardController.do")
public class updateBoardController extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		
						
		int room_no = Integer.parseInt(request.getParameter("roomNo"));
		
		DAO dao = new DAO();
		
		SelectDTO dto =	dao.UserRoomSelect(room_no);
		
		

	request.setAttribute("dto", dto);
		
		
		//SelectDTO의 request값을 updateboard2.jsp로 전달하여 dto값 그대로 나타나게 함.
		RequestDispatcher dis = 
					request.getRequestDispatcher("updateBoard2.jsp");
		
		dis.forward(request, response);
			
		
		
		
	}

}
