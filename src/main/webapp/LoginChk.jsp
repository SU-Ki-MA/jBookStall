<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login jBookStall</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/css/bootstrap.min.css"
    integrity="sha512-XWTTruHZEYJsxV3W/lSXG1n3Q39YIWOstqvmFsdNEEQfHoZ6vm6E9GK2OrF6DSJSpIbRbi+Nn0WDPID9O7xB2Q=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="shortcut icon" href="./IMG/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="./CSS/main.css">
  <link rel="stylesheet" href="./CSS/login.css">
</head>

<body class="bg-dark">
  <div class="main-container">
    <div class="login-container p-5">
      <h1>Login</h1>
      <form action="NewLogin" method="post">
        <div class="mt-3">
          <div class="form-floating mb-3">
            <input type="email" name="email" class="form-control input-tf" id="floatingEmail"
              placeholder="name@example.com" autocomplete="off">
            <label for="floatingEmail">Email address</label>
          </div><span name="errorName">${errors.Name}</span>
          <div class="form-floating">
            <input type="password" name="pass" class="form-control input-tf" id="floatingPassword"
              placeholder="Password" autocomplete="off">
            <label for="floatingPassword">Password</label>
          </div>
        </div>
        <button type="submit" class="btn btn-dark butt mt-3">Login</button>
      </form>
      <a href="./regChk.jsp" class="link-text mt-2">new user?</a>
    </div>
  </div>
  
  <%	
	    if(request.getAttribute("val")!=null){
		out.println("<div class=\"toast-container position-fixed bottom-0 end-0 p-3\">\r\n"
	    		+ "    <div class=\"toast align-items-center text-bg-danger border-0\" role=\"alert\" aria-live=\"assertive\" aria-atomic=\"true\">\r\n"
	    		+ "      <div class=\"d-flex\">\r\n"
	    		+ "       \r\n"
	    		+ "	<div class=\"toast-body\">\r\n"+
	    				request.getAttribute("val")
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
 
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.bundle.min.js"
    integrity="sha512-9GacT4119eY3AcosfWtHMsT5JyZudrexyEVzTBWV3viP/YfB9e2pEy3N7WXL3SV6ASXpTU0vzzSxsbfsuUH4sQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
	
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