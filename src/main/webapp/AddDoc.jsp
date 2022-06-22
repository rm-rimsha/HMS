<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Doctor Form</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
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
}

nav ul li ul {
	position: absolute;
	background-color: #0001;
	top: 84px;
	padding-left: 0px;
	display: block;
	width: 250px;
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

#boxborder {
	width: 500px;
	height: 50px;
	margin-left: 100px;
	margin-top: 100px;
	padding-right: 100px;
	background-color: #091753;
	border-color: #091753;
	border-width: 5px;
	border-style: solid;
}

span {
	color: #fff;
	font-size: 30px;
	font-family: verdana;
	padding-left: 200px;
	padding-top: 50px;
}

#box {
	width: 500px;
	height: 100%;
	margin-left: 100px;
	margin-right: 100px;
	padding-right: 100px;
	background-color: #fff;
	border-style: solid;
	border-color: #091753;
	border-width: 5px;
	position: relative;
}

#box i {
	position: absolute;
	color: #091753;
}

input[type=text], input[type=password], input[type=number], input[type=tel], input[type=email], input[type=date] {
	width: 250px;
	padding: 14px 30px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
	border-color: #091753;
}

button {
	background-color: #091753;
	color: white;
	border: none;
	cursor: pointer;
	width: 100px;
	height: 40px;
	border-radius: 3px;
	font-family: Roboto;
	margin-left: 70px;
}

button:hover {
	opacity: 0.8;
}

h1 {
	color: #091753;
	font-size: 30px;
	text-align: center;
	padding-top: 40px;
}

td {
	color: #091753;
	font-size: 20px;
	font-family: sans-serif;
	padding-top: 20px;
	padding-left: 10px;
}
</style>
<body>
	<img
		src="https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768"
		width="130" height="100" ALIGN=left>
	<nav>
		<ul>
			<li><a href="AdminMenu">Home</a></li>
			<li class="active"><a>Doctor</a>
				<ul>
					<li><a href="showAddDoc">Add</a></li>
					<li><a href="editDoctors">Edit</a></li>
					<li><a href="DeleteDoc">Delete</a></li>
					<li><a href="showDoctors">View all</a></li>
				</ul></li>
			<li><a>Receptionist</a>
				<ul>
					<li><a href="showAddRec">Add</a></li>
					<li><a href="editReceptionists">Edit</a></li>
					<li><a href="DeleteRec">Delete</a></li>
					<li><a href="showReceptionists">View all</a></li>
				</ul></li>
			<li><a>Department</a>
				<ul>
					<li><a href="showAddDep">Add</a></li>
					<li><a href="deleteDepartments">Delete</a></li>
					<li><a href="showDepartments">View all</a></li>
				</ul></li>
			<li><i
				style="padding-top: 20px; padding-left: 45px; padding-right: 60px; font-size: 30px; color: #fff;"
				class="fa">&#xf007;</i>
				<ul>
					<li><a href="ViewAdmin">Account</a></li>
					<li><a href="AdminLogout">Logout</a></li>
				</ul></li>
		</ul>
	</nav>

	<div id="boxborder">
		<span>ADD DOCTOR</span>
	</div>
	<div id="box">
		<form:form action="saveDoc" method="post" modelAttribute="docUser">
			<table>
				<tr>
					<td>Name</td>
					<td><form:input path="name" placeholder="Enter name of doctor" /></td>
					<td><form:errors path="name" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Username</td>
					<td><form:input path="username"
							placeholder="Enter username of doctor" /></td>
					<td><form:errors path="username" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><form:input type = "password" path="password" 
							placeholder="Enter password of doctor" /></td>
					<td><form:errors path="password" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><form:radiobutton path="gender" value="Male" /> Male <form:radiobutton
							path="gender" value="Female" /> Female <form:radiobutton
							path="gender" value="None" /> None</td>
					<td><form:errors path="gender" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Date of Birth</td>
					<td><form:input type="date" path="dob" placeholder="YY/MM/DD" /></td>
					<td><form:errors path="dob" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><form:input type="email" path="email"
							placeholder="Enter email of doctor" /></td>
					<td><form:errors path="email" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Contact Number</td>
					<td><form:input type="tel" path="contactNumber"
							placeholder="Enter contact number of doctor" /></td>
					<td><form:errors path="contactNumber" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Speciality</td>
					<td><form:input type="text" path="speciality"
							placeholder="Enter speciality of doctor" /></td>
					<td><form:errors path="speciality" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Qualification</td>
					<td><form:input type="text" path="qualification"
							placeholder="Enter qualification of doctor" /></td>
					<td><form:errors path="qualification" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Experience</td>
					<td><form:input type = "number" path="experience"
							placeholder="Enter experience of doctor" /></td>
					<td><form:errors path="experience" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Department</td>
					<td><form:input type="text" path="department"
							placeholder="Enter department of doctor" /></td>
					<td><form:errors path="department" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Consultation Time</td>
					<td><form:input type = "number" path="consultationTime"
							placeholder="Enter Consultation timing of doctor" /></td>
					<td><form:errors path="consultationTime" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Start Time</td>
					<td><form:input type ="text" path="startT" placeHolder= "HH:MM:SS" /></td>
					<td><form:errors path="startT" cssClass="error" /></td>
				</tr>
				<tr>
					<td>End Time</td>
					<td><form:input type ="text" path="endT" placeHolder= "HH:MM:SS" /></td>
					<td><form:errors path="endT" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Break-start </td>
					<td><form:input type ="text" path="startB" placeHolder= "HH:MM:SS"/></td>
					<td><form:errors path="startB" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Break-end </td>
					<td><form:input type ="text" path="endB" placeHolder= "HH:MM:SS"
							 /></td>
					<td><form:errors path="endB" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Fee</td>
					<td><form:input type= "number" path="fee" placeholder="Enter fee of doctor" /></td>
					<td><form:errors path="fee" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Available Days</td>
					<td><form:input path="availableDays"
							placeholder="Enter the days Doctor is available:" /></td>
					<td><form:errors path="availableDays" cssClass="error" /></td>
				</tr>
				<tr>
					<td></td>
					<td><form:button>Submit</form:button></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>