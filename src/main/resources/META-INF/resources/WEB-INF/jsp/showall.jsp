<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="loop"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>All Employee Details</title>
</head>
<body>




	<div>
		<h3>${editmessage}</h3>
	</div>
	<div>
		<h3>Employee Details</h3>
	</div>
	${searchedemployee}
	<form method="POST" action="/search/employee">
		<input type="text" name="search" class="form-control" id="search"
			value="" placeholder="search by id,name,email, name,country,city,skillset,band ">
		<button type="submit" class="btn btn-primary" value="searchbutton"
			name="searchbutton" >Search</button>

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

			<loop:forEach items="${listemployees}" var="record">
				<tr>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.id}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.empid}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.name}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.email}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.phone}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.addphone}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.DOB}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.country}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.state}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.city}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.homeaddress}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.ofcloc}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.jy}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.yoe}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.skilset}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.certifications}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.band}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.jrss}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.pm}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.pem}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.training}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.proj}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.client}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.startdate}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.enddate}</td>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;">${record.preferredloc}</td>

					<form method="POST" action="/remove/employees/${record.empid}">
						<td
							style="word-wrap: break-word; min-width: 160px; max-width: 160px;"><button
								type="submit" class="btn btn-primary" name="delete">Delete</button></td>
					</form>
					<td
						style="word-wrap: break-word; min-width: 160px; max-width: 160px;"><form
							method="POST" action="/edit/employee/${record.empid}">
							<button type="submit" class="btn btn-primary" value="edit"
								name="edit">Edit</button></td>
					</form>
			</loop:forEach>
			</tr>
		</tbody>
	</table>
		<div>
		<h3>${deletemessage}</h3>
	</div>
	<div class="form-group">
		<form method="POST" action="/bulkdelete">
			<div class="form-group mt-3">
			<button type="submit" class="btn btn-primary">Bulk Delete</button>
		</form>
		<div>
			<h4>${bulkdeletemessage}</h4>
		</div>
		
		<div>
			<h4>${bulknotdeletemessage}</h4>
		</div>
		
		
	</div>
	<form method="POST" action="/">
		<button type="submit" class="btn btn-primary" value="showall"
			name="showall">Insert Further</button>
	</form>
</body>
</html>