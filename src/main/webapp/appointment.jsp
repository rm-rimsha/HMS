<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Book Appointment</title>

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
width: 700px;
height:260px;
margin-bottom:20px;
margin-top: 5px;
opacity: 0.8;
border-radius: 18px;
margin-left:140px;
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
color: #091753;
margin-left:280px
}
h2{
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 40px;
color: #091753;
margin-left: 15px;
margin-bottom: -10px;
margin-top:3px;
}
h3{
font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 25px;
color: #091753;
margin-left: 15px;
margin-bottom: -8px;
margin-top:5px;
}
h4{
font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 25px;
color: #091753;
margin-left: 15px;
margin-top: 7px;
margin-bottom: 0px;
}
h5{
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 25px;
color: #091753;
margin-left: 15px;
margin-top: 90px;
margin-bottom: -40px;
}
h6{
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 25px;
color: #091753;
margin-left: 15px;
margin-top: -170px;
margin-bottom: 0px;
float:right;
margin-right:-20px;
}

button {  
            background-color: #091753;  
            color: white;  
            border:#091753 ;  
            cursor: pointer; 
            font-style:bold; 
            font-size:20px;
            width: 170px;
            height: 50px;  
            margin-top: 0px;
            margin-bottom: 20px;
            border-radius: 0px;
            font-family: Roboto;
             transition-duration: 0.4s;
            } 
            
 select{
 
            background-color: #091753;  
            color: white;  
            border: none;  
            cursor: pointer; 
            font-style:bold; 
            font-size:30px;
            width: 330px;
            height: 50px;  
            margin-top: 0px;
            margin-bottom: 0px;
            border-radius: 0px;
            border-style:solid;
            font-family: Roboto;
            transition-duration: 0.4s;
            margin-left:330px;
             
 
 
 }
cancelAppointmentButton:button {
  transition-duration: 1.0s;
}

cancelAppointmentButton:hover {
  background-color: #091753;
  color: white;
}
        
button:hover {  

            opacity: 0.8;  
        }           
button.cancelAppointmentButton{
margin-top: -1000px;
}
div.formDiv{
text-align: right;
}
input.transparentInput
{
background-color: transparent;
border: none;
color: transparent;
cursor: default;
width: 0px;
font-size: 0px;
autocomplete: "false";
margin-left:330px;
}
label{
font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 25px;
color: #091753;
margin-left: 15px;
margin-bottom: -8px;
margin-top:5px;
}

input {  
            width: 150px; 
            height: 35px; 
            padding: 14px 25px;  
            margin: 8px 10px;   
            display: inline-block;  
            border: 1px solid #ccc;  
            box-sizing: border-box;  
            border-color: #091753;
        }
button.registerButton{
width: 110px;
height: 40px;
margin-left: 10px;
}
p{
color: red;
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 17px;
width: 180px;
margin-left: 500px;
}

</style>
</head>
<body>
<div id = "logo">
	 
	</div>
<br>
<form method = "post" id = "dropdownForm" action = "departmentName">
<input class = "transparentInput" name = "dptn" id = "dptn">
<input class = "transparentInput" name = "patientId" id = "patientId">
<input class = "transparentInput" name = "patientName" id = "patientName">
</form>
<div id = "receptionistDiv"></div>
<p>${error}</p>
<h1>BOOK APPOINTMENT</h1>
<form>
<select id="deptName" onChange="selected()">
<option value = "" disabled selected>Select Department</option>
</select>
<script type="text/javascript">

if("${module}" == "receptionist"){
	document.getElementById("logo").innerHTML = 
		"<img src=\"https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768\" width=\"130\" height=\"100\" ALIGN=left>" + 
	"<nav>"+
		"<nav>"+
			"<ul>"+
				"<li><a href=\"receptionistHome\">Home</a></li>"+
				"<li><a href =\"receptionistBookAppointments\">Book Appointment</a></li>"+
				"<li style = \"margin-right: 180px;\"><i"+
				"style=\"padding-top: 20px; padding-left: 45px; padding-right: 60px; font-size: 30px; color: #fff;\""+
				"class=\"fa\">&#xf007;</i>"+
				"<ul>"+
					"<li><a href=\"receptionistViewProfile\">View Profile</a></li>"+
					"<li><a href=\"ReceptionistChangePassword.jsp\">Change Password</a></li>"+
					"<li><a href=\"ReceptionistLogin.jsp\">Sign Out</a></li>"+
				"</ul></li>"+
			"</ul>"+
		"</nav>"+
	"</nav>"
}else{
	document.getElementById("logo").innerHTML = 
		"<img src=\"https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768\" width=\"130\" height=\"100\" ALIGN=left>" + 
	"<nav>"+
		"<nav>"+
			"<ul>"+
				"<li><a href=\"MainScreen\">Home</a></li>" +
				"<li><a href =\"getAppointment\">Get Appointment</a></li>" +
				"<li style = \"margin-right: 180px;\"><i" +
				"style=\"padding-top: 20px; padding-left: 45px; padding-right: 60px; font-size: 30px; color: #fff;\"" +
				"class=\"fa\">&#xf007;</i>" +
				"<ul>" +
					"<li><a href=\"PatientViewProfile\">View Profile</a></li>" +
					"<li><a href=\"PatientMedicalHistory\">Edit Profile</a></li>" +
					"<li><a href=\"editProfile\">View History</a></li>" +
					"<li><a href=\"PatientChangePassword.jsp\">Change Password</a></li>" +
					"<li><a href=\"PatientLogin.jsp\">Sign Out</a></li>" +
				"</ul></li>" +
			"</ul>" +
		"</nav>" +
	"</nav>"
}

