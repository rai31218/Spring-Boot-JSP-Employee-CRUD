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
	padding-top: 160px;
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

form.example input[type=text] {
	padding: 10px;
	font-size: 17px;
	border: 1px solid grey;
	float: left;
	width: 6%;
	background: #f1f1f1;
}

form.example button {
	float: left;
	width: 20%;
	padding: 10px;
	background: #2196F3;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;
}

form.example button:hover {
	background: #0b7ddb;
}

form.example::after {
	content: "";
	clear: both;
	display: table;
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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<%session.getAttribute("search"); %>

	<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
		<div id="main">
			<button class="openbtn" onclick="openNav()">&#9776;</button>
		</div>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
				<p>
				<h1 style="color: #f1f1f1">BIG BLUE POC</h1>
				</p>
			</li>
			<li></li>
		</ul>
		<!-- Search -->
		<div class="pull-right">
			<form method="POST" class="" role="search" 
				action="/search/employee/1">
				<div class="input-group">
					<input type="text" name="search" class="form-control"
						placeholder="Search" id="search">
					<div class="">
						<button class="btn btn-primary" type="submit" value="searchbutton"
							name="searchbutton">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
		<!-- Search End -->


	</nav>

	<div id="mySidebar" class="sidebar">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<form action="/">
			<button type="submit" class="btn btn-light">Import Users</button>
		</form>
		<form action="/show/employees/1">
			<button type="submit" class="btn btn-light">Show All</button>
		</form>

		<form method="post" action="/bulkdelete">
			<button type="submit" class="btn btn-light">Bulk Delete</button>
		</form>


	</div>

	</form>

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

							<loop:forEach items="${searchedemployee}" var="searchedemployee">
								<tr>
									<td
										style="word-wrap: break-word; min-width: 160px; max-width: 200px;">${searchedemployee.empid}</td>
									<td
										style="word-wrap: break-word; min-width: 160px; max-width: 200px;">${searchedemployee.name}</td>
									<td
										style="word-wrap: break-word; min-width: 160px; max-width: 200px;">${searchedemployee.email}</td>

									<form method="POST"
										action="/remove/employees/${searchedemployee.empid}">
										<td
											style="word-wrap: break-word; min-width: 60px; max-width: 60px;"><button
												type="submit" class="btn btn-primary" name="delete">Delete</button></td>
									</form>
									<form method="POST"
										action="/edit/employee/${searchedemployee.empid}">
										<td
											style="word-wrap: break-word; min-width: 60px; max-width: 60px;">
											<button type="submit" class="btn btn-primary" value="edit"
												name="edit">Edit</button>
										</td>
									</form>
									<form method="POST"
										action="/detail/employee/${searchedemployee.empid}">
										<td
											style="word-wrap: break-word; min-width: 60px; max-width: 60px;">
											<button type="submit" class="btn btn-primary" value="details"
												name="edit">Detail</button>
										</td>
									</form>
							</loop:forEach>
							</tr>
						</tbody>
					</table>
					<div class="text-center">${nosearchresult}</div>
					<div>${deletemessage}</div>

					<div>${bulkdeletemessage}</div>

					<div>${bulknotdeletemessage}</div>
				</div>
			</div>
		</div>
		<div class="container">
		<loop:choose>
				<loop:when test="${numberofpages.size() ne 0}">

			<ul class="pagination  justify-content-center" style="margin: 20px 0">
				<li class="page-item"><a class="page-link"
					href="/search/employee/1">First</a></li>
				<loop:forEach items="${numberofpages}" var="record"
					varStatus="status">

					<loop:choose>
						<loop:when test="${status.count == pagenumber}">
							<form action="/search/employee/${status.count}" method="POST"
								id="searchwordforpaginationsubmit">
								<li class="page-item active" id="pagei"><a
									class="page-link" href="#"
									onclick="document.getElementById('searchwordforpaginationsubmit').submit(); return false;">${status.count}
								</a><input type="hidden" name="search" id="search"
									value="${searchwordforpagination}"></li>
							</form>
						</loop:when>

						<loop:otherwise>
							<form action="/search/employee/${status.count}" method="POST"
								id="searchwordforpaginationsubmit2">
								<li class="page-item" id="pagei"><a class="page-link"
									href="#"
									onclick="document.getElementById('searchwordforpaginationsubmit2').submit(); return false;">${status.count}
								</a><input type="hidden" name="search" id="search"
									value="${searchwordforpagination}"></li>
							</form>
						</loop:otherwise>


					</loop:choose>
				</loop:forEach>
				<loop:choose>
					<loop:when test="${pagenumber!=searchedemployee.size()}">
						<li class="page-item"><a class="page-link" id="searchpage"
							href="/search/employee/${pagenumber+1}">Next</a></li>
					</loop:when>
				</loop:choose>
				<li class="page-item"><a class="page-link"
					href="/show/employees/${numberofpages.size()}">Last</a></li>
			</ul>
			</loop:when>
			</loop:choose>
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
