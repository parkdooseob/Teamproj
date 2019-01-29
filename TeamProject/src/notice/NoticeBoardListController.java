package notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.HostDTO;

@WebServlet("/NoticeBoardListController.do")
public class NoticeBoardListController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}
	
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//  寃뚯떆�뙋 �쟾泥� 湲��쓽 媛쒖닔 
			// �뵒鍮� 媛앹껜 �깮�꽦 ReBoardDAO bdao
			NoticeBoardDAO bdao = new NoticeBoardDAO();			
			// int count =  硫붿꽌�뱶�샇異�  getBoardCount()   count(*)
			int count=bdao.getNoticeCount();
			// 게시판 가져오기  2페이지 10개 => 시작행 끝행
			// 한페이지에 5개 글을 가져오도록 설정
			int pageSize=5;
			// �럹�씠吏� 媛��졇�삤湲�
			// �븯�떒�쓽 �럹�씠吏� 踰덊샇瑜� �닃���쓣 �븣 �꽆�뼱�삤�뒗 媛�
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null){
				pageNum="1";
			}
			// �떆�옉�뻾踰덊샇 援ы븯湲�  10  1�럹�씠吏�  1踰덊뻾   2�럹�씠吏�  11踰덊뻾   3  21踰덊뻾
			int currentPage=Integer.parseInt(pageNum);
			int startRow=(currentPage-1)*pageSize+1;
			// �걹�뻾踰덊샇
			int endRow=currentPage*pageSize;
			
			// �쁽�옱 �꽭�뀡�쓽 �샇�뒪�듃 id 媛믪쓣 諛쏆븘�삤湲�
			HttpSession session = request.getSession();
			HostDTO hdto  = (HostDTO)session.getAttribute("hdto");
			String host_id = "hello"; //hdto.getHost_id();
			
			List<NoticeBoardDTO> noticedList=null;
			//  �떆�옉�뻾踰덊샇  紐뉕컻(10) 媛��졇�삤湲�
			// boardList=硫붿꽌�뱶�샇異�  getBoardList(�떆�옉�뻾startRow,紐뉕컻pageSize)
			if(count!=0){
				noticedList=bdao.getNoticeList(startRow, pageSize);
			}
			//�쟾泥� �럹�씠吏� �닔 援ы븯湲�  50媛� 湲�  10媛쒖뵫 蹂댁뿬二쇨린 => 5+0
					//                 55媛� 湲� 10媛쒖뵫 蹂댁뿬二쇨린 => 5+1
			int pageCount =count/pageSize+(count%pageSize==0?0:1);
			//�븳�솕硫댁뿉 蹂댁뿬以� �럹�씠吏��닔 �꽕�젙
			int pageBlock=3;
			// �븳�솕硫댁뿉 蹂댁뿬以� �떆�옉�럹�씠吏� 援ы븯湲�  1~10  => 1  /  11~20 => 11
			int startPage=((currentPage-1)/pageBlock)*pageBlock+1;
			// �븳�솕硫댁뿉 蹂댁뿬以� �걹�럹�씠吏� 援ы븯湲�
			int endPage=startPage+pageBlock-1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
			// request  count boardList pageNum 
					// pageCount pageBlock startPage endPage���옣
			request.setAttribute("count", count); //紐⑤뱺�냽�꽦���옣 Integer -> Object�삎���옣
			request.setAttribute("noticedList", noticedList); // List -> Object ���옣
			request.setAttribute("pageNum", pageNum); //String -> Object ���옣
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			// �씠�룞   reBoard.jsp
			RequestDispatcher dis = request.getRequestDispatcher("footer/noticeBoard.jsp");
			System.out.println("�뵒�뒪�뙣爾�");
			dis.forward(request, response);
			
			/*forward.setRedirect(false);
			forward.setPath("./CarMain.jsp?center=board/list.jsp");
			return forward;*/

	
	}


}
