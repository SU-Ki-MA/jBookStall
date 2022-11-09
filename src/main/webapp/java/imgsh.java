

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

/**
 * Servlet implementation class imgsh
 */
public class imgsh extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
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
		String user = request.getParameter("uname");
		String pass = request.getParameter("pwd");
		PrintWriter	out = response.getWriter();
		out.println("<html>"
				+ "<head>\r\n"
				+ "<meta charset=\"ISO-8859-1\">\r\n"
				+ "<title>Insert title here</title>\r\n"
				+ "</head>\r\n"
				+ "<body>");
	
		String url = "jdbc:mysql://localhost:3306/log";        
		                                                           
        
                             
           String user1 = "root";                            
           String pass1 = "1234";                         
           String sql = "select * from img";   
           
//         String sql = "insert into student1 values('" + user1 + "','" + pass1 + "')";                                                            
           
           
        
           
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
//                    	se.jpg
                    	
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

}
