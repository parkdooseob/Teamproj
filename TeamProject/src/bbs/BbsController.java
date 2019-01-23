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
		
		//postŸ������ ������ jsp�������� getParameter�� ��û(textarea)
		String b_title =request.getParameter("bbsTitle");
		String b_content =request.getParameter("bbsContent");
		System.out.println("����:"+b_title);
		System.out.println("����:"+b_content);
				
		//��üȭ(�ν��Ͻ�)
		BbsDAO dao = new BbsDAO();
		
		//dao����� ���� �� �ֱ�
		dao.insertBbs(b_title, b_content);
		
		
	}

}
