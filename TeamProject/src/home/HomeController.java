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
		
		
		//1. DTO 객체 만들어 놓고?
		
		//2. DAO SELECT * 해서 다 담아서 오고..
		
		//3. 담아온 객체를 벡터에 담아서 
		
		//4. HOME.JSP에 뿌린다.
		/**
		 
		 추천 공간 사진 받아올 때 필요한 테이블

1. 공간 space
2. 사진 hosting_pic
3. 유저 host
4. 추천 수

공간 이름 => 공간에 있고
공간 유형 => 공간
사진 => 사진
유저=>호스트

공간이랑 사진은 join

<추천 공간> 유저 레벨이 2에서 추천 수가 높은 순으로 정렬
select s.공간 제목, s.공간유형, p사진1   ,  sum(별점), 룸번호

from space s join with picture p 
where s.host in (select host_no from host_user where host_level = 3)
as 호스트 번호가 같은곳으로 
join with review r as 룸 자동 생성번호가 같은데로
order_by sum(별점)

추천수 : 
select sum(별점), 룸번호 from review
group by 룸번호
oderby sum(별점); 

<인기공간>
select  s.공간 이름(글 제목이랑은 다를 수 있음), s.공간유형, p사진1  
order by 추천수


 
		 * */
		
		//예약확인(검색)을 위해  요청값(입력했던 폰번호,비밀번호)을 이용하여 ... 검색!
				//1. DB작업을 위한 CarDAO객체 생성
//				CarDAO cdao  = new CarDAO();
				//검색조건1. 전화번호와 비밀번호를 기준으로 하여 검색 
				//검색조건2. 현재 날짜보다 이전 날짜에 예약한 현황은 보여 주지 말아라! 
				
				//2. 예약확인(검색)을 위한 메소드 호출시 ~  입력했던 폰번호, 비밀번호를 전달 ~ 
//				Vector<CarConfirmBean>  v = cdao.getAllCarOrder(memberphone,memberpass);
				
				//CarReserveResult.jsp(예약현황을 확인 하는 페이지 View)로...
				//응답데이터를 전달 하기 위해.. request(탁자)에  백터(응답서류)를 올려 놓는다
//				req.setAttribute("v", v);
		
		
//		RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
//		dis.forward(request, response);
	}
	

}
