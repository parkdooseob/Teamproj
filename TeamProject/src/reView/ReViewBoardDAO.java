package reView;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DB.HostingDTO;
public class ReViewBoardDAO {
	// DB 작업 객체
		private Connection con;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		
		// 커넥션 풀을 담을 변수 선언
		DataSource ds = null;
		// 생성자
		public ReViewBoardDAO() {
			// TODO Auto-generated constructor stub
			try {
				// 1. Was서버와 연결된 웹프로젝트의 모든정보를 가지고 있는 컨텍스트 객체 생성
				Context init = new InitialContext();
				// 2. 연결된 Was서버에서 DataSource(커넥션 풀)을 검색해서 얻기
				ds = (DataSource)init.lookup("java:comp/env/jdbc/sharespace");
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("커넥션풀 가져오기 실패 : "+e);
			}
		}// 생성자 끝
		
		// 리소스 반납(해제) 메서드
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
		
		// 전체 게시글 갯수 가져오는 메서드
		public int getBoardCount(){
			System.out.println("전체 게시글 메서드");
			String sql="";
			int count=0;
			try {
				//1,2 디비연결  메서드호출
				con = ds.getConnection();
				//3 sql count(*)
				sql="select count(*) from review";
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
		// 모든 행의 DTO
		public List<ReViewBoardDTO> getBoardList(int startRow,int pageSize, String email){
			System.out.println("리스트 메서드");
			String sql="";
			List<ReViewBoardDTO> boardList=new ArrayList<ReViewBoardDTO>();
			try{
				//1,2 디비연결
				con= ds.getConnection();
				//3 sql 전체 board 글가져오기  
				//정렬 최근글 맨처음 re_ref내림차순 답글순서 re_seq 오름차순
				// limit 시작행-1 , 몇개 
				/*sql="select * from board2 order by re_ref desc, re_seq asc limit ?,?";*/
				sql = "SELECT * FROM review WHERE email=? order by rv_date limit ?,?";
				pstmt=con.prepareStatement(sql);				
				pstmt.setString(1, email);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				//4 rs = 실행 저장
				rs=pstmt.executeQuery();
				//5 rs 다음행이동 데이터 있으면  ReBoardDTO rb 객체 생성
				//    bb 멤버변수  <-  rs 열을 저장
				//  배열 boardList 한칸 저장
				while(rs.next()){
					ReViewBoardDTO rb=new ReViewBoardDTO();
					rb.setRoom_no(rs.getInt("room_no"));					
					rb.setEmail(rs.getString("email"));
					rb.setName(rs.getString("name"));										
					rb.setRv_date(rs.getTimestamp("rv_date"));
					rb.setRv_star(rs.getInt("rv_star"));
					rb.setRv_post(rs.getString("rv_post"));
					boardList.add(rb);
				}
			}catch(Exception e){
				System.out.println("getBoardList() 메서드에서 "+e);
			}finally {
				freeResource();
			}
			return boardList;
		}

		public HostingDTO getHostingList(int i) {
			// TODO Auto-generated method stub
			HostingDTO hodto = new HostingDTO();
				
			try {
				
				con = ds.getConnection();
				
				String sql = "SELECT * FROM hosting WHERE room_no = ?";			
				
				pstmt = con.prepareStatement(sql);
					
				pstmt.setInt(1, i);
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				
				return hodto;
				
			} catch(Exception e){
				System.out.println("getHostingList() 메서드에서 "+e);
			}finally {
				freeResource();
			}
			
			
			
			return null;
		}
		
}
