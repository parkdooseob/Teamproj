package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import home.SearchDTO;

public class ReservListDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 커넥션풀을 담을 변수 선언
	private DataSource ds;

	// 생성자
	public ReservListDAO() {
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
	
	/**예약 시간 추출 메소드
	 * String 배열로 시작 시간 끝 시간 return*/
	
	public int[] time(int t10, int t11, int t12, int t13, 
					   int t14, int t15, int t16, int t17, 
					   int t18, int t19, int t20, int t21){
		
		int[] timeS = new int[2];
	
		// 시작 시간  끝 시간 
		ArrayList rd = new ArrayList();
	
		rd.add(t10);
		rd.add(t11);
		rd.add(t12);
		rd.add(t13);
		rd.add(t14);
		rd.add(t15);
		rd.add(t16);
		rd.add(t17);
		rd.add(t18);
		rd.add(t19);
		rd.add(t20);
		rd.add(t21);
		
		int start = (rd.indexOf(1)) + 10;
		int end = (rd.lastIndexOf(1)) + 10;
		timeS[0] = start;
		timeS[1] = end;
		
		
		
		return timeS;
		
	} 
	
	
	/**예약 상태 추출 메소드
	 * 0: 사용 전 예약
	 * 1. 지난 예약
	 * 2. 취소된 예약*/
	public int rStatus(int check, Date date){
		Date now = new Date();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		Date resD = null;
		try {
			now = fm.parse(fm.format(now));
			resD = fm.parse(fm.format(date));
		} catch (ParseException e) {
			System.out.println("날짜 계산에서 오류");
			e.printStackTrace();
		}
		
		int status = 0;
		
		if(check == 1){//예약 취소`
			status = 2;
		}else if(check == 0 && (now.getTime()-resD.getTime()) >= 0){//0까지는 오늘 예약
			status = 0;
		}else if(check == 0 && (now.getTime()-resD.getTime()) < 0){// 지난 예약
			status = 1;
		}
		
		
		return status;
	}
	
	/**홈에서 선택된 공간 찾기 */
	public Vector<ReservListDTO> getList(String id){
		System.out.println("요청 들어옴");
		
		Vector<ReservListDTO> ReservList = new Vector<ReservListDTO>();
		
		try {
			con = ds.getConnection();	
			System.out.println("연결됨");
			String sql = "select * from " 
						+"booking b join booking_time t " 
						+"on b.book_no = t.book_no "
						+"join review r "
						+"on b.book_no = r.book_no "
						+"where b.email = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
		
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ReservListDTO dto = new ReservListDTO();
				dto.setBook_no(rs.getInt("book_no")); 
				dto.setEmail(id);
				dto.setBook_date(rs.getDate("book_date"));
				dto.setTotal_price(rs.getInt("total_price"));
				dto.setRoom_no(rs.getInt("room_no"));
//				dto.setBook_check(rs.getInt("book_check"));
				int[] timeS = new int[2];
				timeS = time(rs.getInt("t10"),rs.getInt("t11"),rs.getInt("t12"),rs.getInt("t13"),rs.getInt("t14"),
					 rs.getInt("t15"),rs.getInt("t16"),rs.getInt("t17"),rs.getInt("t18"),
					 rs.getInt("t19"),rs.getInt("t20"),rs.getInt("t21"));
				dto.setStartT(timeS[0]);
				dto.setEndT(timeS[1]);
//				dto.setT10(rs.getInt("t10"));
//				dto.setT11(rs.getInt("t11"));
//				dto.setT12(rs.getInt("t12"));
//				dto.setT13(rs.getInt("t13"));
//				dto.setT14(rs.getInt("t14"));
//				dto.setT15(rs.getInt("t15"));
//				dto.setT16(rs.getInt("t16"));
//				dto.setT17(rs.getInt("t17"));
//				dto.setT18(rs.getInt("t18"));
//				dto.setT19(rs.getInt("t19"));
//				dto.setT20(rs.getInt("t20"));
//				dto.setT21(rs.getInt("t21"));
				dto.setrStatus(rStatus(rs.getInt("book_check"), rs.getDate("book_date")));
				dto.setReview_no(rs.getInt("review_no"));
				dto.setRv_date(rs.getDate("rv_date"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_post(rs.getString("rv_post"));
				
				ReservList.add(dto);
			}
			
		
		} catch (SQLException e) {
			System.out.println("FindSpaces 함수 오류"+e);
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return ReservList;
	}
}