function selected(){
	var e = document.getElementById("deptName");
	var selection= e.options[e.selectedIndex].value;
	document.getElementById("dptn").value=selection;
	if("${module}" == "receptionist"){
		document.getElementById("patientName").value = document.getElementById("pname").value;
		document.getElementById("patientId").value = document.getElementById("pid").value;
	}
	document.getElementById("dropdownForm").submit();
	
}

function getOptionCode(deptName){
	var optionCode = "<option value=" + deptName + ">" + deptName + "</option>";
	return optionCode;
}
var names = "${deptName}".split(',');
var text = "";
for(var counter = 0 ; counter < names.length ; counter++){
	text += getOptionCode(names[counter]);
}
document.getElementById("deptName").innerHTML += text;

mySelect = document.getElementById("deptName");
for(var i, j = 0; i = mySelect.options[j]; j++) {
   if(i.value == "${dname}") {
       mySelect.selectedIndex = j;
       break;
   }
}

</script>      
</form>
<table>
<tbody>
<tr>
<td id = "appointmentsColumn">
</td>
</tr>
</tbody>
</table>
<script>
function getFormCode(doctorId, doctorName, qualifications, experience,speciality,fee, action){
	var formCode = "<form class = \"appointmentForm\">" +
	"<fieldset>" +
	"<h2>Dr. " + doctorName + "</h2>" + 
	"<h3 style = \"text-align: left\">" + speciality + 
	"</h3>" + 
	"<h4 style = \"text-align: left\">" + qualifications + 
	"</h4>" + 
	"<h5 style = \"text-align: left\">Experience: " + experience + 
	" years</h5>" + 
	"<h6 style = \"text-align: left\">Fee: Rs." + fee + 
	"</h6></div>" +
		"<div>" + 
		"<button class = \"appointmentButton\" name = \"doctorId\" type = \"submit\" value = " + doctorId + 
		" formaction=" + action + " style = \"margin-left: 490px;\">Get Appointment</button><br><br>" + 	
		"<input class = \"transparentInput\" name = \"patientId\" value = \"${patientId}\">" +
		"<input class = \"transparentInput\" name = \"patientName\" value =\"${patientName}\">" +
	"</fieldset>" +
	"</form>"; 
	return formCode;
}
var action = "";
if("${module}" == "receptionist"){
	document.getElementById("receptionistDiv").innerHTML = 
	"<form style = \"margin-left: 150px\"><label for = \"patientName\">Patient Name: </label>" + 
	"<input type = \"text\" id = \"pname\" name = \"patientName\" value = " + "${patientName}" + ">" +
	"<label for = \"patientId\">Patient Id: </label>" +
	"<input type = \"number\" id = \"pid\" name = \"patientId\" value = " + ${patientId} + ">" + 
	"${error}" + "</form>" +
	"<button class = \"registerButton\" formaction = \"PatientRegister.jsp\">Register</button>";
	
	action = "receptionistGetAppointment";
}else{
	action = "getappointment";
}
var doctorIds = "${doctorIds}".split(',');
var doctorName = "${doctorName}".split(',');
var qualifications = "${qualifications}".split(',');
var experience = "${experience}".split(',');
var speciality = "${speciality}".split(',');
var fee = "${fee}".split(',');
var text = "";

var count = 0;
if(doctorName[0] != ""){
 for(var counter = 0 ; counter < doctorName.length ; counter++){
	text += getFormCode(parseInt(doctorIds[counter]), doctorName[counter], qualifications[counter], experience[counter],
			 speciality[counter],fee[counter], action);
}  
}
document.getElementById("appointmentsColumn").innerHTML = text;
</script>

</body>
</html>