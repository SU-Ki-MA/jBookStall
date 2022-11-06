<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/css/bootstrap.min.css"
    integrity="sha512-XWTTruHZEYJsxV3W/lSXG1n3Q39YIWOstqvmFsdNEEQfHoZ6vm6E9GK2OrF6DSJSpIbRbi+Nn0WDPID9O7xB2Q=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="shortcut icon" href="./IMG/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="./CSS/main.css">
  <link rel="stylesheet" href="./CSS/cart.css">
  <title>Cart</title>
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
              <li><a class="dropdown-item" href="/user">Username</a></li>
              <li><a class=" dropdown-item active" href="#">Cart</a></li>
              <li><a class="dropdown-item" href="/logout">logout</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="main-container">
    <div class="table-grid">
    
    
      <%	
	    if(request.getAttribute("valid")!=null){
		out.println("<div class=\"toast-container position-fixed bottom-0 end-0 p-3\">\r\n"
	    		+ "    <div class=\"toast align-items-center text-bg-danger border-0\" role=\"alert\" aria-live=\"assertive\" aria-atomic=\"true\">\r\n"
	    		+ "      <div class=\"d-flex\">\r\n"
	    		+ "       \r\n"
	    		+ "	<div class=\"toast-body\">\r\n"+
	    				request.getAttribute("valid")
	    		+ "    \r\n"
	    		+ "  </div>\r\n"
	    		+ "	\r\n"
	    		+ "	\r\n"
	    		+ "        \r\n"
	    		+ "        <button type=\"button\" class=\"btn-close btn-close-white me-2 m-auto\" data-bs-dismiss=\"toast\"\r\n"
	    		+ "          aria-label=\"Close\"></button>\r\n"
	    		+ "      </div>\r\n"
	    		+ "    </div>\r\n"
	    		+ "  </div>\r\n"
	    		+ "");
	}
	//if(request.getParameter("accounts") == null)
	//	username = "";
	//request.getAttribute("data");
	%>
      <h2>Cart ID : <%out.println(request.getParameter("cId")); %> <span class="text-success"><%if(request.getAttribute("valid")!=null){out.println(request.getAttribute("valid"));} %></span></h2>

      <div class="cart">

        
        
		<%@page import = "java.sql.Connection"%>
		<%@page import ="java.sql.Date"%>
		<%@page import ="java.sql.DriverManager"%>
		<%@page import ="java.sql.ResultSet"%>
		<%@page import ="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>        
        
        
        <%
        String url = "jdbc:mysql://localhost:3306/jb";        
	    String user1 = "root";                            
	    String pass1 = "zxer";
	    String id = request.getParameter("id");	
	    System.out.println(id);
	    String uId = request.getParameter("uId");
		String cId = request.getParameter("cId");
		System.out.println("cid = "+cId);
		System.out.println("uId = "+uId);
		session.setAttribute("cId",cId); 
		
		String searchBook = "SELECT cd.c_id,cd.b_id,b.b_name,cd.price,cd.qty FROM cart_data AS cd, books AS b WHERE cd.b_id = b.b_id  and cd.c_id='"+ cId+"' ;";
	    Boolean chkout = false;
		request.setAttribute("cId",cId);
	 
		Connection con = null; 
		int i=0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");       
	      	con= DriverManager.getConnection(url, user1,pass1);   
	        Statement st = con.createStatement();
	        if(request.getAttribute("purchased")!=null){
	        	String pid =(String) request.getAttribute("purchased");
	        	searchBook = "SELECT cd.c_id,cd.b_id,b.b_name,cd.price,cd.qty FROM cart_data AS cd, books AS b WHERE cd.b_id = b.b_id  and cd.c_id='"+request.getAttribute("purchased")+"' ;";
	        }
	        ResultSet rs = st.executeQuery(searchBook);  
	        
	        while(rs.next()) {
	        	i++;
	        	
	        	String price = rs.getString("price");
	        	String qty = rs.getString("qty");
	        	System.out.println("price "+price);
	        	System.out.println("qty "+qty);
	        	Double p = Double.parseDouble(price);
	        	Double q = Double.parseDouble(qty);
	        	Double sum= p*q;
	        	out.println("        <div class=\"cart-item\">\r\n"
	    	     		+ "          <div>\r\n"
	    	     		+ "            <h5>No</h5>\r\n"
	    	     		+ "            <p>"+i+"</p>\r\n"
	    	     		+ "          </div>\r\n"
	    	     		+ "          <div>\r\n"
	    	     		+ "            <h5>Book ID</h5>\r\n"
	    	     		+ "           <p>Rs. "+rs.getString("b_id")+"</p>\r\n"
	    	     		+ "          </div>\r\n"
	    	     		+ "          <div>\r\n"
	    	     		+ "            <h5>Book Name</h5>\r\n"
	    	     		+ "            <p>"+rs.getString("b_name")+"</p>\r\n"
	    	     		+ "          </div>\r\n"
	    	     		+ "          <div>\r\n"
	    	     		+ "            <h5>Price</h5>\r\n"
	    	     		+ "            <p>Rs. "+rs.getString("price")+"</p>\r\n"
	    	     		+ "          </div>\r\n"
	    	     		+ "          <div>\r\n"
	    	     		+ "            <div>\r\n"
	    	     		+ "              <h5>Qty</h5>\r\n"
	    	     		+ "              <p>"+rs.getString("qty")+"</p>\r\n"
	    	     		+ "            </div>\r\n"
	    	     		+ "            <div>\r\n"
	    	     		+ "              <form action=\"AQty\" method=\"post\"><input type=\"hidden\" name=\"bookid\" value=\"\"><input type=\"hidden\"\r\n"
	    	     		+ "                  name=\"operation\" value=\"1\"><button type=\"button\" class=\"btn btn-success\">+</button></form>\r\n"
	    	     		+ "              <form action=\"AQty\" method=\"post\"><input type=\"hidden\" name=\"bookid\" value=\"\"><input type=\"hidden\"\r\n"
	    	     		+ "                  name=\"operation\" value=\"1\"><button type=\"button\" class=\"btn btn-secondary\">-</button></form>\r\n"
	    	     		+ "            </div>\r\n"
	    	     		+ "          </div>\r\n"
	    	     		+ "          <div>\r\n"
	    	     		+ "            <h5>Total</h5>\r\n"
	    	     		+ "            <p>"+sum+"</p>\r\n"
	    	     		+ "          </div>\r\n"
	    	     		+ "          <div>\r\n"
	    	     		+ "            <form action=\"/cart\" method=\"post\"><input type=\"hidden\" name=\"bookid\" value=\"\"><input type=\"hidden\"\r\n"
	    	     		+ "                name=\"operation\" value=\"1\"><button type=\"button\" class=\"btn btn-danger\">x</button></form>\r\n"
	    	     		+ "          </div>\r\n"
	    	     		+ "        </div>");
	        	
	        	
	        }
	        
	        con.close();   
	         }                
	         catch (Exception ex) {                             
	         System.err.println(ex); 
	      }
		
		%>
		<!-- repeating content -->

      </div>
      <div class="cart-end">
        <div class="checkout-buttons">
          <p>SubTotal: <span>Rs. 12618</span></p>
          <% if(request.getAttribute("purchased")!=null){
        	  out.println("<button type=\"button\" class=\"btn btn-dark mt-3 butt\"><a class=\"dropdown-item\" href=\"home.html\">Return to Home</a></button>");
          }else{
        	  out.println("<button type=\"button\" class=\"btn btn-dark mt-3 butt\"><a class=\"dropdown-item\" href=\"payment.jsp\">Proceed to Checkout</a></button>");
          }
          
          %>
         <!--  <button type="button" class="btn btn-dark mt-3 butt"><a class="dropdown-item" href="payment.jsp">Proceed to Checkout</a></button> -->
        </div>
      </div>
    </div>
  </div>
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