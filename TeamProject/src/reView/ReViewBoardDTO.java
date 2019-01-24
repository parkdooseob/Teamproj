package reView;

import java.sql.Timestamp;

public class ReViewBoardDTO {
	private int room_no;
    private String email;
    private String name;
    private Timestamp rv_date;
    private int rv_star;
    private String rv_post;
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
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
	public Timestamp getRv_date() {
		return rv_date;
	}
	public void setRv_date(Timestamp rv_date) {
		this.rv_date = rv_date;
	}
	public int getRv_star() {
		return rv_star;
	}
	public void setRv_star(int rv_star) {
		this.rv_star = rv_star;
	}
	public String getRv_post() {
		return rv_post;
	}
	public void setRv_post(String rv_post) {
		this.rv_post = rv_post;
	}
    
    
    

}
