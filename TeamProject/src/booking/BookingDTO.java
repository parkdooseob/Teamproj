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
	private int parking; // 주차
	private int wifi; // 와이파이
	private int projector; // 프로젝터
	private int laptop; // 컴퓨터
	private int cabinet; // 캐비넷	
	private int total_price; // 총 금액
	private int book_check; // 취소유무
	
	/* 룸정보에서 (사진, 제목, 내용 ) */
	private String content;	
	private String subject;
	/* 룸번호의 사진 받아오기*/
	private String pic1;	
	
	// getter, setter
	public int getParking() {
		return parking;
	}
	public void setParking(int parking) {
		this.parking = parking;
	}
	public int getWifi() {
		return wifi;
	}
	public void setWifi(int wifi) {
		this.wifi = wifi;
	}
	public int getProjector() {
		return projector;
	}
	public void setProjector(int projector) {
		this.projector = projector;
	}
	public int getLaptop() {
		return laptop;
	}
	public void setLaptop(int laptop) {
		this.laptop = laptop;
	}
	public int getCabinet() {
		return cabinet;
	}
	public void setCabinet(int cabinet) {
		this.cabinet = cabinet;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPic1() {
		return pic1;
	}
	public void setPic1(String pic1) {
		this.pic1 = pic1;
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
