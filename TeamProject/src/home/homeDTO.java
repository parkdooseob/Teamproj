package home;

public class homeDTO {
	
	/**호스트*/
	private String host_id;
	private String host_nic;
	private String host_level;
	
	/**공간*/
	//1.호스트 번호
	private String room_no;
	private String content;
	private String post;
	private String room;
	private int people;
	
	/**공간 위치*/
	private String a_ci;
	
	/**사진*/
	private String pic1;
	
	/**예약*/
	private int book_no;
	
	
	
	/*
	 CREATE TABLE `hosting` (
  `host_no` int(11) DEFAULT NULL COMMENT '호스트번호',외래키
  `room_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '룸자동생성번호',
  `content` varchar(45) NOT NULL COMMENT '제목',
  `post` varchar(45) NOT NULL COMMENT '비고',
  `room` varchar(10) NOT NULL COMMENT '공간타입',
  `people` varchar(45) NOT NULL COMMENT '수용인원수',
  `title` varchar(45) NOT NULL,
  `pDay` varchar(45) NOT NULL,
  PRIMARY KEY (`room_no`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8
	  */
	
	
	/**사진*/
	/*
	
CREATE TABLE `hosting_pic` (
  `room_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '룸자동생성번호',
  `pic1` varchar(45) NOT NULL,
  `pic2` varchar(45) NOT NULL,
  `pic3` varchar(45) NOT NULL,
  PRIMARY KEY (`room_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8
	*/
	
	/**호스트*/
	/*
	
	
	*/
	
	/*
	 :
	
	*/
	
	
	/**리뷰*/
	/*
	 리뷰
	 */
	
	/**예약일*/
	
}
