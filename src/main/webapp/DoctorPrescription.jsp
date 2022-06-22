<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Prescription</title>
<link rel="stylesheet" href=  
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />  

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
	width: 370px;
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
textarea{
font-size: 13pt;
resize: none;
color: #091753;
width: 40%;
text-align: left;
background-color: #fff;
border-style: solid;
border-color: #091753;
border-width: 5px;
opacity: 0.8;
border-radius: 10px;
font-family: verdana;
font-style: normal;
margin-left: -30%;
}
button{
background-color: #091753;  
color: white;  
border: none;  
cursor: pointer;  
width: 135px;
height: 40px;  
margin-top: 0px;
margin-bottom: 4px;
border-radius: 3px;
font-family: Roboto;
margin-left: -30%;
}
        
button:hover {  
            opacity: 0.8;  
        }  
h1{
border-style: solid;
border-color: #091753;
border-width: 5px;
background-color: #fff;
border-radius: 9px;
width: 40%;
margin-left: 14.65%;
font-family: verdana;
font-style: normal;
font-weight: bold;
font-size: 40px;
color: #091753;
opacity: 0.8;
}
Label{
text-align: left;
margin-left: 15%;
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 20px;
color: #000000;
display: block;
margin-top: -10px;
margin-bottom: -30px;
}
</style>
<title>Prescription</title>
</head>
<body>
<div id = "logo">
	 <img src="https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768" width="130" height="100" ALIGN=left>
	<nav>
		<nav>
			<ul>
				<li><a href="doctorHome">Home</a></li>
				<li><a href ="doctorViewPatients">Appointment History</a></li>
				<li style = "margin-right: 180px;"><i
				style="padding-top: 20px; padding-left: 45px; padding-right: 60px; font-size: 30px; color: #fff;"
				class="fa">&#xf007;</i>
				<ul>
					<li><a href="doctorViewProfile">View Profile</a></li>
					<li><a href="DoctorChangePassword.jsp">Change Password</a></li>
					<li><a href="DoctorLogin.jsp">Sign Out</a></li>
				</ul></li>
			</ul>
		</nav>
	</nav>
	</div>
<form method = "post" style = "text-align: center;">
	<div id = "printingMaterial">
	<h1>PRESCRIPTION</h1>
	<Label for="date"><strong>Date: </strong>${date }</Label><br><br>
	<textarea id = "prescription" name = "prescription" rows="23" cols="60">${prescription }</textarea><br><br>
	</div>
	<button name = "patientId" onclick="printPrescription()" formAction = "doctorPrintPrescription" style="margin-right: 35px" value = ${patientId }>Print Prescription</button>
	<button name = "patientId" value = ${patientId } formaction = "doctorSavePrescription" style = "margin-left: 35px">Done</button>
</form>
<script>
function printPrescription(){
	document.getElementById("prescription").defaultValue = document.getElementById("prescription").value;
	var prtContent = document.getElementById("printingMaterial");
	var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');

	WinPrint.document.write(prtContent.innerHTML);
	WinPrint.document.close();
	WinPrint.focus();
	WinPrint.print();
	WinPrint.close();
}
</script>
</body>
</html>