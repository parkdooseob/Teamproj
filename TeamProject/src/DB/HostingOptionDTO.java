package DB;

public class HostingOptionDTO {

	
	private int room_no ;
	private int parking; //주차
	private int wifi; //와이파이
	private int projector; //프로젝트빔
	private int laptop; //컴퓨터
	private int cabinet; //캐비넷
	
	
	

	
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
