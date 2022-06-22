<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login Form</title>
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


#boxborder
{
    width: 500px;
	height: 50px;
	margin-left: 100px;
	margin-top: 100px;
	background-color: #091753;
	border-color: #091753;
	border-width:5px;
	border-style: solid;
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
    width: 500px;
	height: 250px;
	margin-left: 100px;
	background-color: #fff;
	border-style: solid;
	border-color: #091753;
	border-width: 5px;
	position: relative;
}

#box i{ 
            position: absolute;
            color: #091753; 
        } 

input[type=text],  
        input[type=password] {  
            width: 150px;  
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


h1
{
color: #091753;
font-size: 30px;
text-align:center;
padding-top:40px; 
}

td
{
padding-top: 20px;
padding-left: 120px;
}
</head>
</style>


<body>
<div id="logo">
		<img
			src="https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768"
			width="130" height="100" ALIGN=left>
		<nav>
			<ul>
				<li><a href="Home">Home</a></li>
				<li><a href="HomeDepartments">Departments</a></li>
				<li><a href="">About Us</a></li>
				<li><a href="">Contact Us</a></li>
				<li class="active"><a href="portals">Portals</a></li>
			</ul>
		</nav>
	</div>
<div id="boxborder"><span>ADMIN LOGIN</span></div>
<div id="box">
   <form:form action="saveAdminUser" method="post" modelAttribute="adminUser">
      <table>
      <tr>
      <td> <i class="fa fa-user fa-lg"></i> <form:input path="adminName" 
                            placeholder = "Username"/></td>
            <td style = "color : red; font-size: 20px;"><form:errors path="adminName" cssClass="error" /></td>
            
            </tr>
            <tr>
            <td><i class="fa fa-key fa-lg"></i><form:password path="adminPassword"
                               placeHolder = "Password" /></td>
            <td style = "color : red; font-size: 20px;"><form:errors path="adminPassword" cssClass="error" /></td>
            </tr>
         <tr>
            <td></td>
            <td><form:button>Login</form:button></td>
         </tr>
      </table>
   </form:form>
</div>
</body>
</html>