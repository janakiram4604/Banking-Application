
package com.bank.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bank.entities.Account;
import com.bank.entities.users;
import com.bank.service.AccountServices;
import com.mysql.cj.Session;

@Controller
public class AccountController {
	
	@Autowired
	private AccountServices accountServices;

	
//	
//	// Reading All Accounts
//	@RequestMapping("/getAllAccounts")
//	public String getAllAccountsHandler(Model model) {
//		
//		List<Account> accountsList=accountServices.getAllAccounts();
//		model.addAttribute("accountsList",accountsList);
//		return "AccountsDisplay";
//	}
//	
	//Account creation Form
	@RequestMapping("/createAccount")
	public String createAccountPage(HttpSession session, Model model) {
	    users user = (users) session.getAttribute("loggeduser");
	    model.addAttribute("username", user.getUsername());
	    return "createAccount";
	}

	
	//Account Creation Controller
	@RequestMapping("/AccountCreation")
	public String AccountCreation(@RequestParam("account_type") String account_type,
			@RequestParam("account_balance") double account_balance,
			@RequestParam("account_holderDOB") String account_holderDOB,
			@RequestParam("account_pin") int account_pin,
			@RequestParam("account_address") String account_address,
			@RequestParam("account_holderName") String account_holderName,
			Model model,HttpSession session,RedirectAttributes redirectAttributes) {
		
		users user = (users)session.getAttribute("loggeduser");
		
		int pk=accountServices.addAccount(account_type,account_balance,account_holderDOB,account_pin,account_address,user.getId(),account_holderName);
		
		if(pk>0) {
			session.setAttribute("accountLoggedIn", true);
			redirectAttributes.addFlashAttribute("status","Account Creation Successful");
			redirectAttributes.addFlashAttribute("accno",pk);
			return "redirect:/dashboard";
		}
		else {
			model.addAttribute("Status","Account Creation Failed");
			return "redirect:/createAccount";
		}
	}
	
//	//Generate Pin form
//	@RequestMapping("/generatePin")
//	public String generatepinform() {
//		return "GeneratePinForm";
//	}
//	
//	//Generate Pin Controller
//	@RequestMapping("/GeneratePin")
//	public String GeneratePinHandler(@RequestParam("accountNo") int accountNo,
//								   @RequestParam("accountHolderDOB") String accountHolderDOB,
//								   @RequestParam("accountPin") int accountPin,Model model) {
//		
//		int count=accountServices.generatePin(accountNo, accountHolderDOB, accountPin);
//		if(count==1) {
//			model.addAttribute("message","Successful");
//		}
//		else if(count==-1) {
//			model.addAttribute("message","Invalid Account No");
//		}
//		else {
//			model.addAttribute("message","Invalid DOB");
//		}
//		return "GeneratePinStatus";
//		
//	}
//	
//	//Balance Checking Form
//	@RequestMapping("/checkBalance")
//	public String checkBalance() {
//		return "CheckBalanceForm";
//	}
	
