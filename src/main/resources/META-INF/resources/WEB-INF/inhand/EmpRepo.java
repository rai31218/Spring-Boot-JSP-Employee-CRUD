package com.example.repo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.hibernate.service.ServiceRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.example.model.Employee;

@org.springframework.context.annotation.Configuration
@Repository
public class EmpRepo {

	@Autowired
	private SessionFactory factory;

	Employee employee;

	private static Transaction tnx = null;

	private Session getSession() {
		Session session = factory.getCurrentSession();
		if (session == null) {
			session = factory.openSession();
		}
		return session;
	}

	public String createEmployee(Employee employee) {

		System.out.println("Connected to databased - " + factory);
		String id = "";
		int duplicacy = 1;
		tnx = getSession().beginTransaction();
		try {
			Query query = getSession().createQuery("FROM Employee e WHERE e.empid like :search");
			List searchresult = query.setParameter("search", "%" + employee.getEmpid() + "%").list();

			if (searchresult.isEmpty()) {
				getSession().save(employee);
				id = employee.getEmpid();
				System.out.println("\nEmployee inserted successfully with ID - " + id);

			}

			else {
				System.out.println("Duplicate value discarded");
				id = "R"+employee.getEmpid();
			}

			tnx.commit();
		} catch (HibernateException he) {
			tnx.rollback();
			he.printStackTrace();
		}
		return id;

	}

	public List showall() {

		tnx = getSession().beginTransaction();
		List employees = getSession().createQuery("From Employee e").list();
		List employeelist = new ArrayList();
//		for(int i=0;i<2;i++)
//		{
//			Employee emp=(Employee) employees.get(i);
//			employeelist.add(emp);
//		}
		//System.out.println("Now check what comes: " + ((Employee) employees.get(0)).getName());
		tnx.commit();
		return employees;

	}

	public String deleteemp(String id) {
		System.out.println("DELETE HITTED with id: "+id);
		tnx = getSession().beginTransaction();
		Employee e = null;
		String message ="";
//		Employee empForDelete = getSession().get(Employee.class, id);
//		getSession().delete(empForDelete);
		Query deletableemp = getSession().createQuery("From Employee e where e.empid=:id");
		deletableemp.setParameter("id", id);
		List editemp = deletableemp.list();
		try {
			if(!editemp.isEmpty())
			{
				System.out.println("DELETE IF HITTED");
				Iterator<Employee> it = editemp.iterator();
				while (it.hasNext()) {
					e = it.next();
				}
				getSession().delete(e);	
				message = e.getEmpid();
			}
			
			else
			{
				message="N"+id.toString();
			}

		}catch(Exception exception)
		{
			System.out.println("Exception e"+exception);
			
		}
		
		tnx.commit();
		return message;

	}
	
	
//	public String bulkdelete(int empId)
//	{
//		tnx = getSession().beginTransaction();
//		getSession().delete(employee);
//		tnx.commit();
//		return "Deleted";
//	}

//	public Employee edit(int id) {
//		tnx=getSession().beginTransaction();
//		System.out.println("Came into first edit method "+id);
//		Employee updatableemp = getSession().get(Employee.class, id); 
//		tnx.commit();
//		return updatableemp;
//		
//	}

	public List edit(String id) {
		tnx = getSession().beginTransaction();
		System.out.println("Came into first edit method " + id);
		Query updatableemp = getSession().createQuery("From Employee e where e.empid=:id");
		updatableemp.setParameter("id", id);
		List editemp = updatableemp.list();
		tnx.commit();
		System.out.println("Edit wala emp id is: " + editemp);
		return editemp;

	}

	public String editsave(String id, Employee employee) {
		System.out.println("Main edit method called");
		tnx = getSession().beginTransaction();
		Employee e = null;
		// Employee e = getSession().get(Employee.class, id);
		Query updatableemp = getSession().createQuery("From Employee e where e.empid=:id");
		updatableemp.setParameter("id", id);
		List emp = updatableemp.list();
		Iterator<Employee> it = emp.iterator();
		while (it.hasNext()) {
			e = it.next();
		}

		e.setEmpid(employee.getEmpid());
		e.setName(employee.getName());
		e.setEmail(employee.getEmail());
		e.setPhone(employee.getPhone());
		e.setAddphone(employee.getAddphone());
		e.setDOB(employee.getDOB());
		e.setCountry(employee.getCountry());
		e.setState(employee.getState());
		e.setCity(employee.getCity());
		e.setHomeaddress(employee.getHomeaddress());
		e.setOfcloc(employee.getOfcloc());
		e.setJy(employee.getJy());
		e.setYoe(employee.getYoe());
		e.setSkilset(employee.getSkilset());
		e.setCertifications(employee.getCertifications());
		e.setBand(employee.getBand());
		e.setJrss(employee.getJrss());
		e.setPm(employee.getPm());
		e.setPem(employee.getPem());
		e.setTraining(employee.getTraining());
		e.setProj(employee.getProj());
		e.setClient(employee.getClient());
		e.setStartdate(employee.getStartdate());
		e.setEnddate(employee.getEnddate());
		e.setPreferredloc(employee.getPreferredloc());

		tnx.commit();
		return "Updation Done";

	}

	public List search(String search, Model model) {
		System.out.println("Search method called with: " + search);
		tnx = getSession().beginTransaction();
		Query query = getSession().createQuery("FROM Employee e WHERE e.empid like :search or e.email like :search "
				+ "or e.skilset like :search or e.name like :search or e.country like :search "
				+ "or e.city like :search or e.state like :search or  e.band like :search ");
		List searchresult = query.setParameter("search", "%" + search + "%").list();
		System.out.println("The search result is: " + searchresult);
		tnx.commit();
		return searchresult;
	}
}