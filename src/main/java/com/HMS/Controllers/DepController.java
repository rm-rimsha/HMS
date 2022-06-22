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
import com.HMS.model.Department;

@Controller
public class DepController 
{
	
	//                                <<ADD-DEPARTMENT>>                          //
	
	//returns a new Department-object
	@ModelAttribute("dep")
	public Department setUpdep() 
	{
		return new Department();
	}
	
	//returns add-dep page
	@RequestMapping("/showAddDep")
	public String showAddDep() 
	{
		return "AddDep.jsp";
	}
	
	@PostMapping("/saveDep")
	public String saveDep(@Valid @ModelAttribute("dep") Department dep, BindingResult b) 
	{
		String depName = dep.getDepName();
		
		Database db = new Database();
		Connection c = db.getConnection();
		
		if(!b.hasErrors()) 
		{
			String sql = "Insert into Department(name)" + "Values(?)";
			try {
				PreparedStatement ps = c.prepareStatement(sql);
				ps.setString(1, depName);
				ps.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "AdminMenu.jsp";
		}
		else 
		{
			return "AddDep.jsp";
		}
		
		
	}//ADD-DEPARTMENT-COMPLETE
	
	//DISPLAYS-ALL-DEPARTMENTS
	@GetMapping("/showDepartments")
	public String showDep() 
	{
		return "ShowDepartments.jsp";
	}
	
    //                                  <<DELETE-DEPARTMENT>>                               //
    
	//returns delete-department-page
	@GetMapping("/deleteDepartments")
	public String getDelPage() 
	{
		return "DeleteDep.jsp";
	}
	
	//returns deletion-successful-page
	@GetMapping("/DeleteDepComplete")
	public String depDeletedPg() 
	{
		return "DeleteDepComplete.jsp";
	}//delete-department-complete
}
