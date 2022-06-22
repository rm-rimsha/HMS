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
<link rel="stylesheet" href=  
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />  
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

i{
            color: #fff; 
            margin-right: 5px;
            margin-left: 5px;
            margin-top: 10px;
            margin-bottom: 10px;
            padding-left: 15px;
        }     


button {  
            background-color: #091753;  
            color: white;  
            border: none;  
            cursor: pointer;  
            width: 300px;
            height: 50px; 
            border-radius: 50px;
            font-size: 20px; 
            margin-top: 45px;
            margin-left: 650px;
            padding-right: 5px;
            padding-bottom: 5px;
        } 
        
button:hover {  
            opacity: 0.8;  
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
	text-align: left;
}
</style>
<body>
<div id = "logo">
	 <img src="https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768" width="130" height="100" ALIGN=left>
	<nav>
		<ul>
		    <li class="active"><a href="Home">Home</a>
			<li><a href="HomeDepartments">Departments</a></li>
			<li><a href="AboutUs">About Us</a></li>
			<li><a href="ContactUs">Contact Us</a></li>
			<li><a href="portals">Portals</a></li>
		</ul>
	</nav>
	</div>
	<div id="row">
	<b>We care about your health</b>
	<br>
	<p>The best medical teams at your service every second.</p>
	</div>
<a href="PatientLogin.jsp"><button>GET APPOINTMENT<i class="fa fa-arrow-circle-right fa-1x" aria-hidden="true"></i></button>
</a>
</body>

</html>