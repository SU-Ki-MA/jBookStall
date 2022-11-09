


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.PreparedStatement;


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public Login() {
//        super();
//        // 
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		 
	    
	      
		PrintWriter	out = response.getWriter();
		out.println("<html>"
				+ "<head>\r\n"
				+ "<meta charset=\"ISO-8859-1\">\r\n"
				+ "<title>Insert title here</title>\r\n"
				+ "</head>\r\n"
				+ "<body>");
		out.println(email);
		out.println(pass);
//--------------------------------------------------------------------------------------
		
		
		String pregex = "^(?=.*[0-9])"
                + "(?=.*[a-z])(?=.*[A-Z])"
                + "(?=\\S+$).{8,250}$";
		
		Pattern p = Pattern.compile(pregex);

		Matcher m = p.matcher(pass);

		String regex = "^[A-Za-z0-9+_.-]+@(.+)$";
	    
	    Pattern pattern = Pattern.compile(regex);
	    
	    Matcher matcher = pattern.matcher(email);
	    
		out.println("--------------------------------------------------------------------------a");
		if(matcher.matches()&& m.matches()) {
	         out.println("Given email id is valid");
	         out.println("Given pass id is valid");
	      } 
		else {
	    	 
//	    	  response.sendRedirect("Login.html");  
	    	  request.setAttribute("val", "1" );
	    	  RequestDispatcher rd = request.getRequestDispatcher("test.jsp");
	    	  rd.forward(request, response);
	      }
		out.println("--------------------------------------------------------------------------");
		String url = "jdbc:mysql://localhost:3306/log";        
		                                                           
        
                             
           String user1 = "root";                            
           String pass1 = "1234";                         
           String sql = "select * from img";   
           
//         String sql = "insert into student1 values('" + user1 + "','" + pass1 + "')";                                                            
           
           
        
//           HttpSession session = request.getSession();
           
           
//           out.println(session);
//           out.println(session.getId());
           
           
           out.println("<form action=\"login\" method=\"get\">\r\n"
           		+ "	\r\n"
           		+ "	User Name : <input type=\"text\" name= \"uname\"><br><br>\r\n"
           		+ "	\r\n"
           		+ "	password : <input type=\"password\" name= \"pwd\"><br>\r\n"
           		+ "	<input type= \"submit\" >\r\n"
           		+ "	</form>");
           
           
           
                Connection con = null;                             
                          
                          
                try {                                              
                                                  
                	Class.forName("com.mysql.cj.jdbc.Driver");       
                  
                    con= DriverManager.getConnection(url, "root", "1234");   
                   
                    Statement st = con.createStatement();                                                       
                                           
                    ResultSet rs = st.executeQuery(sql);             
                    while(rs.next()) {
                    	out.println(rs.getString("pic_dir"));
                    	out.println("<img src=\"" +rs.getString("pic_dir")+"\">");
                    	
//                    	out.println(rs.getString("pwd"));
                    	
                    	
                    }
            
                    con.close();   
                    out.println("</body>\r\n"
                    		+ "</html>");
                }                                                  
                                                                    
                
            catch (Exception ex) {                             
            	out.println(ex);  
                    System.err.println(ex);                        
                }           
                
                	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession();
		
		
		PrintWriter	out = response.getWriter();
		out.println("<html>"
				+ "<head>\r\n"
				+ "<meta charset=\"ISO-8859-1\">\r\n"
				+ "<title>Insert title here</title>\r\n"
				+ "</head>\r\n"
				+ "<body>");
		  out.println("<button></button>");
		     out.println("</body>\r\n"
             		+ "</html>");
                                 
//		out.println(session.getId());
//		out.println(session);
//		   session.invalidate();
//		   
//		   out.println(session);
//		   out.println(session.getId());
		   
		
	}
                     
                }  

                     