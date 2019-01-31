package space;

import java.sql.Date;

public class ReviewDTO {
	
	private int review_no;
	private int book_no;
	private int room_no;
	private String email;
	private String nic_name;
	private Date re_date;
	private int re_point;
	private String re_content;
	
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
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
	
	public String getNic_name() {
		return nic_name;
	}
	public void setNic_name(String nic_name) {
		this.nic_name = nic_name;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public int getRe_point() {
		return re_point;
	}
	public void setRe_point(int re_point) {
		this.re_point = re_point;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	
	

}
