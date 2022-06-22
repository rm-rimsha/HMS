<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Homepage</title>
</head>
<style type="text/css">
body {
  background-image: linear-gradient(rgba(0,0,0,0.1), rgba(0,0,0,0.1)),  url(https://cdn.internationalliving.com/wp-content/uploads/2014/11/L3-4-768x573.jpg);
  background-size: 1536px 721px;
  background-repeat:no-repeat;
  background-attachment:fixed;
}


nav
{
	width:100%;
	height:100px;
	background-color: #0001;
	line-height: 70px;
}
nav ul
{
	float : right;
	margin-right: 30px;
	z-index: 999;
}
nav ul li
{
	list-style-type: none;
	display: inline-block;
	transition: 0.8s all; 
}
nav ul li:hover
{
	text-decoration: underline;
	background-color: #091753;
}
li.active
{
text-decoration: underline;
	background-color: #091753;
}
nav ul li a
{
	text-decoration: none;
	color: #fff;
	padding: 30px;
	font-size: 35px;
	font-family: verdana;
}
#row
{
	display: inline-block;
	text-align:left;
	padding-top: 120px;
	font-family: courier;
	font-size:30px;
}

p{
  color: #091753;
  font-family: courier;
  font-size: 30px;
  text-align: left;
}
b
{
	color: #091753;
	font-family: verdana;
	font-size: 50px;
	text-align: center;
	margin-left: 60px;
	
}
h1 {
	font-family: courier;
	font-size: 50px;
	color: #fff;
	padding-left: 500px;
	padding-right: 500px;
}
h2 {
	font-family: courier;
	font-size: 45px;
	color: #fff;
	padding-left: 500px;
	padding-right: 500px;
	padding-top: 30px;
}
</style>
<body>
<div id = "logo">
	 <img src="https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768" width="130" height="100" ALIGN=left>
	<nav>
		<ul>
		    <li><a href="Home">Home</a>
			<li><a href="HomeDepartments">Departments</a></li>
			<li class="active"><a href="AboutUs">About Us</a></li>
			<li><a href="ContactUs">Contact Us</a></li>
			<li><a href="portals">Portals</a></li>
		</ul>
	</nav>
	</div>
	<div id="row">
	<h1>-About Us-</h1>
	<br></br>
	<b> "The Passion to Release Grateful Patients" </b>
	<br></br>
	<p>Our hospital was founded in 2000. We have been successfully providing our patients the best facilities. Our main goal
	is to offer our patients the most innovative and advanced treatments through our highly qualified medical staff. 
	Patients' health and comfort is our number one priority</p>
	<h2>Services</h2>
	<p>24-Hour emergency service</p>
	<p>Full-time available certified physicians</p>
	<p>Pathology/Laboratory Services</p>
	<p>Heart/Lungs Transplant Available</p>
	<p></p>
	</div>

</body>

</html>