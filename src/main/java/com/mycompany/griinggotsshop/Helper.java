package com.mycompany.griinggotsshop;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {

    public static String get10MoreWords(String desc) {
        String[] str = desc.split(" ");
        String show10 = "";

        if (str.length > 10) {
            for (int i = 0; i < 10; i++) {
                show10 += str[i]+" ";
            }
            return (show10 + "........");
        } else {
            return (desc + ".......");
        }

    }
    
    public static Map<String, Long> getCounts(SessionFactory factory){
        Session session = factory.openSession();
        
        String s1 ="Select count(*) from User";
        String s2 ="Select count(*) from Product";
        
       Query q1 = session.createQuery(s1);
       Query q2 =  session.createQuery(s2);
       
       Long userCount = (Long) q1.list().get(0);
       Long productCount = (Long) q2.list().get(0);
       
       Map<String,Long> map = new HashMap<>();
       map.put("userCount", userCount);
       map.put("productCount", productCount);
               
       
       session.close();
        
        return map;
    }
    
}
