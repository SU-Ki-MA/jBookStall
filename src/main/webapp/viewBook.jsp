<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); %>
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
  <link rel="stylesheet" href="./CSS/book.css">
  <title>Book</title>
</head>

<body>
  <nav class="navbar navbar-dark navbar-expand-lg bg-dark fixed-top" id="the-nav">
    <div class="container-fluid">
      <a class="navbar-brand brand" href="home.html">JBookStall</a>
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
            <li><form action="viewUser.jsp" method="post"><button type="submit" class=" dropdown-item">User</button></form></li>
            <li><form action="viewCart" method="post"><button type="submit" class=" dropdown-item">Cart</button></form></li>
            <li><a class="dropdown-item" href="/logout">logout</a></li>
          </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  			
  <div class="main-container book-container">
  

    <div class="img-container">
      <img
        src=<%= request.getParameter("image")%>
        class="img-fluid rounded img-book" alt="...">
    </div>
    <div class="details">
      <table class="table table-borderless table-css">
        <tr>
          <th>ID</th>
          <td><%= request.getParameter("id")%></td>
        </tr>
        <tr>
          <th>Name</th>
          <td><%= request.getParameter("name")%></td>
        </tr>
        <tr>
          <th>Description</th>
          <td> <%= request.getParameter("desc")%></td>
        </tr>
        <tr>
          <th>Price</th>
          <td>Rs. <%= request.getParameter("price")%></td>
        </tr>
        <tr>
          <th>Stock</th>
          <td><%= request.getParameter("stock")%></td>
        </tr>
        <tr>
          <th>Author</th>
          <td><%= request.getParameter("author")%></td>
        </tr>
      </table>
      <div>

       <form action="cart" method="post">
         <input type="hidden" name="id" value=<%= request.getParameter("id")%>>
            <input type = "hidden" name = "image" value = <%= request.getParameter("image")%> >
            <input type="hidden" name="author" value=<%= request.getParameter("author")%>>
            <input type="hidden" name="authorid" value=<%= request.getParameter("authorid")%>>
            <input type="hidden" name="desc" value=<%= request.getParameter("desc")%>>
            <input type="hidden" name="name" value=<%= request.getParameter("name")%>>
            <input type="hidden" name="price" value=<%= request.getParameter("price")%>>
            <input type="hidden" name="stock" value=<%= request.getParameter("stock")%>>
      <button type="submit" class="btn btn-dark mt-3 butt">Add to  Cart</button>
      </form>
      </div>
    </div>
  </div>
  <%System.out.print( request.getParameter("price")); %>
  
  
  
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