package home;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/search.do")
public class SearchController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request, response);
	}

	protected void Process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");//공간 타입
		String location = request.getParameter("location");//위치
		String date = request.getParameter("date");//날짜
		String number = request.getParameter("number");//수용인원수
		System.out.println(date);
		SearchDAO dao = new SearchDAO();
		Vector<SearchDTO> FindV = dao.FindSpace(type, location, date, number);
		
		request.setAttribute("FindV ", FindV );
		
		RequestDispatcher dis = request.getRequestDispatcher("Jong/detail.jsp");
		dis.forward(request, response);
	}

	
}
