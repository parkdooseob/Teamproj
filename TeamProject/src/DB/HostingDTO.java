package DB;

public class HostingDTO {

	
	private int room_no; //공간 번호
	private String host_id;//호스트 아이디
	private String content;//글 내용
	private String room;//룸 종류
	private String people;	//소, 중, 대
	private String subject; //제목
	private String from; // 부터
	private String to; // 까지
	private String aTime; //이용시간
	private String etc; //비고
	private int drink;
	private int elevator;
	private int toilet;
	private int airconditioner;
	private int heating;
	private int socket;
	
	//setter , getter 메소드
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getaTime() {
		return aTime;
	}
	public void setaTime(String aTime) {
		this.aTime = aTime;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public int getDrink() {
		return drink;
	}
	public void setDrink(int drink) {
		this.drink = drink;
	}
	public int getElevator() {
		return elevator;
	}
	public void setElevator(int elevator) {
		this.elevator = elevator;
	}
	public int getToilet() {
		return toilet;
	}
	public void setToilet(int toilet) {
		this.toilet = toilet;
	}
	public int getAirconditioner() {
		return airconditioner;
	}
	public void setAirconditioner(int airconditioner) {
		this.airconditioner = airconditioner;
	}
	public int getHeating() {
		return heating;
	}
	public void setHeating(int heating) {
		this.heating = heating;
	}
	public int getSocket() {
		return socket;
	}
	public void setSocket(int socket) {
		this.socket = socket;
	}

	
	
	
	
	
}
