package com.infotran.springboot.model.member;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "userdb")
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String username;

	private String password;

	@Transient
	private String password1;

	private String name;

	private String sex;
	
	private String phonenumber;

	private String emailaddress;

	private String address;

	private String status;
	
	
	private String act_level;
	
	private Timestamp registerTime; 
	
	@Transient
	private boolean rememberMe;
	
	@Transient
	private String invalidCredentials;
	 
	public Member() {
		super();
	}

	public Member(Integer id) {
		super();
		this.id = id;
	}

	public Member(String name) {
		super();
		this.name = name;
	}
	
	
	
	public Member(String username, String password, boolean rememberMe) {
		super();
		this.username = username;
		this.password = password;
		this.rememberMe = rememberMe;
	}

	public Member(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public Member(String username, String password, String name, String phonenumber, String emailaddress,
			String address, String status) {
		super();
		this.username = username;
		this.password = password;
		this.name = name;
		this.phonenumber = phonenumber;
		this.emailaddress = emailaddress;
		this.address = address;
		this.status = status;
	}

	public Member(Integer id, String username, String password, String name, String phonenumber, String emailaddress,
			String address, String status) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.name = name;
		this.phonenumber = phonenumber;
		this.emailaddress = emailaddress;
		this.address = address;
		this.status = status;
	}

	public Member(Integer id, String username, String password, String password1, String name, String phonenumber,
			String emailaddress, String address, String status) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.password1 = password1;
		this.name = name;
		this.phonenumber = phonenumber;
		this.emailaddress = emailaddress;
		this.address = address;
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getEmailaddress() {
		return emailaddress;
	}

	public void setEmailaddress(String emailaddress) {
		this.emailaddress = emailaddress;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public boolean isRememberMe() {
		return rememberMe;
	}

	public void setRememberMe(boolean rememberMe) {
		this.rememberMe = rememberMe;
	}

	public String getInvalidCredentials() {
		return invalidCredentials;
	}

	public void setInvalidCredentials(String invalidCredentials) {
		this.invalidCredentials = invalidCredentials;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	
	
	public String getAct_level() {
		return act_level;
	}

	public void setAct_level(String act_level) {
		this.act_level = act_level;
	}

	public Timestamp getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}


	
}
