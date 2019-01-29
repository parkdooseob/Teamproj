package Comment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;




@WebServlet("/CommentSelectController")
public class CommentSelectController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("selectcontroller에 들어옴");
		int startNo = Integer.parseInt(request.getParameter("startNo"));
		int room_no = Integer.parseInt(request.getParameter("room_no"));
		CommentDao cDao = new CommentDao();
		JSONArray ar = cDao.getSelectComment(startNo, room_no);
		PrintWriter out = response.getWriter();
		out.println(ar);
	}

}
