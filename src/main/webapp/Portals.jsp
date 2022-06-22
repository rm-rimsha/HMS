<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Portals</title>
</head>
<style type="text/css">
body {
	background-image: linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1)),
		url(https://cdn.internationalliving.com/wp-content/uploads/2014/11/L3-4-768x573.jpg);
	background-size: 1536px 721px;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

nav {
	width: 100%;
	height: 100px;
	background-color: #0001;
	line-height: 70px;
}

nav ul {
	float: right;
	margin-right: 30px;
	z-index: 999;
}

nav ul li {
	list-style-type: none;
	display: inline-block;
}

nav ul li:hover {
	text-decoration: underline;
	background-color: #091753;
	transition: 0.8s all;
}

li.active {
	text-decoration: underline;
	background-color: #091753;
}

nav ul li a {
	text-decoration: none;
	color: #fff;
	padding: 30px;
	font-size: 35px;
	font-family: verdana;
}

#card {
	width: 200px;
	height: 75px;
	display: inline-table;
	border-radius: 50px;
	padding: 20px 10px;
	cursor : pointer;
	margin-top: 10px;
	margin-right: 20px;
	margin-left: 190px;
	background-color: #fff;
	text-align: center;
	transition: transform 0.5s;
	cursor: pointer;
}

#card:hover {
	transform: translate(-15px,-15px);
}

#card1 {
	width: 200px;
	height: 75px;
	display: inline-table;
	border-radius: 50px;
	padding: 20px 10px;
	cursor : pointer;
	margin-top: 20px;
	margin-right: 20px;
	margin-left: 40px;
	background-color: #fff;
	text-align: center;
	transition: transform 0.5s;
	cursor: pointer;
}

#card1:hover {
	transform: translate(+15px, -15px);
}

h1 {
	font-family: courier;
	font-size: 50px;
	color: #fff;
	padding-left: 600px;
	padding-right: 500px;
	padding-top: 30px;
}

button {  
            background-color: #091753;  
            color: white;  
            border: none;  
            cursor: pointer;  
            width: 120px;
            height: 45px; 
            border-radius: 5px;
            font-size: 15px; 
            border-radius: 3px;
            font-family: Roboto;
        } 
        
button:hover {  
            opacity: 0.8;  
        }  

</style>
<body>
	<div id="logo">
		<img
			src="https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768"
			width="130" height="100" ALIGN=left>
		<nav>
			<ul>
				<li><a href="Home">Home</a></li>
				<li><a href="HomeDepartments">Departments</a></li>
				<li><a href="AboutUs">About Us</a></li>
				<li><a href="ContactUs">Contact Us</a></li>
				<li class="active"><a href="portals">Portals</a></li>
			</ul>
		</nav>
	</div>
	<br>
	<div id="card">
		<img
			src="https://cdn.pixabay.com/photo/2017/09/27/20/55/clinical-trial-icon-2793430_960_720.png"
			width="150" height="150" class="center"> <a
			href="DoctorLoginForm"><button>Doctor</button></a>
	</div>
	<div id="card1">
		<img
			src="https://cdn.pixabay.com/photo/2017/10/25/18/21/attribution-icon-2888829_960_720.png"
			width="150" height="150" class="center"> <a
			href="PatientLoginForm"><button>Patient</button></a>
	</div>
	<br>
	<div id="card">
		<img
			src="https://cdn.pixabay.com/photo/2017/09/27/20/55/clinical-trial-icon-2793430_960_720.png"
			width="150" height="150" class="center"> <a
			href="ReceptionistLoginForm"><button>Receptionist</button></a>
	</div>
	<div id="card1">
		<img
			src="https://cdn.pixabay.com/photo/2017/10/25/18/21/attribution-icon-2888829_960_720.png"
			width="150" height="150" class="center"> <a
			href="adminLoginForm"><button>Admin</button></a>
	</div>
</body>
</html>