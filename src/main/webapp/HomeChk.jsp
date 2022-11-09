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
  <link rel="stylesheet" href="./CSS/home.css">
  <title>Home</title>
</head>
<nav class="navbar navbar-dark navbar-expand-lg bg-dark fixed-top" id="the-nav">
  <div class="container-fluid">
    <a class="navbar-brand brand" href="/home">JBookStall</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
      aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse nav-item-set" id="navbarNavDropdown">
      <ul class="navbar-nav items-container">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Profile
          </a>
          <ul class="dropdown-menu dropdown-menu-dark">
            <li><a class="dropdown-item" href="/user">Username</a></li>
            <li><a class="dropdown-item" href="/cart">Cart</a></li>
            <li><a class="dropdown-item" href="/logout">logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="main-container">
  <div class="form-floating mb-3 search-div">
    <input type="text" name="searchtext" class="form-control input-tf" id="floatingSearchText" placeholder="Search"
      autocomplete="off">
    <label for="floatingSearchText">Search</label>
    <button type="button" class="btn btn-dark butt" onclick="search()">Search</button>
  </div>
  <div class="grid-contents" id="grid-book">
  </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.bundle.min.js"
  integrity="sha512-9GacT4119eY3AcosfWtHMsT5JyZudrexyEVzTBWV3viP/YfB9e2pEy3N7WXL3SV6ASXpTU0vzzSxsbfsuUH4sQ=="
  crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
  function myFunction(x) {
    if (x.matches) { // If media query matches
      document.getElementById('the-nav').className = 'navbar navbar-dark navbar-expand-lg bg-dark fixed-bottom';
      for (a in document.getElementsByClassName('img-fluid rounded-start')) {
        a.className = "card-img-top img-card"
      }
    } else {
      document.getElementById('the-nav').className = 'navbar navbar-dark navbar-expand-lg bg-dark fixed-top';
      for (a in document.getElementsByClassName('card-img-top')) {
        a.className = "img-fluid rounded-start img-card"
      }
    }
  }
  var x = window.matchMedia("(max-width: 992px)")
  myFunction(x)
  x.addListener(myFunction)
</script>
<script>
  async function sendreq(ipstr) {
    let res = await fetch(`http://localhost:3777/?str=${ipstr}`)
    document.getElementById('grid-book').innerHTML = ""
    console.log(res)
    res = await res.json()
    console.log(res)
    res.forEach(elem => {
      previousChilds = document.getElementById('grid-book').innerHTML
      document.getElementById('grid-book').innerHTML = previousChilds + ` out value="${test}" <div class="card card-flex bg-dark">
      <div class="img-div">
        <img
          src="${elem.image?.toString()}"
          class="img-fluid rounded img-card" alt="${elem.name}_image">
      </div>
      <div class="card-body card-content">
        <div class="card-details">
          <h5 class="card-title">${elem.name?.toString()}</h5>
          <p class="card-text">${elem.desc?.substring(0, 130)}...</p>
        </div>
        <div class="buttons-set">
          <form action="/cart" method="post" class="hidden-forms">
            <input type="hidden" name="id" value="${elem.id?.toString()}">
            <input type = "hidden" name = "image" value = "${elem.image?.toString()}" >
            <input type="hidden" name="author" value="${elem.author?.toString()}">
            <input type="hidden" name="authorid" value="${elem.authorid?.toString()}">
            <input type="hidden" name="desc" value="${elem.desc?.toString()}">
            <input type="hidden" name="name" value="${elem.name?.toString()}">
            <input type="hidden" name="price" value="${elem.price?.toString()}">
            <input type="hidden" name="stock" value="${elem.stock?.toString()}">
            <button type="submit" class="btn btn-dark mt-3 butt">Add to cart</button>
          </form>
          <form action="/book" method="post" class="hidden-forms">
            <input type="hidden" name="id" value="${elem.id?.toString()}">
            <input type="hidden" name="name" value="${elem.name?.toString()}">
            <input type="hidden" name="author" value="${elem.author?.toString()}">
            <input type="hidden" name="authorid" value="${elem.authorid?.toString()}">
            <input type="hidden" name="desc" value="${elem.desc?.toString()}">
            <input type="hidden" name="image" value="${elem.image?.toString()}">
            <input type="hidden" name="price" value="${elem.price?.toString()}">
            <input type="hidden" name="stock" value="${elem.stock?.toString()}">
            <button type="submit" class="btn btn-dark mt-3 butt">view</button>
          </form>
        </div>
      </div>
    </div> `;
    })
  }
  document.getElementById('grid-book').innerHTML =
    `<div class="spinner-border text-info" role="status">
                  <span class="visually-hidden">Loading...</span>
                </div>`;
  sendreq("");
</script>
<script>
  function search() {
    document.getElementById('grid-book').innerHTML =
      `<div class="spinner-border text-info" role="status">
  <span class="visually-hidden">Loading...</span>
</div>`;
    let search_text = document.getElementById('floatingSearchText').value
    sendreq(search_text)
  }
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