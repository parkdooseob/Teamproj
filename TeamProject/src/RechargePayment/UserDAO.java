package RechargePayment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import user.UserDTO;

public class UserDAO {
	// DB작업할 삼총사 객체를 담을 변수 선언
			private Connection con;
			private PreparedStatement pstmt;
			private ResultSet rs;

			// 커넥션풀을 담을 변수 선언
			private DataSource ds;

			// 생성자
			public UserDAO() {
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
			
			public int recharge(String email, int addedPoint){
				System.out.println("요청 들어옴");
				int result = 0;
				try {
					con = ds.getConnection();	
					System.out.println("연결됨");
					String sql = "update user set point=? where email=?";
					
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

			// 회원정보 가져오기 메서드
			public UserDTO getUser(String email) {
				
				UserDTO udto = new UserDTO();
				
				try {
					
					con = ds.getConnection();
					
					String sql = "SELECT * FROM user WHERE email=?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, email);		
					
					rs = pstmt.executeQuery();		
					
					rs.next();		
					
					udto.setEmail(rs.getString("email"));
					udto.setPass(rs.getString("pass"));
					udto.setName(rs.getString("name"));
					udto.setHost_check(rs.getInt("host_check"));
					udto.setPoint(rs.getInt("point"));
					
					
					
				} catch (Exception e) {
					System.out.println("userCheck() 메서드에서 "+e);
				} finally {
					freeResource();
				}
				
				
				return udto;
			}
}
