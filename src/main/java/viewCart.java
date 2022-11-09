

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.apache.catalina.tribes.group.Response;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class viewCart
 */
@WebServlet("/viewCart")
public class viewCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewCart() {
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
	 * @throws ServletException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		doGet(request, response);
		HttpSession session = request.getSession(false);
		if(session==null) {
			backToLogin(request,response);
		}
		String uId = (String) session.getAttribute("uId");
		if(uId==null) {
			backToLogin(request,response);
		}
		System.out.println("uid at view cart "+uId);
		String newCid = getCid(uId);
		cartTable(request,response,newCid);
		
	}
	public static void cartTable(HttpServletRequest request, HttpServletResponse response,String cId) throws  IOException, ServletException{
		
		RequestDispatcher rd = request.getRequestDispatcher("NewCart.jsp?cId="+cId);
		request.setAttribute("cId", cId);
        rd.forward(request, response);
	}
	public static void backToLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("LoginChk.jsp");
		
        rd.forward(request, response);
	}
	public static String getCid(String uId) {
		String newCid = "";
		String url = "";        
	    String user1 = "";                            
	    String pass1 = "";
	    String searchUser ="select c_id from users where u_id='"+uId+"';";
	    Connection con = null;
	    try {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	con= DriverManager.getConnection(url, user1,pass1);
	    	Statement st = con.createStatement();
	    	ResultSet rs = st.executeQuery(searchUser);
	    	while(rs.next()) {
	    		newCid = rs.getString("c_id");
	    	}
	    }
	    catch(Exception ex) {
	    	System.out.println("Error view cart at getCid");
	    	System.err.println(ex); 
	    	
	    }
		return newCid;
	}
	

}
