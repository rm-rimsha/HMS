<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Homepage</title>
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
	background-color: #091753;
	text-decoration: underline;
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

span{
color: #fff;
font-size: 30px;
font-family: verdana;
padding-left: 150px;
padding-top: 50px;

}

#box
{
    width: 800px;
	height: 500px;
	margin-top: 50px;
	margin-left: 20px;
	background-color: #0001;
	position: relative;
}

#box i{ 
            position: absolute;
            color: #091753; 
            display: inline-block;
            margin-right: 10px;
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
padding-left: 120px;
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
		<ul>
		    <li><a href="Home">Home</a>
			<li><a href="HomeDepartments">Departments</a></li>
			<li><a href="AboutUs">About Us</a></li>
			<li class="active"><a href="ContactUs">Contact Us</a></li>
			<li><a href="portals">Portals</a></li>
		</ul>
	</nav>
	</div>
	<div id="box">
	<h1>CONTACT</h1>
	<table>
	<tr>
	<td><i class="fa fa-phone fa-2x" aria-hidden="true"></i><span>+923216010102</span></td></tr>
	<tr>
	<td><i class="fa fa-address-card fa-2x" aria-hidden="true"></i><span><b>TheHospital</b></span><br></br><span>Sector H-12, Islamabad, Pakistan</span></td>
	</tr>
	<tr>
	<td><i class="fa fa-envelope fa-2x" aria-hidden="true"></i><span>theHospital@email.com</span></td>
	</tr>
	</table>
	</div>

</body>

</html>