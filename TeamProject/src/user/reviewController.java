package user;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/reviewController.do")
public class reviewController extends HttpServlet {
    
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("리뷰 요청 들어옴");
		request.setCharacterEncoding("UTF-8");
		/*
		private int review_no;
		private int book_no;
		private int room_no;
		private String email;
		private Date re_date;
		private int re_point;
		private String re_content;
		*/
		
		String book_no = request.getParameter("book_no");
		String room_no = request.getParameter("room_no");
		String email = request.getParameter("email");
		String re_point = request.getParameter("re_point");
		String re_content = request.getParameter("re_content");
		
		ReviewDAO dao = new ReviewDAO();
		
		int result = dao.addReview(book_no, room_no, email, re_point, re_content);
		
		if(result ==1){
			//성공
		}
		
		
		
		
	}

}
