package home;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SearchDAO {
	/*
select * from 
hosting h join hosting_option o
on h.room_no = o.room_no
join hosting_bill b
on h.room_no = b.room_no
join hosting_address a
on h.room_no = a.room_no
left outer join (select room_no, avg(re_point)  as 'star' from review group by room_no ) r
on h.room_no = r.room_no
left outer join (select room_no, sum(t10 + t11 + t12 + t13 + t14 + t15 + t16 + t17 + t18 + t19 + t20 + t21) as 'ch'
from booking b left outer join booking_time t
on b.book_no = t.book_no
where t.book_date = '2019-01-01'
and b.book_check = 0
group by b.room_no) c
on h.room_no = c.room_no
where c.ch != 12
and h.room_type = '카페'
and a.a_address like '%제주%'
and h.people = '소';
	*/
	
	// DB작업할 삼총사 객체를 담을 변수 선언
				private Connection con;
				private PreparedStatement pstmt;
				private ResultSet rs;

				// 커넥션풀을 담을 변수 선언
				private DataSource ds;

				// 생성자
				public SearchDAO() {
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
				
				/**홈에서 선택된 공간 찾기 */
				public Vector<SearchDTO> FindSpace(String type, String location, String date, String number){
					System.out.println("요청 들어옴");
					
					Vector<SearchDTO> FindV = new Vector<SearchDTO>();
					String bookDate = null;
					Date dateF;
					try {
						dateF = new SimpleDateFormat("yyyy년 mm월 dd일").parse(date);
						bookDate = new SimpleDateFormat("yyyy-MM-dd").format(dateF);
					} catch (ParseException e1) {
						System.out.println("날짜변환 오류");
					}
//					System.out.println(bookDate);
					
//					int people = 0;
//					if(number.equals("소")){
//						people = 0;
//					}else if(number.equals("중")){
//						people = 1;
//					}else if(number.equals("대")){
//						people = 2;
//					}
					
					try {
						con = ds.getConnection();	
						System.out.println("연결됨");
						String sql = "select * from "
								+"hosting h join hosting_option o "
								+"on h.room_no = o.room_no "
								+"join hosting_bill b "
								+"on h.room_no = b.room_no "
								+"join hosting_address a "
								+"on h.room_no = a.room_no "
								+"left outer join (select room_no, avg(re_point)  as 'star' from review group by room_no ) r "
								+"on h.room_no = r.room_no "
								+"left outer join (select room_no, sum(t10 + t11 + t12 + t13 + t14 + t15 + t16 + t17 + t18 + t19 + t20 + t21) as 'ch' "
								+"from booking b left outer join booking_time t "
								+"on b.book_no = t.book_no "
								+"where t.book_date = ? "
								+"and b.book_check = 0 "
								+"group by b.room_no) c "
								+"on h.room_no = c.room_no "
								+"where c.ch != 12 "
								+"and h.room_type = ? "
								+"and a.a_address like '%?%' "
								+"and h.people = ? ";
						
						
						
						
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, bookDate);// 날짜
						pstmt.setString(2, type);// 공간 윻ㅇ
						pstmt.setString(3, location);// 인원 
						pstmt.setString(4, number);// 인원 
						
					
						rs = pstmt.executeQuery();
						
						while(rs.next()){
							
							SearchDTO dto = new SearchDTO();
							dto.setHost_id(rs.getString("host_id"));
							dto.setRoom_no(rs.getInt("room_no")); 
							dto.setSubject(rs.getString("subject")); 
							dto.setRoom_type(rs.getString("room_type"));
							dto.setPeople(rs.getString("people"));
							dto.setDrink(rs.getInt("drink"));
							dto.setElevator(rs.getInt("elevator"));
							dto.setToilet(rs.getInt("toilet"));
							dto.setAirconditioner(rs.getInt("airconditioner"));
							dto.setHeating(rs.getInt("heating"));
							dto.setSocket(rs.getInt("socket"));
							
							dto.setContent(rs.getString("content"));
							dto.setFromdate(rs.getString("fromdate"));
							dto.setTodate(rs.getString("todate"));
							dto.setEtc(rs.getString("etc"));
							
							
							dto.setParking(rs.getInt("parking"));
							dto.setWifi(rs.getInt("wifi"));
							dto.setProjector(rs.getInt("projector"));
							dto.setLaptop(rs.getInt("laptop"));
							dto.setCabinet(rs.getInt("cabinet"));
							
							dto.setWeekday(rs.getInt("weekday"));
							dto.setHoliday(rs.getInt("holiday"));
							
							
							dto.setA_wdo(rs.getString("a_wdo"));
							dto.setA_kdo(rs.getString("a_kdo"));
							dto.setA_woo(rs.getString("a_woo"));
							dto.setA_address(rs.getString("a_address"));
							dto.setA_D_address(rs.getString("a_D_address"));
							dto.setA_etc_address(rs.getString("a_etc_address"));
							
							dto.setStar(rs.getDouble("star"));
							
							FindV.add(dto);
						}
						
					
					} catch (SQLException e) {
						System.out.println("FindSpaces 함수 오류"+e);
						e.printStackTrace();
					} finally {
						freeResource();
					}
					
					return FindV;
				}
}
