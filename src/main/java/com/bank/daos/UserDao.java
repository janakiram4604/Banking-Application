package com.bank.daos;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.bank.entities.users;
import javax.persistence.*;
import javax.transaction.Transactional;


@Repository
public class UserDao {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Transactional
	public int  adduser(String username,String password,Date date) {
		users user=new users(username,password,date);
		hibernateTemplate.save(user);
		return 1;
	}
	
	@Transactional
	public users getUser(String username) {
		
		Session session=hibernateTemplate.getSessionFactory().openSession();
		Query query = session.createQuery("from users where username = :username");
		query.setParameter("username", username);
		List<users> list=(List<users>) query.getResultList();
		session.close();
		return list.isEmpty() ? null:list.get(0);
	}
	
	@Transactional
	public void updatepassword(users user) {
		
		hibernateTemplate.update(user);
	}
	
	@Transactional
	public users getuserbyname(String username) {
		Session session=hibernateTemplate.getSessionFactory().openSession();
		Query query = session.createQuery("from users where username = :username");
		query.setParameter("username", username);
		List<users> list=(List<users>) query.getResultList();
		session.close();
		
		if (list.isEmpty())
			return null;
		else
			return list.isEmpty() ? null : list.get(0);
	}
}
