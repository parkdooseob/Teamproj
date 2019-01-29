package Comment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CommentUpdateController")
public class CommentUpdateController extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comment_no = request.getParameter("comment_no");
		String content = request.getParameter("content");
		CommentDao cDao = new CommentDao();
		int result = cDao.updateComment(comment_no, content);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}

}
