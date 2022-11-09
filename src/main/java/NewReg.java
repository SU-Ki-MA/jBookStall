

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
 * Servlet implementation class NewReg
 */
@WebServlet("/regChk")
public class NewReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewReg() {
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
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String user = request.getParameter("username");
        Boolean cred = chkRegx(email,pass,user);
        HttpSession session = request.getSession();
        
        
        if(!cred) {
        	String err = "Email or Username already exist";
        	forwordPageErr(request, response,err);
        }
        if(cred) {
        	
        	reg(request,response ,session,email,pass,user);
        }
        	
		
	}
	public static Boolean chkRegx(String email,String pass,String user) {
		String pregex = "^(?=.*[0-9])"
                + "(?=.*[a-z])(?=.*[A-Z])"
                + "(?=\\S+$).{8,250}$";
		Pattern p = Pattern.compile(pregex);
		Matcher m = p.matcher(pass);
		String regex = "^[A-Za-z0-9+_.-]+@(.+)$";
	    Pattern pattern = Pattern.compile(regex);
	    Matcher matcher = pattern.matcher(email);
	    String userRegex = "^[A-Za-z]\\w{5,29}$";
	    Pattern userPattern = Pattern.compile(userRegex);
	    Matcher userMatch = userPattern.matcher(user);
	    
	    System.out.println();
	    if(matcher.matches()&& m.matches()&&userMatch.matches()) {
	         return true;
	      }
	    else {
	    	return false;
	    }
	    
	}
	public static void forwordPageErr(HttpServletRequest request,HttpServletResponse response,String err) throws ServletException, IOException {
    	  request.setAttribute("val", err );
    	  RequestDispatcher rd = request.getRequestDispatcher("regChk.jsp");
    	  
    	  rd.forward(request, response);
	}
	
	public static void reg(HttpServletRequest request,HttpServletResponse response,HttpSession session,String email,String p,String user) throws ServletException, IOException {
//
		
		
		String cId= UniqRandom();
		String uId = UniqRandom();
		Argon2 argon2 = Argon2Factory.create();
        String hash = argon2.hash(10, 65536, 1, p.toCharArray());
        String url = ;        
        String user1 = "";                            
        String pass1 = "";  
        String sId = session.getId();
        int bool =0;
        
        String ipAddress = getClientIp(request);
        DateTimeFormatter dateTimeformate = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
        String now1 = dateTimeformate.format(LocalDateTime.now());
        Date sessionCreationTime = new Date(session.getCreationTime());
        Date lastUsed =new Date(session.getLastAccessedTime());
        
        String userCart = "INSERT INTO carts(c_id,u_id,chkout) VALUES ('"+cId+"','"+uId+"','"+bool+"');";
        String userEmail = "INSERT INTO email(email,u_id) VALUES ('"+email+"','"+uId+"');";
        String userReg = "INSERT INTO users VALUES ('"+uId+"','"+user+"',NULL,'"+hash+"',NULL,'"+now1+"','"+now1+"','"+ipAddress+"','"+sId+"');";   
        String userUpdate = "UPDATE users SET email = '"+email+"', c_id= '"+cId+"' WHERE u_id = '"+uId+"';";
        Connection con = null;                   
     
        try {                                              
                                       
     	Class.forName("com.mysql.cj.jdbc.Driver");       
     	con= DriverManager.getConnection(url, user1,pass1);   
        Statement st = con.createStatement();
        st.executeUpdate(userReg);                    
        st.executeUpdate(userEmail); 
        st.executeUpdate(userCart);
        st.executeUpdate(userUpdate); 
        con.close();   
     
        }                                                  

     
        catch (Exception ex) {                             
        System.err.println(ex); 
        forwordPageErr(request, response,ex.toString());
         
     }
//        session.setAttribute("ipAddress", ipAddress);
//        session.setAttribute("sessionId", sId);
        RequestDispatcher rd = request.getRequestDispatcher("LoginChk.jsp");
        rd.forward(request, response);
}
	
	public static String UniqRandom(){
		String randomUniq;
		UUID uuid=UUID.randomUUID(); //Generates random UUID  
		System.out.println(uuid);  
		randomUniq = uuid.toString();
		return randomUniq;
	}
	
	public static String getClientIp(HttpServletRequest request) {
        String remoteAddr = "";
        if (request != null) {
            remoteAddr = request.getHeader("X-FORWARDED-FOR");
            if (remoteAddr == null || "".equals(remoteAddr)) {
                remoteAddr = request.getRemoteAddr();
            }
        }

        return remoteAddr;
    }
	
	
	

}
