package home;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
					ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");

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
			public int popularSpace(){
				System.out.println("요청 들어옴");
				int result = 0;
				try {
					con = ds.getConnection();	
					System.out.println("연결됨");
					String sql = "update user2 set point=? where email=?";
					sql = "select * from hosting h join hosting_pic"
							+ "on ";
					/*
					select * from hosting h join hosting_pic pic
					on h.room_no = pic.room_no
					join (select room_no, count(*) from booking
					 		where
					on h.room_no = b.room_no
					left outer join review r
					on h.room_no = r.room_no
					
					*/
					
					pstmt = con.prepareStatement(sql);
//					pstmt.setInt(1, addedPoint);
//					pstmt.setString(2, email);
					
					result = pstmt.executeUpdate();
					System.out.println(result);
				} catch (SQLException e) {
					System.out.println("recharge() 함수 오류"+e);
					e.printStackTrace();
				} finally {
					freeResource();
				}
				
				return result;
			}
			
			
			/*
			public int recharge(String email, int addedPoint){
				System.out.println("요청 들어옴");
				int result = 0;
				try {
					con = ds.getConnection();	
					System.out.println("연결됨");
					String sql = "update user2 set point=? where email=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, addedPoint);
					pstmt.setString(2, email);
					
					result = pstmt.executeUpdate();
					System.out.println(result);
				} catch (SQLException e) {
					System.out.println("recharge() 함수 오류"+e);
					e.printStackTrace();
				} finally {
					freeResource();
				}
				
				return result;
			}
			*/

}
