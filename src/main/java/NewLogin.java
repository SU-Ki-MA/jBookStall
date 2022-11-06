import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import de.mkammerer.argon2.Argon2Factory.Argon2Types;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.bouncycastle.crypto.generators.Argon2BytesGenerator;
import org.bouncycastle.crypto.params.Argon2Parameters;
import org.bouncycastle.util.test.Test;

import com.mysql.cj.protocol.Resultset;

import de.mkammerer.argon2.Argon2;

import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Servlet implementation class NewLogin
 */
@WebServlet("/newlogin")
public class NewLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NewLogin() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String user1 = "";
		String pass1 = "";
		Boolean cred = chkRegx(email, pass);
		Boolean validity =false;
		if (!cred) {
			String err = "Email or password is incorrect";
			forwordPageErr(request, response, err);
		}else {
			validity =verifyPassword(email,pass);
		}
		if(validity) {
			setSession(request, response);
		}
		else {
			String err = "Email or password is incorrect";
			forwordPageErr(request, response, err);
		}

	}

	public static Boolean chkRegx(String email, String pass) {
		String pregex = "^(?=.*[0-9])" + "(?=.*[a-z])(?=.*[A-Z])" + "(?=\\S+$).{8,250}$";
		Pattern p = Pattern.compile(pregex);
		Matcher m = p.matcher(pass);
		String regex = "^[A-Za-z0-9+_.-]+@(.+)$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(email);
		System.out.println();
		if (matcher.matches() && m.matches()) {
			return true;
		} else {
			return false;
		}
	}

	public static void forwordPageErr(HttpServletRequest request, HttpServletResponse response, String err)
			throws ServletException, IOException {
		request.setAttribute("val", err);
		RequestDispatcher rd = request.getRequestDispatcher("LoginChk.jsp");
		rd.forward(request, response);
	}

	public static Boolean verifyPassword(String email,String p ) {

		Argon2 argon2 = Argon2Factory.create();
		String hash = null;
		String url = "jdbc:mysql://localhost:3306/jb";
		String user1 = "";
		String pass1 = "";
		String sql = "select pass_hash from users where email = '" + email + "';";
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user1, pass1);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			while (rs.next()) {
				hash = rs.getString("pass_hash");
			}
			con.close();}
			catch (Exception ex) {
				System.out.println("verifyPassword ");
				System.err.println(ex);
			}
			if (argon2.verify(hash, p.toCharArray())) {
				return true;
			} else {
				return false;
			}
	}

	public static void setSession(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String url = "jdbc:mysql://localhost:3306/jb";
		String user1 = "";
		String pass1 = "";
		Connection con = null;
		String ipAddress = getClientIp(request);
		String sId =session.getId();
		DateTimeFormatter dateTimeformate = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
        String now1 = dateTimeformate.format(LocalDateTime.now());
        Date sessionCreationTime = new Date(session.getCreationTime());
        
        String uId = "";
        String cId = "";
        String getCid = "select c_id,u_id from users WHERE email = '"+email+"';";
		String updateSession = "UPDATE users SET session_id = '"+sId+"', session_ip_address= '"+ipAddress+"' , session_creation = '"+sessionCreationTime+"' WHERE email = '"+email+"';";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user1, pass1);
			Statement st = con.createStatement();
			st.executeUpdate(updateSession);
			ResultSet rs = st.executeQuery(getCid);
			if(rs.next()) {
				cId = rs.getString("c_id");
				uId = rs.getString("u_id");
			}
			
			con.close();
			}
		
		catch (Exception ex) {
			System.out.println("setSession");
				System.err.println(ex);
			}
		System.out.println("uid at login "+uId);
		request.setAttribute("uId", uId);
		request.setAttribute("cId", cId);
		session.setAttribute("uId", uId);
		session.setAttribute("cId", cId);
		session.setAttribute("email", email);
		session.setAttribute("ipAddress", ipAddress);
		session.setAttribute("sessionId", session.getId());
		request.setAttribute("session", session);
		RequestDispatcher rd = request.getRequestDispatcher("home.html");
        rd.forward(request, response);
       

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
