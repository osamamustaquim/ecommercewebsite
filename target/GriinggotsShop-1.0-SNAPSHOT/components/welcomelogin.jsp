<%@page import="com.mycompany.entities.User"%>

<%

    User usernow = (User) session.getAttribute("current-user");


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
        <%@include file = "common_css_js.jsp" %> 
    </head>
  
        <body> 
              
            <div class="header mt-2 bg-success">
                <div class="container">
                    <div class="sticky">
                        <a class="navbar-brand" href="index.jsp"><h1><b>Hello  <%=  usernow.getUserName()   %> Welcome to Gringgots Shop</b></h1></a></div>
                    </div>
            </div>
                     
           
</body>
</html>
