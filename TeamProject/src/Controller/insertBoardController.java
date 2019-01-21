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
		
		String savePath = "D:\\jspp\\TeamProject_v6\\WebContent\\img\\"; 
		int sizeLimit = 100 * 1024 * 1024; 

		
		String fileName = "";
		String originalFileName = "";	
		String title ="";
		String space = "";
		String peopleValue = "";
		String address ="";
		String postNum ="";
		String detailAddress ="";
		String etcAddress ="";
		String wdo ="";
		String kdo = "";
		String day ="";
		String from = "";
		String to = "";
		String content="";
		String img="";
		String img1="";
		String img2="";
		String img3="";
		String etc ="";
		int bill = 0;
		int parking = 0;
		int wifi = 0; 
		int toilet = 0;
		int drink = 0;
		System.out.println(savePath);



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
			
			
			title = multi.getParameter("title");
			space = multi.getParameter("space");
			peopleValue = multi.getParameter("peopleValue");
			address = multi.getParameter("address");
			postNum = multi.getParameter("postNum");
			detailAddress =multi.getParameter("detailAddress");
			etcAddress = multi.getParameter("etcAddress");
			wdo = multi.getParameter("Wdo");
			kdo = multi.getParameter("Kdo");			
			day = multi.getParameter("day");
			from = multi.getParameter("from");
			to = multi.getParameter("to");
			content = multi.getParameter("content");
			etc = multi.getParameter("etc");
			bill =  Integer.parseInt(multi.getParameter("billValue"));
			parking = Integer.parseInt(multi.getParameter("parking"));
			wifi = Integer.parseInt(multi.getParameter("wifi"));
			toilet = Integer.parseInt(multi.getParameter("toilet"));
			drink = Integer.parseInt(multi.getParameter("drink"));
			
		
								
			while(formNames.hasMoreElements()){
				
				String formName = (String) formNames.nextElement(); 
				fileName = multi.getFilesystemName(formName); 
				saveFile.add(fileName);
				originalFileName = multi.getOriginalFileName(formName); 
				originFile.add(originalFileName);
			}
		
			
			if (fileName == null) { 		
				
				System.out.println("파일 이름이 없음.");
				
			} 
			
			for(int i=0 ; i< saveFile.size();i++){
				
				if(i == 0){img = (String)saveFile.get(0);}				
				else if(i == 1){
					img1 = (String)saveFile.get(0);}
	
				
				else if(i == 2){
					img2 = (String)saveFile.get(0);}

				
				else if(i == 3){
					img3 = (String)saveFile.get(0);}								
			}
				
			
			System.out.println(saveFile.get(0));
			
			//Hosting
			HostingDTO dto = new HostingDTO();
			dto.setPeople(peopleValue);			
			dto.setContent(content);
			dto.setRoom(space);
			dto.setPost(img);
			dto.setTitle(title);
			dto.setFrom(from);
			dto.setTo(to);
			dto.setaTime(at);
			
			
			//HostingBill
			HostingBillDTO dto1 = new HostingBillDTO();
			dto1.setRoom_day(day);
			dto1.setRoom_sum(bill);
			
			//HostingOption 
			HostingOptionDTO dto2 = new HostingOptionDTO();
			dto2.setDrink(drink);
			dto2.setParking(parking);
			dto2.setToilet(toilet);
			dto2.setWifi(wifi);
			dto2.setEtc(etc);
			
			
			//HostingPic
			HostingPicDTO dto3 = new HostingPicDTO();
			dto3.setPic1(img1);
			dto3.setPic2(img2);
			dto3.setPic3(img3);
			
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

