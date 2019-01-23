package user;

public class UserDTO {
	
	private String email; 
	private String name;
	private String pass;
	private int host_check;
	private int point;
	
	
	
	//setter, getter
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getHost_check() {
		return host_check;
	}
	public void setHost_check(int host_check) {
		this.host_check = host_check;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	
	
	
	
}
