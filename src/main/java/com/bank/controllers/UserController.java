package com.bank.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bank.daos.AccountDao;
import com.bank.entities.Account;
import com.bank.entities.Transactions;
import com.bank.entities.users;
import com.bank.service.AccountServices;
import com.bank.service.TransactionService;
import com.bank.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AccountServices accountServices;
	
	@Autowired
	private AccountDao accountDao;
	
	@Autowired
	private TransactionService transactionService;
	
	
	
	@RequestMapping("/")
	public String showLandingPage() {
	    return "LandingPage";  
	}
	
	
	@RequestMapping("/signup")
	public String signup() {
		return "SignupForm";
	}
	
	@RequestMapping("/signupform")
	public String signuphandler(@RequestParam("username") String username,@RequestParam("password") String password,Model model) {
		int bal=userService.adduser(username, password);
		if(bal==1) {
			model.addAttribute("username",username);
			return "SignupSuccess";
		}
		else {
			model.addAttribute("message","⚠️ Username already exists. Please try another.");
			return "SignupForm";
		}
		
	}
	
	
	@RequestMapping("/login")
	public String login() {
		return "LoginForm";
	}
	

	@RequestMapping("/loginform")
	public String loginhandler(@RequestParam("username") String username, 
	                           @RequestParam("password") String password, 
	                           Model model, 
	                           HttpSession session) {
	    int suc = userService.logincheck(username, password);

	    if (suc == 0) {
	        model.addAttribute("message", "Account doesn't exist");
	        return "LoginForm";
	    } else if (suc == 1) {
	        session.setAttribute("username", username); 
	        users user=userService.getUserByUsername(username);
	        session.setAttribute("loggeduser", user);
	        return "redirect:/dashboard";
	    } else {
	        model.addAttribute("message", "Password is Wrong");
	        return "LoginForm";
	    }
	}

	@RequestMapping("/dashboard")
	public String dashboard(HttpSession session,Model model) {
		users user=(users)session.getAttribute("loggeduser");
		
		if(user==null) {
			return "redirect:/login";
		}
		System.out.println("USER ID: " + user.getId());
		Account account=accountServices.getuserByuserid(user.getId());
		System.out.println("ACCOUNT FOUND: " + (account != null));
		model.addAttribute("account",account);
		model.addAttribute("username", user.getUsername());

	    
	    Boolean accountLoggedIn = (Boolean) session.getAttribute("accountLoggedIn");
	    model.addAttribute("accountLoggedIn", accountLoggedIn != null && accountLoggedIn);

	    if (account != null && Boolean.TRUE.equals(accountLoggedIn)) {
	        List<Transactions> transactions=transactionService.getTransactions(account.getAccount_no());
	        model.addAttribute("transactions", transactions);
	    }
		
		return "dashboard";
	}
	
	
	@RequestMapping("/bank-login")
	public String getaccount(@RequestParam("accno") int accno,@RequestParam("accpass") int accpin,HttpSession session,Model model) {
		Account account=accountDao.getAccount(accno);
		if(account!=null&&account.getAccount_pin()==accpin) {
			session.setAttribute("accountLoggedIn", true);
		}
		else {
	        session.setAttribute("error", "Invalid account number or PIN");
	    }

	    return "redirect:/dashboard";
	}
	
	@RequestMapping("/create-account")
	public String creation(@RequestParam("type") String type, HttpSession session, RedirectAttributes redirectAttributes) {
	    users user = (users) session.getAttribute("loggeduser");

	    if (user == null) return "redirect:/login";

	    Account existingAccount = accountServices.getuserByuserid(user.getId());
	    if (existingAccount != null) {
	        redirectAttributes.addFlashAttribute("error", "⚠️ You already have a bank account. Cannot create another.");
	        return "redirect:/dashboard";
	    }

	    session.setAttribute("type", type);
	    return "createAccount";
	}
	
	
	
	@RequestMapping("/logout")
	public String logoutHandler(HttpSession session, RedirectAttributes ra) {
	    session.invalidate();
	    ra.addFlashAttribute("message", "You have been logged out successfully.");
	    return "redirect:/";
	}
	
	@RequestMapping("/deposit-form")
	public String depositHandler() {
		return "DepositMoneyForm";
	}

	@RequestMapping("/deposit")
	public String deposit(@RequestParam("accountno") int accountNo,@RequestParam("amount") double amount,@RequestParam("pin") int pin,HttpSession session,Model model,RedirectAttributes redirectAttributes) {
		
		int result=accountServices.DepositMoney(accountNo, amount, pin);
		if(result==0) {
			redirectAttributes.addFlashAttribute("success","Money Deposited Succesfully");
			return "redirect:/deposit-form";
		}
		else {
			redirectAttributes.addFlashAttribute("error","Failed.Check the pin");
			return "redirect:/deposit-form";
		}
		
		
	}
	
	
	@RequestMapping("/withdraw-form")
	public String withdrawform() {
		return "WithdrawlForm";
	}
	
	@RequestMapping("/withdraw")
	public String withdrawlHandler(@RequestParam("accountno") int accountno,@RequestParam("amount") double amount,@RequestParam("pin") int pin,RedirectAttributes redirectAttributes) {
		int result =accountServices.debitMoney(accountno, amount, pin);
		if(result==0) {
			redirectAttributes.addFlashAttribute("success","Money debited sucessully.");
			return "redirect:/withdraw-form";
		}
		else if(result==1) {
			redirectAttributes.addFlashAttribute("error","Insufficient Funds");
			return "redirect:/withdraw-form";
		}
		else {
			redirectAttributes.addFlashAttribute("error","Failed.Check ht pin");
			return "redirect:/withdraw-form";
		}
	}
	
	
	@RequestMapping("/change-pin-form")
	public String changepinform() {
		return "ChangePinForm";
	}
	
	@RequestMapping("/change-pin")
	public String ChangePin(@RequestParam("accountno") int accountno,@RequestParam("oldpin") int oldpin,@RequestParam("newpin") int newpin,RedirectAttributes redirectAttributes,HttpSession session) {
		int result=accountServices.changepin(accountno, oldpin, newpin);
		if(result==-1) {
			redirectAttributes.addFlashAttribute("error","Account doesn't exist");
			return "redirect:/change-pin-form";
		}
		else if(result==0) {
			redirectAttributes.addFlashAttribute("error","select another pin entered one is used");
			return "redirect:/change-pin-form";
		}
		else {
			users user = (users) session.getAttribute("loggeduser");
	        session.setAttribute("loggeduser", user);
			redirectAttributes.addFlashAttribute("success","Pin changed successfully");
			return "redirect:/change-pin-form";
		}
	}
	
	@RequestMapping("/about")
	public String aboutpage() {
		return "AboutPage";
	}
	
	
	
	@RequestMapping("/forgot")
	public String forgot() {
		return "ForgotPassword";
	}
	
	@RequestMapping("/validate-user")
	public String validateHandler(@RequestParam("username") String username,Model model) {
		if(userService.validateUser(username)==0) {
			model.addAttribute("message","⚠️ User doesn't exists. Once check with Username.");
			return "ForgotPassword";
		}
		else {
			model.addAttribute("username",username);
			return "ResetPassword";
		}
	}
	
	
	
	@RequestMapping("/reset-password")
	public String resetpassword(@RequestParam("username") String username,
	                            @RequestParam("password") String password,
	                            RedirectAttributes redirectAttributes) {
	    int res = userService.updatepassword(username, password);
	    if (res == 1) {
	        redirectAttributes.addFlashAttribute("message", "✅ Password Updated Successfully 🕺");
	    } else {
	        redirectAttributes.addFlashAttribute("message", "❌ Failed to update password. Try again.");
	    }
	    redirectAttributes.addFlashAttribute("username", username);
	    return "redirect:/reset-view";
	}
	
	@RequestMapping("/reset-view")
	public String showResetPage() {
	    return "ResetPassword"; 
	}

	
}


