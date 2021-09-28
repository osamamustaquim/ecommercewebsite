<%  User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "Please login! first....");
        response.sendRedirect("login.jsp");
        return;
    }%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Out</title>
        <%@include file = "components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file = "components/navbar.jsp" %>

        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Order Summary</h3>
                            <div class="cart-body"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"> 
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Order Details</h3>

                            <form>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input    value="<%=  user.getUserEmail()   %>"            type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input value="<%=  user.getUserName()   %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">                                  
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Shipping Address</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="enter your shipping address"></textarea>
                                </div>
                                <div class="container">
                                    <button class="btn btn-outline-success text-center">Order now </button>
                                    <button class="btn btn-outline-primary text-center">Continue Shopping  </button>
                                </div>
                            </form>


                        </div>
                    </div>

                </div>

            </div>

        </div>

        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
