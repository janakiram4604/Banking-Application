package com.bank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.daos.TransactionsDao;
import com.bank.entities.Transactions;

@Service
public class TransactionService {
	
	@Autowired
	private TransactionsDao transactionsDao;
	
	public List<Transactions> getTransactions(int accountno){
		 return transactionsDao.geTransactions(accountno);
	}
}
