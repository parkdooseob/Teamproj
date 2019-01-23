package bbs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BbsController.do")
public class BbsController extends HttpServlet {
      
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//post타입으로 연결할 jsp페이지를 getParameter로 요청(textarea)
		String b_title =request.getParameter("bbsTitle");
		String b_content =request.getParameter("bbsContent");
		System.out.println("제목:"+b_title);
		System.out.println("내용:"+b_content);
				
		//객체화(인스턴스)
		BbsDAO dao = new BbsDAO();
		
		//dao만들고 난후 값 넣기
		dao.insertBbs(b_title, b_content);
		
		
	}

}
