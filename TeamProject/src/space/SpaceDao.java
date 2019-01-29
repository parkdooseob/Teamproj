package space;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.text.SimpleDateFormat;
import java.time.LocalDate;

import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONArray;

import Comment.CommentDTO;




public class SpaceDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 커넥션 풀을 담을 변수 선언
		DataSource ds = null;
		// 생성자
		public SpaceDao() {
			// TODO Auto-generated constructor stub
			try {
				// 1. Was서버와 연결된 웹프로젝트의 모든정보를 가지고 있는 컨텍스트 객체 생성
				Context init = new InitialContext();
				// 2. 연결된 Was서버에서 DataSource(커넥션 풀)을 검색해서 얻기
				ds = (DataSource)init.lookup("java:comp/env/jdbc/ShareSpace");
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("커넥션풀 가져오기 실패 : "+e);
			}
		}// 생성자 끝
		
		// 리소스 반납(해제) 메서드
		public void freeResource(){
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
			}if(con != null){
				try {
					con.close();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
			
		}

	public List getSpace(int num) {
		ArrayList list = new ArrayList();
		HostingDTO hdto;
		HAddressDTO haDto;
		HBillDTO hbDto;
		HOptionDTO hoDto;
		HPicDTO hpDto;
		HostDTO hostDto;
		try {
			con = ds.getConnection();
			String sql = "select * "
						+"from hosting h "
						+"join hosting_address ha "
						+"on h.room_no=ha.room_no "
						+"join hosting_bill hb "
						+"on h.room_no=hb.room_no "
						+"join hosting_option ho "
						+"on h.room_no=ho.room_no "
						+"join hosting_pic hp "
						+"on h.room_no=hp.room_no "
						+"where h.room_no=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				hdto=new HostingDTO();
				hdto.setHost_id(rs.getString(1));
				hdto.setRoom_no(num);
				hdto.setSubject(rs.getString(3));
				hdto.setRoom(rs.getString(4));
				hdto.setPeople(rs.getInt(5));
				hdto.setDrink(rs.getInt(6));
				hdto.setElevator(rs.getInt(7));
				hdto.setToilet(rs.getInt(8));
				hdto.setAirconditioner(rs.getInt(9));
				hdto.setHeating(rs.getInt(10));
				hdto.setSocket(rs.getInt(11));
				list.add(hdto);
				
				haDto=new HAddressDTO();
				haDto.setA_wdo(rs.getString(13));
				haDto.setA_kdo(rs.getString(14));
				haDto.setA_woo(rs.getString(15));
				haDto.setA_address(rs.getString(16));
				haDto.setA_D_address(rs.getString(17));
				haDto.setA_etc_address(rs.getString(18));
				list.add(haDto);
				
				hbDto = new HBillDTO();
				hbDto.setRoom_day(rs.getInt(20));
				hbDto.setRoom_sum(rs.getInt(21));
				list.add(hbDto);
				
				hoDto = new HOptionDTO();
				hoDto.setParking(rs.getInt(23));
				hoDto.setWifi(rs.getInt(24));
				hoDto.setProjector(rs.getInt(25));
				hoDto.setLaptop(rs.getInt(26));
				hoDto.setCabinet(rs.getInt(27));
				list.add(hoDto);
				
				hpDto = new HPicDTO();
				hpDto.setPic1(rs.getString(29));
				hpDto.setPic2(rs.getString(30));
				hpDto.setPic3(rs.getString(31));
				hpDto.setPic4(rs.getString(32));
				list.add(hpDto);
				
				
			}
			con = ds.getConnection();
			sql="select * "
			  + "from host "
			  + "where host_id = (select host_id"
			  +					" from hosting "
			  + 				" where room_no=?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				hostDto = new HostDTO();
				hostDto.setHost_id(rs.getString(1));
				hostDto.setEmail(rs.getString(2));
				hostDto.setHost_pass(rs.getString(3));
				hostDto.setHost_nic(rs.getString(4));
				hostDto.setHost_phone(rs.getString(5));
				hostDto.setHost_level(rs.getInt(6));
				list.add(hostDto);
				
			}
			
		} catch (SQLException e) {
			System.out.println(e.getErrorCode());
			System.out.println("getSpace에서 오류남"+e);

		}finally {
			freeResource();
		}
		return list;
	}

	public ArrayList getNoDate(int num) {
		ArrayList noList = new ArrayList();
		try{
			for(int i=0;i<7;i++){
				
				Date date = Date.valueOf(LocalDate.now().plusDays(i));
				System.out.println(date);
				SimpleDateFormat fo = new SimpleDateFormat("yyyy-M-dd");
				
					con = ds.getConnection();
					String sql = "select sum(bt.t10), sum(bt.t11), sum(bt.t12), sum(bt.t13), "
								+"sum(bt.t14),sum(bt.t15), sum(bt.t16), sum(bt.t17), "
								+"sum(bt.t18), sum(bt.t19), sum(bt.t20), sum(bt.t21) "
								+ "from (select * "
								+ 		"from booking "
								+ 		"where book_check=0 and book_date=? and room_no=?) b " 
								+"join booking_time bt "
								+"on b.book_no = bt.book_no "
								+"and b.book_date = bt.book_date";
					pstmt = con.prepareStatement(sql);
					pstmt.setDate(1, date);
					pstmt.setInt(2, num);
					rs = pstmt.executeQuery();
					if(rs.next()){
						for(int j=1;j<13;j++){
							System.out.println("rs.get()"+j+"번째 값: "+rs.getInt(j));
							if(rs.getInt(j)==0){
								break;
							}
							if(j==12){
								System.out.println(date);
								noList.add(fo.format(date));
							}
						}
						
//						SimpleDateFormat ne_format = new SimpleDateFormat("yyyy-M-dd");
//						String dd = ne_format.format(rs.getDate(1));
//						noList.add(dd);
			//			System.out.println(dd);
					}
					freeResource();
			}
		}catch(Exception e){
			System.out.println("getNoDate에서 에러"+e);
		}finally{
			freeResource();
		}
		
		return noList;
	}

	public JSONArray getTime(Date selectDate, int roomNo) {
		
		JSONArray jarray = new JSONArray();
		
		try{
			con = ds.getConnection();
			String sql = "select sum(bt.t10), sum(bt.t11), sum(bt.t12), sum(bt.t13), "
						+"sum(bt.t14),sum(bt.t15), sum(bt.t16), sum(bt.t17), "
						+"sum(bt.t18), sum(bt.t19), sum(bt.t20), sum(bt.t21) "
						+ "from (select * "
						+ 		"from booking "
						+ 		"where book_check=0 and book_date=? and room_no=?) b " 
						+"join booking_time bt "
						+"on b.book_no = bt.book_no "
						+"and b.book_date = bt.book_date";
			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, selectDate);
			pstmt.setInt(2, roomNo);
			rs = pstmt.executeQuery();
			if(rs.next()){
								
				jarray.add(rs.getInt(1));
				jarray.add(rs.getInt(2));
				jarray.add(rs.getInt(3));
				jarray.add(rs.getInt(4));
				jarray.add(rs.getInt(5));
				jarray.add(rs.getInt(6));
				jarray.add(rs.getInt(7));
				jarray.add(rs.getInt(8));
				jarray.add(rs.getInt(9));
				jarray.add(rs.getInt(10));
				jarray.add(rs.getInt(11));
				jarray.add(rs.getInt(12));
				
				
			}
		}catch(Exception e){
			System.out.println("getTime에서 오류"+e);
		}finally{
			freeResource();
		}
		for(int i=0;i<jarray.size();i++){
			System.out.println("i : "+jarray.get(i));
		}
		return jarray;
	}

	public ArrayList<CommentDTO> getCommentList(int num) {
		ArrayList<CommentDTO> comList = null;
		CommentDTO commentDto;
		try{
			con = ds.getConnection();
			String sql = "select c.comment_no, c.room_no, u.email, "
						+"u.name, c.com_content, c.com_date "
						+"from comment c join user u "
						+"on u.email = c.email "
						+"where room_no=? "
						+"order by com_date desc limit 0, 10 ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			comList = new ArrayList<CommentDTO>();
			while(rs.next()){
				commentDto = new CommentDTO();
				commentDto.setComment_no(rs.getInt(1));
				commentDto.setEmail(rs.getString(3));
				commentDto.setNick_name(rs.getString(4));
				commentDto.setCom_content(rs.getString(5));
				commentDto.setCom_date(rs.getDate(6));
				comList.add(commentDto);
			}
		}catch(Exception e){
			System.out.println("getCommentList에서 에러"+e);
		}finally{
			freeResource();
		}
		
		return comList;
	}
	
	
		
		

}
