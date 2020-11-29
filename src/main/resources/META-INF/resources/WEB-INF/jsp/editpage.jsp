<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>


	<nav class="navbar  navbar-inverse navbar-fixed-top navbar-expand-sm bg-primary navbar-dark">
		<div id="main">
			<button class="openbtn" onclick="openNav()">&#9776;</button>
		</div>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
				<p>
				<h1 style="color: #f1f1f1">BIG BLUE POC</h1>
				</p>
			</li>
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




	<div class="container mb-4">
		<div class="row">
			<div class="col-xs-6 col-md-9 mx-auto mt-3 pt-5">
			
			<div class="card shadow-lg rounded border-secondary">
					<div class="card-header text-center bg-primary text-white">
					Update Employee
					</div>
				<div class="card-body">
								
			<form method="POST" action="/save/editedemployees/${editableid}" enctype="multipart/form-data">
			<div class="" style="padding: 5px">
				Empid:<input type="text" name="empid" class="form-control" id="empid"
					value="${updatableemp[0].empid}" placeholder="Employee Id" required>
			</div>
			<div class="" style="padding: 5px">
				Employee Name:<input type="text" name="empname" class="form-control" id="empname"
					value="${updatableemp[0].name}" placeholder="Employee Name" required>
			</div>
			<div class="" style="padding: 5px">
				Employee email:<input type="email" name="email" class="form-control" id="email"
					value="${updatableemp[0].email}" placeholder="Email Id" required>
			</div>
			<div class="" style="padding: 5px">
				Phone Number:<input type="text" name="phone" class="form-control" id="phone"
					value="${updatableemp[0].phone}" maxlength="12" placeholder="Phone Number" required>
			</div>
			<div class="" style="padding: 5px">
				Additional Phone:<input type="text" name="addphone" class="form-control" id="addphone"
					value="${updatableemp[0].addphone}" placeholder="Additional Phone Number" maxlength="10" >
			</div>
			<div class="" style="padding: 5px">
				Data of Birth:<input type="text" name="dob" class="form-control" id="dob"
					value="${updatableemp[0].DOB}" placeholder="Date of birth DD-MM-YY"required>
			</div>
			<div class="" style="padding: 5px">
				Country: <input type="text" name="country" class="form-control" id="country"
					value="${updatableemp[0].country}"  placeholder="Country">
			</div>
			<div class="" style="padding: 5px">
				State: <input type="text" name="state" class="form-control" id="state"
					value="${updatableemp[0].state}" placeholder="State">
			</div>
			<div class="" style="padding: 5px">
				City:<input type="text" name="city" class="form-control" id="city"
					value="${updatableemp[0].city}" placeholder="City">
			</div>
			<div class="" style="padding: 5px">
				Home Address<input type="text" name="addr" class="form-control" id="addr"
					value="${updatableemp[0].homeaddress}" placeholder="Home Address" >
			</div>
			<div class="" style="padding: 5px">
				office Location:<input type="text" name="ofcloc" class="form-control" id="ofcloc"
					value="${updatableemp[0].ofcloc}" placeholder="Office Location">
			</div>
			<div class="" style="padding: 5px">
				Joining Year<input type="text" name="jy" class="form-control" id="jy"
					value="${updatableemp[0].jy}" placeholder="Joining Year" required>
			</div>
			<div class="" style="padding: 5px">
				Year of Experience: <input type="text" name="yoe" class="form-control" id="yoe"
					value="${updatableemp[0].yoe}" placeholder="Year Of Experience" >
			</div>
			<div class="" style="padding: 5px">
				SkillSet<input type="text" name="skilset" class="form-control" id="skilset"
					value="${updatableemp[0].skilset}" placeholder="Skill Set" required>
			</div>
			<div class="" style="padding: 5px">
				Certifications:<input type="text" name="cert" class="form-control" id="cert"
					value="${updatableemp[0].certifications}" placeholder="Certifications">
			</div>
			<div class="" style="padding: 5px">
				Band:<input type="text" name="band" class="form-control" id="band"
					value="${updatableemp[0].band}" placeholder="Band" required>
			</div>
			<div class="" style="padding: 5px">
				JRSS:<input type="text" name="jrss" class="form-control" id="jrss"
					value="${updatableemp[0].jrss}" placeholder="JRSS" required>
			</div>
			<div class="" style="padding: 5px">
				PM Name:<input type="text" name="pm" class="form-control" id="pm"
					value="${updatableemp[0].pm}" placeholder="PM Name" >
			</div>
			<div class="" style="padding: 5px"">
				PeM Name:<input type="text" name="pem" class="form-control" id="pem"
					value="${updatableemp[0].pem}" placeholder="PeM Name" required>
			</div>
			<div class="" style="padding: 5px">
				Training:<input type="text" name="training" class="form-control" id="training"
					value="${updatableemp[0].training}" placeholder="Trainings" >
			</div>
			<div class="" style="padding: 5px">
				Project Name: <input type="text" name="proj" class="form-control" id="proj"
					value="${updatableemp[0].proj}" placeholder="Project Name" required>
			</div>
			<div class="" style="padding: 5px">
				Client:<input type="text" name="client" class="form-control" id="client"
					value="${updatableemp[0].client}" placeholder="Client Name" >
			</div>
			<div class="" style="padding: 5px">
				Project Start Date: <input type="text" name="startdate" class="form-control" id="startdate"
					value="${updatableemp[0].startdate}" placeholder="Project Start Date DD-MM-YY">
			</div>
			<div class="" style="padding: 5px">
				Project End Date:<input type="text" name="enddate" class="form-control" id="enddate"
					value="${updatableemp[0].enddate}" placeholder="Project End Date DD-MM-YY" >
			</div>
			<div class="" style="padding: 5px">
				Preferred Location<input type="text" name="preferredloc" class="form-control" id="preferredloc"
					value="${updatableemp[0].preferredloc}" placeholder="Preferred Location">
			</div>

			<div>
				<button type="submit" class="btn btn-primary">Save</button>
			</div>
			
			</form>
				 </div>	<!-- End card body -->

	</div>

	
	</div>
            </div>
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
