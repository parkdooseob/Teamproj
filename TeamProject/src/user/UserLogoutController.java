package user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserLogoutController
 */
@WebServlet("/UserLogoutController.do")
public class UserLogoutController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그아웃 들어왔따");
		
		HttpSession session = request.getSession();

		String access_token = (String)session.getAttribute("access_token"); 
		
		// 일반 로그인시 0
		// 구글 로그인시 1
		// 카카오 로그인시 2
		int login_val = (int)session.getAttribute("login_val");
		
		if(login_val==1){
			session.invalidate();
			response.sendRedirect("https://www.google.com/accounts/Logout");
		}else if(login_val==2){			
			
			   System.out.println("카카오 로그아웃");
			   URL url = new URL("https://kapi.kakao.com/v1/user/logout");					   
			   HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			   conn.setDoOutput(true);
			   conn.setRequestMethod("POST");
			   //conn.setRequestProperty("Accept-Language",  "ko-kr,ko;q=0.8,en-us;q=0.5,en;q=0.3");
			   conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");		   
			   conn.setRequestProperty("Authorization", "Bearer " + access_token );
			   
			   String param = URLEncoder.encode("Bearer", "UTF-8") + "=" + URLEncoder.encode(access_token, "UTF-8");
			   /*param += "&" + URLEncoder.encode("property_keys", "UTF-8") + "=" + URLEncoder.encode("['kakao_account.has_email']", "UTF-8");*/
			  
			   	   
			   OutputStreamWriter osw = new OutputStreamWriter(conn.getOutputStream());
			   osw.write(param);
			   osw.flush();
			 
			   
			   
			   BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			   
			   String line = null;
			   StringBuffer str = new StringBuffer();
			   while ((line = br.readLine()) != null) {
			    
				   str.append(line);
			   }
			    
			   System.out.println(str);
			   session.invalidate();
		}else{
			session.invalidate();
		}		
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다')");
		out.println("location.href='home.jsp'");
		out.println("</script>");
		out.close();
		return;
		
	}	

}
