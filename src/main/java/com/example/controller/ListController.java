package com.example.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.service.EmpService;

@ComponentScan(basePackages = { "com.example.controller" })
@Controller
public class ListController {

	@Autowired
	EmpService empservice;

	@RequestMapping(value = "/")
	public String list(Model model) {
		return "upload";
	}
	
	@RequestMapping(value = "/bulkdelete")
	public String bulkdeletepage(Model model) {
		return "bulkdelete";
	}

	@RequestMapping(value="/save/employees")
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
	
	
	
	@RequestMapping(value = "/remove/employees/{id}")
	public String delete(@PathVariable("id") String id, Model model) {
		empservice.deleteemp(id,model);
		return "showall";
	}
	

	@RequestMapping(value = "/edit/employee/{id}")
	public String edit(@PathVariable("id") String id, Model model) {
		empservice.editemp(id,model);
		return "editpage";
	}
	
	@RequestMapping(value = "/save/editedemployees/{id}")
	public String editsave(@PathVariable("id") String id, @RequestParam Map<String, String> params, Model model) {
		System.out.println("Id:   "+id);
		System.out.println("the fields are: "+ params);
		empservice.editsave(id,params,model);
		return "showall";
	}
	
	
	@RequestMapping(value = "/show/employees")
	public String showall(Model model) {
		empservice.showall(model);
		return "showall";
	}
	
	@RequestMapping(value = "/search/employee")
	public String search(@RequestParam("search") String search,Model model) {
		System.out.println("The id came is: "+search);
		empservice.search(search,model);
		return "searchedpage";
	}
	
	@RequestMapping(value="/bulk/delete")
	
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

