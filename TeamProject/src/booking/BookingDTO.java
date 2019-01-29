package booking;

import java.sql.Timestamp;

public class BookingDTO {
	
	private int book_no; // 예약 번호
	private int room_no; // 예약 공간 번호
	private String email; // 가입한 회원의 이메일
	private String book_phone; // 호스트가입시 넣은 전화번호
	private Timestamp book_date; // 예약 날짜
	private int book_time; // 체크인 시간
	private int book_hour; // 이용시간
	private int total_price; // 총 금액
	private int book_check; // 취소유무
	
	
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
	public String getBook_phone() {
		return book_phone;
	}
	public void setBook_phone(String book_phone) {
		this.book_phone = book_phone;
	}
	public Timestamp getBook_date() {
		return book_date;
	}
	public void setBook_date(Timestamp book_date) {
		this.book_date = book_date;
	}
	public int getBook_time() {
		return book_time;
	}
	public void setBook_time(int book_time) {
		this.book_time = book_time;
	}
	public int getBook_hour() {
		return book_hour;
	}
	public void setBook_hour(int book_hour) {
		this.book_hour = book_hour;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getBook_check() {
		return book_check;
	}
	public void setBook_check(int book_check) {
		this.book_check = book_check;
	}
	
	
	
	
	
}
