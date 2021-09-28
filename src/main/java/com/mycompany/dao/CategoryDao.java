
package com.mycompany.dao;

import com.mycompany.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class CategoryDao {
   private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
   
    //save into db
   public int saveCategory(Category refcategory)
   {   
       Session session = this.factory.openSession();
       Transaction beginTransaction = session.beginTransaction();
      int categoryid=(int) session.save(refcategory);
       beginTransaction.commit();       
       session.close();
       return categoryid;
   }
   
   
   
   //called in admin jsp for category type.
   public List<Category> getCategories()
   {   
       Session s = this.factory.openSession();
       Query query = s.createQuery("from Category");
       List<Category> list = query.list();
       return list;
   }
   
   
   
   
   
   public Category getCategoryById(int cid)
   {       
          Category cat=null;
            try {
                        Session session = this.factory.openSession();
                        cat = session.get(Category.class, cid);
      
                        session.close();
           
                  } 
            catch (Exception e) 
            {
                 e.printStackTrace();
              }   
          return cat;
         }   
}
