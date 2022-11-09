

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
/**
 * Servlet implementation class AQty
 */
@WebServlet("/AQty")
public class AQty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AQty() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		HttpSession session = request.getSession(); 
		String cId =(String)session.getAttribute("cId");
		String bId = request.getParameter("bookid");
		inc(cId,bId);
		
	}
	public static void inc(String cId,String bId) {
		String url = "jdbc:mysql://localhost:3306/jb";        
	    String user1 = "root";                            
	    String pass1 = "zxer";		
	    Connection con = null;
	    
	    String qty = getQty(cId);
	    int q = Integer.parseInt(qty);
	    q++;
	    String addcard = "update cart_data set qty = '"+q+"' where c_id='"+cId+"' and  _id='"+bId+"');";
	    try {                                              
	      	Class.forName("com.mysql.cj.jdbc.Driver");       
	      	con= DriverManager.getConnection(url, user1,pass1);   
	        Statement st = con.createStatement();
	        st.executeUpdate(addcard); 
	        
	        con.close();   
	         }                
	    catch (Exception ex) {   
	         System.out.println("Error At inc");
	         System.err.println(ex); 
//	         System.out.println("      </div>\r\n"
//	         		+ "      <div class=\"cart-end\">\r\n"
//	         		+ "        <div class=\"checkout-buttons\">\r\n"
//	         		+ "          <p>SubTotal: <span>Rs. 12618</span></p>");
	      }
	    
	}
	
	public static String getQty(String cId) {
		String qty="";
		String url = "jdbc:mysql://localhost:3306/jb";        
	    String user1 = "root";                            
	    String pass1 = "zxer";		
	    Connection con = null;
	    String searchCart = "select qty from cart_data where cId='"+cId+"' );";
	    try {                                              
	      	Class.forName("com.mysql.cj.jdbc.Driver");       
	      	con= DriverManager.getConnection(url, user1,pass1);   
	        Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery(searchCart); 
	        while(rs.next()) {
	        	qty = rs.getString("qty");
	        }
	        con.close();   
	         }                
	    catch (Exception ex) {   
	         System.out.println("Error At getQty");
	         System.err.println(ex); 
	      }
		return qty;
	}
	}


