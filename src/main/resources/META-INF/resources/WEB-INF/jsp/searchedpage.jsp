<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="loop"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Searched Result</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div><h3>Searched Result for Employee</h3> </div>
<div><h3>${nosearchresult}</h3></div>

<form method="POST" action="/search/employee">
		<input type="text" name="search" class="form-control" id="search"
			value=""  placeholder="search by id,name,email, name,country,city,skillset,band">
		<button type="submit" class="btn btn-primary" value="searchbutton"
			name="searchbutton">Search</button>

	</form>
	<table class="table table-striped">

<thead>
			<tr>
				<th>SerialId</th>
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
				<loop:forEach items="${searchedemployee}" var="searchedemployee">
			<tr>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.id}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.empid}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.name}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.email}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.phone}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.addphone}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.DOB}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.country}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.state}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.city}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.homeaddress}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.ofcloc}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.jy}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.yoe}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.skilset}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.certifications}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.band}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.jrss}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.pm}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.pem}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.training}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.proj}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.client}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.startdate}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.enddate}</td>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${searchedemployee.preferredloc}</td>


				<form method="POST"
					action="/remove/employees/${searchedemployee.empid}">
					<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;"><button type="submit" class="btn btn-primary"
							name="delete">Delete</button></td>
				</form>
				<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;"><form method="POST"
						action="/edit/employee/${searchedemployee.empid}">
						<button type="submit" class="btn btn-primary" value="edit"
							name="edit">Edit</button></td>
				</form>
				</tr>
		</loop:forEach>

		
		</tbody>

	</table>
	<form method="POST" action="/show/employees">
		<button type="submit" class="btn btn-primary" value="showall"
			name="showall">Show All</button>
	</form>
</body>
</html>