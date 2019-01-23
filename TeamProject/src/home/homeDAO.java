package home;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class homeDAO {
	// DB작업할 삼총사 객체를 담을 변수 선언
			private Connection con;
			private PreparedStatement pstmt;
			private ResultSet rs;

			// 커넥션풀을 담을 변수 선언
			private DataSource ds;

			// 생성자
			public homeDAO() {
				try {
					// 1.Was서버와 연결된 웹프로젝트의 모든정보를 가지고 있는 컨텍스트객체 생성
					Context init = new InitialContext();

					// 2.연결된 Was서버에서 DataSource(커넥션풀)을 검색해서 얻기
					ds = (DataSource) init.lookup("java:comp/env/jdbc/sharespace");

				} catch (Exception e) {
					System.out.println("커넥션풀 가져오기 실패 : " + e);
					e.printStackTrace();
				}
			}

			// 리소스 반납 (해제)메소드
			public void freeResource() {
				if (con != null) {
					try {
						con.close();
					} catch (Exception err) {
						err.printStackTrace();
					}
				}
				if (rs != null) {
					try {
						rs.close();
					} catch (Exception err) {
						err.printStackTrace();
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception err) {
						err.printStackTrace();
					}
				}
			}// 생성자 끝
			
			/**인기공간 찾기*/
			public Vector<homeDTO> popularSpace(){
				System.out.println("요청 들어옴");
				
				Vector<homeDTO> popularV = new Vector<homeDTO>();
				
				try {
					con = ds.getConnection();	
					System.out.println("연결됨");
					String sql = "select *	from hosting h join hosting_pic pic "
							+"on h.room_no = pic.room_no "
							+"join (select room_no, count(*) as 'count' from booking where book_check=0 group by room_no) b "
							+"on h.room_no = b.room_no "
							+"join (select room_no, avg(rv_star) as 'star' from review group by room_no ) r "
							+"on h.room_no = r.room_no "
							+"order by b.count*r.star desc";
						
					
					pstmt = con.prepareStatement(sql);
					/*
					 	private int host_id;	
	 					private int room_no;	
	 					private String subject;	
	 					private String room;	
	 					private int people;		
						private String pic1;	
						private int count;	
						private double star;
	 
					*/
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						homeDTO dto = new homeDTO();
						dto.setHost_id(rs.getString("host_id"));
						dto.setRoom_no(rs.getInt("room_no"));
						dto.setSubject(rs.getString("subject"));
						dto.setRoom(rs.getString("room"));
						dto.setPeople(rs.getInt("people"));
						dto.setPic1(rs.getString("pic1"));
						dto.setCount(rs.getInt("count"));
						dto.setStar(rs.getDouble("star"));
						popularV.add(dto);
					}
					
				
				} catch (SQLException e) {
					System.out.println("popularSpace() 함수 오류"+e);
					e.printStackTrace();
				} finally {
					freeResource();
				}
				
				return popularV;
			}
			
			/**추천 공간 찾기*/
			public Vector<homeDTO> RecommendSpace(){
				System.out.println("요청 들어옴");
				
				Vector<homeDTO> recommendV = new Vector<homeDTO>();
				
				try {
					con = ds.getConnection();	
					System.out.println("연결됨");
					
					String sql = "select * " 
					+"from hosting h join hosting_pic pic "
					+"on h.room_no = pic.room_no "
					+"join host "
					+"on  h.host_id = host.host_id "
					+"join (select room_no, count(*) as 'count' from booking where book_check=0 group by room_no) b "
					+"on h.room_no = b.room_no "
					+"join (select room_no, avg(rv_star) as 'star' from review group by room_no ) r "
					+"on h.room_no = r.room_no "
					+"where host_level = 3 "
    				+"order by b.count*r.star desc ";
						
					
					
					
					pstmt = con.prepareStatement(sql);
					/*
					 	private int host_id;	
	 					private int room_no;	
	 					private String subject;	
	 					private String room;	
	 					private int people;		
						private String pic1;	
						private int count;	
						private double star;
	 
					*/
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						homeDTO dto = new homeDTO();
						dto.setHost_id(rs.getString("host_id"));
						dto.setRoom_no(rs.getInt("room_no"));
						dto.setSubject(rs.getString("subject"));
						dto.setRoom(rs.getString("room"));
						dto.setPeople(rs.getInt("people"));
						dto.setPic1(rs.getString("pic1"));
						dto.setCount(rs.getInt("count"));
						dto.setStar(rs.getDouble("star"));
						recommendV.add(dto);
					}
					
					


				} catch (SQLException e) {
					System.out.println("popularSpace() 함수 오류"+e);
					e.printStackTrace();
				} finally {
					freeResource();
				}
				
				return recommendV;
			}
			

}
