package com.example.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.service.EmpService;

//@ComponentScan(basePackages = { "com.example.controller" })
@Controller
public class ListController {

	@Autowired
	EmpService empservice;

	@GetMapping(value = "/")
	public String list(Model model) {
		return "upload";
	}
	
	@PostMapping(value = "/bulkdelete")
	public String bulkdeletepage(Model model) {
		return "bulkdelete";
	}

	@PostMapping(value="/save/employees")
	public String saveemp(@RequestParam("file") MultipartFile file, Model model) throws IOException
	{
		
		int status=empservice.saveemp(file,model);
		if(status==1)
		{
			System.out.println("Status came as: "+status);
			return "upload";
		}
		else if(status==2)
		{
			System.out.println("Status came as: "+status);
			return "upload";
		}

		else
		{
			System.out.println("Status came as: "+status);
		    return "newlist";
		}
	}
	
	
	
	@PostMapping(value = "/remove/employees/{id}")
	public String delete(@PathVariable("id") String id, Model model) {
		empservice.deleteemp(id,model);
		return "showall";
	}
	

	@PostMapping(value = "/edit/employee/{id}")
	public String edit(@PathVariable("id") String id, Model model) {
		empservice.editemp(id,model);
		return "editpage";
	}
	
	@PostMapping(value = "/save/editedemployees/{id}")
	public String editsave(@PathVariable("id") String id, @RequestParam Map<String, String> params, Model model) {
		System.out.println("Id:   "+id);
		System.out.println("the fields are: "+ params);
		empservice.editsave(id,params,model);
		return "showall";
	}
	
	
	@GetMapping(value = "/show/employees/{pagenumber}")
	public String showall(@PathVariable("pagenumber") int pagenumber, Model model) {
		empservice.showall(pagenumber,model);
		empservice.pagination(model);
		return "showallinprogress";
	}
	
	
	@PostMapping(value = "/search/employee")
	public String search(@RequestParam("search") String search,Model model) {
		System.out.println("The id came is: "+search);
		empservice.search(search,model);
		return "searchedpage";
	}
	
	@PostMapping(value="/bulk/delete")
	
	public String bulkdelete(@RequestParam("file") MultipartFile file, Model model) throws IOException {
		
		int status=empservice.bulkdelete(file,model);
		if(status==2)
		{
			System.out.println("Status came as in bulk refresh: "+status);
			return "bulkdelete";
			
		}
		else {
			return "showall";
		}
		
	
	}
	
	
	
	
}

