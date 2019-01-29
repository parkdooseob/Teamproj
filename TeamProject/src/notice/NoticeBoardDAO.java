package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class NoticeBoardDAO {
	// DB �옉�뾽 媛앹껜
		private Connection con;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		
		// 而ㅻ꽖�뀡 ���쓣 �떞�쓣 蹂��닔 �꽑�뼵
		DataSource ds = null;
		// �깮�꽦�옄
		public NoticeBoardDAO() {
			// TODO Auto-generated constructor stub
			try {
				// 1. Was�꽌踰꾩� �뿰寃곕맂 �쎒�봽濡쒖젥�듃�쓽 紐⑤뱺�젙蹂대�� 媛�吏�怨� �엳�뒗 而⑦뀓�뒪�듃 媛앹껜 �깮�꽦
				Context init = new InitialContext();
				// 2. �뿰寃곕맂 Was�꽌踰꾩뿉�꽌 DataSource(而ㅻ꽖�뀡 ��)�쓣 寃��깋�빐�꽌 �뼸湲�
				ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("而ㅻ꽖�뀡�� 媛��졇�삤湲� �떎�뙣 : "+e);
			}
		}// �깮�꽦�옄 �걹
		
		// 由ъ냼�뒪 諛섎궔(�빐�젣) 硫붿꽌�뱶
		public void freeResource(){
			if(con != null){
				try {
					con.close();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
			if(rs != null){
				try {
					rs.close();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}if(pstmt != null){
				try {
					pstmt.close();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}
		
		// �쟾泥� 寃뚯떆湲� 媛��닔 媛��졇�삤�뒗 硫붿꽌�뱶
		public int getNoticeCount(){
			System.out.println("전체 게시글 메서드");
			String sql="";
			int count=0;
			try {
				//1,2 디비연결  메서드호출
				con = ds.getConnection();
				//3 sql count(*)
				sql="select count(*) from hosting";
				pstmt=con.prepareStatement(sql);
				//4 rs = 실행 저장
				rs=pstmt.executeQuery();
				//5 rs 첫행이동 데이터있으면  count=저장
				if(rs.next()){
					count=rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				freeResource();
			}
			return count;
		}
		// 紐⑤뱺 �뻾�쓽 DTO
		public List<NoticeBoardDTO> getNoticeList(int startRow,int pageSize){
			System.out.println("리스트 메서드");
			String sql="";
			List<NoticeBoardDTO> noticedList=new ArrayList<NoticeBoardDTO>();
			try{
				//1,2 �뵒鍮꾩뿰寃�
				con= ds.getConnection();
				//3 sql �쟾泥� board 湲�媛��졇�삤湲�  
				//�젙�젹 理쒓렐湲� 留⑥쿂�쓬 re_ref�궡由쇱감�닚 �떟湲��닚�꽌 re_seq �삤由꾩감�닚
				// limit �떆�옉�뻾-1 , 紐뉕컻 
				/*sql="select * from board2 order by re_ref desc, re_seq asc limit ?,?";*/
				// DB Subject
				sql = "SELECT * FROM hosting order by room_no limit ?,?";
				pstmt=con.prepareStatement(sql);				
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				//4 rs = �떎�뻾 ���옣
				rs=pstmt.executeQuery();
				//5 rs �떎�쓬�뻾�씠�룞 �뜲�씠�꽣 �엳�쑝硫�  ReBoardDTO rb 媛앹껜 �깮�꽦
				//    bb 硫ㅻ쾭蹂��닔  <-  rs �뿴�쓣 ���옣
				//  諛곗뿴 boardList �븳移� ���옣
				while(rs.next()){
					NoticeBoardDTO rb=new NoticeBoardDTO();
					rb.setHost_id(rs.getString("host_id"));
					rb.setRoom_no(rs.getInt("room_no"));
					rb.setSubject(rs.getString("subject"));
					rb.setRoom(rs.getString("room"));
					rb.setPeople(rs.getString("people"));
					rb.setDrink(rs.getInt("drink"));
					rb.setElevator(rs.getInt("elevator"));
					rb.setToilet(rs.getInt("toilet"));
					rb.setAirconditioner(rs.getInt("airconditioner"));
					rb.setHeating(rs.getInt("heating"));
					rb.setSocket(rs.getInt("socket"));					
					noticedList.add(rb);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				freeResource();
			}
			return noticedList;
		}
		
}
