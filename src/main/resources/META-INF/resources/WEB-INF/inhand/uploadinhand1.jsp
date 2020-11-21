<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Upload Details</title>

</head>
<body>

	<!--accept=".csv"  -->
	<div class="rounded-lg border border-secondary container" border=1px solid black align="center">
	  
		<div class="form-group">
			<form method="POST" action="/save/employees"
				enctype="multipart/form-data">
				<div class="form-group mt-3">
					<div><h3>Select a CSV file</h3></div>
					<label><input type="file" name="file" class="file"
						id="file" accept=".csv"></label>
				</div>
				<button type="submit" class="btn btn-primary">Import Users</button>


				<div>${csvnotuploaded}</div>
				<div><h3>${emptymessage}</h3></div>
			</form>
		</div>
	</div>



</body>
</html>