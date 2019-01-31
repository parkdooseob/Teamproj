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
	

	
	/**예약 상태 추출 메소드
	 * 0: 사용 전 예약
	 * 1. 지난 예약
	 * 2. 취소된 예약*/
	public int rStatus(int check, java.sql.Date date){
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
		}else if(check == 0 && (now.getTime()-resD.getTime()) < 0){//0까지는 오늘 예약
			status = 0;
		}else if(check == 0 && (now.getTime()-resD.getTime()) >= 0){// 지난 예약
			status = 1;
		}
		
		
		return status;
	}
	
	/**홈에서 선택된 공간 찾기 */
	public Vector<ReservListDTO> getList(String id){
		System.out.println("getList요청 들어옴");
		
		Vector<ReservListDTO> ReservList = new Vector<ReservListDTO>();
		
		
		
		try {
			con = ds.getConnection();	
			System.out.println("연결됨");
			String sql = "select * from " 
						+"booking b join booking_time t " 
						+"on b.book_no = t.book_no "
						+"left outer join review r "
						+"on b.book_no = r.book_no "
						+"join hosting h "
						+"on b.room_no = h.room_no "
						+"join hosting_pic p "
						+"on b.room_no = p.room_no "
						+"where b.email = ? "
						+"order by b.book_no desc";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			System.out.println("Getlist 실행됨");
		
			rs = pstmt.executeQuery();
//			System.out.println("P1");
			while(rs.next()){
//				System.out.println("P2");
				ReservListDTO dto = new ReservListDTO();
				dto.setBook_no(rs.getInt("book_no")); 
				dto.setEmail(id);
				dto.setBook_date(rs.getDate("book_date"));
				dto.setTotal_price(rs.getInt("total_price"));
				dto.setRoom_no(rs.getInt("room_no"));
				dto.setSubject(rs.getString("subject"));
//				dto.setBook_check(rs.getInt("book_check"));

				/**booking_time table 값 받아오기 for*/
				String prefix = "T";
				ArrayList timeTb = new ArrayList();
				for(int i = 10; i < 22; i++){
					String postfix = String.valueOf(i);
					String index = prefix + postfix;
					timeTb.add(rs.getInt(index));
				}
				
				int StartTime = timeTb.indexOf(1)+10;
				int EndTime = timeTb.lastIndexOf(1)+10;
			
				dto.setStartT(StartTime); //예약 시작 시간 
				dto.setEndT(EndTime); // 예약 마감 시간
				
				
				dto.setPic1(rs.getString("pic1"));
				dto.setRoom_type(rs.getString("room_type"));
				
				// 예약 상태 (지난 예약, 취소 예약, 다가 올 예약 받는 함수)
				dto.setrStatus(rStatus(rs.getInt("book_check"), rs.getDate("book_date")));
				
				dto.setReview_no(rs.getInt("review_no"));
				dto.setRe_date(rs.getDate("re_date"));
				dto.setRe_point(rs.getInt("re_point"));
				dto.setRe_content(rs.getString("re_content"));
				
				ReservList.add(dto);
				System.out.println("Getlist 담김");
			}
			
		
		} catch (SQLException e) {
			System.out.println("getList 함수 오류"+e);
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return ReservList;
	}
}


