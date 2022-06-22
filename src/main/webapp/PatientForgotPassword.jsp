<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PATIENT FORGOT PASSWORD</title>
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
padding-left: 90px;
padding-top: 40px;

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

input {  
            width: 170px; 
            height: 45px; 
            padding: 14px 25px;  
            margin: 8px -10px;   
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
            margin-top: 3px;
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

p{
color: red;
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 13px;
width: 180px;
margin-top: 0px;
margin-bottom: 0px;
margin-right: -50px;
}
</style>
</head>



<body>
<div id="logo">
		<img
			src="https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768"
			width="130" height="100" ALIGN=left>
		<nav>
			<ul>
				<li><a href="Home">Home</a></li>
				<li><a href="showDepartments">Departments</a></li>
				<li><a href="">About Us</a></li>
				<li><a href="">Contact Us</a></li>
				<li class="active"><a href="portals">Portals</a></li>
			</ul>
		</nav>
	</div>
<div id="boxborder"><span>FORGOT PASSWORD?</span></div>
<div id="box">
   <form action = "patientForgotPassword" method = "post">
      <table>
      <tr>
      <td> <input  name = "username" type = "text"
                            placeholder = "Username"/></td>           
            </tr>
            <tr>
            <td><input type = "email" name ="email"
                               placeHolder = "Email" /><br>
                               <p>${error}</p></td>
            </tr>
         <tr>
            <td></td>
            <td>

            <button>Submit</button>

            </td>
         </tr>
      </table>
   </form>
</div>
</body>
</html>