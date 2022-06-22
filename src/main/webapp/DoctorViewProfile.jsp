<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Profile</title>
<link rel="stylesheet" href=  
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />  
<style type="text/css">


body {
	background-image: linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1)),
		url(https://cdn.internationalliving.com/wp-content/uploads/2014/11/L3-4-768x573.jpg);
	background-size: 1536px 721px;
	background-repeat: no-repeat;
	background-attachment: fixed;
	position: relative;
}

nav {
	width: 100%;
	height: 100px;
	background-color: #0001;
	line-height: 70px;
	left: 0px;
}

nav ul {
	display: flex;
	justify-content: flex-end;
	float: right;
	margin-right: 30px;
	z-index: 999;
}

nav ul li {
	list-style-type: none;
	display: inline-block;
	position: relative;
}

nav ul li:hover {
	text-decoration: underline;
	background-color: #091753;
	transition: 0.8s all;
}

li.active {
	text-decoration: underline;
	background-color: #091753;
	color: #091753;
}

nav ul li ul {
	position: absolute;
	background-color: #0001;
	top: 84px;
	padding-left: 0px;
	display: block;
	width: 370px;
	transition: 0.5s;
	visibility: hidden;
	font-size: 25px;
}

nav ul li:hover ul {
	opacity: 1;
	visibility: visible;
}

a {
	text-decoration: none;
	color: #fff;
	padding: 30px;
	font-size: 35px;
	font-family: verdana;
}

span{
color: #fff;
font-size: 30px;
font-family: verdana;
padding-top: 50px;

}

b{
color: #fff;
font-size: 30px;
font-family: verdana;
padding-top: 50px;
margin-right: -150px;
}

#box
{
    width: 800px;
	height: 1070px;
	margin-top: 50px;
	margin-left: 20px;
	background-color: #0001;
	position: relative;
}

h1
{
color: #091753;
font-size: 40px;
text-align:center;
padding-top:20px; 
}

td
{
padding-top: 20px;
padding-left: 80px;
font-size: 25px;
color: #fff;
}
#box table, tr
{
padding-top: 50px;
}

</head>
</style>


<body>
<div id = "logo">
	 <img src="https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768" width="130" height="100" ALIGN=left>
	<nav>
		<nav>
			<ul>
				<li><a href="doctorHome">Home</a></li>
				<li><a href ="doctorViewPatients">Appointment History</a></li>
				<li style = "margin-right: 180px;"><i
				style="padding-top: 20px; padding-left: 45px; padding-right: 60px; font-size: 30px; color: #fff;"
				class="fa">&#xf007;</i>
				<ul>
					<li><a href="doctorViewProfile">View Profile</a></li>
					<li><a href="DoctorChangePassword.jsp">Change Password</a></li>
					<li><a href="DoctorLogin.jsp">Sign Out</a></li>
				</ul></li>
			</ul>
		</nav>
	</nav>
	</div>
	<div id="box">
	<h1>PROFILE</h1>
	<table>
	<tr>
	<td><b>Username:</b></td>
	<td><span>${username}</span></td>
	</tr>
	<tr>
	<td><b>Gender:</b></td>
	<td><span>${gender}</span></td>
	</tr>
	<tr>
	<td><b>Date of Birth:</b></td>
	<td><span>${dateOfBirth}</span></td>
	</tr>
	<tr>
	<td><b>Email Address:</b></td>
	<td><span>${email}</span></td>
	</tr>
	<tr>
	<td><b>Contact Number:</b></td>
	<td><span>0${contactNumber}</span></td>
	</tr>
	<tr>
	<td><b>Department:</b></td>
	<td><span>${departmentName}</span></td>
	</tr>
	<tr>
	<td><b>Specialty:</b></td>
	<td><span>${speciality}</span></td>
	</tr>
	<tr>
	<td><b>Qualification:</b></td>
	<td><span>${qualification}</span></td>
	</tr>
	<tr>
	<td><b>Experience:</b></td>
	<td><span>${experience} years</span></td>
	</tr>
	<tr>
	<td><b>Consultation Time:</b></td>
	<td><span>${consultationTime} minutes</span></td>
	</tr>
	<tr>
	<td><b>Available Days:</b></td>
	<td><span>${availableDays}</span></td>
	</tr>
	<tr>
	<td><b>Fee:</b></td>
	<td><span>Rs. ${fee}</span></td>
	</tr>
	</table>
	</div>

</body>

</html>