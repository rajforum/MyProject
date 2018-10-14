package com.sof.doa;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "userProfile")
public class UserProfile implements Serializable {
	private Integer socketId;
	private String name;
	private byte [] image;
	private String country;
	public enum Sex {MALE, FEMALE};
	private Sex sex;
	private Date dob;
	
	public UserProfile() {}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "STACKID")
	public Integer getSocketId() {
		return socketId;
	}

	public void setSocketId(Integer socketId) {
		this.socketId = socketId;
	}

	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "IMAGE")
	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	@Column(name = "COUNTRY")
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Column(name = "SEX")
	public String getSex() {
		return sex.toString();
	}

	public void setSex(Sex sex) {
		this.sex = sex;
	}

	@Column(name = "DOB")
	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}
}
