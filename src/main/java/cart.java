

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
 * Servlet implementation class cart
 */
@WebServlet("/cart")
public class cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cart() {
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
		doGet(request, response);
		
		HttpSession session = request.getSession(false);
		if(session==null) {
			backToLogin(request,response);
		}
		searchAuthor(request,response);
		searchBook(request, response);
		searchCart(request, response,session);
		
//		setCart(request, response);
		
		
		
		
	}
	
	public void searchAuthor(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost:3306/jb";        
	    String user1 = "";                            
	    String pass1 = "";
	    Connection con = null; 
	    String stock = request.getParameter("stock");
		String authorId = request.getParameter("authorid");	    
		String authorName = request.getParameter("author");
		String addToAuthor = "INSERT INTO authors(a_id,a_name,a_copies_sold) VALUES ('"+authorId+"','"+authorName+"','"+0+"');";
		String searchAuthor = "select a_copies_sold from authors where a_id = '"+authorId+"' ;";
		try {                                              
	      	Class.forName("com.mysql.cj.jdbc.Driver");       
	      	con= DriverManager.getConnection(url, user1,pass1);   
	        Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery(searchAuthor);  
	        if(rs.next()) {
	        	int a_copies_sold = rs.getInt("a_copies_sold");
	        	a_copies_sold++;
	        	String updateBook = "update authors set a_copies_sold='"+a_copies_sold+"' where a_id = '"+authorId+"' ;";
	        	//st.executeUpdate(updateBook);
	        }
	        else {
	        	st.executeUpdate(addToAuthor);
	        }
	        con.close();   
	         }                
	         catch (Exception ex) {
	        	 System.out.println("searchAuthor ");
	         System.err.println(ex); 
	      }
	    
		
	}
	public static String getCid(String uId) {
		String newCid = "";
		String url = "jdbc:mysql://localhost:3306/jb";        
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
	    	System.out.println("Error at getCid");
	    	System.err.println(ex); 
	    	
	    }
		return newCid;
	}

	public static void searchCart(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		
		
		String url = "jdbc:mysql://localhost:3306/jb";        
	    String user1 = "";                            
	    String pass1 = "";
	    int b_copy_sold = 1;
	    String id = request.getParameter("id");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String stock = request.getParameter("stock");
		String authorid = request.getParameter("authorid");	    
		String cId = (String) session.getAttribute("cId");
		String uId = (String) session.getAttribute("uId");
		String newCid = getCid(uId);
		System.out.println("new Cid = "+newCid);
		session.setAttribute("uId", uId);
		request.setAttribute("uId", uId);
		request.setAttribute("cId", cId);
		System.out.println("SearchCart : "+cId);
		System.out.println("SearchCart : "+uId);
		cId =newCid;
		String searchBook = "select qty from cart_data where b_id = '"+id+"' and c_id ='"+ cId+"' ;";
	    int chkout = 0;
		
		Connection con = null; 
	     
	     try {                                              
	      	Class.forName("com.mysql.cj.jdbc.Driver");       
	      	con= DriverManager.getConnection(url, user1,pass1);   
	        Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery(searchBook);  
	        if(rs.next()) {
	        	int qty = rs.getInt("qty");
	        	qty++;
	        	String updateBook = "update cart_data set qty='"+qty+"' where c_id = '"+cId+"' and b_id = '"+id+"';";
	        	st.executeUpdate(updateBook);
	        }
	        else {
	        	String addToBook = "INSERT INTO cart_data(c_id,b_id,qty,price) VALUES ('"+cId+"','"+id+"','"+1+"','"+price+"');";
	        	st.executeUpdate(addToBook);
	        }
	        con.close();   
	         }                
	         catch (Exception ex) {   
	        	 System.out.println("search cart data");
	         System.err.println(ex); 
	      }
	     carttable(request,response,cId);
	     
	     System.out.println();
	}
	
	public static void carttable(HttpServletRequest request, HttpServletResponse response,String cId) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("NewCart.jsp?cId="+cId);
		request.setAttribute("cId", cId);
        rd.forward(request, response);
	}
	
	public static void backToLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("LoginChk.jsp");
		
        rd.forward(request, response);
	}
	
	public static void searchBook(HttpServletRequest request, HttpServletResponse response) {
		String url = "jdbc:mysql://localhost:3306/jb";        
	    String user1 = "";                            
	    String pass1 = "";
	    String id = request.getParameter("id");
	    String searchBook = "select * from books where b_id = '"+id+"';";
	    int b_copy_sold = 1;
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String stock = request.getParameter("stock");
		String authorid = request.getParameter("authorid");	    
	    Connection con = null; 
	     
	     try {                                              
             
	      	Class.forName("com.mysql.cj.jdbc.Driver");       
	      	con= DriverManager.getConnection(url, user1,pass1);   
	        Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery(searchBook);  
	        if(rs.next()) {
	        	b_copy_sold = rs.getInt("b_copy_sold");
	        	b_copy_sold++;
	        	String updateBook = "update books set b_copy_sold='"+b_copy_sold+"' where b_id = '"+id+"';";
	        	//st.executeUpdate(updateBook);
	        }else {
	        	String addToBook = "INSERT INTO books VALUES ('"+id+"','"+name+"','"+price+"','"+stock+"','"+b_copy_sold+"','"+authorid+"');"; 
	        	st.executeUpdate(addToBook);
	        }
	        con.close();   
	         }                
	         catch (Exception ex) {   
	        	 System.out.println("search Books");
	         System.err.println(ex); 
	      }
	     
	}
}
