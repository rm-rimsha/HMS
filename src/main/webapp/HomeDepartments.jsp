<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Departments</title>
<link href="https://fontawesome.com/icons?c=medical" rel="stylesheet"> 
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
	width: 800px;
	height: 50px;
	margin-left: 100px;
	margin-top: 100px;
	margin-right: 50px;
	padding-right: 0px;
	background-color: #091753;
	border-color: #091753;
	border-width: 5px;
	border-style: solid;
}

#boxborder span {
	color: #fff;
	font-size: 30px;
	font-family: verdana;
	padding-left: 250px;
	padding-top: 50px;
}

#box {
	width: 800px;
	height: 100%;
	margin-left: 100px;
	margin-right: 50px;
	padding-right: 0px;
	background-color: #fff;
	border-style: solid;
	border-color: #091753;
	border-width: 5px;
	position: relative;
}

#box span {
	color: #091753;
	font-size: 30px;
	font-family: verdana;
	padding-left: 30px;
	padding-top: 50px;
}

button {
	background-color: #091753;
	color: white;
	border: none;
	cursor: pointer;
	width: 80px;
	height: 40px;
	font-family: Roboto;
}

button:hover {
	opacity: 0.8;
}

table, td, th{
    border: 1.5px solid #091753;
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
	font-size: 25px;
	font-family: verdana;
	padding-top: 10px;
	padding-left: 110px;
	padding-right: 105px;
	padding-bottom: 5px;
}

</head>
</style>


<body>
<div id = "logo">
	 <img src="https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768" width="130" height="100" ALIGN=left>
	<nav>
		<ul>
		    <li><a href="Home">Home</a>
			<li class="active"><a href="showDepartments">Departments</a></li>
			<li><a href="AboutUs">About Us</a></li>
			<li><a href="ContactUs">Contact Us</a></li>
			<li><a href="portals">Portals</a></li>
		</ul>
	</nav>
	</div>
	<div id="boxborder"><span>DEPARTMENTS</span></div>
	<div id="box">
	<table>
	<tr>
	<tr>
	<td><img src = "https://i.postimg.cc/d3WMQ9sH/icons8-medical-heart-96-5.png"></td>
	<td>CARDIOLOGY</td>
	</tr>
	<tr>
	<td><img src = "https://i.postimg.cc/wxhxhKMH/icons8-hearing-52.png"></td>
	<td>  ENT  </td>
	</tr>
	<tr>
	<td><img src = "https://i.postimg.cc/5ycwDcWb/icons8-tooth-96.png"></td>
	<td>  DENTAL  </td>
	</tr>
	<tr>
	<td><img src = "https://i.postimg.cc/Z51K8J8b/icons8-liver-96.png"></td>
	<td>GASTROENTEROLOGY</td>
	</tr>
	<tr>
	<td><img src = "https://i.postimg.cc/bNGV2P3N/icons8-brain-96.png"></td>
	<td>NEUROLOGY</td>
	</tr>
	<tr>
	<td><img src = "https://i.postimg.cc/T15SGvsw/icons8-kidney-80.png"></td>
	<td>NEPHROLOGY</td>
	</tr>
	<tr>
	<td><img src = "https://i.postimg.cc/mDpYjc8z/icons8-eye-96.png"></td>
	<td>OPTHAMOLOGY</td>
	</tr>
	<tr>
	<td><img src = "https://i.postimg.cc/fRRPTdpp/icons8-human-bone-96.png"></td>
	<td>ORTHOPEDICS</td>
	</tr>
	<tr>
	<td><img src = "https://i.postimg.cc/vm9kpspZ/icons8-boy-stroller-96.png"></td>
	<td>PEDIATRICS</td>
	</tr>
	<tr>
	<td><img src = "https://i.postimg.cc/Rhx16rFq/icons8-lungs-80.png"></td>
	<td>PULMONOLOGY</td>
	</tr>
	</table>
	</div>

</body>

</html>