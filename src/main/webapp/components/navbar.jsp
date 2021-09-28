<%@page import="com.mycompany.entities.User"%>

<%

    User user1 = (User) session.getAttribute("current-user");


%>


<nav class="navbar navbar-expand-lg navbar-dark mt-2 bg-primary  " id="navbar_top">
    <div class="container">

        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contactus.jsp">Contact Us</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                
                
                <li class="nav-item active">
                    <a class="nav-link mt-2" href="#"  data-toggle="modal" data-target="#cart">  <i class="fa fa-shopping-cart"   style="font-size: 25px; "></i>  <span class="ml-auto  cart-items" style="font-size:15px;"> (0)</span>   </a>
                    
                </li>
                

                <%                 if (user1 == null) {

                %>
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp" >
                        <button class="btn btn-outline-success my-2 my-sm-0" style="color: white">Login</button></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp" ><button class="btn btn-outline-success my-2 my-sm-0" style="color: white">Register</button></a>
                </li> 

                <%             } else {

                %>

                <li class="nav-item active">
                    <a class="nav-link" href="<%=  user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp" %>" >
                        </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="logoutServlet" ><button class="btn btn-success my-2 my-sm-0" style="color: white">Logout</button></a>
                </li>

                <%
                    }

                %>

            </ul>
        </div>


    </div>
</nav>
              