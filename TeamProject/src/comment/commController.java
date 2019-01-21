package comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/commController.do")
public class commController extends HttpServlet {
      
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		//post타입으로 연결할 jsp페이지를 getParameter로 요청(textarea)
		String t_co =request.getParameter("t_comment");
		System.out.println("콘솔창으로 보냈다"+t_co);
				
		//객체화(인스턴스)
		commentDAO dao = new commentDAO();
		
		//dao만들고 난후 이거t_co 값 넣기
		dao.insertComment(t_co);
		
		
	}

}
