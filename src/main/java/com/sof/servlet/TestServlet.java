package com.sof.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.sof.doa.Answer;
import com.sof.doa.QueryTag;
import com.sof.persistence.HibernateUtil;

//@WebServlet("/test")
public class TestServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Maven + Hibernate + MySQL");
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        session.beginTransaction();
        
//        Stock stock = new Stock();
//        
//        stock.setStockCode("4716");
//        stock.setStockName("GENM111111");
//        
//        session.save(stock);
        
        
        /*UserProfile user = new UserProfile();
        user.setName("Jay Ram");
        user.setCountry("INDIA");
        user.setDob(new Date(1985, 12, 12));
        user.setSex(Sex.MALE);
        
        session.save(user);
        */
        
        /*
        UserCredential user = new UserCredential();
        user.setContact_No("7546859183");
        user.setEmail("kishorr789@gmail.com");
        user.setPassword("Raj@12");
        user.setRole(Role.User);
        
        session.save(user);
        session.getTransaction().commit();
        */
        
     
//        QueryTag user = new QueryTag();
//        user.setTagName("Mavel");
   
         
     
        /*
        Question user = new Question();
        user.setId(1);
        user.setBodyText("Explain JVM, JDK, JRE");
        user.setTitle("JVM, JDK, JRE in java");
        user.setVote(1);
        user.setAuthorId(1);
       */
        
        Answer user = new Answer();
        user.setQueryId(5);
        user.setUserId(1);
        user.setBodyText("JDk is java Development Key. \n JVM is Java Virtual Machine. \n JRE is Java Runtime Environment.");
        user.setVote(2);
        
        session.save(user);
        session.getTransaction().commit();
		return;
	}
}
