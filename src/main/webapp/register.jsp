

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registration</title>
        <%@include file = "components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file = "components/navbar.jsp" %>
        
        
        <div class="container-fluid ">
        
        <div class="row  mt-5">
            
            <div class="col-md-4 offset-md-4 ">
                <%@include file = "components/message.jsp" %>
                
                <div class="card bgclr">
                    <div class="card-body px-5">                
                
                <h4 class="text-center my-3">Sign-Up</h4>
                <form action="RegisterServlet" method="post">
                    <div class="form-group">
                        <label for="name">User Name</label>
                             <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="enter here">                             
                     </div>
                    <div class="form-group">
                        <label for="email">User Email</label>
                             <input  name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="enter here">                             
                     </div>
                    <div class="form-group">
                        <label for="password">User password</label>
                             <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="enter here">                             
                     </div>
                    
                    <div class="form-group">
                        <label for="phone">User phone</label>
                             <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="enter here">                             
                     </div>
                    
                    <div class="form-group">
                     Please Choose your Membership
                        <select name="user_type" class="form-control" id="user_type"> 
                            <option value="normal"> Normal</option>
                            <option value="primemember"> Prime Membership</option>
                        </select>                             
                    </div>
                    
                    <div class="form-group">
                        User address
                        <textarea name="user_address" style="height: 130px;" class="form-control"  placeholder="enter your address"> </textarea>                            
                     </div>
                    
                    <div class="container text-center">
                        <button class="btn btn-success">Register</button>
                        <button type="reset" class="btn btn-warning">Reset</button>                        
                    </div>
                    
                </form> 
                </div>
                </div>
            </div>            
        </div>
        </div>
        
    </body>
</html>
