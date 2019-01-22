package home;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import db.CarConfirmBean;
//import db.CarDAO;


@WebServlet("/Home.do")
public class HomeController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request, response);
	}

	protected void Process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("접속");
		homeDAO dao = new homeDAO();
		
		Vector<homeDTO> popularV = dao.popularSpace();
		Vector<homeDTO> recommendV = dao.RecommendSpace();
	
		request.setAttribute("popularV", popularV);
		request.setAttribute("recommendV", recommendV);
		
		RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
		dis.forward(request, response);
	}
	

}
