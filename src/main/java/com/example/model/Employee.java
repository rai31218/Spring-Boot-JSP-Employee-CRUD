package com.example.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


@Entity
@Table(name = "emp")
@NamedQuery(name = "select", query = "from Employee e")
public class Employee {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String empid;
	private String name;
	private String email;
	private String phone;
	private String addphone;
	private String DOB;
	private String country;
	private String state;
	private String city;
	private String homeaddress;
	private String ofcloc;
	private String jy;
	private String yoe;
	private String skilset;
	private String certifications;
	private String band;
	private String jrss;
	private String pm;
	private String pem;
	private String training;
	private String proj;
	private String client;
	private String startdate;
	private String enddate;
	private String preferredloc;
	
	public String getEmpid() {
		return empid;
	}

	public void setEmpid(String empid) {
		this.empid = empid;
	}
	
	
	
	
	
	@Override
	public String toString() {
		return "Employee [id=" + id + ", empid=" + empid + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", addphone=" + addphone + ", DOB=" + DOB + ", country=" + country + ", state=" + state + ", city="
				+ city + ", homeaddress=" + homeaddress + ", ofcloc=" + ofcloc + ", jy=" + jy + ", yoe=" + yoe
				+ ", skilset=" + skilset + ", certifications=" + certifications + ", band=" + band + ", jrss=" + jrss
				+ ", pm=" + pm + ", pem=" + pem + ", training=" + training + ", proj=" + proj + ", client=" + client
				+ ", startdate=" + startdate + ", enddate=" + enddate + ", preferredloc=" + preferredloc
				+ ", getEmpid()=" + getEmpid() + ", getId()=" + getId() + ", getName()=" + getName() + ", getEmail()="
				+ getEmail() + ", getPhone()=" + getPhone() + ", getAddphone()=" + getAddphone() + ", getDOB()="
				+ getDOB() + ", getCountry()=" + getCountry() + ", getState()=" + getState() + ", getCity()="
				+ getCity() + ", getHomeaddress()=" + getHomeaddress() + ", getOfcloc()=" + getOfcloc() + ", getJy()="
				+ getJy() + ", getYoe()=" + getYoe() + ", getSkilset()=" + getSkilset() + ", getCertifications()="
				+ getCertifications() + ", getBand()=" + getBand() + ", getJrss()=" + getJrss() + ", getPm()=" + getPm()
				+ ", getPem()=" + getPem() + ", getTraining()=" + getTraining() + ", getProj()=" + getProj()
				+ ", getClient()=" + getClient() + ", getStartdate()=" + getStartdate() + ", getEnddate()="
				+ getEnddate() + ", getPreferredloc()=" + getPreferredloc() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	public Employee() {
		
	}
	public Employee(String empid,String name, String email, String phone, String addphone, String dOB, String country,
			String state, String city, String homeaddress, String ofcloc, String jy, String yoe, String skilset,
			String certifications, String band, String jrss, String pm, String pem, String training, String proj,
			String client, String startdate, String enddate, String preferredloc) {
		super();
		this.empid = empid;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.addphone = addphone;
		DOB = dOB;
		this.country = country;
		this.state = state;
		this.city = city;
		this.homeaddress = homeaddress;
		this.ofcloc = ofcloc;
		this.jy = jy;
		this.yoe = yoe;
		this.skilset = skilset;
		this.certifications = certifications;
		this.band = band;
		this.jrss = jrss;
		this.pm = pm;
		this.pem = pem;
		this.training = training;
		this.proj = proj;
		this.client = client;
		this.startdate = startdate;
		this.enddate = enddate;
		this.preferredloc = preferredloc;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddphone() {
		return addphone;
	}
	public void setAddphone(String addphone) {
		this.addphone = addphone;
	}
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getHomeaddress() {
		return homeaddress;
	}
	public void setHomeaddress(String homeaddress) {
		this.homeaddress = homeaddress;
	}
	public String getOfcloc() {
		return ofcloc;
	}
	public void setOfcloc(String ofcloc) {
		this.ofcloc = ofcloc;
	}
	public String getJy() {
		return jy;
	}
	public void setJy(String jy) {
		this.jy = jy;
	}
	public String getYoe() {
		return yoe;
	}
	public void setYoe(String yoe) {
		this.yoe = yoe;
	}
	public String getSkilset() {
		return skilset;
	}
	public void setSkilset(String skilset) {
		this.skilset = skilset;
	}
	public String getCertifications() {
		return certifications;
	}
	public void setCertifications(String certifications) {
		this.certifications = certifications;
	}
	public String getBand() {
		return band;
	}
	public void setBand(String band) {
		this.band = band;
	}
	public String getJrss() {
		return jrss;
	}
	public void setJrss(String jrss) {
		this.jrss = jrss;
	}
	public String getPm() {
		return pm;
	}
	public void setPm(String pm) {
		this.pm = pm;
	}
	public String getPem() {
		return pem;
	}
	public void setPem(String pem) {
		this.pem = pem;
	}
	public String getTraining() {
		return training;
	}
	public void setTraining(String training) {
		this.training = training;
	}
	public String getProj() {
		return proj;
	}
	public void setProj(String proj) {
		this.proj = proj;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getPreferredloc() {
		return preferredloc;
	}
	public void setPreferredloc(String preferredloc) {
		this.preferredloc = preferredloc;
	}

	
	

}
