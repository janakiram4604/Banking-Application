package com.bank.daos;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.bank.entities.Account;
import org.hibernate.Session;

@Repository
public class AccountDao {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Transactional
	public List<Account> getAllAccounts() {
		
		List<Account> accountList=hibernateTemplate.loadAll(Account.class);
		
		return accountList;
	}
	
	
	@Transactional
	public int addAccount(Account account) {
		
		try {
			int pk=(Integer)hibernateTemplate.save(account);
			return pk;
			
		}
		catch (Exception e) {
			System.out.println(e);
			return -1;
		}
	}
	
	@Transactional
	public Account getAccount(int accountNo) {
		Account account=hibernateTemplate.get(Account.class, accountNo);
		return account;
	}
	
	
	@Transactional
	public void updateAccount(Account account) {
		hibernateTemplate.update(account);
	}
	
	@Transactional
	public int deleteAccount(int accountNo, String accountHolderDOB, int accountPin) {
	    Account account = getAccount(accountNo);

	    if (account == null) {
	        return -1; 
	    } else if (accountPin != account.getAccount_pin()) {
	        return -2; 
	    } else if (!accountHolderDOB.equals(account.getAccount_holderDOB())) {
	        return -3; 
	    } else {
	        hibernateTemplate.delete(account);
	        return 0;
	    }
	}
	
	@Transactional
	public Account getuserByuserid(int userId) {
	    Session session = hibernateTemplate.getSessionFactory().openSession();
	    
	    @SuppressWarnings("unchecked")
	    List<Account> list = session
	        .createQuery("FROM Account WHERE user_id = :uid")
	        .setParameter("uid", userId)
	        .list(); 

	    session.close();
	    return list.isEmpty() ? null : list.get(0);
	}

	
	

	
	

}
