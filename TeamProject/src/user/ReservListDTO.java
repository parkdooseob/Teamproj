package user;

import java.sql.Date;

public class ReservListDTO {
	private int book_no;
	private String subject;
	private String email;
	private Date book_date;
	private int total_price;
	private int room_no;

	/**계산에 사용되나 담을 필요 없는 값들*/
//	private int book_check;
//	private int t10;
//	private int t11;
//	private int t12;
//	private int t13;
//	private int t14;
//	private int t15;
//	private int t16;
//	private int t17;
//	private int t18;
//	private int t19;
//	private int t20;
//	private int t21;
	
	/**함수 적용하여 계산 할 값들*/
	private int startT;// 예약 시작 시간
	private int endT; // 예약 마감 시간
	private int rStatus; //예약 상태(사용 전, 사용 후, 취소)
	
	private String pic1;
	private String room_type;
	
	private int review_no;
	private Date re_date;
	private int re_point;
	private String re_content;
	
	
	
	
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}
	public int getrStatus() {
		return rStatus;
	}
	public void setrStatus(int rStatus) {
		this.rStatus = rStatus;
	}
	public int getStartT() {
		return startT;
	}
	public void setStartT(int startT) {
		this.startT = startT;
	}
	public int getEndT() {
		return endT;
	}
	public void setEndT(int endT) {
		this.endT = endT;
	}
	
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBook_date() {
		return book_date;
	}
	public void setBook_date(Date book_date) {
		this.book_date = book_date;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	
//	public int getBook_check() {
//		return book_check;
//	}
//	public void setBook_check(int book_check) {
//		this.book_check = book_check;
//	}
//	public int getT10() {
//		return t10;
//	}
//	public void setT10(int t10) {
//		this.t10 = t10;
//	}
//	public int getT11() {
//		return t11;
//	}
//	public void setT11(int t11) {
//		this.t11 = t11;
//	}
//	public int getT12() {
//		return t12;
//	}
//	public void setT12(int t12) {
//		this.t12 = t12;
//	}
//	public int getT13() {
//		return t13;
//	}
//	public void setT13(int t13) {
//		this.t13 = t13;
//	}
//	public int getT14() {
//		return t14;
//	}
//	public void setT14(int t14) {
//		this.t14 = t14;
//	}
//	public int getT15() {
//		return t15;
//	}
//	public void setT15(int t15) {
//		this.t15 = t15;
//	}
//	public int getT16() {
//		return t16;
//	}
//	public void setT16(int t16) {
//		this.t16 = t16;
//	}
//	public int getT17() {
//		return t17;
//	}
//	public void setT17(int t17) {
//		this.t17 = t17;
//	}
//	public int getT18() {
//		return t18;
//	}
//	public void setT18(int t18) {
//		this.t18 = t18;
//	}
//	public int getT19() {
//		return t19;
//	}
//	public void setT19(int t19) {
//		this.t19 = t19;
//	}
//	public int getT20() {
//		return t20;
//	}
//	public void setT20(int t20) {
//		this.t20 = t20;
//	}
//	public int getT21() {
//		return t21;
//	}
//	public void setT21(int t21) {
//		this.t21 = t21;
//	}
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
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
	public String getPic1() {
		return pic1;
	}
	
	
	
	
	
}
