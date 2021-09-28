
package com.mycompany.dao;

import com.mycompany.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


public class userDao {
   private SessionFactory factory;

    public userDao(SessionFactory factory) {
        this.factory = factory;
    }
   
   // connection DB to get username and password
    
  public  User getEmailandPassword(String email, String password){
   
      User user=null;
      
      try {
          
          String query="from User where userEmail =: e and userPassword = : p";
          
          Session session = this.factory.openSession();
          Query q =session.createQuery(query);
          q.setParameter("e", email);
          q.setParameter("p", password);
          
         user = (User) q.uniqueResult();
          
          session.close();
          
      } catch (Exception e) {
      }
      
      return user;      
  }
    
}
