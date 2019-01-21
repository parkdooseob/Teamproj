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
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
			con = ds.getConnection(); 
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}//getCon()
	

	public void insert(HostingDTO dto, HostingBillDTO dto1, HostingOptionDTO dto2, HostingPicDTO dto3, HostingAddressDTO dto4) {
		
		getCon();				
		
		
		try {
			
			// hosting 테이블
			String sql ="insert into hosting values(?,null,?,?,?,?,?,?,?,?)";
									
			pstmt =	con.prepareStatement(sql);
			
			pstmt.setInt(1, 3);
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getPost());
			pstmt.setString(4, dto.getRoom());
			pstmt.setString(5, dto.getPeople());
			pstmt.setString(6, dto.getTitle());
			pstmt.setString(7, dto.getFrom());
			pstmt.setString(8, dto.getTo());
			pstmt.setString(9, dto.getaTime());
			
			pstmt.executeUpdate();
			System.out.println("hosting테이블 insert완료");
			
			// hosting_bill 테이블
			sql ="insert into hosting_bill values(null,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto1.getRoom_day());
			pstmt.setInt(2, dto1.getRoom_sum());		
			
			pstmt.executeUpdate();
			System.out.println("hosting_bill테이블 insert완료");
			
			// Hosting_Option 테이블
			sql = "insert into hosting_option values(null,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto2.getParking());
			pstmt.setInt(2, dto2.getWifi());
			pstmt.setInt(3, dto2.getDrink());
			pstmt.setInt(4, dto2.getToilet());
			pstmt.setString(5, dto2.getEtc());
			pstmt.executeUpdate();
			System.out.println("hosting_option테이블 insert완료");
			
			//Hosting_pic 테이블
			sql ="insert into hosting_pic values(null,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto3.getPic1());
			pstmt.setString(2, dto3.getPic2());
			pstmt.setString(3, dto3.getPic3());
			pstmt.executeUpdate();
			System.out.println("hosting_pic테이블 insert완료");
			
			//Hosting_address 테이블
			sql = "insert into hosting_address values(?,?,?,?,?,?)";
			
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
		
		Vector<SelectDTO> vector = new Vector<SelectDTO>(); //HostingDTO
		
	
			
				try {	
					if(num ==1){
						String sql ="";
						
						sql="select * from hosting natural join hosting_bill";
						
						pstmt = con.prepareStatement(sql);
					rs=	pstmt.executeQuery();
					
					while(rs.next()) {
						SelectDTO dto = new SelectDTO();
						
						dto.setaTime(rs.getString("aTime"));
						dto.setContent(rs.getString("content"));
						dto.setPost(rs.getString("post"));
						dto.setTitle(rs.getString("title"));
						dto.setRoom_sum(rs.getInt("room_sum"));
																		
						vector.add(dto);																			
					}					
					
					}else if(num ==2){
						String sql ="";
						
						sql="select * from hosting natural join hosting_bill where room = '카페' ";
						
						pstmt = con.prepareStatement(sql);
					rs=	pstmt.executeQuery();
					
					while(rs.next()) {
						SelectDTO dto = new SelectDTO();
						
						dto.setaTime(rs.getString("aTime"));
						dto.setContent(rs.getString("content"));
						dto.setPost(rs.getString("post"));
						dto.setTitle(rs.getString("title"));
						dto.setRoom_sum(rs.getInt("room_sum"));
																		
						vector.add(dto);																			
					}					
						
						
					}else if(num == 3){
						String sql ="";
						
						sql="select * from hosting natural join hosting_bill where room = '강의실' ";
						
						pstmt = con.prepareStatement(sql);
					rs=	pstmt.executeQuery();
					
					while(rs.next()) {
						SelectDTO dto = new SelectDTO();
						
						dto.setaTime(rs.getString("aTime"));
						dto.setContent(rs.getString("content"));
						dto.setPost(rs.getString("post"));
						dto.setTitle(rs.getString("title"));
						dto.setRoom_sum(rs.getInt("room_sum"));
																		
						vector.add(dto);																			
					}					
						
						
					}else if(num ==4){
						String sql ="";
						
						sql="select * from hosting natural join hosting_bill where room = '룸' ";
						
						pstmt = con.prepareStatement(sql);
					rs=	pstmt.executeQuery();
					
					while(rs.next()) {
						SelectDTO dto = new SelectDTO();
						
						dto.setaTime(rs.getString("aTime"));
						dto.setContent(rs.getString("content"));
						dto.setPost(rs.getString("post"));
						dto.setTitle(rs.getString("title"));
						dto.setRoom_sum(rs.getInt("room_sum"));
																		
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
	
	

}
