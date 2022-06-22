<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Doctor Main</title>

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
form.appointmentForm{
text-align: left;
background-color: #fff;
border-style: solid;
border-color: #091753;
border-width: 5px;
width: 650px;
margin-bottom:5px;
margin-top: 5px;
opacity: 0.8;
border-radius: 18px;
}
fieldset{
position: relative;
width: 600px;
border: 0px;
}
h1{
font-family: verdana;
font-style: normal;
font-weight: bold;
font-size: 40px;
color: #fff;
}
h3{
font-family: verdana;
font-style: normal;
font-weight: bold;
font-size: 25px;
color: #091753;
margin-left: 15px;
margin-bottom: 0px;
}
h4{
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 18px;
color: #091753;
margin-left: 15px;
margin-top: -35px;
margin-bottom: 30px;
}
h5{
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
color: #091753;
margin-left: 15px;
margin-top: -25px;
}
button {  
            background-color: #091753;  
            color: white;  
            border: none;  
            cursor: pointer;  
            width: 100px;
            height: 40px;  
            margin-top: 0px;
            margin-bottom: 4px;
            border-radius: 3px;
            font-family: Roboto;
            } 
        
button:hover {  
            opacity: 0.8;  
        }           
button.prescribeButton{
margin-top: -35px;
}
button.patientDetailsButton{
margin-top: -15px;
}
div.formDiv{
text-align: right;
}
button.profile{
width: 150px;
margin-top: 10px;
}
</style>
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
<br>
<h1>APPOINTMENTS</h1>
<hr>
<table>
<tbody>
<tr>
<td id = "appointmentsColumn">
</td>
<td>

</td>
</tr>
</tbody>
</table>
<script>
function getFormCode(patientId, patientName, date, time){
	var formCode = "<form method = \"post\" class = \"appointmentForm\">" +
	"<fieldset>" +
	"<h3>" + patientName + "</h3>" + 
		"<div class = \"formDiv\">" + 
		"<button class = \"prescribeButton\" name = \"patientId\" type = \"submit\" value = " + patientId + 
				" formaction=\"doctorPrescribe\">Prescribe</button><br><br>" + 
		"<button class = \"patientDetailsButton\" type = \"submit\" name = \"patientId\" value = " + patientId + 
				" formaction = \"doctorViewPatientDetails\" style = \"margin-left: 422px\">Patient Details</button>" + 
		"<h4 style = \"text-align: left\">" + date + 
		"</h4>" + 
		"<h5 style = \"text-align: left\">" + time + 
		"</h5></div>" +
	"</fieldset>" +
	"</form>"; 
	return formCode;
}
var patientIds = "${patientIds}".split(',','${noOfAppointments}');
var patients = "${patients}".split(',','${noOfAppointments}');
var dates = "${dates}".split(',','${noOfAppointments}');
var times = "${times}".split(',','${noOfAppointments}');
var text = "";
for(var counter = 0 ; counter < ${noOfAppointments} ; counter++){
	text += getFormCode(parseInt(patientIds[counter]), patients[counter], dates[counter], times[counter].substring(0,5));
}
document.getElementById("appointmentsColumn").innerHTML = text;
</script>
</body>
</html>