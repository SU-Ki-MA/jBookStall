
import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Servlet implementation class payment
 */
public class payment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public payment() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter	out = response.getWriter();
		Argon2 argon2 = Argon2Factory.create();
		out.println("<html>"
				+ "<head>\r\n"
				+ "<meta charset=\"ISO-8859-1\">\r\n"
				+ "<title>Insert title here</title>\r\n"
				+ "</head>\r\n"
				+ "<body>");
		out.println("-------------------------dawdsdaw\n");
		String h = request.getParameter("hash");
		String pwd = request.getParameter("pwd");
		char[] password = pwd.toCharArray();
		
		 if (argon2.verify(h, password)) {
             out.println("Hash matches password.");
         }
		
		
		
		
		
		
		
		//		String cred = request.getParameter("cred");
////		String cvv = request.getParameter("cvv");
////		String cvv_regex = "^[0-9]{3, 4}$";
//		
//		String regex = "^4[0-9]{12}(?:[0-9]{3})?$";
//		
//		
//Pattern pattern = Pattern.compile(regex);
//	    
//	    Matcher em = pattern.matcher(cred);
//	    
		 
		 
//	    -----------------------------------------------------------------------this another
//		 String cred = request.getParameter("username");
//			String cvv = request.getParameter("cvv");
//			String cvv_regex = "^[0-9]{3, 4}$";
//			
//			String egex = "^4[0-9]{12}(?:[0-9]{3})?$";
//			Pattern p2 = Pattern.compile(egex);
//			
//			Matcher mc = p2.matcher(cred);
//			Pattern p1 = Pattern.compile(cvv_regex);
//			
//			String pregex = "^(?=.*[0-9])"
//	                + "(?=.*[a-z])(?=.*[A-Z])"
//	                + "(?=\\S+$).{8,250}$";
//
//			Pattern p = Pattern.compile(pregex);
//
//			Matcher m = p.matcher(pass);
//
//			 String user_regex = "^[A-Za-z]\\w{5,29}$";
//		    
//		    Pattern user_pattern = Pattern.compile(user_regex);
//		    
//		    Matcher um= user_pattern.matcher(uname);
//			
//			String regex = "^[A-Za-z0-9+_.-]+@(.+)$";
//		    
//		    Pattern pattern = Pattern.compile(regex);
//		    
//		    Matcher em = pattern.matcher(email);
//		    
//		    
//		    
//			out.println("--------------------------------------------------------------------------a");
//			if(mc.matches()){
//				out.println("\nValiidddd");
//			}
//			if(em.matches() && m.matches() && um.matches()) {
//		         out.println("Given email ,");
//		         out.println(" pass ,");
//		         out.println(" uname id is valid");
//		      } 
//			else {
//		    	 
////		    	  response.sendRedirect("Login.html");  
//		    	  request.setAttribute("val", "1" );
//		    	  RequestDispatcher rd = request.getRequestDispatcher("register.html");
//		    	  rd.forward(request, response);
//		      }
//	    
		out.println("--------------------------------------------------------------------------a");
	
//		if(em.matches()) {
//	         out.println("Given email ,");
//	         out.println(" pass ,");
//	         out.println(" uname id is valid");
//	      } 
		}

}
