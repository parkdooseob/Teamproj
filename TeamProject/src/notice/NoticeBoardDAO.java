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
		// DB 작업 객체
		private Connection con;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		
		// 커넥션 풀을 담을 변수 선언
		DataSource ds = null;
		// 생성자
		public NoticeBoardDAO() {
			try {
				// 1. Was서버와 연결된 웹프로젝트의 모든정보를 가지고 있는 컨텍스트 객체 생성
				Context init = new InitialContext();
				// 2. 연결된 Was서버에서 DataSource(커넥션 풀)을 검색해서 얻기
				ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
				ds = (DataSource)init.lookup("java:comp/env/jdbc/sharespace");
				
			} catch (Exception e) {
				System.out.println("커넥션풀 가져오기 실패 : "+e);
			}
		}// 생성자 끝
		
		// 리소스 반납(해제) 메서드
		public void freeResource(){
			if(con != null){
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if(rs != null){
				try {
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}if(pstmt != null){
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		// 전체 게시글 갯수 가져오는 메서드
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
		//모든 행의 DTO
		public List<NoticeBoardDTO> getNoticeList(int startRow,int pageSize){
			System.out.println("리스트 메서드");
			String sql="";
			List<NoticeBoardDTO> noticedList=new ArrayList<NoticeBoardDTO>();
			try{
				//1,2  디비연결
				con= ds.getConnection();
				//3 sql 전체 board 글가져오기   
				//정렬 최근글 맨처음 re_ref내림차순 답글순서 re_seq 오름차순
				// limit 시작행-1 , 몇개 
				/*sql="select * from board2 order by re_ref desc, re_seq asc limit ?,?";*/
				sql = "SELECT * FROM hosting order by room_no limit ?,?";
				pstmt=con.prepareStatement(sql);				
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				//4 rs = 실행 저장
				rs=pstmt.executeQuery();
				//5 rs 다음행이동 데이터 있으면  ReBoardDTO rb 객체 생성
				//    bb 멤버변수  <-  rs 열을 저장
				//  배열 boardList 한칸 저장
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
