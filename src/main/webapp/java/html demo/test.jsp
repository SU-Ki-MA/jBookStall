<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="login" method="post">
	
	email : <input type="text" name= "email"><br><br>
	
	password : <input type="password" name= "pass"><br>
	<input type= "submit" >
	<img src="img/re.png" alt="Girl in a jacket" width="500" height="600">
	
	</form>
	<%
	String username, acc;
	request.getAttribute("val");
	if(request.getAttribute("val")!=null){
		out.println(request.getAttribute("val"));
	}
	
	//if(request.getParameter("accounts") == null)
	//	username = "";
	//request.getAttribute("data");
	%>
</body>
</html>