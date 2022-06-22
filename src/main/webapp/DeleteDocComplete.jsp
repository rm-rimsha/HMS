<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.HMS.ConfigAndDB.Database"%>
<%@ page import="java.io.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
	Database db = new Database();
Connection c = db.getConnection();
PreparedStatement ps;
int id = Integer.parseInt(request.getParameter("id"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Doc</title>
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
	width: 700px;
	height: 50px;
	margin-left: 10px;
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
	padding-left: 250px;
	padding-top: 50px;
}

#box {
	width: 700px;
	height: 100%;
	margin-left: 10px;
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
	width: 100px;
	height: 40px;
	margin-left: 400px;
	margin-top: 10px;
	border-radius: 3px;
	font-family: Roboto;
}

button:hover {
	opacity: 0.8;
}

h1 {
	color: #fff;
	font-size: 50px;
	text-align: left;
	padding-top: 100px;
}

td {
	color: #091753;
	font-size: 15px;
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
	<h1>Deletion successful.</h1>

	<%
	//drop the foreign key 
	// to delete the required columns in the doctor and timing table
	String sql1 = "Alter Table Timing Drop Foreign Key timing_ibfk_1";
	ps = c.prepareStatement(sql1);
	ps.executeUpdate();
	
	String sql = "Delete From Doctor where id = " + id;
	ps = c.prepareStatement(sql);
	ps.executeUpdate();
	
	
	String sql2 = "Delete From Timing Where doctorId = "+id;
	ps = c.prepareStatement(sql2);
	ps.executeUpdate();
	
	//again specify the foreign key
	String sql3 = "Alter Table Timing Add Foreign Key (doctorId) References Doctor(id)";
	ps = c.prepareStatement(sql3);
	ps.executeUpdate();
	%>

	<a href="AdminMenu"><button>Done</button></a>

</body>
</html>