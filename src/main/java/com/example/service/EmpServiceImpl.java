package com.example.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.model.Employee;
import com.example.repo.EmpRepo;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.exceptions.CsvValidationException;

@Service
public class EmpServiceImpl implements EmpService {

	Employee employee;
	@Autowired
	EmpRepo emprepo;
	CSVReader reader = null;
	String splitBy = " ";
	String[] emparr = {};
	String returnstatement = "Employee details Saved";	
	List showlist = new ArrayList();	

	@Override
	public int saveemp(int pagenumber,MultipartFile file, Model model) throws IOException {
		Reader reader1 = new BufferedReader(new InputStreamReader(file.getInputStream()));
		int returnstatus = 0;
		String[] nextRecord = {};
		String duplicatenotification = " ";
		List recordlist = new ArrayList();
		int count=1;
		List idlist=new ArrayList();
		System.out.println("SAVEEMP METHOD CALLED");
		if (file.isEmpty()) {
					System.out.println("saveemp method() called with file: "+ file+"and the reader is: "+reader1+" is empty?: "+file.isEmpty());
		
		
		model.addAttribute("searcfileforpagination",file);

			model.addAttribute("csvnotuploaded", "Please select a CSV file to upload.");
			model.addAttribute("status", false);
			returnstatus = 2;

		}

		else {
			reader = new CSVReaderBuilder(reader1).withSkipLines(1).build(); // to skip the header

			try {
				while ((nextRecord = reader.readNext()) != null) {
					if (!nextRecord[1].isEmpty() && !nextRecord[2].isEmpty() && !nextRecord[3].isEmpty() && !nextRecord[4].isEmpty() &&
			            !nextRecord[6].isEmpty() && !nextRecord[12].isEmpty() && !nextRecord[14].isEmpty() && !nextRecord[16].isEmpty() &&
			            !nextRecord[19].isEmpty() && !nextRecord[21].isEmpty()) {
						System.out.print("Employee name : " + nextRecord[0] + nextRecord[1] + nextRecord[2]);
						employee = new Employee(nextRecord[0], nextRecord[1], nextRecord[2], nextRecord[3],
								nextRecord[4], nextRecord[5], nextRecord[6], nextRecord[7], nextRecord[8],
								nextRecord[9], nextRecord[10], nextRecord[11], nextRecord[12], nextRecord[13],
								nextRecord[14], nextRecord[15], nextRecord[16], nextRecord[17], nextRecord[18],
								nextRecord[19], nextRecord[20], nextRecord[21], nextRecord[22], nextRecord[23],
								nextRecord[24]);
						String id = emprepo.createEmployee(employee);
						recordlist.add(Arrays.asList(nextRecord).subList(0, 3));
						
						count++;
						if (id.equals(employee.getEmpid())) { // no redundency
							idlist.add(id);
						} else {
							
							duplicatenotification = id.substring(1) + " " + duplicatenotification;
						}
						
					} else {
						model.addAttribute("emptymessage", "Some fields are missing. Please follow the template");
						System.out.println("Not allowed");
						returnstatus = 1;
						break;
					}

				}
				duplicatenotification = "Redudent Data found in Database for following Employee Ids: " + duplicatenotification;
				model.addAttribute("successmessage", "The Employee Details Have Been Uploaded");
				model.addAttribute("duplicatenotification", duplicatenotification);
				model.addAttribute("totalrecorduploaded", recordlist.size());
				model.addAttribute("totalrecordsaved",idlist.size());
				System.out.println("DUPLICATE NOTIFICATION: " + duplicatenotification);
			} catch (CsvValidationException e) {
				e.printStackTrace();
			}
		}

		return returnstatus;
	}

	@Override
	public List showall(int pagenumber,Model model) {
		 int total=5;    
		 model.addAttribute("pagenumber",pagenumber); // as it needs the unmodified value
	        if(pagenumber==1){}    
	        else{    
	        	pagenumber=(pagenumber-1)*total+1;    
	        }    
		List listemployees = emprepo.showall(pagenumber);
		if(listemployees.isEmpty())
		{
			model.addAttribute("norecord", "No Record Present");
		}
		model.addAttribute("listemployees", listemployees);
		
		return listemployees;
	}
	
	@Override
	public List pagination(Model model) {
		System.out.println("Pagination method called from serviceimpl");
		List pagination = emprepo.pagination();		
		System.out.println("PAGINATION CONTAINS: "+pagination.size()+ " AND ");
		if(!pagination.isEmpty()) {
			pagination=pagination.subList(0, (pagination.size()+5-1)/5);
			
			//model.addAttribute("pagination", pagination);
		}
		else {
			//model.addAttribute("pagination", 0);
		}
		model.addAttribute("pagination", pagination);
		return pagination;
	}
	@Override
	public String deleteemp(String id, Model model) {
		String deletemessage = emprepo.deleteemp(id);
		if(!deletemessage.startsWith("N"))
		{
			deletemessage = "Employee details with Employee id " +  deletemessage+ " deleted";
		}
		
		else
		{
			deletemessage = "Employee Id " +deletemessage.substring(1) +" not found";
		}
		
		model.addAttribute("deletemessage", deletemessage);
		//bulkdeletemessage ="Employe Ids deleted are: " + bulkdeletemessage;
		//bulknotdeletemessage="Not found: "+ bulknotdeletemessage;
		
		 //return "reditect:showall";
		showall(1,model);
		return "Deleted";
	}


