package com.bank.service;

import java.util.Date;
import java.util.List;

import org.hibernate.internal.util.beans.BeanInfoHelper.ReturningBeanInfoDelegate;
import org.hibernate.result.UpdateCountOutput;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.daos.AccountDao;
import com.bank.daos.TransactionsDao;
import com.bank.entities.Account;
import com.bank.entities.Transactions;

import net.bytebuddy.asm.Advice.OffsetMapping.ForOrigin.Renderer.ForReturnTypeName;

@Service
public class AccountServices {
	
	@Autowired
	private AccountDao accountDao;
	
	@Autowired
	private TransactionsDao transactionsDao;
	
	public List<Account> getAllAccounts() {
		return accountDao.getAllAccounts();
	}
	
	
	public int addAccount(String account_type,double account_balance,String account_holderDOB,int account_pin,String account_address,int user_id,String account_holderName) {
		Account account=new Account(account_type,account_balance,account_holderDOB,account_pin,account_address,user_id,account_holderName);
		int pk=accountDao.addAccount(account);
		return pk;
	}
	


	public int generatePin(int accountNo,String accountHolderDOB,int accountPin){
		Account account=accountDao.getAccount(accountNo);
		if(account==null) {
			return -1;
		}
		else if(!account.getAccount_holderDOB().equals(accountHolderDOB)) {
			return -2;
		}
		else {
			account.setAccount_pin(accountPin);
			accountDao.updateAccount(account);
			
			return 1;
		}
	}
	
//	public int checkbalance(int accountNo,int accountPin) {
//		Account account=accountDao.getAccount(accountNo);
//		if(!(accountNo==account.getAccount_no())) {
//			return -1;
//		}
//		else if(!(accountPin==account.getAccount_pin())) {
//			return -2;
//		}
//		else {
//			int bal=account.getAccount_balance();
//			return bal;
//		}
//	}
	
	public int DepositMoney(int accountNo,double money,int accountPin) {
		Account account=accountDao.getAccount(accountNo);
		if(account==null) {
			return -1;
		}
		else if(!(accountPin==account.getAccount_pin())) {
			return -2;
		}
		else {
			account.setAccount_balance(account.getAccount_balance()+money);
			accountDao.updateAccount(account);
			transactionsDao.saveTransactions(accountNo,"deposit",money,new Date());
			return 0;
		}
	}
	
	public int  DeleteAccount(int accountNo,String accountHolderDOB,int accountPin) {
		return accountDao.deleteAccount(accountNo, accountHolderDOB, accountPin);
	}
	

	public int debitMoney(int accountNo,double amount,int accountPin) {
			Account account=accountDao.getAccount(accountNo);
	
			if(account==null) {
				return -1;
			}
			else if(account.getAccount_balance()>=amount) {
				
				if(account.getAccount_pin()!=accountPin) {
					return -2;
				}
				else {
					account.setAccount_balance(account.getAccount_balance()-amount);
					accountDao.updateAccount(account);
					transactionsDao.saveTransactions(accountNo, "debit", amount, new Date());
					return 0;
				}
		   }	
			else {
				return 1;
			}
			
	 }
	
	public Account getuserByuserid(int user_id) {
		Account account=accountDao.getuserByuserid(user_id);
		return account;
	}
	
	public int changepin(int accountno,int oldpin,int newpin) {
		Account account =accountDao.getAccount(accountno);
		if(account==null) {
			return -1;
		}
		else if(account.getAccount_pin()!=newpin && account.getAccount_pin()==oldpin) {
			account.setAccount_pin(newpin);
			accountDao.updateAccount(account);
			return 1;
		}
		else {
			return 0;
		}
	}
	
	
}
