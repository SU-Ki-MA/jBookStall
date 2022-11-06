
import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

	    
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		PrintWriter	out = response.getWriter();
		Argon2 argon2 = Argon2Factory.create();
		out.println("<html>"
				+ "<head>\r\n"
				+ "<meta charset=\"ISO-8859-1\">\r\n"
				+ "<title>Insert title here</title>\r\n"
				+ "</head>\r\n"
				+ "<body>");
		
		String pregex = "^(?=.*[0-9])"
                + "(?=.*[a-z])(?=.*[A-Z])"
                + "(?=\\S+$).{8,250}$";
		
		Pattern p = Pattern.compile(pregex);

		Matcher m = p.matcher(pass);

		String regex = "^[A-Za-z0-9+_.-]+@(.+)$";
	    
	    Pattern pattern = Pattern.compile(regex);
	    
	    Matcher matcher = pattern.matcher(email);
		
	    if(matcher.matches()&& m.matches()) {
	    	 RequestDispatcher rd = request.getRequestDispatcher("home.html");
	    	 rd.forward(request, response);
	      } 
		else {
	    	 
//	    	  response.sendRedirect("Login.html");  
	    	  request.setAttribute("val", "1" );
	    	  RequestDispatcher rd = request.getRequestDispatcher("login.html");
	    	  rd.forward(request, response);
	    	  
//	    	 
//	    	  Add toast here
//
//	    	  
	      }
		 char[] password = pass.toCharArray();

		 try {
	            // iterations = 10
	            // memory = 64m
	            // parallelism = 1
	            String hash = argon2.hash(10, 65536, 1, password);
	            out.println(hash);
	            
	            out.println("---------------------------------------------\n");
	            
	            String url = "jdbc:mysql://localhost:3306/pog";        
                
	            
                
	            String user1 = "root";                            
	            String pass1 = "1234";                         
	            String sql = "INSERT INTO EMPLOYEE VALUES ('"+hash+"');";   
	            
	            
	            Connection con = null;                             
                
                
                try {                                              
                                                  
                	Class.forName("com.mysql.cj.jdbc.Driver");       
                  
                    con= DriverManager.getConnection(url, "root", "1234");   
                   
                    Statement st = con.createStatement();                                                       
                                           
                     st.executeUpdate(sql);             
                    out.println("DONE");
            
                    con.close();   
                    out.println("</body>\r\n"
                    		+ "</html>");
                }                                                  
                                                                    
                
            catch (Exception ex) {                             
            	out.println(ex);  
                    System.err.println(ex);                        
                } 
	            
	            // argon2 verify hash
	            if (argon2.verify(hash, password)) {
	                out.println("Hash matches password.");
	            }
//	            out.println("<form action=\"payment\" method=\"post\">\r\n"
//	            		+ "	hash : <input type=\"text\" name =\"hash\"><br><br>\r\n"
//	            		+ "	password : <input type=\"text\" name =\"pwd\"><br><br>\r\n"
//	            		+ "	<input type= \"submit\" >");
//	            
	            }
		 finally {
			 argon2.wipeArray(password);
		}
	
		
		out.println("</body>\r\n"
        		+ "</html>");
		
		
		
		
		
		
	}

}
