package space;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.*;


@WebServlet("/TimeSpaceController")
public class TimeSpaceController extends HttpServlet {
	       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date[] = request.getParameter("date").split(" ");
		
		Date selectDate = Date.valueOf(date[0]);
		int roomNo = Integer.parseInt(request.getParameter("room_no"));
		
		System.out.println("date : "+request.getParameter("date"));
		System.out.println("room : "+roomNo);
		SpaceDao dao = new SpaceDao();
		JSONArray jarray = dao.getTime(selectDate, roomNo);
		PrintWriter out = response.getWriter();
		out.print(jarray);
	}

}
