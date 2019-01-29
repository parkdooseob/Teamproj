package space;

public class HBillDTO {
	
	private int room_no;	//룸자동생성번호
	private int room_day;	//평일요금
	private int room_sum;	//주말요금
	
	
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public int getRoom_day() {
		return room_day;
	}
	public void setRoom_day(int room_day) {
		this.room_day = room_day;
	}
	public int getRoom_sum() {
		return room_sum;
	}
	public void setRoom_sum(int room_sum) {
		this.room_sum = room_sum;
	}
	

}
