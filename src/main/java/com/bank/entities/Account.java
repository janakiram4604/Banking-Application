package com.bank.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="bank_accounts")
public class Account {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private  int  account_no;
	private String account_type;
	private double account_balance;
	private String account_holderDOB;
	private int account_pin;
	private String account_address;
	private int user_id;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at", updatable = false)
	private Date created_at;
	private String account_holderName;
	
	public Account() {
		super();
	}

	public Account(String account_type, double account_balance, String account_holderDOB, int account_pin,
			String account_address, String account_holderName) {
		super();
		this.account_type = account_type;
		this.account_balance = account_balance;
		this.account_holderDOB = account_holderDOB;
		this.account_pin = account_pin;
		this.account_address = account_address;
		this.account_holderName = account_holderName;
	}

	

	public Account(String account_type, double account_balance, String account_holderDOB, int account_pin,
			String account_address, int user_id, String account_holderName) {
		super();
		this.account_type = account_type;
		this.account_balance = account_balance;
		this.account_holderDOB = account_holderDOB;
		this.account_pin = account_pin;
		this.account_address = account_address;
		this.user_id = user_id;
		this.account_holderName = account_holderName;
	}

	public int getAccount_no() {
		return account_no;
	}

	public void setAccount_no(int account_no) {
		this.account_no = account_no;
	}

	public String getAccount_type() {
		return account_type;
	}

	public void setAccount_type(String account_type) {
		this.account_type = account_type;
	}

	public double getAccount_balance() {
		return account_balance;
	}

	public void setAccount_balance(double account_balance) {
		this.account_balance = account_balance;
	}

	public String getAccount_holderDOB() {
		return account_holderDOB;
	}

	public void setAccount_holderDOB(String account_holderDOB) {
		this.account_holderDOB = account_holderDOB;
	}

	public int getAccount_pin() {
		return account_pin;
	}

	public void setAccount_pin(int account_pin) {
		this.account_pin = account_pin;
	}

	public String getAccount_address() {
		return account_address;
	}

	public void setAccount_address(String account_address) {
		this.account_address = account_address;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public String getAccount_holderName() {
		return account_holderName;
	}

	public void setAccount_holderName(String account_holderName) {
		this.account_holderName = account_holderName;
	}

	@PrePersist
	protected void onCreate() {
	    this.created_at = new Date();
	}

	
}
