
package com.mycompany.servlets;

import com.mycompany.dao.CategoryDao;
import com.mycompany.dao.ProductDao;
import com.mycompany.entities.Category;
import com.mycompany.entities.Product;
import com.mycompany.griinggotsshop.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           //add category 
           //add product
           String opr = request.getParameter("operation");
           
           if(opr.trim().equals("addcategory"))
           {
                String title = request.getParameter("categtitle");
                String description = request.getParameter("categDescription"); 
                
               Category category = new Category();
               category.setCategoryTitle(title);
               category.setCategoryDescription(description);
               
               //save into database
               CategoryDao categoryDao = new CategoryDao(FactoryProvider.getfactory());
               int catId = categoryDao.saveCategory(category);
               HttpSession session = request.getSession();
               session.setAttribute("message", "category added successfully with id: "+ catId);
               response.sendRedirect("admin.jsp");
        
           }
           else if(opr.trim().equals("addproduct"))
                   {
                   
                  String pName= request.getParameter("pName");                  
                  String pDesc= request.getParameter("pDesc");                    
                  int pPrice = Integer.parseInt(request.getParameter("pPrice"));                    
                  int pDiscount =Integer.parseInt(request.getParameter("pDiscount"));                   
                  int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));        
                 
               int catId=Integer.parseInt(request.getParameter("catId"));
                   
                   Part part= request.getPart("pPic");
                     
                   
               
                  Product p= new Product();
                   p.setpName(pName);
           
                   p.setpDesc(pDesc);
                   
                   p.setpPrice(pPrice);
                  
                   p.setpDiscount(pDiscount);
                 
                   p.setpQuantity(pQuantity);
                
                   p.setpPhoto(part.getSubmittedFileName());                    
                    
                   
                  
                   CategoryDao cdoa = new CategoryDao(FactoryProvider.getfactory());
               Category category = cdoa.getCategoryById(catId); 
               out.println("before p.set category" );
                p.setCategory(category);
                out.println("Done p.setcategory" );
                
                ProductDao pdao= new ProductDao(FactoryProvider.getfactory());
                pdao.saveProduct(p);
                
                //saving img in db
              String path =  request.getRealPath("img") + File.separator + "products" + File.separator +part.getSubmittedFileName();
                         out.println(path);
                
               //uploading image
               
               try{
               FileOutputStream fos= new FileOutputStream(path);
               InputStream is = part.getInputStream();
               
               byte[] data = new byte[is.available()];
               is.read(data);
               
               //writing data
               fos.write(data);
               fos.close();
               }
               catch(Exception e){
                   e.printStackTrace();
               }
               
                
                
                HttpSession session = request.getSession();
               session.setAttribute("message", "product is added  successfully: ");
               response.sendRedirect("admin.jsp");
                        }  
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
