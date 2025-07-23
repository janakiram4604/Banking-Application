package com.bank.service;


import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.bank.controllers.UserController;
import com.bank.daos.UserDao;
import com.bank.entities.users;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public int adduser(String username,String password) {
		users user=userDao.getUser(username);
		if(user==null) {
			BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
			String hashedPassword=encoder.encode(password);
			int rep=userDao.adduser(username, hashedPassword,new Date());
			return rep;
		}
		else {
			return -1;
		}
	}
	
	
	public int logincheck(String username,String password) {
		users user=userDao.getUser(username);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(user==null) {
			return 0;
		}
		else if (encoder.matches(password, user.getPassword())) {
		    return 1;
		}
		else {
			return -1;
		}

	}
	
	
	public int validateUser(String username) {
		users user=userDao.getUser(username);
		if(user==null) {
			return 0;
		}
		else {
			return 1;
		}
	}
	
	public int updatepassword(String username,String password) {
		users user=userDao.getUser(username);
		if(user==null) {
			return 0;
		}
		else {
			BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
			String pwd=encoder.encode(password);
			user.setPassword(pwd);
			userDao.updatepassword(user);
			return 1;
		}
	}
	
	
	public users getUserByUsername(String username) {
		users user=userDao.getuserbyname(username);
		if(user==null) {
			return null;
		}
		else {
			return user;
		}
	}
	
	
}
