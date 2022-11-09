

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jakarta.servlet.RequestDispatcher;

/**
 * Servlet implementation class NewPayment
 */
@WebServlet("/NewPayment")
public class NewPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPayment() {
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
		HttpSession session = request.getSession(); 
		String cId =(String)session.getAttribute("cId");
		String c = request.getParameter("cId");
		System.out.println("c=>"+c);
		System.out.println("cId =>"+cId);
		String ccName = request.getParameter("cc-name");
		String ccNumber = request.getParameter("cc-number");
		String cvv = request.getParameter("cc-cvv");
		String ccExpiration = request.getParameter("cc-expiration");
		Boolean card_Validity =CardChecker(ccName,ccNumber,cvv);
		if(card_Validity) {
			addCard(ccName,ccNumber,cvv,ccExpiration,cId,request,response);
		}
		else{
			String err = "Card Number or CCV is Incorrect";
			forwordPageErr(request,response,err );
		}
		
	}
	
	
	
	
	public static Boolean CardChecker(String ccName ,String ccNumber,String cvv) throws ServletException, IOException {
		String cvv_regex = "^[0-9]{3,4}$";
		String CardNumber_regex = "^4[0-9]{12}(?:[0-9]{3})?$";
		String user_regex = "^((?:[A-Za-z]+ ?){1,3})$";
		
		Pattern Card_pattern = Pattern.compile(CardNumber_regex);
		Matcher Card_Matcher = Card_pattern.matcher(ccNumber);
		
		Pattern CCV_pattern = Pattern.compile(cvv_regex);
		Matcher CCV_Matcher = CCV_pattern.matcher(cvv);
		
		Pattern user_pattern = Pattern.compile(user_regex);
		Matcher User_Matcher= user_pattern.matcher(ccName);
		
		
		if(Card_Matcher.matches() && CCV_Matcher.matches() && User_Matcher.matches()) {
	         return true;
	      }
		else {
			
			return false;
		}
		    
	}
	/**
	 * @param cId
	 * @param request
	 * @param response
	 */
	public static void updateCheckout(String cId,HttpServletRequest request, HttpServletResponse response) {
		String url = ;        
	    String user1 = "";                            
	    String pass1 = "";		
	    Connection con = null;
	    String updateCarts = "UPDATE carts set chkout = 1 WHERE c_id = '"+cId+"';";
	    String updateCID = "SELECT c_id,u_id from carts where c_id = '"+cId+"';";
	    String uId = null;
	    
	    
	    try {                                              
	      	Class.forName("com.mysql.cj.jdbc.Driver");       
	      	con= DriverManager.getConnection(url, user1,pass1);   
	        Statement st = con.createStatement();
	       
	        st.executeUpdate(updateCarts); 
	        ResultSet rs =st.executeQuery(updateCID);
	        ;
	        while(rs.next()) {
	        	uId = rs.getString("u_id");
	        	System.out.println("uId 5"+uId);
	        }
	        String c = UniqRandom();
	        String addCart = "insert into carts(c_id,u_id,chkout) values('"+c+"','"+uId+"',0) ";
	        String updateUser = "UPDATE users set c_id = '"+c+"' WHERE u_id = '"+uId+"';";
	        st.executeUpdate(addCart);
	        st.executeUpdate(updateUser);
	        con.close();   
	        String valid = "Successfuly Purchased ";
	        request.setAttribute("valid", valid);
	        request.setAttribute("purchased", cId);
			RequestDispatcher rd = request.getRequestDispatcher("NewCart.jsp");
			rd.forward(request, response);
	         }                
	    catch (Exception ex) {   
	         System.out.println("Error At updateCheckout");
	         System.err.println(ex); 
	      }
	    
	    
	}
	
	
	public static void forwordPageErr(HttpServletRequest request, HttpServletResponse response, String err) throws ServletException, IOException {
		request.setAttribute("val", err);
		RequestDispatcher rd = request.getRequestDispatcher("payment.jsp");
		rd.forward(request, response);
	}
	public static void addCard(String ccName ,String ccNumber,String cvv,String ccExpiration,String cId,HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String url = ;        
	    String user1 = "";                            
	    String pass1 = "";		
	    Connection con = null;
	    Double bill_total = billTotal(cId);
	    String bill_id = UniqRandom();
	    DateTimeFormatter dateTimeformate = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
        String bill_time = dateTimeformate.format(LocalDateTime.now());
        System.out.println("bill time at add cart "+bill_time);
	    String addcard = "insert into checkouts values ('"+bill_id+"','"+bill_time+"','"+bill_total+"','"+ccNumber+"','"+ccName+"','"+cvv+"','"+ccExpiration+"','"+cId+"' );";
	    try {                                              
	      	Class.forName("com.mysql.cj.jdbc.Driver");       
	      	con= DriverManager.getConnection(url, user1,pass1);   
	        Statement st = con.createStatement();
	        st.executeUpdate(addcard); 
	        
	        con.close();   
	        updateCheckout(cId,request,response);
	         }                
	    catch (Exception ex) {   
	         System.out.println("Error At addCart");
	         System.err.println(ex); 
	      }
	    
	}
	
	public static Double billTotal(String cId) {
		String url = ;        
	    String user1 = "";                            
	    String pass1 = "";		
	    Connection con = null;
	    String addcard = "SELECT cd.c_id,cd.b_id,b.b_name,cd.price,cd.qty FROM cart_data AS cd, books AS b WHERE cd.b_id = b.b_id  and cd.c_id='"+ cId+"' ;";
	    Double sum = (double) 0;
	    try {                                              
	      	Class.forName("com.mysql.cj.jdbc.Driver");       
	      	con= DriverManager.getConnection(url, user1,pass1);   
	        Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery(addcard);  
	        
	        while(rs.next()) {
	        	String price = rs.getString("price");
	        	String qty = rs.getString("qty");
	        	System.out.println("price "+price);
	        	System.out.println("qty "+qty);
	        	Double p = Double.parseDouble(price);
	        	Double q = Double.parseDouble(qty);
	        	sum=sum+ p*q;
	        }
	        con.close();  
	        
	         }                
	    catch (Exception ex) {   
	    	 System.out.println("Error At bill Total");
	         System.err.println(ex); 
	      }
	    return sum;
	    
	}
	
	public static String UniqRandom(){
		String randomUniq;
		UUID uuid=UUID.randomUUID(); 
		System.out.println(uuid);  
		randomUniq = uuid.toString();
		return randomUniq;
	}
	

}
