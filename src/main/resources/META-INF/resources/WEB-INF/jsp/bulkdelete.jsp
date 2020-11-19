<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="loop"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bulk Delete</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="form-group">
		<form method="POST" action="/bulk/delete"
			enctype="multipart/form-data">
			<div class="form-group mt-3">
				<div>
					<h3>Select a CSV file</h3>
				</div>
				<label><input type="file" name="file" class="file" id="file"></label>
			</div>
			<button type="submit" class="btn btn-primary">Bulk Delete</button>
		</form>
		<div>
			<h3>${nodeletecsv}</h3>
		</div>
		<div>
			<h3>${bulkdeletemessage}</h3>
		</div>
		
	</div>
</body>
</html>