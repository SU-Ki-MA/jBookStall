<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html lang="en">
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); %>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/css/bootstrap.min.css"
    integrity="sha512-XWTTruHZEYJsxV3W/lSXG1n3Q39YIWOstqvmFsdNEEQfHoZ6vm6E9GK2OrF6DSJSpIbRbi+Nn0WDPID9O7xB2Q=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="shortcut icon" href="./IMG/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="./CSS/main.css">
  <link rel="stylesheet" href="./CSS/user.css">
  <title>Profile</title>
</head>

<body>
  <nav class="navbar navbar-dark navbar-expand-lg bg-dark fixed-top" id="the-nav">
    <div class="container-fluid">
      <a class="navbar-brand brand" href="#">JBookStall</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
        aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse nav-item-set" id="navbarNavDropdown">
        <ul class="navbar-nav items-container">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="home.html">Home</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">
              Profile
            </a>
            <ul class="dropdown-menu dropdown-menu-dark">
              <li><a class="dropdown-item active" href="#">Username</a></li>
              <li><form action="viewCart" method="post"><button type="submit" class=" dropdown-item">Cart</button></form></li>
              <li><form action="logout" method="post"><button type="submit" class=" dropdown-item">Logout</button></form></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  		<%@page import = "java.sql.Connection"%>
		<%@page import ="java.sql.Date"%>
		<%@page import ="java.sql.DriverManager"%>
		<%@page import ="java.sql.ResultSet"%>
		<%@page import ="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
  <%
	  	String url = ;        
	 	String user1 = "";                            
		String pass1 = "";
	  	String uId =(String) session.getAttribute("uId");
	  	String searchUser = "select email,creation_time,session_creation from users where u_id = '"+uId+"' ;";
		
	  	String email="";
	  	String ct="";
	  	String sc="";
		Connection con = null; 
	     
	     try {                                              
	      	Class.forName("com.mysql.cj.jdbc.Driver");       
	      	con= DriverManager.getConnection(url, user1,pass1);   
	        Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery(searchUser);  
	        if(rs.next()) {
	        	email = rs.getString("email");
	        	ct = rs.getString("creation_time");
	        	sc = rs.getString("session_creation");
	        }
	       
	        con.close();   
	         }                
	         catch (Exception ex) {   
	        	 System.out.println("View user ");
	         System.err.println(ex); 
	      }
  
  
  out.println(" <div class=\"main-container\">\r\n"
			+ "    <div class=\"profile\">\r\n"
			+ "      <div class=\"user-info\">\r\n"
			+ "        <h2>UserName # Uid "+ uId+"</h2>\r\n"
			+ "        <h6> "+ email+"</h6>\r\n"
			+ "        <table cellpadding=\"5\" cellspacing=\"5\">\r\n"
			+ "          <tr>\r\n"
			+ "            <td>Account Creation Time</td>\r\n"
			+ "            <td>"+ ct+"</td>\r\n"
			+ "          </tr>\r\n"
			+ "          <tr>\r\n"
			+ "            <td>Last Access Time</td>\r\n"
			+ "            <td>"+ sc+"</td>\r\n"
			+ "          </tr>\r\n"
			+ "        </table>\r\n"
			+ "      <form action=\"viewCart\" method=\"post\"><button type=\"submit\" class=\"btn btn-dark butt mt-3\">Cart</button></form>"
			+ "      </div>\r\n"
			+ "      <div class=\"bill-container\">\r\n"
			+ "        <table class=\"bill-table\">\r\n"
			+ "          <thead>\r\n"
			+ "            <tr>\r\n"
			+ "              <th scope=\"col\">#</th>\r\n"
			+ "              <th scope=\"col\">Bill ID</th>\r\n"
			+ "              <th scope=\"col\">Date-Time</th>\r\n"
			+ "              <th scope=\"col\">Total</th>\r\n"
			+ "              <th scope=\"col\">Cart ID</th>\r\n"
			+ "            </tr>\r\n"
			+ "          </thead>\r\n"
			+ "          <tbody>\r\n"
			+ "            <tr>\r\n");
  		 String getBill="SELECT c_id,bill_id,bill_time,bill_total FROM carts NATURAL JOIN checkouts where u_id='"+uId+"' order by bill_time asc;";
  		 String cId=null,bill_id=null,bill_total=null,bill_time=null;
		  try {                                              
		    	Class.forName("com.mysql.cj.jdbc.Driver");       
		    	con= DriverManager.getConnection(url, user1,pass1);   
		      	Statement st = con.createStatement();
		     	ResultSet rs = st.executeQuery(getBill);
		     	int i =0;
		      while(rs.next()) {
		    	  i++;
		      	cId = rs.getString("c_id");
		      	bill_id = rs.getString("bill_id");
		      	bill_total = rs.getString("bill_total");
		      	bill_time = rs.getString("bill_time");
		      	out.println(
		     			"              <td data-label=\"#\">"+i+"</td>\r\n"
		     			+ "              <td data-label=\"Bill ID\">"+bill_id+"</td>\r\n"
		     			+ "              <td data-label=\"Date-Time\">"+bill_time+"</td>\r\n"
		     			+ "              <td data-label=\"Total\">"+bill_total+"</td>\r\n"
		     			+ "              <td data-label=\"Cart ID\"><form action=\"NewCart.jsp?cId="+cId+"&oldCart=1"
		     			+"\" method=\"post\"><button type=\"submit\" class=\"btn link-text bg-transparent\"> # "+ cId
		     			+"</button></form></td>\r\n"
		     			+ "            </tr>\r\n");
		      }
		     
		      con.close();   
		       }                
		       catch (Exception ex) {   
		      	 System.out.println("View user ");
		       System.err.println(ex); 
		    }

  out.println("         </tbody>\r\n"
			+ "        </table>\r\n"
			+ "      </div>\r\n"
			+ "    </div>\r\n"
			+ "  </div>");
  %>
  	    	
  
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.bundle.min.js"
    integrity="sha512-9GacT4119eY3AcosfWtHMsT5JyZudrexyEVzTBWV3viP/YfB9e2pEy3N7WXL3SV6ASXpTU0vzzSxsbfsuUH4sQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script>
    function myFunction(x) {
      if (x.matches) { // If media query matches
        document.getElementById('the-nav').className = 'navbar navbar-dark navbar-expand-lg bg-dark fixed-bottom';
      } else {
        document.getElementById('the-nav').className = 'navbar navbar-dark navbar-expand-lg bg-dark fixed-top';
      }
    }
    var x = window.matchMedia("(max-width: 992px)")
    myFunction(x)
    x.addListener(myFunction)
  </script>
  <script>
    const toasts = document.getElementsByClassName('toast')
    for (i = 0; i < toasts.length; i++) {
      let elem = toasts.item(i)
      let elem_tost = new bootstrap.Toast(elem)
      elem_tost.show()
    }
  </script>
</body>

</html>