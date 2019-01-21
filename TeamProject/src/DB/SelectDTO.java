package DB;

public class SelectDTO {
	
	private String title;
	private String aTime;
	private String post;
	private String content;
	private int room_sum;
	
	//setter , getter
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getaTime() {
		return aTime;
	}
	public void setaTime(String aTime) {
		this.aTime = aTime;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRoom_sum() {
		return room_sum;
	}
	public void setRoom_sum(int room_sum) {
		this.room_sum = room_sum;
	}
	
	
	
}
