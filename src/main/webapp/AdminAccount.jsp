<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="com.HMS.ConfigAndDB.Database"%>
<%@ page import="java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
	Database db = new Database();
Statement s = db.getStatement();
Connection c = db.getConnection();
PreparedStatement ps;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display All Doctors</title>
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
	width: 650px;
	height: 50px;
	margin-left: 100px;
	margin-top: 100px;
	padding-right: 0px;
	background-color: #091753;
	border-color: #091753;
	border-width: 5px;
	border-style: solid;
}

span {
	color: #fff;
	font-size: 30px;
	font-family: verdana;
	padding-left: 150px;
	padding-top: 50px;
}

#box {
	width: 650px;
	height: 100%;
	margin-left: 100px;
	margin-right: 100px;
	padding-right: 0px;
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

button {
	background-color: #091753;
	color: white;
	border: none;
	cursor: pointer;
	margin-top: 25px;
	margin-bottom: 25px;
	margin-right: 50px;
	margin-left: 450px;
	width: 150px;
	height: 75px;
	border-radius: 3px;
	font-family: Roboto;
}

button:hover {
	opacity: 0.8;
}

table, td, th {
	border: 1px solid #091753;
	border-collapse: collapse;
}

td {
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
		<span>ADMIN PROFILE</span>
	</div>
	<div id="box">
		<form:form action="getChangePsPg" method="POST"
			modelAttribute="adminUser">
			<table>
				<tr>
					<td><b>USERNAME </b></td>
					<td><b>EMAIL</b></td>
					<td><b>CONTACT</b></td>
				</tr>
				<%
					try {
					String sql = "Select * From Admin";
					ResultSet rs = s.executeQuery(sql);
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("username")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getLong("contactNumber")%></td>
				</tr>
				<tr>
				</tr>
				<%
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
			</table>
			<form:button>CHANGE PASSWORD</form:button>
		</form:form>
	</div>
</body>
</html>