	//Balance Checking Controller
//	@RequestMapping("/BalanceCheck")
//	public String BalanaceCheckingHandler(@RequestParam("accountNo") int accountNo,@RequestParam("accountPin") int accountPin,Model model) {
//		
//		int bal=accountServices.checkbalance(accountNo, accountPin);
//		if(bal==-1) {
//			model.addAttribute("message","Account Number is Invalid");
//		}
//		else if(bal==-2) {
//			model.addAttribute("message","Account Pin is Invalid");
//		}
//		else {
//			model.addAttribute("message",bal);
//		}
//		return "CheckBalanceStatus";
//	}
//	
//*****************************************************************************************************************************************************
	//***************************************"DEPOSIT LOGIC"***********************************************
	//Deposit Form
//	@RequestMapping("/DepositMoney")
//	public String depositMoney() {
//		return "DepositMoneyForm";
//	}
//	
	//Money Deposit Form
//	@RequestMapping("/MoneyDeposit")
//	public String moneyDeposit(@RequestParam("accountNo") int accountNo,@RequestParam("accountPin") int acountPin,@RequestParam("money") int money,Model model,RedirectAttributes redirectAttributes) {
//		
//		int stat=accountServices.DepositMoney(accountNo, acountPin, money);
//		if(stat==-1) {
//			redirectAttributes.addFlashAttribute("message","Account doesn't exist");
//		}
//		else if(stat==-2) {
//			redirectAttributes.addFlashAttribute("message","Account Pin is Invalid");
//		}
//		else {
//			int bal=accountServices.checkbalance(accountNo, acountPin);
//			redirectAttributes.addFlashAttribute("message","Money Deposited Successfully");
//			redirectAttributes.addFlashAttribute("bal",bal);
//		}
//
//
//		return "redirect:/depositmoney";
//	}
	
	
//	@RequestMapping("/depositmoney")
//	public String deopsitmoney(HttpServletRequest request,Model model) {
//		String message=(String)model.asMap().get("message");
//		Integer bal=(Integer)model.asMap().get("bal");
//		if(message==null||bal==null) {
//			return "redirect:/DepositMoney";
//		}
//		return "MoneyDepositStatus";
//	}
	
	
	
//*********************************************************************************************************************************************************
	//********************************"Account Deletion Logic"*****************************************
	//Account Deletion Form
//	@RequestMapping("/deleteAccount")
//	public String deleteAccount() {
//		return "DeleteAccountForm";
//	}
//		
//	//Account Deletion Controller
//	@RequestMapping("/AccountDelete")
//	public String AccountDeletion(@RequestParam("accountNo") int accountNo,@RequestParam("accountHolderDOB") String accountHolderDOB,@RequestParam("accountPin") int accountPin,Model model) {
//		
//		int bal=accountServices.DeleteAccount(accountNo, accountHolderDOB, accountPin);
//		if(bal==-1) {
//			model.addAttribute("message","Account Number is Invalid");
//		}
//		else if(bal==-2) {
//			model.addAttribute("message","Account Pin is Invalid");
//		}
//		else {
//			model.addAttribute("message","Account Deletion Successful");
//		}
//		return "AccountDeletionStatus";
//	}
	
	
//**************************************************************************************************************************************
	//*************************************"WITHDRAW LOGIC"*******************************
//	//Money withdraw form
//	@RequestMapping("/withdrawl")
//	public String withdrawmoney() {
//		return "WithdrawlForm";
//	}
//	

	//Money Withdraw Controller
//	@RequestMapping("/debitmoney")
//	public String debitMoney(@RequestParam("accountNo") int accountNo,@RequestParam("accountPin") int accountPin,@RequestParam("money") int money,RedirectAttributes redirectAttributes){
//		int res=accountServices.debitMoney(accountNo, accountPin, money);
//		if(res==-1) {
//			redirectAttributes.addFlashAttribute("message","Account Not Found");
//		}
//		else if(res==-2) {
//			redirectAttributes.addFlashAttribute("message", "Invalid PIN");
//		}
//		else if(res==-5) {
//			
//			int bal = accountServices.checkbalance(accountNo, accountPin);
//	        redirectAttributes.addFlashAttribute("message", "Insufficient Balance");
//	        redirectAttributes.addFlashAttribute("bal", bal);
//		}
//		else {
//			redirectAttributes.addFlashAttribute("message", "Withdraw Successful");
//	        redirectAttributes.addFlashAttribute("bal", res);
//		}
//		return "redirect:/withdrawStatus";
//	}
	
	
//	
//	@RequestMapping("/withdrawStatus")
//	public String showWithdrawStatus(HttpServletRequest request,Model model) {
//		 String message = (String) model.asMap().get("message");
//		 Integer bal = (Integer) model.asMap().get("bal");
//		if(message==null||bal==null) {
//			return "redirect:/withdrawl";
//		}
//		
//		return "WithdrawStatus";
//	}
	
	
}

