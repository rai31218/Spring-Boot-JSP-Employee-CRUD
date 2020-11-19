<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Edit Employee</title>
</head>
<body>

	<div class="container">
		<div>
			<h3>Give The Details</h3>
		</div>
		<form method="POST" action="/save/editedemployees/${editableid}"
			enctype="multipart/form-data">
			<div class="form-group">
				<input type="text" name="empid" class="form-control" id="empid"
					value="${updatableemp[0].empid}" placeholder="Id">
			</div>
			<div class="form-group">
				<input type="text" name="empname" class="form-control" id="empname"
					value="${updatableemp[0].name}">
			</div>
			<div class="form-group">
				<input type="email" name="email" class="form-control" id="email"
					value="${updatableemp[0].email}" required>
			</div>
			<div class="form-group">
				<input type="text" name="phone" class="form-control" id="phone"
					value="${updatableemp[0].phone}" maxlength="10"  required>
			</div>
			<div class="form-group">
				<input type="text" name="addphone" class="form-control" id="addphone"
					value="${updatableemp[0].addphone}"  maxlength="10" required>
			</div>
			<div class="form-group">
				<input type="text" name="dob" class="form-control" id="dob"
					value="${updatableemp[0].DOB}" required>
			</div>
			<div class="form-group">
				<input type="text" name="country" class="form-control" id="country"
					value="${updatableemp[0].country}" required>
			</div>
			<div class="form-group">
				<input type="text" name="state" class="form-control" id="state"
					value="${updatableemp[0].state}" required>
			</div>
			<div class="form-group">
				<input type="text" name="city" class="form-control" id="city"
					value="${updatableemp[0].city}" required>
			</div>
			<div class="form-group">
				<input type="text" name="addr" class="form-control" id="addr"
					value="${updatableemp[0].homeaddress}" required>
			</div>
			<div class="form-group">
				<input type="text" name="ofcloc" class="form-control" id="ofcloc"
					value="${updatableemp[0].ofcloc}" required>
			</div>
			<div class="form-group">
				<input type="text" name="jy" class="form-control" id="jy"
					value="${updatableemp[0].jy}" required>
			</div>
			<div class="form-group">
				<input type="text" name="yoe" class="form-control" id="yoe"
					value="${updatableemp[0].yoe}" required>
			</div>
			<div class="form-group">
				<input type="text" name="skilset" class="form-control" id="skilset"
					value="${updatableemp[0].skilset}" required>
			</div>
			<div class="form-group">
				<input type="text" name="cert" class="form-control" id="cert"
					value="${updatableemp[0].certifications}" required>
			</div>
			<div class="form-group">
				<input type="text" name="band" class="form-control" id="band"
					value="${updatableemp[0].band}" required>
			</div>
			<div class="form-group">
				<input type="text" name="jrss" class="form-control" id="jrss"
					value="${updatableemp[0].jrss}" required>
			</div>
			<div class="form-group">
				<input type="text" name="pm" class="form-control" id="pm"
					value="${updatableemp[0].pm}" required>
			</div>
			<div class="form-group">
				<input type="text" name="pem" class="form-control" id="pem"
					value="${updatableemp[0].pem}" required>
			</div>
			<div class="form-group">
				<input type="text" name="training" class="form-control" id="training"
					value="${updatableemp[0].training}" required>
			</div>
			<div class="form-group">
				<input type="text" name="proj" class="form-control" id="proj"
					value="${updatableemp[0].proj}" required>
			</div>
			<div class="form-group">
				<input type="text" name="client" class="form-control" id="client"
					value="${updatableemp[0].client}" required>
			</div>
			<div class="form-group">
				<input type="text" name="startdate" class="form-control" id="startdate"
					value="${updatableemp[0].startdate}" required>
			</div>
			<div class="form-group">
				<input type="text" name="enddate" class="form-control" id="enddate"
					value="${updatableemp[0].enddate}" required>
			</div>
			<div class="form-group">
				<input type="text" name="preferredloc" class="form-control" id="preferredloc"
					value="${updatableemp[0].preferredloc}" required>
			</div>

			<div>
				<button type="submit" class="btn btn-primary">Save</button>
			</div>
	</div>

	</form>
	</div>
</body>
</html>