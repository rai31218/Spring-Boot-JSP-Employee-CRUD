package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
//@ComponentScan(basePackages= {"com.example.controller"})

import com.example.model.Employee;
import com.example.repo.EmpRepo;
@SpringBootApplication
public class SpringBootWithJspApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootWithJspApplication.class, args);
		  
		//  EmpRepo emprepo=new EmpRepo();
		//Employee employee=new Employee("r","R");
		//emprepo.createEmployee(employee);
	}
	
	
	@Bean
	 public ViewResolver getViewResolvers() {
	        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	        resolver.setPrefix("/WEB-INF/jsp/");
	        resolver.setSuffix(".jsp");
	        resolver.setViewClass(JstlView.class);
	        return resolver;
	    }

}
