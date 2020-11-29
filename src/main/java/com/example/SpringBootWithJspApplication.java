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
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import com.example.model.Employee;
import com.example.repo.EmpRepo;
@SpringBootApplication
public class SpringBootWithJspApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootWithJspApplication.class, args);
		
	}
	
	
	@Bean
	 public ViewResolver getViewResolvers() {
	        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	        //TilesViewResolver tilesresolver = new TilesViewResolver();
	        resolver.setPrefix("/WEB-INF/jsp/");
	        resolver.setSuffix(".jsp");
	        resolver.setViewClass(JstlView.class);
	        return resolver;
	    }

}
