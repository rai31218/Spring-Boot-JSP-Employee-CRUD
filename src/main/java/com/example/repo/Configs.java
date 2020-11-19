package com.example.repo;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

@PropertySource(value= {"classpath:application.properties"})
@Configuration
public class Configs {

	@Value("${spring.datasource.url}")
	private String url;
	@Value("${spring.datasource.username}")
	private String username;
	@Value("${spring.datasource.password}")
	private String password;
	@Value("${spring.jpa.properties.hibernate.dialect}")
	private String dialect;
	@Value("${spring.jpa.hibernate.ddl-auto}")
	private String ddlauto;
	//@Value("${spring.jpa.generate-ddl}")
	private String generateddl;
	
	
	
	public DataSource getDataSource() {
		
		DriverManagerDataSource datasource= new DriverManagerDataSource(url, username, password);
		datasource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		return datasource;
	}
	
	public Properties hibernetProps()
	{
		Properties props=new Properties();
		props.put("hibernate.dialect", dialect);
		props.put("hibernate.hbm2ddl.auto", "update");
		//props.put("generate-ddl", generateddl);
		return props;
	}
	
	@Bean
	public LocalSessionFactoryBean sessionFactory()
	{
		LocalSessionFactoryBean sfb= new LocalSessionFactoryBean();
		sfb.setDataSource(getDataSource());
		sfb.setHibernateProperties(hibernetProps());
		sfb.setPackagesToScan(new String[]{"com.example.model"});
		return sfb;
		
	}
	
	@Bean
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory factory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager();
		transactionManager.setSessionFactory(factory);
		return transactionManager;
	}

}