	public List editemp(String id, Model model) {
		List updatableemp = emprepo.edit(id);
		// System.out.println(updatableemp.get(1));
		model.addAttribute("updatableemp", updatableemp);
		model.addAttribute("editableid", id);
		return updatableemp;
	}

	@Override
	public String editsave(String id, Map params, Model model) {
		employee = new Employee(params.get("empid").toString(), params.get("empname").toString(),
				params.get("email").toString(), params.get("phone").toString(), params.get("addphone").toString(),
				params.get("dob").toString(), params.get("country").toString(), params.get("state").toString(),
				params.get("city").toString(), params.get("addr").toString(), params.get("ofcloc").toString(),
				params.get("jy").toString(), params.get("yoe").toString(), params.get("skilset").toString(),
				params.get("cert").toString(), params.get("band").toString(), params.get("jrss").toString(),
				params.get("pm").toString(), params.get("pem").toString(), params.get("training").toString(),
				params.get("proj").toString(), params.get("client").toString(), params.get("startdate").toString(),
				params.get("enddate").toString(), params.get("preferredloc").toString());

		String editmessage = emprepo.editsave(id, employee);
		model.addAttribute("editmessage", editmessage);
		showall(1,model);
		return "Updated";
	}

	@Override
	public List search(int pagenumber,String search, Model model) {
		int total=5;    
		 model.addAttribute("pagenumber",pagenumber);
		 if(pagenumber==1){}    
	        else{    
	        	pagenumber=(pagenumber-1)*total+1;    
	        }   
		 
		List searchedemployee = emprepo.search(pagenumber,search, model);
		if (searchedemployee.isEmpty()) {
			model.addAttribute("nosearchresult", "No Match found");
		}
		
		model.addAttribute("searchedemployee", searchedemployee);
		List searchpagepagination = emprepo.searchpagepagination(search);
		
		List numberofpages=searchpagepagination.subList(0, (searchpagepagination.size()+5-1)/5);	
		model.addAttribute("numberofpages", numberofpages);
		model.addAttribute("searchwordforpagination", search);
		System.out.println("Number of pages for search: "+numberofpages);
		//showall(model);
		return searchedemployee;
	}

	@Override
	public int bulkdelete(MultipartFile file, Model model) throws IOException {
		Reader readers=new BufferedReader(new InputStreamReader(file.getInputStream()));
		System.out.println("bulkdelete method() called from serviceimpl");
		int returnstatus=0;
		String deletedid="";
		String[] nextRecord = {};
		String bulkdeletemessage = "";
		String bulknotdeletemessage="";
		String duplicatenotification;
		if (file.isEmpty()) {
			model.addAttribute("nodeletecsv", "Please select a CSV file to upload.");
			model.addAttribute("status", false);
			returnstatus=2; 
			
			showall(1,model);
			pagination(model);
			return returnstatus;
		}
		
		else {
			reader = new CSVReaderBuilder(readers).withSkipLines(1).build(); // to skip the header
			
			
			try {
				while ((nextRecord = reader.readNext()) != null) {
				    if(!nextRecord[0].isEmpty())
				    {
					  System.out.print("Employee id : " + nextRecord[0] );
					  deletedid = emprepo.deleteemp((nextRecord[0]));
					  
					if(!deletedid.startsWith("N")){
						bulkdeletemessage = deletedid + " " + bulkdeletemessage;
					  System.out.println("Deleted IDs are: "+bulkdeletemessage);
				    }
					else {
						
					  bulknotdeletemessage = deletedid.substring(1) + " " + bulknotdeletemessage;
					  System.out.println("Not found IDs are: "+bulknotdeletemessage);
				    }


				    
				    }
				}
				bulkdeletemessage ="Employee Ids deleted are: " + bulkdeletemessage;
				bulknotdeletemessage="Not found: "+ bulknotdeletemessage;
			} catch (CsvValidationException e) {
				
				e.printStackTrace();
			}
			model.addAttribute("bulkdeletemessage",bulkdeletemessage);
			model.addAttribute("bulknotdeletemessage",bulknotdeletemessage);
			showall(1,model);
		    pagination(model);
	}
		
			return returnstatus;
}

	@Override
	public List details(String id, Model model) {
		System.out.println("Into details method of serviceimpl with id: "+id);
		List details = emprepo.details(id, model);
		model.addAttribute("details",details);
		return null;
	}

	@Override
	public int multipledelete(List params, Model model) {
		  
		int status=emprepo.multipledelete(params);
		model.addAttribute("multipledeletemessage", "Data was deleted successfully");
		showall(1,model);
		return status;
	}
}
