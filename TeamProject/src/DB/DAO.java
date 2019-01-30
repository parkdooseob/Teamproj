package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon(){		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/sharespace");
			con = ds.getConnection(); 
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}//getCon()
	

	public void insert(HostingDTO dto, HostingBillDTO dto1, HostingOptionDTO dto2, HostingPicDTO dto3, HostingAddressDTO dto4) {
		
		getCon();				
		
		
		try {
			// hosting 테이블
			String sql ="insert into hosting values(?,null,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt =	con.prepareStatement(sql);
	
			pstmt.setString(1, dto.getHost_id());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getRoom());
			pstmt.setString(4, dto.getPeople());
			pstmt.setInt(5, dto.getDrink());
			pstmt.setInt(6, dto.getElevator());
			pstmt.setInt(7, dto.getToilet());
			pstmt.setInt(8, dto.getAirconditioner());
			pstmt.setInt(9, dto.getHeating());
			pstmt.setInt(10, dto.getSocket());
			pstmt.setString(11, dto.getContent());
			pstmt.setString(12, dto.getFrom());
			pstmt.setString(13, dto.getTo());
			pstmt.setString(14, dto.getaTime());
			pstmt.setString(15, dto.getEtc());
			
			pstmt.executeUpdate();
			System.out.println("hosting테이블 insert완료");
			
			// hosting_bill 테이블
			sql ="insert into hosting_bill values(null,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto1.getWeekday());
			pstmt.setInt(2, dto1.getHoliday());		
			
			pstmt.executeUpdate();
			System.out.println("hosting_bill테이블 insert완료");
			
			// Hosting_Option 테이블
			sql = "insert into hosting_option values(null,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto2.getParking());
			pstmt.setInt(2, dto2.getWifi());
			pstmt.setInt(3, dto2.getProjector());
			pstmt.setInt(4, dto2.getLaptop());
			pstmt.setInt(5, dto2.getCabinet());
			pstmt.executeUpdate();
			System.out.println("hosting_option테이블 insert완료");
			
			//Hosting_pic 테이블
			sql ="insert into hosting_pic values(null,?,?,?,?,null)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto3.getPic1());
			pstmt.setString(2, dto3.getPic2());
			pstmt.setString(3, dto3.getPic3());
			pstmt.setString(4, dto3.getPic4());
			pstmt.executeUpdate();
			System.out.println("hosting_pic테이블 insert완료");
			
			//Hosting_address 테이블
			sql = "insert into hosting_address values(null,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);			
			
			pstmt.setString(1, dto4.getA_wdo());
			pstmt.setString(2, dto4.getA_kdo());
			pstmt.setString(3, dto4.getA_woo());
			pstmt.setString(4, dto4.getA_address());
			pstmt.setString(5, dto4.getA_D_address());
			pstmt.setString(6, dto4.getA_etc_address());
			
			pstmt.executeUpdate();
			System.out.println("hosting_address테이블 insert완료");

			
			
		} catch (Exception e) {
			System.out.println("insert 에서 오류 :" +e);
		}finally {
						
			try {
				if(pstmt !=null){
					pstmt.close();					
				}
				
				if(con != null){
					con.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
		}
		
	}


	public Vector<SelectDTO> select(int num) {
		
		getCon();
		
		Vector<SelectDTO> vector = new Vector<SelectDTO>();
		
	
			
				try {	
					if(num ==1){
						String sql ="";
						
						sql="select * from hosting natural join hosting_bill natural join hosting_pic";
						
						pstmt = con.prepareStatement(sql);
					rs=	pstmt.executeQuery();
					
					while(rs.next()) {
						SelectDTO dto = new SelectDTO();
						
						dto.setaTime(rs.getString("Time"));
						dto.setContent(rs.getString("content"));
						dto.setImg1(rs.getString("pic1"));
						dto.setSubject(rs.getString("subject"));
						dto.setWeekday(rs.getInt("weekday"));
						dto.setHoliday(rs.getInt("holiday"));
						vector.add(dto);	
						
					}					
					
					}else if(num ==2){
						String sql ="";
						
						sql="select * from hosting natural join hosting_bill natural join hosting_pic where room = '카페' ";
						
						pstmt = con.prepareStatement(sql);
					rs=	pstmt.executeQuery();
					
					while(rs.next()) {
						SelectDTO dto = new SelectDTO();
						
						dto.setaTime(rs.getString("Time"));
						dto.setContent(rs.getString("content"));
						dto.setImg1(rs.getString("pic1"));
						dto.setSubject(rs.getString("subject"));
						dto.setWeekday(rs.getInt("weekday"));
						dto.setHoliday(rs.getInt("holiday"));
						vector.add(dto);	
							
					}					
						
						
					}else if(num == 3){
						String sql ="";
						
						sql="select * from hosting natural join hosting_bill natural join hosting_pic where room = '강의실' ";
						
						pstmt = con.prepareStatement(sql);
					rs=	pstmt.executeQuery();
					
					while(rs.next()) {
						SelectDTO dto = new SelectDTO();
						
						dto.setaTime(rs.getString("Time"));
						dto.setContent(rs.getString("content"));
						dto.setImg1(rs.getString("pic1"));
						dto.setSubject(rs.getString("subject"));
						dto.setWeekday(rs.getInt("weekday"));
						dto.setHoliday(rs.getInt("holiday"));
						vector.add(dto);	
						
																		
					}					
						
						
					}else if(num ==4){
						String sql ="";
						
						sql="select * from hosting natural join hosting_bill natural join hosting_pic where room = '룸' ";
						
						pstmt = con.prepareStatement(sql);
					rs=	pstmt.executeQuery();
					
					while(rs.next()) {
						SelectDTO dto = new SelectDTO();
						
						dto.setaTime(rs.getString("Time"));
						dto.setContent(rs.getString("content"));
						dto.setImg1(rs.getString("pic1"));
						dto.setSubject(rs.getString("subject"));
						dto.setWeekday(rs.getInt("weekday"));
						dto.setHoliday(rs.getInt("holiday"));
						vector.add(dto);	
						
																		
					}					
						
						
					}
											
						
					} catch (Exception e) {
						System.out.println("select 에서 오류 :" +e);
					}finally {
									
						try {
							if(pstmt !=null){
								pstmt.close();					
							}
							
							if(con != null){
								con.close();
							}if(rs != null){
								rs.close();
							}
						} catch (Exception e2) {
							// TODO: handle exception
						}
						
					}
				return vector;
					
				}
	
	
	public Vector<SelectDTO> select(String id) {
		
		getCon();
		
		Vector<SelectDTO> vector = new Vector<SelectDTO>();
		
	
			
				try {
					String sql ="select * from hosting natural join hosting_bill natural join hosting_pic where host_id = ? ";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						SelectDTO dto = new SelectDTO();
						
						dto.setaTime(rs.getString("Time"));
						dto.setContent(rs.getString("content"));
						dto.setImg1(rs.getString("pic1"));
						dto.setSubject(rs.getString("subject"));
						dto.setWeekday(rs.getInt("weekday"));
						dto.setHoliday(rs.getInt("holiday"));
						dto.setRoom_no(rs.getInt("room_no")); 
						//이미지명, 제목 , room_no만 필요
						
						vector.add(dto);	
																		
					}			
					
					
					
					} catch (Exception e) {
						System.out.println("select 에서 오류 :" +e);
					}finally {
									
						try {
							if(pstmt !=null){
								pstmt.close();					
							}
							
							if(con != null){
								con.close();
							}if(rs != null){
								rs.close();
							}
						} catch (Exception e2) {
							// TODO: handle exception
						}
						
					}
				return vector;
					
				}
	
	public SelectDTO UserRoomSelect(int room_no) {
		
		getCon();
		SelectDTO dto = new SelectDTO();

	
				try {
					String sql ="select * from hosting natural join hosting_bill natural join hosting_pic natural join hosting_address natural join hosting_option where room_no = ? ";
					pstmt = con.prepareStatement(sql);
					
										
					pstmt.setInt(1, room_no);
					rs = pstmt.executeQuery();
					rs.next();
		
						
						dto.setRoom_no(rs.getInt("room_no")); 
						dto.setSubject(rs.getString("subject"));
						dto.setRoom(rs.getString("room"));
						dto.setPeople(rs.getString("people"));
						dto.setDrink(rs.getInt("drink"));
						dto.setElevator(rs.getInt("elevator"));
						dto.setToilet(rs.getInt("toilet"));
						dto.setAirconditioner(rs.getInt("airconditioner"));
						dto.setProjector(rs.getInt("projector"));
						dto.setHeating(rs.getInt("heating"));
						dto.setSocket(rs.getInt("socket"));
						dto.setParking(rs.getInt("parking"));
						dto.setLaptop(rs.getInt("laptop"));
						dto.setCabinet(rs.getInt("cabinet"));
						dto.setWifi(rs.getInt("wifi"));						
						dto.setContent(rs.getString("content"));
						dto.setFrom(rs.getString("fromdate"));
						dto.setTo(rs.getString("todate"));
						dto.setaTime(rs.getString("Time"));
						dto.setEtc(rs.getString("etc"));
						dto.setWeekday(rs.getInt("weekday"));
						dto.setHoliday(rs.getInt("holiday"));						
						dto.setImg1(rs.getString("pic1"));
						dto.setImg2(rs.getString("pic2"));
						dto.setImg3(rs.getString("pic3"));
						dto.setImg4(rs.getString("pic4"));
						dto.setA_address(rs.getString("a_address"));
						dto.setA_D_address(rs.getString("a_D_address"));
						dto.setA_etc_address(rs.getString("a_etc_address"));
						dto.setPost_Num(rs.getString("a_woo"));	
						dto.setWdo(rs.getString("a_wdo"));
						dto.setKdo(rs.getString("a_kdo"));
					
						
					} catch (Exception e) {
						System.out.println("select 에서 오류 :" +e);
					}finally {
									
						try {
							if(pstmt !=null){
								pstmt.close();					
							}
							
							if(con != null){
								con.close();
							}if(rs != null){
								rs.close();
							}
						} catch (Exception e2) {
							// TODO: handle exception
						}
						
					}
				
				return dto;
				}


	public void delete(HostingDTO dto) {
		
		getCon();
		
		try {
			
				String sql = "delete from hosting where room_no =?";
																		
				pstmt =	con.prepareStatement(sql);
				pstmt.setInt(1, dto.getRoom_no());	
				pstmt.executeUpdate();
				
				sql = "delete from hosting_address where room_no =?";
				
				pstmt =	con.prepareStatement(sql);
				pstmt.setInt(1, dto.getRoom_no());	
				pstmt.executeUpdate();
				
				sql = "delete from hosting_bill where room_no =?";
				
				pstmt =	con.prepareStatement(sql);
				pstmt.setInt(1, dto.getRoom_no());	
				pstmt.executeUpdate();
				
				sql = "delete from hosting_option where room_no =?";
				
				pstmt =	con.prepareStatement(sql);
				pstmt.setInt(1, dto.getRoom_no());	
				pstmt.executeUpdate();
				
				sql = "delete from hosting_pic where room_no =?";
				
				pstmt =	con.prepareStatement(sql);
				pstmt.setInt(1, dto.getRoom_no());	
				pstmt.executeUpdate();
				
				
				
		} catch (Exception e) {
			System.out.println("delete 에서 오류 :" +e);
		}finally {
						
			try {
				if(pstmt !=null){
					pstmt.close();					
				}
				
				if(con != null){
					con.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
		}
		
		
		
		
	}


	public void update(HostingDTO dto, HostingBillDTO dto1, HostingOptionDTO dto2, HostingPicDTO dto3,
				HostingAddressDTO dto4) {
		
				getCon();				
				
		try {
			// hosting 테이블
			String sql ="update hosting set subject =?, room = ? , people =? , drink =? , elevator =?, toilet =? ,"
					+ " airconditioner =? , heating =? , socket =?  , content =? , fromdate =? , todate =? ,"
					+ " time = ? ,etc=?  where room_no = ? ";
									
			
			System.out.println(dto.getDrink());
			
		pstmt =	con.prepareStatement(sql);			
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getRoom());
			pstmt.setString(3, dto.getPeople());
			pstmt.setInt(4, dto.getDrink());
			pstmt.setInt(5, dto.getElevator());
			pstmt.setInt(6, dto.getToilet());
			pstmt.setInt(7, dto.getAirconditioner());
			pstmt.setInt(8, dto.getHeating());
			pstmt.setInt(9, dto.getSocket());
			pstmt.setString(10, dto.getContent());
			pstmt.setString(11, dto.getFrom());
			pstmt.setString(12, dto.getTo());
			pstmt.setString(13, dto.getaTime());
			pstmt.setString(14, dto.getEtc());
			pstmt.setInt(15, dto.getRoom_no());
						
			pstmt.executeUpdate();
			
			System.out.println("hosting 테이블 업데이트 완료");
			
			// hosting_address 테이블
			sql = "update hosting_address set a_wdo =? , a_kdo =? , a_woo = ? , a_address =? , a_D_address =? , a_etc_address =? where room_no =?";
			
			pstmt =	con.prepareStatement(sql);
		
			pstmt.setString(1, dto4.getA_wdo());
			pstmt.setString(2, dto4.getA_kdo());
			pstmt.setString(3, dto4.getA_woo());
			pstmt.setString(4, dto4.getA_address());
			pstmt.setString(5, dto4.getA_D_address());
			pstmt.setString(6, dto4.getA_etc_address());
			pstmt.setInt(7, dto.getRoom_no());
			
			pstmt.executeUpdate();
			
			System.out.println("hosting_address 테이블 업데이트 완료");

			
			// hosting_bill 테이블
			sql = "update hosting_bill set weekday = ? , holiday = ? where room_no =?";
			
			pstmt =	con.prepareStatement(sql);

			
		    pstmt.setInt(1, dto1.getWeekday());
			pstmt.setInt(2, dto1.getHoliday());
			pstmt.setInt(3, dto.getRoom_no());
			
			pstmt.executeUpdate();
			
			System.out.println("hosting_bill 테이블 업데이트 완료");
			
			// hosting_option 테이블
			sql ="update hosting_option set parking =? , wifi =? , projector =? , laptop =? , cabinet=? where room_no =?";
			
			pstmt =	con.prepareStatement(sql);

			
			pstmt.setInt(1, dto2.getParking());
			pstmt.setInt(2, dto2.getWifi());
			pstmt.setInt(3, dto2.getProjector());
			pstmt.setInt(4, dto2.getLaptop());
			pstmt.setInt(5, dto2.getCabinet());
			pstmt.setInt(6, dto.getRoom_no());
			
			pstmt.executeUpdate();
			
			System.out.println("hosting_option 테이블 업데이트 완료");
			
			// hosting_pic 테이블
			sql = "update hosting_pic set pic1 = ? , pic2 =? , pic3 =? , pic4 =? where room_no =?" ;
			
			pstmt =	con.prepareStatement(sql);
											
			pstmt.setString(1, dto3.getPic1());
			pstmt.setString(2, dto3.getPic2());
			pstmt.setString(3, dto3.getPic3());
			pstmt.setString(4, dto3.getPic4());
			pstmt.setInt(5, dto.getRoom_no());
			
			pstmt.executeUpdate();
			
			System.out.println("hosting_pic 테이블 업데이트 완료");

			
		} catch (Exception e) {
			System.out.println("update 에서 오류 :" + e);
		}finally {
						
			try {
				if(pstmt !=null){
					pstmt.close();					
				}
				
				if(con != null){
					con.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
		}
		
		
	}
	
	

}
