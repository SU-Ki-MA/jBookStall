<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/css/bootstrap.min.css"
    integrity="sha512-XWTTruHZEYJsxV3W/lSXG1n3Q39YIWOstqvmFsdNEEQfHoZ6vm6E9GK2OrF6DSJSpIbRbi+Nn0WDPID9O7xB2Q=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="shortcut icon" href="./IMG/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="./CSS/main.css">
  <link rel="stylesheet" href="./CSS/Payment.css">

</head>

<body>

  <div class="main-container">
    <form action="NewPayment" method="post">
      <div class="login-container p-5">
        <h1>Cart ID:</h1>
        <div class="row">
          <div class="col-md-4 order-md-2 mb-4 ">
          </div>
          <?xml version="1.0" encoding="UTF-8" standalone="no"?>

          <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="256"
            height="256" viewBox="0 0 256 256" xml:space="preserve">


            <g style="stroke: none; stroke-width: 0; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: none; fill-rule: nonzero; opacity: 1;"
              transform="translate(1.4065934065934016 1.4065934065934016) scale(2.81 2.81)">
              <path
                d="M 84.83 72.913 H 5.17 c -2.855 0 -5.17 -2.315 -5.17 -5.17 V 22.257 c 0 -2.855 2.315 -5.17 5.17 -5.17 h 79.66 c 2.855 0 5.17 2.315 5.17 5.17 v 45.485 C 90 70.598 87.685 72.913 84.83 72.913 z"
                style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(54,59,56); fill-rule: nonzero; opacity: 1;"
                transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
              <path
                d="M 84.83 17.087 h -1.404 v 23.531 c 0 16.021 -12.987 29.008 -29.008 29.008 H 0.366 c 0.754 1.922 2.615 3.287 4.804 3.287 h 79.66 c 2.855 0 5.17 -2.315 5.17 -5.17 V 22.257 C 90 19.402 87.685 17.087 84.83 17.087 z"
                style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(46,50,47); fill-rule: nonzero; opacity: 1;"
                transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
              <path
                d="M 18.972 35.272 H 7.931 c -1.173 0 -2.123 -0.951 -2.123 -2.123 v -5.945 c 0 -1.173 0.951 -2.123 2.123 -2.123 h 11.041 c 1.173 0 2.123 0.951 2.123 2.123 v 5.945 C 21.095 34.321 20.145 35.272 18.972 35.272 z"
                style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(234,165,0); fill-rule: nonzero; opacity: 1;"
                transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
              <path
                d="M 19.885 46.116 H 7.018 c -0.617 0 -1.117 -0.499 -1.117 -1.117 s 0.5 -1.117 1.117 -1.117 h 12.868 c 0.617 0 1.117 0.499 1.117 1.117 S 20.502 46.116 19.885 46.116 z"
                style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(84,92,86); fill-rule: nonzero; opacity: 1;"
                transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
              <path
                d="M 38.684 46.116 H 25.817 c -0.617 0 -1.117 -0.499 -1.117 -1.117 s 0.5 -1.117 1.117 -1.117 h 12.868 c 0.617 0 1.117 0.499 1.117 1.117 S 39.301 46.116 38.684 46.116 z"
                style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(84,92,86); fill-rule: nonzero; opacity: 1;"
                transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
              <path
                d="M 57.484 46.116 H 44.615 c -0.617 0 -1.117 -0.499 -1.117 -1.117 s 0.499 -1.117 1.117 -1.117 h 12.869 c 0.617 0 1.117 0.499 1.117 1.117 S 58.101 46.116 57.484 46.116 z"
                style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(84,92,86); fill-rule: nonzero; opacity: 1;"
                transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
              <path
                d="M 76.283 46.116 H 63.414 c -0.617 0 -1.117 -0.499 -1.117 -1.117 s 0.499 -1.117 1.117 -1.117 h 12.869 c 0.617 0 1.117 0.499 1.117 1.117 S 76.9 46.116 76.283 46.116 z"
                style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(84,92,86); fill-rule: nonzero; opacity: 1;"
                transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
              <path
                d="M 31.052 65.099 H 7.018 c -0.617 0 -1.117 -0.499 -1.117 -1.117 c 0 -0.617 0.5 -1.117 1.117 -1.117 h 24.034 c 0.617 0 1.117 0.499 1.117 1.117 C 32.169 64.6 31.669 65.099 31.052 65.099 z"
                style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(84,92,86); fill-rule: nonzero; opacity: 1;"
                transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
              <path
                d="M 31.052 58.399 h -8.401 c -0.617 0 -1.117 -0.499 -1.117 -1.117 s 0.5 -1.117 1.117 -1.117 h 8.401 c 0.617 0 1.117 0.499 1.117 1.117 S 31.669 58.399 31.052 58.399 z"
                style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(84,92,86); fill-rule: nonzero; opacity: 1;"
                transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
              <path
                d="M 73.658 55.457 c -1.58 0 -2.974 0.734 -3.908 1.862 c -0.935 -1.128 -2.329 -1.862 -3.908 -1.862 c -2.814 0 -5.096 2.282 -5.096 5.096 c 0 2.814 2.282 5.096 5.096 5.096 c 1.58 0 2.974 -0.734 3.908 -1.862 c 0.935 1.128 2.329 1.862 3.908 1.862 c 2.814 0 5.096 -2.282 5.096 -5.096 C 78.754 57.738 76.472 55.457 73.658 55.457 z"
                style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(84,92,86); fill-rule: nonzero; opacity: 1;"
                transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
              <path
                d="M 70.668 64.649 c 0.838 0.622 1.865 0.999 2.99 0.999 c 2.814 0 5.096 -2.282 5.096 -5.096 c 0 -1.064 -0.328 -2.05 -0.885 -2.867 C 75.889 60.401 73.454 62.762 70.668 64.649 z"
                style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(73,79,74); fill-rule: nonzero; opacity: 1;"
                transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
            </g>
          </svg>
          
          <%String cId =(String)session.getAttribute("cId"); %>
          <input type="type" name="cId" value="<%= cId %>" />
         
          <div class="txt">

            <form class="needs-validation" novalidate action="NewPayment" method="post">

              <div class="row">
                <div class="col-md-12 mb-3">
                  <label for="cc-name">Name On Card</label>
                  <input type="text" name="cc-name" class="form-control" id="cc-name" placeholder="" required>
                  <small class="text-muted">Full name as displayed on card</small>
                  <div class="invalid-feedback">
                    Name on card is required
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 mb-3">
                  <label for="cc-number">Card Number</label>
                  <input maxlength='16' type="text" name="cc-number" class="form-control" id="cc-number" placeholder="" required>
                  <div class="invalid-feedback">
                    Credit card number is required
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="cc-expiration">Expiration Date</label>
                  <input maxlength='5' class="form-control" placeholder="MM/YY" type="text" name="cc-expiration"
                    onkeyup="formatString(event);">
                  <div class="invalid-feedback">
                    Expiration date required
                  </div>
                </div>
                <div class="col-md-3 mb-3"></div>
                <div class="col-md-3 mb-3">
                  <label for="cc-cvv">CVV</label>
                  <input maxlength='3' type="text" name="cc-cvv" class="form-control" id="cc-cvv" placeholder="" required>
                  <div class="invalid-feedback">
                    Security code required
                  </div>
                </div>
              </div>

              <button type="submit" class="btn btn-dark butt mt-3">Pay</button>
            </form>
          </div>
        </div>


      </div>

    </form>
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

	%>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
    crossorigin="anonymous"></script>
  <script>
    const toasts = document.getElementsByClassName('toast')
    for (i = 0; i < toasts.length; i++) {
      let elem = toasts.item(i)
      let elem_tost = new bootstrap.Toast(elem)
      elem_tost.show()
    }
  </script>
  <script type="text/javascript" src="JS/expiryDate.js"></script>
</body>

</html>