package com.bank.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="transactions")
public class Transactions {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int account_no;
	private String type;
	private double amount;
	private Date timestamp;
	
	public Transactions() {
		super();
	}

	public Transactions(int account_no, String type, double amount, Date timestamp) {
		super();
		this.account_no = account_no;
		this.type = type;
		this.amount = amount; 
		this.timestamp = timestamp;
	}

	public Transactions(int id, int account_no, String type, double amount, Date timestamp) {
		super();
		this.id = id;
		this.account_no = account_no;
		this.type = type;
		this.amount = amount;
		this.timestamp = timestamp;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAccount_no() {
		return account_no;
	}

	public void setAccount_no(int account_no) {
		this.account_no = account_no;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}
	
	
}
