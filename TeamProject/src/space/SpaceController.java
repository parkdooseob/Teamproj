package space;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Comment.CommentDTO;


@WebServlet("/m_detail")
public class SpaceController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int num =Integer.parseInt(request.getParameter("num"));
		SpaceDao dao = new SpaceDao();
		
		//space의 정보를 list에 담아온다
		List list = dao.getSpace(num);
		request.setAttribute("list", list);
		
		//comment를 가져온다
		ArrayList<CommentDTO> comList = new ArrayList<CommentDTO>();
		comList = dao.getCommentList(num);
		request.setAttribute("commentList", comList);
		//예약이 다찬 날짜를 가져온다
		List noList = dao.getNoDate(num);
		request.setAttribute("noList", noList);
		
		RequestDispatcher dis = request.getRequestDispatcher("m_detail.jsp");
		dis.forward(request, response);
	}
}
