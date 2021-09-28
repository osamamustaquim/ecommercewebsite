<%@page import="com.mycompany.griinggotsshop.Helper"%>
<%@page import="com.mycompany.entities.Category"%>
<%@page import="com.mycompany.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.entities.Product"%>
<%@page import="com.mycompany.dao.ProductDao"%>
<%@page import="com.mycompany.griinggotsshop.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Shopping</title>

        <%@include file = "components/common_css_js.jsp" %> 

    </head>
    <body>
         <%@include file = "components/headerall.jsp" %>
        <%@include file = "components/navbar.jsp" %>
        <!--- start of container -->
        <div class="container-fluid">
            <div class="row mt-3">

                <%                //<!--- getting id by clicking -->
                    String cat = request.getParameter("category");

                    ProductDao dao = new ProductDao(FactoryProvider.getfactory());

                    //setting category page on product wise by selecting id
                    List<Product> list = null;

                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);
                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getfactory());
                    List<Category> listc = cdao.getCategories();
                %>


                <!-- show category-->
                <div class="col-md-2 mt-4">

                    <div class="list-group custom-bg text-white stickproduct" >
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active ">
                            <h2><i class="fa fa-list-alt        " aria-hidden="true">       All Products</i></h2>
                        </a> 
                        <% for (Category c : listc) {%>
                        <h3>  <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action product-header">
                            <% out.println(c.getCategoryTitle() + "<br>");  %>                 
                        </a>      </h3>    
                        <% }

                            if (list.size() == 0) {
                                out.println("<h3>Sorry! out of stock</h3>");
                            }


                        %>
                    </div> 
                </div>


                <!-- show product on home page-->
                <div class="col-md-10 ">

                    <! --row-->
                    <div class="row mt-4">
                        <div class="col-md-12">

                            <div class="card-columns product-card">
                                <!--traversing products-->
                                <%                                for (Product p : list) {

                                %>
                                <!--showing product-->
                                <div class="card givebg">
                                    <div class="container text-center">
                                        
                                        <h3 class="card-title m-4"><%= p.getpName()%></h3>
                                        
      <img src="img/products/<%=  p.getpPhoto()%>"   style="max-height: 200px; max-width: 100%; width: auto"      class="img-fluid card-img-top m-2" alt="">


                                    </div>  

                                    <div class="card-body">
                                        <h4  class="card-text"> 
                                      
                                       <%= Helper.get10MoreWords(p.getpDesc())%>                                         
                                          
                                        </h4>
                                       <button class="btn btn-outline-success" style="font-family: sans-serif; font-size: 18px; color: #fff">    &#8377;    <%= p.getPriceAfterDiscount()%>/- <span class="text-secondary discount-label" style="font-family: sans-serif; font-size: 16px; color: #fff"> ,  <del  style="font-family: sans-serif; font-size: 16px; color: #fff">&#8377;<%=  p.getpPrice()%> </del>  <span style="color: #fff">      <%= p.getpDiscount()%>% off</span></span></button>
                                    </div>

                                    <div class="card-footer text-center">
   <button class="btn custom-bg text-white"  onclick="add_to_cart(<%= p.getpId() %>, '<%=  p.getpName()  %>' , <%= p.getPriceAfterDiscount() %> ) ">Add to <i class="fa fa-shopping-cart"   style="font-size: 20px; color: yellowgreen "></i> </button>


                                    </div>
                                </div>                  


                                <% }%>
                            </div>                 
                        </div>
                    </div>


                </div>

            </div>

        </div>
        <!--- close of container -->

        <%@include file="components/common_modals.jsp" %>
        
    </body>
</html>
