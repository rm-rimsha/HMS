<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<%@ page isELIgnored="false"%>
<title>Change password</title>
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
	color: #091753;
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
	width: 550px;
	height: 50px;
	margin-left: 100px;
	margin-top: 100px;
	padding-right: 20px;
	padding-left: 50px;
	background-color: #091753;
	border-color: #091753;
	border-width: 5px;
	border-style: solid;
}

span {
	color: #fff;
	font-size: 30px;
	font-family: verdana;
	padding-left: 134px;
	padding-top: 50px;
}

#box {
	width: 550px;
	height: 100%;
	margin-left: 100px;
	margin-right: 100px;
	padding-right: 20px;
	padding-left: 50px;
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

#box a {
	color: #091753;
	font-size: 20px;
	font-family: verdana;
	padding-top: 10px;
	padding-left: 10px;
}

input[type=text], input[type=password], input[type=number], input[type=tel],
	input[type=email], input[type=date] {
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
	margin-top: 25px;
	margin-bottom: 25px;
	margin-right: 50px;
	margin-left: 350px;
	width: 145px;
	height: 70px;
	font-size: 20px;
	border-radius: 3px;
	font-family: Roboto;
}

button:hover {
	opacity: 0.8;
}

td {
	color: #091753;
	font-size: 25px;
	font-family: verdana;
	padding-top: 10px;
	padding-left: 65px;
}

p {
	color: #091753;
	font-size: 25px;
	font-family: sans-serif;
	padding-top: 10px;
	padding-left: 10px;
}
</style>
</head>
<body>
	<img
		src="https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768"
		width="130" height="100" ALIGN=left>
	<nav>
		<ul>
			<li><a href="AdminMenu">Home</a></li>
			<li><a>Doctor</a>
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
		<span>Change Password</span>
	</div>
	<div id="box">
		<p>${message}</p>
		<form:form action="saveAdminPs" method="post"
			modelAttribute="editAdmin">
			<table>
				<tr>
					<td></td>
					<td><form:input path="adminName" type="text" placeHolder="Username"/></td>
					<td><form:errors path="adminName" cssClass="error" /></td>
				</tr>
				<tr>
					<td></td>
					<td><form:input path="adminPassword" type="password" placeHolder="Current Password" /></td>
					<td><form:errors path="adminPassword" cssClass="error" /></td>
				</tr>
				<tr>
					<td></td>
					<td><form:input path="adminNewPs" type="password" placeHolder="New Password"/></td>
					<td><form:errors path="adminNewPs" cssClass="error" /></td>
				</tr>
				<tr>
					<td></td>
					<td><form:input path="confirmNewPs" type="password" placeHolder="Confirm Password" /></td>
					<td><form:errors path="confirmNewPs" cssClass="error" /></td>
				</tr>
			</table>
			<form:button>Enter</form:button>
		</form:form>
	</div>
</body>
</html>