<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="loop"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Employee Details</title>
</head>
<body  style="overflow: auto;">


	<div>
		<h3>${csvnotuploaded}</h3>
	</div>
	<div>
		<h3>${successmessage}</h3>
	</div>

	<table class="table table-striped">
	<thead>
			<tr>
				<th>EmployeeId</th>
				<th>Name</th>
				<th>Email</th>
				<th>Phone</th>
				<th>AdditionalPhone</th>
				<th>DOB</th>
				<th>Country</th>
				<th>State</th>
				<th>City</th>
				<th>HomeAddress</th>
				<th>OfficeLocation</th>
				<th>JoiningYear</th>
				<th>YearofExperience</th>
				<th>SkillSet</th>
				<th>Certifications</th>
				<th>Band</th>
				<th>Jrss</th>
				<th>PM Name</th>
				<th>PeM Name</th>
				<th>Training</th>
				<th>CurrentProject</th>
				<th>Client</th>
				<th>Start Date</th>
				<th>End Date</th>
				<th>PreferredLocation</th>
				
			</tr>
		</thead>
		<tbody>
	

		<loop:forEach items="${record}" var="rec">
			<tr>
				<loop:forEach items="${rec}" var="record">

					<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${record}</td>


				</loop:forEach>

			</tr>
		</loop:forEach>
		
		</tbody>
	</table>
<div><h4>${duplicatenotification}</h4></div>


	<div><form method="POST" action="/show/employees">
		<button type="submit" class="btn btn-primary" value="showall"
			name="showall">Show All</button>
	</form></div>
	<div>
	<form method="POST" action="/">
		<button type="submit" class="btn btn-primary" value="showall"
			name="showall">Insert Further</button>
			</form>
	
	</div>
	

</body>
</html>