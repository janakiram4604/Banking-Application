package com.bank.daos;

import java.util.Date;
import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.bank.entities.Transactions;
import com.bank.entities.users;

@Repository
public class TransactionsDao {
			
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Transactional
	public void saveTransactions(int accountNo, String type,double money,Date d) {
		Transactions tx=new Transactions(accountNo,type,(double)money,d);
		hibernateTemplate.save(tx);
	}
	
	@Transactional
	public List<Transactions> geTransactions(int accountno) {
	    Session session = hibernateTemplate.getSessionFactory().openSession();

	    @SuppressWarnings("unchecked")
	    List<Transactions> list = session
	        .createQuery("from Transactions where account_no = :accno")
	        .setParameter("accno", accountno)
	        .list();

	    session.close();
	    return list;
	}

}
