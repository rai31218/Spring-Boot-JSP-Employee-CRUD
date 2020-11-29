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
			Query query = getSession().createQuery("FROM Employee e WHERE e.empid like :empid or e.email like :email");
			query.setParameter("empid", "%" + employee.getEmpid() + "%");
			query.setParameter("email", "%" + employee.getEmail() + "%");

			List searchresult = query.list();

			if (searchresult.isEmpty()) {
				getSession().save(employee);
				id = employee.getEmpid();
				System.out.println("\nEmployee inserted successfully with ID - " + id);

			}

			else {
				System.out.println("Duplicate value discarded");
				id = "R" + employee.getEmpid();
			}
			// getSession().flush();
			tnx.commit();
		} catch (HibernateException he) {
			tnx.rollback();
			he.printStackTrace();
		}
		return id;

	}

	public List showall(int pagenumber) {

		tnx = getSession().beginTransaction();
		Query employ = getSession().createQuery("From Employee e");
		employ.setFirstResult(pagenumber - 1);
		employ.setMaxResults(5);
		List employees = employ.list();
		tnx.commit();
		return employees;

	}

	public List pagination() {

		tnx = getSession().beginTransaction();
		List pagination = getSession().createQuery("From Employee e").list();
		tnx.commit();
		return pagination;

	}

	public String deleteemp(String id) {
		System.out.println("DELETE HITTED with id: " + id);
		tnx = getSession().beginTransaction();
		Employee e = null;
		String message = "";
//		Employee empForDelete = getSession().get(Employee.class, id);
//		getSession().delete(empForDelete);
		Query deletableemp = getSession().createQuery("From Employee e where e.empid=:id");
		deletableemp.setParameter("id", id);
		List deleteemp = deletableemp.list();
		try {
			if (!deleteemp.isEmpty()) {
				System.out.println("DELETE IF HITTED");
				Iterator<Employee> it = deleteemp.iterator();
				while (it.hasNext()) {
					e = it.next();
				}
				getSession().delete(e);
				message = e.getEmpid();
			}

			else {
				message = "N" + id.toString();
			}

		} catch (Exception exception) {
			System.out.println("Exception e" + exception);

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

	public List search(int pagenumber, String search, Model model) {
		System.out.println("Search method called with: " + search);
		// tnx = getSession().beginTransaction();
		Query query = getSession().createQuery("FROM Employee e WHERE e.empid like :search or e.email like :search "
				+ "or e.skilset like :search or e.name like :search or e.country like :search "
				+ "or e.city like :search or e.state like :search or  e.band like :search ");
		query.setParameter("search", "%" + search + "%").list();
		query.setFirstResult(pagenumber - 1);
		query.setMaxResults(5);
		List searchedresult = query.list();

		return searchedresult;
		// tnx.commit();
//		if(!searchresult.isEmpty())
//		{
//			Query searchedresult = getSession().createQuery("FROM Employee e WHERE e.empid like :search or e.email like :search "
//					+ "or e.skilset like :search or e.name like :search or e.country like :search "
//					+ "or e.city like :search or e.state like :search or  e.band like :search ");
//			searchedresult.setParameter("search", "%" + search + "%");
//			searchedresult.setFirstResult(pagenumber-1);
//			searchedresult.setMaxResults(5);
//			List quantifiedsearchresult=searchedresult.list();
//			
//			return quantifiedsearchresult;
//		}
//		else {
//			
//			return searchresult;
//		}
	}

	public List searchpagepagination(String search) {

		// tnx = getSession().beginTransaction();
		System.out.println("Search method called with: " + search);
		tnx = getSession().beginTransaction();
		Query query = getSession().createQuery("FROM Employee e WHERE e.empid like :search or e.email like :search "
				+ "or e.skilset like :search or e.name like :search or e.country like :search "
				+ "or e.city like :search or e.state like :search or  e.band like :search ");
		List searchpagepagination = query.setParameter("search", "%" + search + "%").list();
		// tnx.commit();
		return searchpagepagination;

	}

	public List details(String id, Model model) {
		tnx = getSession().beginTransaction();
		System.out.println("Came into deatils method with id: " + id);
		Query detailemp = getSession().createQuery("From Employee e where e.empid=:id");
		detailemp.setParameter("id", id);
		List details = detailemp.list();
		tnx.commit();
		System.out.println("Edit wala emp id is: " + details);
		return details;

	}

	public int multipledelete(List params) {
		Employee e = null;
		System.out.println("DELETE HITTED from EmpRepo "+params);
		tnx = getSession().beginTransaction();
		Query multipledelete;
		List multipledeletelist = new ArrayList();
		for (int i=0;i<params.size();i++)
		{
			multipledelete = getSession().createQuery("From Employee e where e.empid=:id");
			multipledelete.setParameter("id", params.get(i));
			multipledeletelist=multipledelete.list();
			
		
				if(!multipledeletelist.isEmpty())
				{
					System.out.println("MULTIPLE DELETE ITERATOR HIT FOR: "+multipledeletelist);
					Iterator<Employee> it = multipledeletelist.iterator();
					while (it.hasNext()) {
						e = it.next();
					}
					getSession().delete(e);
					
				}
			
		}
		tnx.commit();
		return 1;
	}
}