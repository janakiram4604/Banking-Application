package com.bank.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class users {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String password;
	private Date created_at;
	
	
	public users() {
		super();
	}
	
	public users(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public users(int id, String username, String password, Date created_at) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.created_at = created_at;
	}
	
	public users(String username, String password, Date created_at) {
		super();
		this.username = username;
		this.password = password;
		this.created_at = created_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}
