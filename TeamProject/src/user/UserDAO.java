package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	
	// DB 작업 객체
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	// 커넥션 풀을 담을 변수 선언
	DataSource ds = null;
	// 생성자
	public UserDAO() {
		// TODO Auto-generated constructor stub
		try {
			// 1. Was서버와 연결된 웹프로젝트의 모든정보를 가지고 있는 컨텍스트 객체 생성
			Context init = new InitialContext();
			// 2. 연결된 Was서버에서 DataSource(커넥션 풀)을 검색해서 얻기
			ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
			
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
	// 사용자 로그인시 등록된 계정이 있는지 유무
	public int userCheck(String email, String pass) {
		// TODO Auto-generated method stub
		int check=-1;
		
		try {
			
			con = ds.getConnection();
			
			String sql = "SELECT pass FROM user WHERE email=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);
			System.out.println("email : "+email+" pass : "+pass);
			
			rs = pstmt.executeQuery();
			
			System.out.println(pstmt.toString());
			
			boolean row = rs.next();
			
			System.out.println("row : "+row);
			
			if(row){
				System.out.println("rs.getString('pass') : " +rs.getString("pass"));
				if(rs.getString("pass").equals(pass)){
					
					check = 1;
					
				}else{
					
					check = 0;
				}
				
			}		
			
		} catch (Exception e) {
			System.out.println("userCheck() 메서드에서 "+e);
		} finally {
			freeResource();
		}
		
		
		
		return check;
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
			udto.setHost(rs.getInt("host"));
			udto.setPoint(rs.getInt("point"));
			
			
			
		} catch (Exception e) {
			System.out.println("userCheck() 메서드에서 "+e);
		} finally {
			freeResource();
		}
		
		
		return udto;
	}
	// 일반회원 가입 메서드
	public boolean insertUser(UserDTO udto) {
		boolean result = false;
		try {
			
			con = ds.getConnection();
			
			String sql = "INSERT INTO user(email,name,pass,host,point) VALUES(?,?,?,0,0)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, udto.getEmail());
			pstmt.setString(2, udto.getName());
			pstmt.setString(3, udto.getPass());
			
			int row = pstmt.executeUpdate();
			
			if(row >= 1){
				result = true;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			freeResource();
		}
		
		
		return result;
	}
	// ajax 일반회원 이메일 수정시 중복체크 메서드
	public boolean getEmail(String email) {
		
		boolean flag = false;
		try {
			
			con = ds.getConnection();
			
			String sql = "SELECT * FROM user WHERE email=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);		
			
			rs = pstmt.executeQuery();		
			
			flag = rs.next();
			
			
		
		} catch (Exception e) {
			System.out.println("getEmail() 메서드에서 "+e);
		} finally {
			freeResource();
		}
		
		return flag;
		
		
	}
	// 회원 프로필 수정 중복체크 ajax 메서드
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		
		int result=-1;
		
		try {
			
			con = ds.getConnection();
			
			String sql = "SELECT * FROM user WHERE email = ?";			
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();	
			
			if(rs.next()){
				result = 0;
			}
			
			System.out.println("패스워드 체크 다오  : "+ rs.getString("email"));
						
			
			return result;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("emailCheck() 메서드에서 "+e);
		} finally {
			freeResource();
		}
		
			
		return result;
		
	}
	// 회원 정보 수정시 SNS계정과 일반가입 계정을 나눠서 처리
	public void userProfileUpdate(String email ,UserDTO udto) {
		// TODO Auto-generated method stub
		String sql="";
		try {
			
			con = ds.getConnection();
			System.out.println("다오왔다 :"+udto.getPass());
			if(udto.getPass()== null){
				System.out.println("SNS계정"+udto.getName()+":"+email);
				sql = "UPDATE user SET name=? WHERE email= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, udto.getName());
				pstmt.setString(2, email);
				System.out.println(pstmt.toString());
			}else{
				sql = "UPDATE user SET email=?, name=?, pass=? WHERE email =? ";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, udto.getEmail());
				pstmt.setString(2, udto.getName());
				pstmt.setString(3, udto.getPass());
				pstmt.setString(4, email);
			}
			
			
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("userProfileUpdate() 메서드에서 "+e);
		} finally {
			freeResource();
		}
		
		
	}
	// 호스트 로그인시 호스트 정보가 있는지 유무
	public int hostCheck(String host_id, String host_pass) {
		// TODO Auto-generated method stub
		int check=-1;		
		try {
			
			con = ds.getConnection();
			
			String sql = "SELECT host_pass FROM host WHERE host_id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, host_id);
			System.out.println("host_id : "+host_id+" host_pass : "+host_pass);
			
			rs = pstmt.executeQuery();
			
			System.out.println(pstmt.toString());
			
			boolean row = rs.next();
			
			System.out.println("row : "+row);
			
			if(row){
				System.out.println("rs.getString('host_pass') : " +rs.getString("host_pass"));
				if(rs.getString("host_pass").equals(host_pass)){
					
					check = 1;
					
				}else{
					
					check = 0;
				}
				
			}		
			
		} catch (Exception e) {
			System.out.println("hostCheck() 메서드에서 "+e);
		} finally {
			freeResource();
		}
		
		
		
		return check;
	}
	// 호스트 로그인시 호스트 정보 가져오는 메서드
	public HostDTO getHost(String host_id) {
		HostDTO hdto = new HostDTO();
		
		try {
			
			con = ds.getConnection();
			
			String sql = "SELECT * FROM host WHERE host_id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, host_id);		
			
			rs = pstmt.executeQuery();		
			
			rs.next();		
			
			hdto.setHost_id(rs.getString("host_id"));
			hdto.setEmail(rs.getString("email"));
			hdto.setHost_pass(rs.getString("host_pass"));
			hdto.setHost_nic(rs.getString("host_nic"));
			hdto.setHost_phone(rs.getString("host_phone"));
			hdto.setHost_level(rs.getInt("host_level"));
			hdto.setPoint(rs.getInt("point"));
			
			
		} catch (Exception e) {
			System.out.println("getHost() 메서드에서 "+e);
		} finally {
			freeResource();
		}
		
		
		return hdto;
	}
	// 호스트 프로필 수정 중복체크 버튼 ajax
	public int hostIdCheck(String host_id) {
		int result=-1;		
		try {
			
			con = ds.getConnection();
			
			String sql = "SELECT * FROM host WHERE host_id = ?";			
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, host_id);
			
			rs = pstmt.executeQuery();	
			
			if(rs.next()){
				result = 0;
			}
			
			System.out.println("패스워드 체크 다오  : "+ rs.getString("host_id"));
						
			
			return result;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("hostIdCheck() 메서드에서 "+e);
		} finally {
			freeResource();
		}
		
			
		return result;	
	}

	public void hostProfileUpdate(String host_id, HostDTO hdto) {
		// TODO Auto-generated method stub		
		try {
			
			con = ds.getConnection();
			System.out.println("다오왔다 :"+hdto.getHost_pass());		
			
			String sql = "UPDATE host SET host_id=?,host_pass=?,host_nic=?,host_phone=? WHERE host_id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, hdto.getHost_id());
			pstmt.setString(2, hdto.getHost_pass());
			pstmt.setString(3, hdto.getHost_nic());
			pstmt.setString(4, hdto.getHost_phone());
			pstmt.setString(5, host_id);
			
			System.out.println(pstmt.toString());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("hostProfileUpdate() 메서드에서 "+e);
		} finally {
			freeResource();
		}
		
	}

	public boolean insertHost(HostDTO hdto) {
		// TODO Auto-generated method stub
		boolean result=false;
		try {
			
			con = ds.getConnection();
			
			String sql = "INSERT INTO host(host_id,email,host_pass,host_nic,host_phone,host_level,point) "
					+ "VALUES(?,?,?,?,?,0,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, hdto.getHost_id());
			pstmt.setString(2, hdto.getEmail());
			pstmt.setString(3, hdto.getHost_pass());
			pstmt.setString(4, hdto.getHost_nic());
			pstmt.setString(5, hdto.getHost_phone());
			pstmt.setInt(6, hdto.getPoint());
			
			System.out.println(pstmt.toString());
			
			int row = pstmt.executeUpdate();
			
			if(row >= 1){
				result = true;
			}
			
		} catch (Exception e) {
			System.out.println("insertHost() 메서드에서"+e);
		} finally {
			freeResource();
		}
		
		return result;
		
	}
}
