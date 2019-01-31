package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 커넥션풀을 담을 변수 선언
	private DataSource ds;

	// 생성자
	public ReviewDAO() {
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
	
	
	public int addReview(String book_no, String room_no, String email, String re_point, String re_content){
		int result = 0;
		Date now = new Date();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		try {
			now = fm.parse(fm.format(now));
		} catch (ParseException e) {
			System.out.println("addReview의 날짜 오류");
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		
	
		return result;
	
	
	}
	
}
