
package com.mycompany.dao;


import com.mycompany.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class ProductDao {
    
     private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    
    
    public boolean saveProduct(Product product){
        boolean f=false;
        try {
            
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
         
           session.save(product);
            
            tx.commit();            
            session.close();
            
            f=true;
            System.out.println("product saved in db");
        } 
        catch (Exception e) 
        {
            //e.printStackTrace();
            System.out.println("product not saved in db:"+e);
            f=false;
        }
         return f;
    }
    
    
    //get all products    
    public List<Product> getAllProducts(){   
        
         Session s = this.factory.openSession();         
         Query query = s.createQuery("from Product");         
         List<Product> list= query.list();
          s.close();
         return list;        
    }
    
    //get all products   of category
    public List<Product> getAllProductsById(int cid){   
        
         Session s = this.factory.openSession();         
         Query query = s.createQuery("from Product as p where p.category.categoryId =: id");     
         query.setParameter("id", cid);
         List<Product> list= query.list();
          s.close();
         return list;        
    }
    
}
