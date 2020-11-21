package com.example.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.example.model.Employee;

public interface EmpService {
	
	int saveemp(MultipartFile file, Model model) throws IOException;
	List showall(int pagenumber,Model model);
	List pagination(Model model);
	String deleteemp(String id,Model model);
	List editemp(String id,Model model);
	String editsave(String id, Map<String, String> params, Model model);
	List search(String search, Model model);
	int bulkdelete(MultipartFile file, Model model) throws IOException;

}
