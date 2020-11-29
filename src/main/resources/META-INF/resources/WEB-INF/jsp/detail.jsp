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
  border: 1px solid grey ;
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        <form method="POST" class="" role="search" action="/search/employee">
      <div class="input-group">
          <input type="text" name="search" class="form-control" placeholder="Search" id="search">
        <div class="">
            <button class="btn btn-primary" type="submit" value="searchbutton"
			name="searchbutton"><i class="fa fa-search"></i></button>
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
			<div class="col-md-6 mx-auto mt-3 pt-5">
				<div class="card shadow-lg rounded border-secondary">
					<div class="card-header text-center bg-primary text-white">

						Employee Details</div>
						
				<div class="card-body text-center">		
				
                 <div>Id: <b>${details[0].empid}</b> </div> 
                 <div>Name: <b> ${details[0].name}</b></div>
                 <div>Email Id:<b> ${details[0].email}</b></div> 
                 <div>Phone:<b>${details[0].addphone}</b>  </div> 
                 <div>Additional Phone:<b> ${details[0].addphone}</b></div> 
                 <div>Date of Birth: <b> ${details[0].DOB}</b></div>
                 <div>Country: <b> ${details[0].country}</b></div>
                 <div>State: <b> ${details[0].state}</b></div>
                 <div>City: <b> ${details[0].city}</b> </div>
                 <div>Home Address:<b>${details[0].homeaddress}</b> </div>
                 <div>Office Location:<b> ${details[0].ofcloc}</b></div>
                 <div>Joining Year: <b> ${details[0].jy}</b></div>
                 <div>Year of Experience: <b> ${details[0].yoe}</b></div>
                 <div>SkillSet: <b> ${details[0].skilset}</b></div>
                 <div>Certification:<b> ${details[0].certifications}</b></div>
                 <div>Band:<b>${details[0].band}</b> </div>
                 <div>JRSS:<b> ${details[0].jrss}</b></div>
                 <div>PM Name:<b>${details[0].pm}</b> </div>
                 <div>PeM Name:<b> ${details[0].pem}</b></div>
                 <div>Training:<b>${details[0].training}</b> </div>
                 <div>Project Name:<b> ${details[0].proj}</b></div>
                 <div>Client Name:<b> ${details[0].client}</b></div>
                 <div>Start Date:<b> ${details[0].startdate}</b> </div>
                 <div>End Date: <b> ${details[0].enddate}</b></div>
                 <div>Preferred Location:<b>${details[0].preferredloc}</b> </div>
					
					<div>
		${deletemessage}
	</div>
	
	<div>
			${bulkdeletemessage}
		</div>
		
		<div>
			${bulknotdeletemessage}
		</div>
				</div>


				</div>
			</div>
		</div>
		<div class="container">

	
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
