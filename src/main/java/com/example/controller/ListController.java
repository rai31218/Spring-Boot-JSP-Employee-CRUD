package com.example.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.service.EmpService;

//@ComponentScan(basePackages = { "com.example.controller" })
@Controller
public class ListController {

	@Autowired
	EmpService empservice;

	@RequestMapping(value = "/")
	public String list(Model model) {
		return "upload";
	}
	@RequestMapping(value = "/m")
	public String m(Model model) {
		return "modaltesting";
	}
	
	@RequestMapping(value = "/bulkdelete")
	public String bulkdeletepage(Model model) {
		return "bulkdelete";
	}

	@RequestMapping(value="/save/employees/{pagenumber}")
	public String saveemp(@PathVariable("pagenumber") int pagenumber, @RequestParam(value="file",required=false) MultipartFile file, Model model) 
	{
		System.out.println("It is coming in saveemp method in controller");
		int status = 0;
		try {
			status = empservice.saveemp(pagenumber,file,model);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		if(status==1)
		{
			System.out.println("Status came as: "+status);
			return "uploads";
		}
		else if(status==2)
		{
			System.out.println("Status came as: "+status);
			return "uploads";
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
	
	
	@GetMapping(value = "/show/employees/{pagenumber}")
	public String showall(@PathVariable("pagenumber") int pagenumber, Model model) {
		empservice.showall(pagenumber,model);
		empservice.pagination(model);
		return "showall";
	}
	
	
	@RequestMapping(value = "/search/employee/{pagenumber}")
	public String search(@PathVariable("pagenumber") int pagenumber, @RequestParam(value="search", required=false) String search,Model model, HttpServletRequest session) {
		System.out.println("The id came is: "+search);
		empservice.search(pagenumber,search,model);
		//empservice.pagination(model);
		session.setAttribute("search", search);
		return "searchedpage";
	}
	
	@RequestMapping(value = "/detail/employee/{id}")
	public String details(@PathVariable("id") String id, Model model) {
		empservice.details(id,model);
		return "detail";
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
	
	@RequestMapping(value="/multiple/delete")
	
	public String multipledelete(@RequestParam(value="delchckbx", required=false) List params, Model model) throws IOException {
		 try {
			 System.out.println("Multiple Delete: "+params);
				int status=empservice.multipledelete(params, model);
				
		 }
		 catch (Exception e) {
			System.out.println(e);
		}
		 return "showall";
		
		
	
	}
	
	
}

