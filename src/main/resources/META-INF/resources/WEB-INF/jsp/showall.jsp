<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="loop"%>
<!DOCTYPE html>
<html lang="en">
<head>


<style>
body {
	font-family: "Lato", sans-serif;
}

.sidebar {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: darkblue;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidebar button {
	background: none !important;
	border: none;
	padding: 5;
	text-decoration: none;
	font-size: 25px;
	color: #f8f7f7;
	display: block;
	transition: 0.3s;
}

.sidebar a:hover {
	color: #f1f1f1;
}

.sidebar .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

.openbtn {
	font-size: 20px;
	cursor: pointer;
	background-color: darkblue;
	color: white;
	padding: 10px 15px;
	border: none;
}

.openbtn:hover {
	background-color: #444;
}

#main {
	transition: margin-left .5s;
	padding: 16px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
	.sidebar {
		padding-top: 15px;
	}
	.sidebar a {
		font-size: 18px;
	}
}
</style>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>


	<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
		<div id="main">
			<button class="openbtn" onclick="openNav()">&#9776;</button>
		</div>
		<ul class="navbar-nav">
			<li class="nav-item active">
				<p>
				<h1 style="color: #f1f1f1">BIG BLUE POC</h1>
				</p>
			</li>
		</ul>

	</nav>

	<div id="mySidebar" class="sidebar">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<form action="/">
			<button type="submit" class="btn btn-light">Import Users</button>
		</form>
		<form action="/show/employees/1">
			<button type="submit" class="btn btn-light">Show All</button>
		</form>

	</div>



	<div class="container mb-4">
		<div class="row">
			<div class="col-xs-12 col-md-12 mx-auto mt-3 pt-5">
				<div class="card shadow-lg rounded border-secondary">
					<div class="card-header text-center bg-primary text-white">

						Employee List</div>


					<table class="table table-striped">
						<thead>
							<tr>

								<th>EmployeeId</th>
								<th>Name</th>
								<th>Email</th>
								<th class="align-center">Actions</th>


							</tr>
						</thead>
						<tbody>

							<loop:forEach items="${listemployees}" var="record">
								<tr>
									<td
										style="word-wrap: break-word; min-width: 160px; max-width: 200px;">${record.empid}</td>
									<td
										style="word-wrap: break-word; min-width: 160px; max-width: 200px;">${record.name}</td>
									<td
										style="word-wrap: break-word; min-width: 160px; max-width: 200px;">${record.email}</td>

									<form method="POST" action="/remove/employees/${record.empid}">
										<td
											style="word-wrap: break-word; min-width: 60px; max-width: 60px;"><button
												type="submit" class="btn btn-primary" name="delete">Delete</button></td>
									</form>
									<form method="POST" action="/edit/employee/${record.empid}">
									<td
										style="word-wrap: break-word; min-width: 60px; max-width: 60px;">
										<button type="submit" class="btn btn-primary" value="edit"
											name="edit">Edit</button>
									</td>
									</form>
									<form method="POST" action="/detail/employee/${record.empid}">
									<td
										style="word-wrap: break-word; min-width: 60px; max-width: 60px;">
										<button type="submit" class="btn btn-primary" value="edit"
											name="edit">Detail</button>
									</td>
									</form>
							</loop:forEach>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>
		<div class="container">

			<ul class="pagination  justify-content-center" style="margin: 20px 0">
				<li class="page-item"><a class="page-link"
					href="/show/employees/1">First</a></li>
				<loop:forEach items="${pagination}" var="record" varStatus="status">
					<loop:choose>
						<loop:when test="${status.count == pagenumber}">
							<li class="page-item active" id="pagei"><a class="page-link"
								href="/show/employees/${status.count}" class="activate"
								onclick="actpage()">${status.count}</a></li>
						</loop:when>

						<loop:otherwise>
							<li class="page-item" id="pagei"><a class="page-link"
								href="/show/employees/${status.count}" class="activate"
								onclick="actpage()">${status.count}</a></li>
						</loop:otherwise>

					</loop:choose>
				</loop:forEach>
				<loop:choose>
					<loop:when test="${pagenumber!=pagination.size()}">
						<li class="page-item"><a class="page-link"
							href="/show/employees/${pagenumber+1}">Next</a></li>
					</loop:when>
				</loop:choose>
				<li class="page-item"><a class="page-link"
					href="/show/employees/${pagination.size()}">Last</a></li>
			</ul>
		</div>
	</div>


	<script>
		function openNav() {
			document.getElementById("mySidebar").style.width = "250px";
			document.getElementById("main").style.marginLeft = "250px";
		}

		function closeNav() {
			document.getElementById("mySidebar").style.width = "0";
			document.getElementById("main").style.marginLeft = "0";
		}
	</script>




</body>
<!-- Footer -->
<footer class="page-footer font-small blue pt-4">
	<div class="footer-copyright text-center py-3">2020 Copyright:</div>
	<!-- Copyright -->

</footer>
<!-- Footer -->
</html>
