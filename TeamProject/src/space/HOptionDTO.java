package space;

public class HOptionDTO {

	private int room_no;	//룸자동생성번호
	private int parking;	//주차
	private int wifi;		//무선인터넷
	private int projector;	//빔 프로젝트
	private int laptop;		//노트북 대여
	private int cabinet;	//사물함 대여
	
	
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
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
	
	
}
