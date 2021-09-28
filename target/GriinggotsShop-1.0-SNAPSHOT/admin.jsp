
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.griinggotsshop.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.entities.Category"%>
<%@page import="com.mycompany.griinggotsshop.FactoryProvider"%>
<%@page import="com.mycompany.dao.CategoryDao"%>
<%@page import="com.mycompany.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "Please login! first....");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "Your not an admin! Do not access this page.");
            response.sendRedirect("login.jsp");
            return;
        }

    }
%>


<%                                CategoryDao cdao = new CategoryDao(FactoryProvider.getfactory());
                                      List<Category> list = cdao.getCategories();
                                      //getting count
                                     Map<String,Long> m=Helper.getCounts(FactoryProvider.getfactory());
%>  



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel</title>
        <%@include file = "components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file = "components/navbar.jsp" %>

        <div class="container  admin">


            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>                
            </div>

            <div class="row mt-3">

                <!--first column-->
                <div class="col-md-4">                     
                    <div class="card">
                        <div class="card-body  text-center">

                            <div class="container">                                 
                                <img style="max-width:130px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon"/>
                            </div>
                            <h3><%= m.get("userCount")   %></h3>
                            <h3 class="text-uppercase text-muted">Users</h3>
                        </div>                         
                    </div>                     
                </div>

                <!--second column-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center"> 

                            <div class="container">                                 
                                <img style="max-width:130px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon"/>
                            </div>

                            <h3><%= list.size() %> </h3>
                            <h3 class="text-uppercase text-muted">Categories</h3>
                        </div>                         
                    </div>
                </div>

                <!--third column-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center"> 

                            <div class="container">                                 
                                <img style="max-width:130px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon"/>
                            </div>

                            <h3><%= m.get("productCount")   %></h3>
                            <h3 class="text-uppercase text-muted">Products</h3>
                        </div>                         
                    </div>
                </div>

            </div>





            <div class="row mt-3">

                <!--fourth column-->
                <div class="col-md-6">                     
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body  text-center">

                            <div class="container">                                 
                                <img style="max-width:130px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon"/>
                            </div>
                            <h5 class="mt-2">Click here to add new category</h5>
                            <h3 class="text-uppercase text-muted">Add Category</h3>
                        </div>                         
                    </div>                     
                </div>

                <!--fifth column-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center"> 

                            <div class="container">                                 
                                <img style="max-width:130px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon"/>
                            </div>

                            <h5 class="mt-2">Click here to add new product</h5>
                            <h3 class="text-uppercase text-muted">Add Product</h3>
                        </div>                         
                    </div>
                </div>                
            </div>
        </div>


        <!-- add category modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-dark  text-white">
                        <h5 class="modal-title" id="exampleModalLabel"> Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form  action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory"/>

                            <div class="form-group">
                                <input type="text" class="form-control" name="categtitle" placeholder="Enter category title" required/>
                            </div>

                            <div class="form-group">
                                <textarea  style="height: 150px" class="form-control" name="categDescription" placeholder="Enter category description" required></textarea>
                            </div>  
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success">Add category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>

                        </form>

                    </div>                  
                </div>
            </div>
        </div>
        <!-- end category modal-->


        <!-- add product modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-dark  text-white">
                        <h5 class="modal-title" id="exampleModalLabel"> Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form  action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct"/>

                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter Product title" required/>
                            </div>

                            <div class="form-group">
                                <textarea  style="height: 150px" class="form-control" name="pDesc" placeholder="Enter product description" required/></textarea>
                            </div>  

                            <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter Product price" required/>
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product discount" required/>
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product quantity" required/>
                            </div>


                            <!--product category-->


                            <div class="form-group">
                                <select name="catId" class="form-control" id="catId">
                                    <%                                        for (Category c : list) {
                                    %>                                     
                                    <option value="<%=c.getCategoryId()%>">    <%=c.getCategoryTitle()%>     </option>
                                    <%
                                        }%>
                                </select>
                            </div>                  

                            <!--product file-->
                            <div class="form-group">
                                select picture of product<br>
                                <input type="file" name="pPic"  required />
                            </div>

                            <div class="container text-center">
                                <button  type="submit" class="btn btn-outline-success">Add Product</button>

                            </div>

                        </form>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>       
                        </div>

                    </div>                  
                </div>
            </div>
        </div>
        <!-- end product  modal-->




    </body>
</html>
