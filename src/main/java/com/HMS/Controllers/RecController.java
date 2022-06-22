package com.HMS.Controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.HMS.ConfigAndDB.Database;
import com.HMS.model.Receptionist;

@Controller
public class RecController 
{
	@GetMapping("/ReceptionistLoginForm")
	public String adminForm() 
	{
		return "ReceptionistLogin.jsp";
	}
	
	
	@ModelAttribute("rec")
	public Receptionist setUpRec() 
	{
		return new Receptionist();
	}

	@RequestMapping("/showAddRec")
	public String addRecForm() 
	{
		return "AddRec.jsp";
	}
	
	@PostMapping("/saveRec")
	public String saveRec(@Valid @ModelAttribute("rec") Receptionist rec, BindingResult b) 
	{
		String username = rec.getUsername();
		String name = rec.getName();
		String password = rec.getPassword();
		String gender = rec.getGender();
		String email = rec.getEmail();
		long contactNum = rec.getContactNumber();
		String dep = rec.getDepartmentName();
		
		Database db = new Database();
		Connection c = db.getConnection();
		
		
		if(!b.hasErrors()) 
		{
			String sql = "Insert into Receptionist(username,password,name,"
					+ "gender,email,contactNumber,departmentName)" + "Values(?,?,?,?,?,?,?)";
			
			try {
				PreparedStatement ps = c.prepareStatement(sql);
				ps.setString(1,username);
				ps.setString(2, password);
				ps.setString(3, name);
				ps.setString(4, gender);
				ps.setString(5,email);
				ps.setLong(6,contactNum);
				ps.setString(7, dep);
				
				ps.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "AdminMenu.jsp";
		}
		else 
		{
			return "AddRec.jsp";
		}
		
		
	}
	
	@GetMapping("/showReceptionists")
	public String showRec() 
	{
		return "ShowReceptionists.jsp";
	}
	
	@GetMapping("editReceptionists")
	public String getEditPg() 
	{
		return "editRecep.jsp";
	}
	
	@GetMapping("/updateRecep")
	public String getUpdatePg() 
	{
		return "updateRecep.jsp";
	}
	
	@GetMapping("/editRecepComplete")
    public String getUpdateComPg() 
	{
		return "updateRecepComplete.jsp";
	}
	
	@ModelAttribute("editRec")
	public Receptionist getRecObj() 
	{
		return new Receptionist();
	}
	
	@PostMapping("/saveEditRec")
	public String saveUpdatedRec(@Valid @ModelAttribute("editRec") Receptionist editRec, BindingResult b) 
	{
		String username = editRec.getUsername();
		String name = editRec.getName();
		String gender = editRec.getGender();
		String email = editRec.getEmail();
		long contactNum = editRec.getContactNumber();
		String dep = editRec.getDepartmentName();
		String password = editRec.getPassword();
		
		Database db = new Database();
		Connection c = db.getConnection();
		
	    if(!b.hasErrors()) 
		{
			
			try {
				PreparedStatement ps = c.prepareStatement(
						"UPDATE Receptionist SET name = ?, gender = ?, email = ?, "
						+ "contactNumber = ?, departmentName = ? Where username = ?");
				ps.setString(1,name);
				ps.setString(2, gender);
				ps.setString(3, email);
				ps.setLong(4, contactNum);
				ps.setString(5,dep);
				ps.setString(6, username);
				
				ps.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "AdminMenu.jsp";
		}
		  else 
		  {
			return "AddRec.jsp";
		}
		
		
	}
	
	@GetMapping("/DeleteRec")
	public String deletePg() 
	{
		return "DeleteRec.jsp";
	}
	
	@GetMapping("/DeleteRecComplete")
	public String deletedConfirmPg() 
	{
		return "DeleteRecComplete.jsp";
	}
	
	
}
