package com.sof.rest.api.v1;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.hibernate.Session;

import com.sof.doa.UserCredential;
import com.sof.doa.UserCredential.Role;
import com.sof.persistence.HibernateUtil;

@Path("/user/new")
public class NewUser {

	@POST
	@Consumes({ MediaType.APPLICATION_FORM_URLENCODED })
	@Produces({ MediaType.TEXT_HTML })
	public String addNewUser(@FormParam("email") String email, @FormParam("mobileno") String mobileno, @FormParam("password") String password, @FormParam("role") String role) {
		try {
			if ( role == null && role.isEmpty()) {
				role = "User";
			}
			
			Role rObj = (role.equalsIgnoreCase("Admin"))? Role.Admin: Role.User;
			
			System.out.println("New user:" + email + ":" + mobileno + ":" + role);
	
			Session session = HibernateUtil.getSessionFactory().openSession();
	        session.beginTransaction();
	        
	        UserCredential user = new UserCredential();
	        user.setContact_No(mobileno);
	        user.setEmail(email);
	        user.setPassword(password);
	        user.setRole(rObj);
	        
	        session.save(user);
	        session.getTransaction().commit();
			return "Hello World";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "User cannot be added!";
	}
}
