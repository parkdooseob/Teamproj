package Controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DAO;
import DB.SelectDTO;


@WebServlet("/detailPageController.do")
public class detailPageController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int a = Integer.parseInt(request.getParameter("a"));
		RequestDispatcher dis = request.getRequestDispatcher("detail.jsp");
		DAO dao = new DAO();

		if(a == 1) {
						
			Vector<SelectDTO> vector =	dao.select(1);
			request.setAttribute("vector", vector);
			
			dis.forward(request, response);
		}
		else if(a == 2) {
			
			Vector<SelectDTO> vector =	dao.select(2);
			request.setAttribute("vector", vector);
						
			dis.forward(request, response);
			
		}
		else if(a == 3) {
			

				
			Vector<SelectDTO> vector =	dao.select(3);
			request.setAttribute("vector", vector);
			dis.forward(request, response);
		}
		else if (a == 4) {
			
			
			Vector<SelectDTO> vector =	dao.select(4);
			request.setAttribute("vector", vector);
			dis.forward(request, response);
		}else {
			System.out.println("올바른경로로 접속하시오.");
		}
		
		
		
	}

}
