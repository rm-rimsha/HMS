<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.HMS.ConfigAndDB.Database"%>
<%
	Database db = new Database();
Statement s = db.getStatement();
ResultSet rs;
String username = request.getParameter("username");
%>
<%
	String sql = "Select * From Receptionist Where username = \"" + username + "\"";
rs = s.executeQuery(sql);
while (rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Receptionist</title>
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
	padding-left: 120px;
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

input[type = text], input[type = password], input[type = number], input[type = tel],
	input[type = email] {
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
	padding-left: 20px;
}
input.transparentInput{
background: transparent;
border: none;
color: transparent;
cursor: default;
width: 0px;
font-size: 0px;
autocomplete: "false";
}
</style>
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
			<li class="active"><a>Receptionist</a>
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
		<span>UPDATE RECEPTIONIST</span>
	</div>
	<div id="box">
		<form:form action="saveEditRec" method="POST" modelAttribute="editRec">
			<table>
				<tr>
					<td>Username</td>
					<td><form:input path="username"
							placeholder="Enter username of receptionist"
							value='<%=rs.getString("username")%>' /></td>
					<td><form:errors path="username" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><form:input path="name"
							placeholder="Enter name of receptionist"
							value='<%=rs.getString("name")%>' /></td>
					<td><form:errors path="name" cssClass="error" />
						<form:input class = "transparentInput" path="password"
						placeholder="Enter password of receptionist"
						value='<%=rs.getString("password")%>' />
						</td>
				</tr>			
				
				<tr>
					<td>Gender</td>
					<td><form:radiobutton path="gender" value="Male" /> Male <br>
						<form:radiobutton path="gender" value="Female" /> Female <br>
						<form:radiobutton path="gender" value="None" /> None <br></td>
					<td><form:errors path="gender" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><form:input type="email" path="email"
							placeholder="Enter email of receptionist"
							value='<%=rs.getString("email")%>' /></td>
					<td><form:errors path="email" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Contact Number</td>
					<td><form:input type="tel" path="contactNumber"
							placeholder="Enter contact number of receptionist"
							value='<%=rs.getLong("contactNumber")%>' /></td>
					<td><form:errors path="contactNumber" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Department</td>
					<td><form:input path="departmentName"
							placeholder="Enter department of receptionist"
							value='<%=rs.getString("departmentName")%>' /></td>
					<td><form:errors path="departmentName" cssClass="error" /></td>
				</tr>
				<tr>
					<td></td>
					<td><form:button>Submit</form:button></td>
				</tr>
			</table>
		</form:form>
	</div>
	<%
		}
	%>
</body>
</html>