package home;

public class homeDTO {
	/**인기공간*/
	/*1,host_no,sharespace,hosting,INT,binary,11,0,0	
2,room_no,sharespace,hosting,INT,binary,11,0,0	
3,subject,sharespace,hosting,VARCHAR,utf8,45,0,0	
4,room,sharespace,hosting,VARCHAR,utf8,10,0,0	
5,people,sharespace,hosting,INT,binary,2,0,0	
6,drink,sharespace,hosting,INT,binary,1,0,0	
7,elevator,sharespace,hosting,INT,binary,1,0,0	
8,toilet,sharespace,hosting,INT,binary,1,0,0	
9,airconditioner,sharespace,hosting,INT,binary,1,0,0	
10,heating,sharespace,hosting,INT,binary,1,0,0	
11,socket,sharespace,hosting,INT,binary,1,0,0	
12,room_no,sharespace,hosting_pic,INT,binary,11,0,0	
13,pic1,sharespace,hosting_pic,VARCHAR,utf8,45,0,0	
14,pic2,sharespace,hosting_pic,VARCHAR,utf8,45,0,0	
15,pic3,sharespace,hosting_pic,VARCHAR,utf8,45,0,0	
16,pic4,sharespace,hosting_pic,VARCHAR,utf8,45,0,0	
17,pic5,sharespace,hosting_pic,VARCHAR,utf8,45,0,0	
18,room_no,,booking,INT,binary,11,0,0	
19,count,,,BIGINT,binary,21,0,0	
20,room_no,,review,INT,binary,11,0,0	
21,star,,,DECIMAL,binary,16,-4,4	
*/
/*
 1,host_no,sharespace,hosting,INT,binary,11,0,0	
2,room_no,sharespace,hosting,INT,binary,11,0,0	
3,subject,sharespace,hosting,VARCHAR,utf8,45,0,0	
4,room,sharespace,hosting,VARCHAR,utf8,10,0,0	
5,people,sharespace,hosting,INT,binary,2,0,0		
13,pic1,sharespace,hosting_pic,VARCHAR,utf8,45,0,0	
19,count,,,BIGINT,binary,21,0,0	
21,star,,,DECIMAL,binary,16,-4,4	
 */	
	
	 private int host_no;	
	 private int room_no;	
	 private String subject;	
	 private String room;	
	 private int people;		
	 private String pic1;	
	 private int count;	
	 private double star;	
	
	
//	/**호스트*/
//	private String host_id;
//	private String host_nic;
//	private String host_level;
	
	/**공간*/
//	//1.호스트 번호
//	private String room_no;
//	private String content;
//	private String post;
//	private String room;
//	private int people;
//	
//	/**공간 위치*/
//	private String a_ci;
//	
//	/**사진*/
//	private String pic1;
//	
//	/**예약*/
//	private int book_no;
	
	
	
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
