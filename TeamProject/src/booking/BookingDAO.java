package booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookingDAO {

	
	// DB 작업 객체
		private Connection con;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		
		// 커넥션 풀을 담을 변수 선언
		DataSource ds = null;
		// 생성자
		public BookingDAO() {
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

		public BookingDTO getPreBookingList(String roomNumber) {
			// TODO Auto-generated method stub
			
				BookingDTO boodto = new BookingDTO();
			
			try {
				System.out.println("다오왔다");
				
				con = ds.getConnection();
				
				String sql = "SELECT h.subject, h.people, h.content, hp.pic1,"
						+ " ho.parking, ho.wifi, ho.projector, "
						+ "ho.laptop, ho.cabinet "
						+ "FROM hosting h join hosting_pic hp on h.room_no = hp.room_no "
						+ "join hosting_option ho on h.room_no = ho.room_no "
						+ "WHERE h.room_no=?";				
				
				pstmt = con.prepareStatement(sql);
				
				if(roomNumber.equals("")){
					roomNumber = "1";
				}
				
				pstmt.setString(1, roomNumber);
				
				System.out.println(pstmt.toString());
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				boodto.setRoom_no(Integer.parseInt(roomNumber));
				boodto.setPeople(rs.getString("people"));
				boodto.setSubject(rs.getString("subject"));
				boodto.setContent(rs.getString("content"));
				boodto.setPic1(rs.getString("pic1"));
				boodto.setParking(rs.getInt("parking"));
				boodto.setWifi(rs.getInt("wifi"));
				boodto.setProjector(rs.getInt("projector"));
				boodto.setLaptop(rs.getInt("laptop"));
				boodto.setCabinet(rs.getInt("cabinet"));
				
				return boodto;
				
			} catch (Exception e) {
				System.out.println("getPreBookingList() 메서드에서 "+e);
			} finally{
				freeResource();
			}	
			
			return null;
		}
	
	
		
		
		
	
}
