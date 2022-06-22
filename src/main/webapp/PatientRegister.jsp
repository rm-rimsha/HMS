<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PATIENT REGISTER</title>
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


#boxborder {
	width: 650px;
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
	padding-left: 200px;
	padding-top: 50px;
}

#box {
	width: 650px;
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

input[type=text], input[type=password], input[type=number], input[type=tel], input[type=email], input[type=date] {
	width: 300px;
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
	width: 150px;
	height: 50px;
	border-radius: 3px;
	font-family: Roboto;
	font-size: 20px;
	float: right;
	margin-right: -230px;
	margin-bottom: 10px;
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
p{
color: red;
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
width: 180px;
margin-top: 0px;
margin-bottom: -18px;
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
<div id="boxborder"><span>PATIENT REGISTER</span></div>
<div id="box">
   <form id = "registerForm" action = "PatientRegister" method = "post">
      <table>
      <tr>
      <td>Full Name</td>
					<td><input class="textbox" type="text" name="fullname" ></td>
                    </tr>
                    <tr>
					<td>Gender</td>
					<td><input type="radio" name="gender" id="male" value="male" checked>Male
                     <input type="radio" name="gender" id="female" value="female" >Female
                     <input type="radio" name="gender" id="other" value="other" >Other</td>
				    </tr>
                    <tr>
                    <td>Date of Birth</td>
                    <td><input type="date" name="date" ></td>
                    </tr>
                    <tr>
                    <td>Email Address</td>
                    <td><input type="email" name="email" ></td>
                    </tr>
                    <tr>
                    <td>User Name</td>
                    <td> <input  type="text" name="username" />  
                    <td> <p>${error}</p></td>         
                    </tr>
                    <tr>
                    <td>Password</td>
                     <td><input type="password" name="password" />
                              <td> <p>${error1}</p></td>
                     </tr>
                      <tr>
                    <td>Confirm password</td>
                     <td><input type="password" name="confirmpassword" />
                              <td> <p>${error2}</p></td>
                     </tr>
                      <tr>
                    <td>Contact Number</td>
                     <td><input  type="text" name="mobile"></td>
                     </tr>
                     <tr>
                    <td>Home Address</td>
                     <td><input type="text" name="Address" ></td>
                     </tr>
                     <tr>
                     <td></td>
                     <td><p>${error3}</p></td>
                      
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