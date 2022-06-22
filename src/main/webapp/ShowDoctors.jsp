<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.HMS.ConfigAndDB.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
	Database db = new Database();
Statement s = db.getStatement();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Doctors</title>
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
	width: 2000px;
	height: 50px;
	margin-left: 0px;
	margin-right: 2px; margin-top : 100px;
	padding-right: 0px;
	background-color: #091753;
	border-color: #091753;
	border-width: 5px;
	border-style: solid;
	margin-top: 100px;
}

span {
	color: #fff;
	font-size: 30px;
	font-family: verdana;
	padding-left: 550px;
	padding-top: 50px;
}

#box {
	width: 2000px;
	height: 100%;
	margin-left: 0px;
	margin-right: 0px;
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

table, td, th {
	border: 1px solid #091753;
	border-collapse: collapse;
}

h1 {
	color: #091753;
	font-size: 30px;
	text-align: center;
	padding-top: 40px;
}

td {
	color: #091753;
	font-size: 16px;
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
		<span>DOCTORS</span>
	</div>
	<div id="box">
		<table>
			<tr>
				<td><b>USERNAME </b></td>
				<td><b>NAME</b></td>
				<td><b>EMAIL</b></td>
				<td><b>GENDER</b></td>
				<td><b>AGE</b></td>
				<td><b>CONTACT</b></td>
				<td><b>DEPARTMENT</b></td>
				<td><b>QUALIFICATION</b></td>
				<td><b>SPECIALITY</b></td>
				<td><b>EXPERIENCE</b></td>
				<td><b>CONSULTATION TIME</b></td>
				<td><b>AVALIABLE DAYS</b></td>
				<td><b>START TIME</b></td>
				<td><b>END TIME</b></td>
                <td><b>BREAK-START</b></td>
                <td><b>BREAK-END</b></td>   
				<td><b>FEE</b></td>

			</tr>
			<%
				try {
				String sql = "Select id, username, name, password, gender, email, contactNumber, " + 
				"timestampdiff(YEAR,dateOfBirth,now()) as Age,"
				+ "departmentName, qualification, speciality, experience, consultationTime, " + 
				"availableDays, fee, startTime, endTime, bStartTime, bEndTime From Doctor "
				+" INNER JOIN Timing ON id = doctorId";

				//Age-->Derived Attribute

				ResultSet rs = s.executeQuery(sql);
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("username")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("email")%></td>
				<td><%=rs.getString("gender")%></td>
				<td><%=rs.getInt("age")%></td>
				<td><%=rs.getString("contactNumber")%></td>
				<td><%=rs.getString("departmentName")%></td>
				<td><%=rs.getString("qualification")%></td>
				<td><%=rs.getString("speciality")%></td>
				<td><%=rs.getString("experience")%></td>
				<td><%=rs.getString("consultationTime")%></td>
				<td><%=rs.getString("availableDays")%></td>
				<td><%=rs.getTime("startTime") %></td>
				<td><%=rs.getTime("endTime") %></td>
				<td><%=rs.getTime("bStartTime") %></td>
				<td><%=rs.getTime("bEndTime") %></td>
				<td><%=rs.getString("fee")%></td>
			</tr>
			<%
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
		</table>
	</div>
</body>
</html>