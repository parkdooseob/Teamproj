package Comment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CommentInsertController")
public class CommentInsertController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CommentInsertController 들어옴");
		String content = request.getParameter("content");
		int room_no = Integer.parseInt(request.getParameter("room_no"));
		//email받아오기
		//String email = request.getParameter("email");
		CommentDao cDao = new CommentDao();
		int commentNo = cDao.insertComment(room_no, content);
//		int result = cDao.insertComment(room_no, email, content);
		request.setAttribute("commentNo", commentNo);
		
		PrintWriter out = response.getWriter();
		out.println(commentNo);
	}

}
