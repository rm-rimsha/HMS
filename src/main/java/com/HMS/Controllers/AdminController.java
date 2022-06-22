package com.HMS.Controllers;

//IMPORTS
import java.sql.Statement;

import javax.validation.Valid;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.catalina.connector.Request;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.ConfigAndDB.Database;
import com.HMS.model.AdminUser;

@Controller
public class AdminController 
{
	@GetMapping("/")
	public String getHomePg() 
	{
		return "Home.jsp";
	}
	
	@GetMapping("/Home")
	public String getHome() 
	{
		return "Home.jsp";
	}
	
	@GetMapping("/AboutUs")
	public String getAboutUs() 
	{
		return "AboutUs.jsp";
	}
	
	@GetMapping("/ContactUs")
	public String getContactUs() 
	{
		return "ContactUs.jsp";
	}
	
	@GetMapping("/HomeDepartments")
	public String getHomeDep() 
	{
		return "HomeDepartments.jsp";
	}
	
	@GetMapping("/portals")
	public String getPortals() 
	{
		return "Portals.jsp";
	}
	
	
	//new adminUser class object
	@ModelAttribute("adminUser")
	public AdminUser setUpAdmin() 
	{
		return new AdminUser();
	}
	
	@GetMapping("/adminLoginForm")
	public String adminForm() 
	{
		return "AdminLoginForm.jsp";
	}
	
	
	@PostMapping("/saveAdminUser")
	public ModelAndView saveAdminUser(@Valid @ModelAttribute("adminUser") AdminUser adminUser, BindingResult br) throws SQLException 
	{
		//DATABASE CLASS OBJECT
		//CONNECTION, STATEMENT OBJECT
		Database db = new Database();
		Statement s = db.getStatement();
		Connection c = db.getConnection();
		
		//VARIABLES STORING USER-ENTERED VALUES
		String adminName = adminUser.getAdminName();
		String adminPassword = adminUser.getAdminPassword();
		
		//PREPAREDSTATMENT OBJECT FOR THE SQL QUERY
		PreparedStatement p = c.prepareStatement("Select password From Admin Where username = ?");
		p.setString(1, adminName);
		//RESULTSET TO STORE THE RESULT OF THE QUERY
		ResultSet rs = p.executeQuery();
		
		//CHECKS IF THE RESULTSET IS NOT EMPTY AND THE USER-ENTERED DATA IS CORRECT(DATATYPE AND NOT EMPTY)
		if(rs.next() && !br.hasErrors()) 
		{
			//CHECKS THE PASSWORD
			
			//IF CORRECT
			//MOVE TO THE NEXT PAGE
			if(rs.getString(1).equals(adminPassword)) 
			{
				ModelAndView mav = new ModelAndView("AdminMenu.jsp");
				mav.addObject("Name", adminName);
				return mav;
			}
			//IF FALSE THEN RETURN TO THE SAME PAGE
			else 
			{
				ModelAndView mav = new ModelAndView("AdminLoginForm.jsp");
				return mav;
			}	
		}
		
		//EXECUTED WHEN
		//THE USER-ENTERED DATA IS WRONG
		//RETURN TO THE SAME PAGE
		ModelAndView mav = new ModelAndView("AdminLoginForm.jsp");
		return mav;
	}
	
	@GetMapping("/AdminLogout")
	public String adminLogout() 
	{
		return "Home.jsp";
	}
	
	@GetMapping("/ViewAdmin")
	public String adminAccount() 
	{
		return "AdminAccount.jsp";
	}
	
	@GetMapping("/changeAdminPs")
	public String adminChangePsPg() 
	{
		return "adminChangePs.jsp";
	}
	
	@ModelAttribute("editAdmin")
    public AdminUser getAdmin() 
	{
		return new AdminUser();
	}	

	@PostMapping("/getChangePsPg")
	public ModelAndView getChngePg(@ModelAttribute("adminUser") AdminUser admin) 
	{
		ModelAndView mav = new ModelAndView("adminChangePs.jsp");
		mav.addObject("message", "Please enter the following credentials");
		return mav;
	}
	
	
	@PostMapping("/saveAdminPs")
	public ModelAndView saveUpdatedPs(@Valid @ModelAttribute("editAdmin") AdminUser editAdmin, BindingResult b)
	{
		String username = editAdmin.getAdminName();
		String currentPs = editAdmin.getAdminPassword();
		String newPs = editAdmin.getAdminNewPs();
		String confirmPs = editAdmin.getConfirmNewPs();
		
		Database db = new Database();
		Connection c = db.getConnection();
		PreparedStatement ps;
		
		
		if(confirmPs.equals(newPs) && !b.hasErrors()) 
		{
			String sql = "Update admin SET password = ? where username = ?";
			try {
				ps = c.prepareStatement(sql);
				ps.setString(1, newPs);
				ps.setString(2, username);
				
				ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ModelAndView mav = new ModelAndView("AdminAccount.jsp");
			return mav;
		}
		else {
			ModelAndView mav = new ModelAndView("adminChangePs.jsp");
			mav.addObject("message", "Passwords do not match");
			return mav;
		}
		
	}
}
