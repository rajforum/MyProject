package com.sof.doa;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "userCredential")
public class UserCredential implements Serializable {
	private Integer UserID;
	private String Contact_No;
	private String Email;
	private String Password;
	public enum Role {Admin, User};
	private Role role;
	
	public UserCredential() {}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "USERID")
	public Integer getUserID() {
		return UserID;
	}

	public void setUserID(Integer userID) {
		UserID = userID;
	}

	@Column(name = "CONTACT_NO")
	public String getContact_No() {
		return Contact_No;
	}

	public void setContact_No(String contact_No) {
		Contact_No = contact_No;
	}

	@Column(name = "EMAIL")
	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	@Column(name = "PASSWORD")
	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	@Column(name = "ROLE")
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	
	
}
