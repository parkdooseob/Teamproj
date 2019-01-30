package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DB.DAO;
import DB.HostingAddressDTO;
import DB.HostingBillDTO;
import DB.HostingDTO;
import DB.HostingOptionDTO;
import DB.HostingPicDTO;


@WebServlet("/insertBoardController.do")
public class insertBoardController extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		request.setCharacterEncoding("UTF-8");
		
	
		ArrayList saveFile = new ArrayList();
		
		ArrayList originFile = new ArrayList();
		

		
		String savePath = request.getRealPath("/upload"); 
		int sizeLimit = 100 * 1024 * 1024;
		System.out.println(savePath);
		

		
		String fileName = "";
		String originalFileName = "";	
		String subject ="";
		String room = "";
		String people = "";
		String address ="";
		String postNum ="";
		String detailAddress ="";
		String etcAddress ="";
		String wdo ="";
		String kdo = "";
		String from = "";
		String to = "";
		String content="";
		String img="";
		String img1="";
		String img2="";
		String img3="";
		String etc ="";
		String host_id="a@naver.com";
		int weekday = 0;
		int holiday = 0;
		int parking = 0;
		int wifi = 0; 
		int toilet = 0;
		int drink = 0;
		int airconditioner = 0;
		int elevator = 0;
		int heating =0;
		int socket = 0;
		int cabinet = 0;
		int projector = 0;
		int laptop = 0;


		try {

			MultipartRequest multi = 
			        new MultipartRequest(request, savePath, sizeLimit, "UTF-8",
										 new DefaultFileRenamePolicy());
						
			Enumeration formNames = multi.getFileNames(); 
			
			String at11 =multi.getParameter("at11");
			String at12 =multi.getParameter("at12");
			String at13 =multi.getParameter("at13");
			String at14 =multi.getParameter("at14");
			String at15 =multi.getParameter("at15");
			String at16 =multi.getParameter("at16");
			String at17 =multi.getParameter("at17");
			String at18 =multi.getParameter("at18");
			String at19 =multi.getParameter("at19");
			String at20 =multi.getParameter("at20");
			String at21 =multi.getParameter("at21");
			String at22 =multi.getParameter("at22");
			String at23 =multi.getParameter("at23");
			String at = at11 +at12 +at13+ at14+ at15+ at16+ at17+ at18+ at19+ at20+ at21+ at22+at23;
			
			
			subject = multi.getParameter("subject");
			room = multi.getParameter("room");
			people = multi.getParameter("people");
			address = multi.getParameter("address");
			postNum = multi.getParameter("postNum");
			detailAddress =multi.getParameter("detailAddress");
			etcAddress = multi.getParameter("etcAddress");
			wdo = multi.getParameter("Wdo");
			kdo = multi.getParameter("Kdo");			
			from = multi.getParameter("from");
			to = multi.getParameter("to");
			content = multi.getParameter("content");
			etc = multi.getParameter("etc");
			weekday =  Integer.parseInt(multi.getParameter("weekday"));
			holiday =  Integer.parseInt(multi.getParameter("holiday"));
			parking = Integer.parseInt(multi.getParameter("parking"));
			wifi = Integer.parseInt(multi.getParameter("wifi"));
			toilet = Integer.parseInt(multi.getParameter("toilet"));
			drink = Integer.parseInt(multi.getParameter("drink"));
			airconditioner = Integer.parseInt(multi.getParameter("airconditioner"));
			socket = Integer.parseInt(multi.getParameter("socket"));
			heating = Integer.parseInt(multi.getParameter("heating"));
			elevator = Integer.parseInt(multi.getParameter("elevator"));
			projector = Integer.parseInt(multi.getParameter("projector"));
			laptop = Integer.parseInt(multi.getParameter("laptop"));
			cabinet = Integer.parseInt(multi.getParameter("cabinet"));


								
			while(formNames.hasMoreElements()){
				
				String formName = (String) formNames.nextElement(); 
				fileName = multi.getFilesystemName(formName); 
				saveFile.add(fileName);
				originalFileName = multi.getOriginalFileName(formName); 
				originFile.add(originalFileName);
			}
		
			
			if (fileName == null) { 		
				
				System.out.println("�뙆�씪�씠由� �뾾�쓬");
				
			} 
			
			for(int i=0 ; i< saveFile.size();i++){
				
				if(i == 0){img = (String)saveFile.get(i);}				
				else if(i == 1){
					img1 = (String)saveFile.get(i);}	
				
				else if(i == 2){
					img2 = (String)saveFile.get(i);}

				
				else if(i == 3){
					img3 = (String)saveFile.get(i);}								
			}
							
				

			//Hosting
			HostingDTO dto = new HostingDTO();
			dto.setPeople(people);			
			dto.setContent(content);
			dto.setRoom(room);
			dto.setSubject(subject);
			dto.setFrom(from);
			dto.setTo(to);
			dto.setaTime(at);
			dto.setAirconditioner(airconditioner);
			dto.setDrink(drink);
			dto.setElevator(elevator);
			dto.setEtc(etc);
			dto.setHeating(heating);
			dto.setHost_id(host_id);
			dto.setSocket(socket);
			dto.setToilet(toilet);
			
			
			
			
			//HostingBill
			HostingBillDTO dto1 = new HostingBillDTO();
			dto1.setWeekday(weekday);
			dto1.setHoliday(holiday);
			
			
			//HostingOption 
			HostingOptionDTO dto2 = new HostingOptionDTO();
			dto2.setCabinet(cabinet);
			dto2.setParking(parking);
			dto2.setWifi(wifi);
			dto2.setLaptop(laptop);
			dto2.setProjector(projector);
			
			
			//HostingPic
			HostingPicDTO dto3 = new HostingPicDTO();
			dto3.setPic1(img);
			dto3.setPic2(img1);
			dto3.setPic3(img2);
			dto3.setPic4(img3);
			
			//HostingAddress 
			HostingAddressDTO dto4 = new HostingAddressDTO();
			dto4.setA_address(address);
			dto4.setA_D_address(detailAddress);
			dto4.setA_etc_address(etcAddress);
			dto4.setA_woo(postNum);
			dto4.setA_wdo(wdo);
			dto4.setA_kdo(kdo);
			
			
			DAO dao = new DAO();
			dao.insert(dto,dto1,dto2,dto3,dto4);
			
			
		RequestDispatcher dis =		
					request.getRequestDispatcher("Jong/detail.jsp");
		
		dis.forward(request, response);
			
			
			

		} catch (Exception e) {
/* 			
*/			} //catch		

	
	}

}

